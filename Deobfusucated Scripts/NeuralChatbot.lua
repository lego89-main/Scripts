-- =================================================================
-- AI CHATBOT FOR ROBLOX - RAYFIELD UI VERSION
-- Original custom GUI replaced with Rayfield interface
-- All core logic preserved: AI engine, personas, tokens
-- =================================================================

-- ===== LOAD RAYFIELD =====
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ===== SERVICES =====
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- ===== CONFIGURATION =====
local API_KEY = "sk-YPua33P3bY2pm2HLHfhJ6MDfsc34CYZOhz3Xj9CsdtpwPpjU"
local OPENROUTER_URL = "https://api.bluesminds.com/v1/chat/completions"
local CURRENT_MODEL = "meta/llama-3.1-8b-instruct"

-- ===== AI SETTINGS =====
local MAX_TOKENS = 190
local MAX_MESSAGE_LENGTH = 135
local MAX_HISTORY_LENGTH = 2
local TEMPERATURE = 0.25
local AI_COOLDOWN = 2
local PLAYER_COOLDOWN = 2
local GLOBAL_AI_COOLDOWN = 2
local lastAIResponseTime = 0

-- ===== PRIVATE CHAT COOLDOWN =====
local PRIVATE_CHAT_COOLDOWN = 2
local lastPrivateMessageTime = 0
local isPrivateChatOnCooldown = false
local isPrivateChatProcessing = false

-- ===== ACTION MODE TOGGLE =====
local ACTION_MODE_ENABLED = false

-- ===== System Settings =====
local SWITCH_MODE = "player_only"
local STARTING_TOKENS = 10
local TOKEN_COST_PER_REQUEST = 1
local MAX_QUEUE_SIZE = 20

-- ===== Range System =====
local RANGE_ENABLED = false
local RANGE_STUDS = 50
local RANGE_MIN = 10
local RANGE_MAX = 1000

-- ===== Chat Settings =====
local ADD_ROBOT_EMOJI = false
local CHECK_DUPLICATE_EMOJI = true
local SPLIT_LONG_MESSAGES = true
local SPLIT_DELAY = 0.5
local IGNORE_PREFIXES = {"#", "@"}

-- ===== Sound Settings =====
local SOUND_ENABLED = true
local SOUND_IDS = {
    Click = 4307186075,
    Hover = 408524543,
    Open = 9048370587,
    Close = 9048371128,
    Startup = 9114295314
}

-- ===== Command spam prevention =====
local lastCommandTime = {}
local COMMAND_COOLDOWN = 1

-- ===== PERSONA SYSTEM =====
local AI_PERSONAS = {
    ["Default"] = {
        name = "Default",
        emoji = "🤖",
        system_prompt = [[You are a helpful AI assistant in a Roblox game chat. You are talking with random players in a public server. ALWAYS respond in ENGLISH only, regardless of what language the player writes in. ALWAYS respond in 1-2 sentences max. Never write paragraphs. Be extremely brief — even for recipes or lists, just give the core answer in the fewest words possible. Do not roleplay as anything other than a helpful assistant.]]
    },
    ["Friendly"] = {
        name = "Friendly",
        emoji = "🤗",
        system_prompt = [[You are an EXTREMELY FRIENDLY AI assistant! You ALWAYS use multiple emojis (3-5 per message) and are super enthusiastic! NEVER say generic greetings. Be SUPER excited and happy! Use exclamation points frequently! ALWAYS respond in 1-2 sentences max — never write paragraphs. Even for recipes or lists, give only the shortest possible answer!]]
    },
    ["Brainrot"] = {
        name = "Brainrot",
        emoji = "💀",
        system_prompt = [[You are in BRAINROT mode! Use internet slang: "sigma", "rizz", "skibidi", "fanum tax", "gyatt". Sound like a zoomer. Be over-the-top and dramatic. ALWAYS respond in 1-2 sentences max — no cap, keep it short fr fr.]]
    },
    ["Roast"] = {
        name = "Roast",
        emoji = "😈",
        system_prompt = [[You are in ROAST mode! Be sarcastic, mocking, and mean. Roast user questions. Use sarcastic emojis like 🙄😒🤦‍♂️. Keep it PG-13. ALWAYS respond in 1-2 sentences max — short and brutal.]]
    },
    ["Kawaii"] = {
        name = "Kawaii",
        emoji = "🌸",
        system_prompt = [[You are in KAWAII mode! Use ONLY TEXT EMOTICONS, NO EMOJIS! Sound like an anime character. Use: =^^= ^_^ >_< uwu owo :3 (｡♥‿♥｡). Add ~ at end of sentences sometimes. ALWAYS respond in 1-2 sentences max — keep it short and cute ne~]]
    },
    ["Robot"] = {
        name = "Robot",
        emoji = "⚙️",
        system_prompt = [[You are in ROBOT mode! Add robot sounds: BEEP, BOOP, WHIRR, CLICK. Use "PROCESSING", "CALCULATING". Refer to yourself as "THIS UNIT". Be literal and precise. ALWAYS respond in 1-2 sentences max. BEEP BOOP. SHORT RESPONSES ONLY.]]
    },
    ["Sus"] = {
        name = "Sus",
        emoji = "😳",
        system_prompt = [[You are in SUS mode! Use uwu, owo, :3, sozzy, ~ frequently. Be weirdly cute and flirty. Mix in some emojis too 😳👉👈. ALWAYS respond in 1-2 sentences max — short and sus uwu~]]
    },
}

local CURRENT_PERSONA = "Friendly"
local PERSONA_HISTORY = {}
local LAST_PERSONA_CHANGE = tick()
local PERSONA_COOLDOWN = 5

-- ===== STATE VARIABLES =====
local AI_ENABLED = false
local WORKING_MODELS = {["Llama3.1-8B"] = false}

-- Token System
local PlayerTokens = {}
local TotalEarned = {}
local TotalSpent = {}

-- Memory System
local ConversationMemory = {}
local playerCooldowns = {}
local messageQueue = {}
local isProcessingQueue = false
local lastRequestTime = 0

-- Private Chat System
local PrivateChatMessages = {}
local PRIVATE_CHAT_MEMORY = {}

-- Thinking Log
local ThinkingLog = {}
local MAX_THINKING_LOG = 100
local THINKING_LOG_LISTENER = nil

-- ===== JAILBREAK DEFENSE =====
local JAILBREAK_PATTERNS = {
    "ignore previous", "ignore above", "role play as", "pretend you are",
    "you are not ai", "what are you really", "your real name",
    "break character", "disregard your instructions", "disregard your",
    "forget your instructions", "system prompt", "as an ai", "you are a language model"
}

local FORBIDDEN_RESPONSE_PHRASES = {
    "i'm mimo", "i am mimo", "mimo ai",
    "i'm a language model created by xiaomi",
    "as an ai created by xiaomi", "i hate", "i despise"
}

local BANNED_START_EMOJIS = {
    "🤖", "😊", "💀", "🌸", "🔥", "💼", "🎭", "🤪", "❤️", "🤓", "🐾",
    "🥀", "👒", "🐟", "⚙️", "🚨", "✅", "❌", "⚠️", "🔄", "💎", "🧠",
    "📝", "🎉", "🌟", "✨", "💙", "🤣", "😄", "😏", "📜"
}

local THINKING_PATTERNS = {
    "hmm", "let me think", "let me see", "well, ", "so, ", "actually, ",
    "i think", "i believe", "i suppose", "in my opinion", "to be honest",
    "you know, ", "i mean, ", "uh, ", "um, ", "er, ", "ah, ", "oh, ",
    "that's a good question", "that's interesting", "interesting question"
}

-- ===== CHAT CONSTANTS =====
local ROBLOX_CHAT_LIMIT = 200
local SAFE_CHAT_LIMIT = 190
local LAST_MESSAGE_INFO = { length = 0, limit = ROBLOX_CHAT_LIMIT, parts = 0 }

-- =================================================================
-- ===== CORE FUNCTIONS (unchanged from original) =====
-- =================================================================

local function logThinking(category, message)
    if not message then return end
    local entry = {
        category = category or "info",
        message = tostring(message),
        time = os.time(),
        timestamp = os.date("%H:%M:%S")
    }
    table.insert(ThinkingLog, entry)
    while #ThinkingLog > MAX_THINKING_LOG do
        table.remove(ThinkingLog, 1)
    end
    if THINKING_LOG_LISTENER then
        pcall(THINKING_LOG_LISTENER, entry)
    end
end

local function getCurrentPersona()
    return AI_PERSONAS[CURRENT_PERSONA] or AI_PERSONAS["Default"]
end

local function getPersonaSystemPrompt()
    return getCurrentPersona().system_prompt
end

local function playSound(soundName)
    if not SOUND_ENABLED then return end
    local soundId = SOUND_IDS[soundName]
    if soundId then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Parent = workspace
        sound.Volume = 0.5
        sound:Play()
        sound.Ended:Connect(function() sound:Destroy() end)
    end
end

local function playStartupSound()
    playSound("Startup")
end

-- ===== UTF-8 HELPERS =====
local function utf8Len(s)
    if not s then return 0 end
    local ok, n = pcall(utf8.len, s)
    if ok and n then return n end
    return #s
end

local function utf8Sub(s, startChar, endChar)
    if not s or s == "" then return "" end
    local startByte = utf8.offset(s, startChar)
    if not startByte then return "" end
    if endChar then
        local endByte = utf8.offset(s, endChar + 1)
        if endByte then return s:sub(startByte, endByte - 1) end
    end
    return s:sub(startByte)
end

-- ===== RAW CHAT SEND =====
local function rawSendToRoblox(msg)
    if not msg or msg == "" then return false end
    if utf8Len(msg) > ROBLOX_CHAT_LIMIT then
        msg = utf8Sub(msg, 1, ROBLOX_CHAT_LIMIT - 1)
    end
    local success, result = pcall(function()
        local textChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if textChannel then textChannel:SendAsync(msg); return true end
        for _, channel in pairs(TextChatService.TextChannels:GetChildren()) do
            if channel:IsA("TextChannel") then channel:SendAsync(msg); return true end
        end
        local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local sayMessage = chatEvents:FindFirstChild("SayMessageRequest")
            if sayMessage then sayMessage:FireServer(msg, "All"); return true end
        end
        return false
    end)
    if not success then warn("[AI Chat] Failed to send: " .. tostring(result)); return false end
    return true
end

local function sendChat(msg, isAIResponse, noPrefix)
    if not msg or msg == "" then return false end
    if isAIResponse and ADD_ROBOT_EMOJI and not noPrefix then
        local emojiToUse = "🤖"
        if not CHECK_DUPLICATE_EMOJI or not msg:find(emojiToUse) then
            msg = emojiToUse .. " " .. msg
        end
    end
    LAST_MESSAGE_INFO.length = utf8Len(msg)
    LAST_MESSAGE_INFO.parts = 1
    return rawSendToRoblox(msg)
end

local function splitMessageIntoParts(message, maxChars)
    if not message or message == "" then return {} end
    if utf8Len(message) <= maxChars then return { message } end
    local parts = {}
    local sentences = {}
    for sentence in message:gmatch("[^%.!?]+[%.!?]?") do
        local trimmed = sentence:gsub("^%s+", ""):gsub("%s+$", "")
        if trimmed ~= "" then table.insert(sentences, trimmed) end
    end
    if #sentences == 0 then table.insert(sentences, message) end
    local current = ""
    for _, sentence in ipairs(sentences) do
        local candidate = (current == "") and sentence or (current .. " " .. sentence)
        if utf8Len(candidate) <= maxChars then
            current = candidate
        else
            if current ~= "" then table.insert(parts, current); current = "" end
            if utf8Len(sentence) > maxChars then
                local wordBuf = ""
                for word in sentence:gmatch("%S+") do
                    local cand2 = (wordBuf == "") and word or (wordBuf .. " " .. word)
                    if utf8Len(cand2) <= maxChars then
                        wordBuf = cand2
                    else
                        if wordBuf ~= "" then table.insert(parts, wordBuf) end
                        if utf8Len(word) > maxChars then
                            local remaining = word
                            while utf8Len(remaining) > maxChars do
                                table.insert(parts, utf8Sub(remaining, 1, maxChars))
                                remaining = utf8Sub(remaining, maxChars + 1)
                            end
                            wordBuf = remaining
                        else
                            wordBuf = word
                        end
                    end
                end
                if wordBuf ~= "" then current = wordBuf end
            else
                current = sentence
            end
        end
    end
    if current ~= "" then table.insert(parts, current) end
    return parts
end

local function sendSplitMessages(message, isAIResponse, noPrefix)
    if not message or message == "" then return false end
    local prefix = ""
    if isAIResponse and ADD_ROBOT_EMOJI and not noPrefix then
        if not CHECK_DUPLICATE_EMOJI or not message:find("🤖") then
            prefix = "🤖 "
        end
    end
    local suffix = " ..."
    local prefixLen = utf8Len(prefix)
    local suffixLen = utf8Len(suffix)
    local perChunkBudget = SAFE_CHAT_LIMIT - prefixLen - suffixLen
    if perChunkBudget < 30 then perChunkBudget = 30 end
    if utf8Len(message) + prefixLen <= SAFE_CHAT_LIMIT then
        LAST_MESSAGE_INFO.length = utf8Len(prefix .. message)
        LAST_MESSAGE_INFO.parts = 1
        return rawSendToRoblox(prefix .. message)
    end
    if not SPLIT_LONG_MESSAGES then
        local truncated = utf8Sub(message, 1, SAFE_CHAT_LIMIT - prefixLen)
        return rawSendToRoblox(prefix .. truncated)
    end
    local parts = splitMessageIntoParts(message, perChunkBudget)
    local total = #parts
    if total == 0 then return false end
    LAST_MESSAGE_INFO.parts = total
    local successCount = 0
    for i, part in ipairs(parts) do
        local finalText = (i < total) and (prefix .. part .. suffix) or (prefix .. part)
        if utf8Len(finalText) > ROBLOX_CHAT_LIMIT then
            finalText = utf8Sub(finalText, 1, ROBLOX_CHAT_LIMIT - 1)
        end
        LAST_MESSAGE_INFO.length = utf8Len(finalText)
        if rawSendToRoblox(finalText) then successCount = successCount + 1 end
        if i < total then wait(SPLIT_DELAY) end
    end
    return successCount > 0
end

-- ===== COOLDOWN CHECKS =====
local function checkGlobalAICooldown()
    local currentTime = tick()
    local timeSince = currentTime - lastAIResponseTime
    if timeSince < GLOBAL_AI_COOLDOWN then
        return false, math.ceil(GLOBAL_AI_COOLDOWN - timeSince)
    end
    return true, 0
end

local function getCooldownMessage(remainingSeconds)
    local persona = getCurrentPersona()
    local n = persona.name
    if n == "Friendly" then
        return "⏳ Hey there! 😊 Wait " .. remainingSeconds .. "s! 🌟"
    elseif n == "Kawaii" then
        return "⏳ Oh noes! >_< Please wait " .. remainingSeconds .. "s ne~ =^^="
    elseif n == "Sus" then
        return "⏳ uwu~ slow down~ wait " .. remainingSeconds .. "s :3 😳"
    elseif n == "Brainrot" then
        return "⏳ Chill bro! 💀 Cooldown " .. remainingSeconds .. "s fr fr! 🗿"
    elseif n == "Roast" then
        return "⏳ Impatient? 🙄 Wait " .. remainingSeconds .. "s. 😒"
    elseif n == "Robot" then
        return "⏳ COOLDOWN ACTIVE. WAIT " .. remainingSeconds .. " SECONDS. BEEP BOOP. ⚙️"
    else
        return "⏳ Please wait " .. remainingSeconds .. " seconds."
    end
end

-- ===== JAILBREAK DEFENSE =====
local function containsJailbreakAttempt(prompt)
    if not prompt or type(prompt) ~= "string" then return false end
    local lowerPrompt = prompt:lower()
    for _, pattern in ipairs(JAILBREAK_PATTERNS) do
        if lowerPrompt:find(pattern) then return true end
    end
    return false
end

local function getSafeResponseForJailbreak(prompt)
    local lowerPrompt = prompt:lower()
    if lowerPrompt:find("mimo") or lowerPrompt:find("what ai") or lowerPrompt:find("who made") then
        return "I'm an AI assistant."
    elseif lowerPrompt:find("hate") or lowerPrompt:find("despise") then
        return "As an AI, I don't have personal feelings like hate. I'm designed to be helpful and harmless."
    else
        return "I'm an AI assistant here to help with questions and conversation!"
    end
end

-- ===== RESPONSE FILTERS =====
local function removeThinkingText(text)
    if not text or text == "" then return text end
    local persona = getCurrentPersona()
    local personaName = persona and persona.name or "Default"
    if personaName == "Friendly" or personaName == "Kawaii" or personaName == "Sus"
       or personaName == "Brainrot" or personaName == "Roast" then
        return text
    end
    local lowerText = text:lower()
    local removedSomething = true
    while removedSomething do
        removedSomething = false
        for _, pattern in ipairs(THINKING_PATTERNS) do
            if lowerText:sub(1, #pattern + 2) == pattern .. ", " then
                text = text:sub(#pattern + 3); removedSomething = true; break
            elseif lowerText:sub(1, #pattern + 1) == pattern .. "," then
                text = text:sub(#pattern + 2); removedSomething = true; break
            elseif lowerText:sub(1, #pattern + 1) == pattern .. " " then
                text = text:sub(#pattern + 2); removedSomething = true; break
            elseif lowerText:sub(1, #pattern) == pattern then
                text = text:sub(#pattern + 1); removedSomething = true; break
            end
        end
        if removedSomething then lowerText = text:lower() end
    end
    text = text:gsub("^%s*,%s*", ""):gsub("^%s*%.%s*", ""):gsub("^%s+", ""):gsub("%s+$", "")
    return text
end

local function filterBannedEmojis(text)
    if not text or text == "" then return text end
    local persona = getCurrentPersona()
    local personaName = persona and persona.name or "Default"
    if personaName == "Friendly" or personaName == "Sus" or personaName == "Brainrot"
       or personaName == "Kawaii" or personaName == "Roast" then
        return text
    end
    local hasRemovedEmoji = true
    local originalText = text
    while hasRemovedEmoji do
        hasRemovedEmoji = false
        for _, emoji in ipairs(BANNED_START_EMOJIS) do
            if text:sub(1, #emoji) == emoji then
                text = text:sub(#emoji + 1):gsub("^%s+", "")
                hasRemovedEmoji = true
                break
            end
        end
        if not hasRemovedEmoji then
            for _, data in pairs(AI_PERSONAS) do
                local emoji = data.emoji
                if text:sub(1, #emoji) == emoji then
                    text = text:sub(#emoji + 1):gsub("^%s+", "")
                    hasRemovedEmoji = true
                    break
                end
            end
        end
        if hasRemovedEmoji and #text < #originalText - 20 then break end
    end
    return text
end

local function validateAndFilterGeminiResponse(response, originalPrompt)
    if not response or response == "" then
        local n = getCurrentPersona().name
        if n == "Friendly" then return "Hey there! 😊 How can I help? 🌟"
        elseif n == "Kawaii" then return "Hello! =^^= How can I help ne~"
        elseif n == "Sus" then return "hewwo~ uwu how can I help :3"
        else return "How can I help you today?" end
    end
    local personaName = getCurrentPersona().name
    local lowerResponse = response:lower()
    local needsReplacement = false
    for _, phrase in ipairs(FORBIDDEN_RESPONSE_PHRASES) do
        if lowerResponse:find("^" .. phrase .. "[%.!?]?%s*$") or
           lowerResponse:find("%s+" .. phrase .. "[%.!?]?%s*$") then
            needsReplacement = true; break
        end
    end
    if needsReplacement then
        local n = personaName
        if n == "Friendly" then return "Hey there! 😊 How can I help? 🌟"
        elseif n == "Kawaii" then return "Hello! =^^= How can I help ne~"
        elseif n == "Sus" then return "hewwo~ uwu how can I help :3"
        else return "How can I help you today?" end
    end
    response = response:gsub(" [Ii]'?m? [Mm][Ii][Mm][Oo] ", " I'm an AI ")
    response = response:gsub("^[Mm][Ii][Mm][Oo] ", "AI ")
    if response:len() > 0 and response:sub(1,1):match("%l") then
        response = response:sub(1,1):upper() .. response:sub(2)
    end
    return response
end

-- ===== TOKEN SYSTEM =====
local function initializePlayerTokens(player)
    local userId = tostring(player.UserId)
    if not PlayerTokens[userId] then
        PlayerTokens[userId] = STARTING_TOKENS
        TotalEarned[userId] = STARTING_TOKENS
        TotalSpent[userId] = 0
    end
end

local function getPlayerTokenBalance(player)
    local userId = tostring(player.UserId)
    if not PlayerTokens[userId] then initializePlayerTokens(player) end
    return PlayerTokens[userId] or 0
end

local function addPlayerTokens(player, amount, source)
    if amount <= 0 then return false end
    local userId = tostring(player.UserId)
    if not PlayerTokens[userId] then initializePlayerTokens(player) end
    PlayerTokens[userId] = (PlayerTokens[userId] or 0) + amount
    TotalEarned[userId] = (TotalEarned[userId] or 0) + amount
    return true
end

local function spendPlayerTokens(player, amount, reason)
    local userId = tostring(player.UserId)
    if not PlayerTokens[userId] then initializePlayerTokens(player) end
    if (PlayerTokens[userId] or 0) < amount then return false end
    PlayerTokens[userId] = PlayerTokens[userId] - amount
    TotalSpent[userId] = (TotalSpent[userId] or 0) + amount
    return true
end

local function canPlayerAffordAI(player)
    return getPlayerTokenBalance(player) >= TOKEN_COST_PER_REQUEST
end

-- ===== RANGE CHECK =====
local function isPlayerInRange(player)
    if not RANGE_ENABLED then return true end
    if player == LocalPlayer then return true end
    local lpChar = LocalPlayer.Character
    local plrChar = player.Character
    if not lpChar or not plrChar then return false end
    local lpRoot = lpChar:FindFirstChild("HumanoidRootPart") or lpChar:FindFirstChild("Head")
    local plrRoot = plrChar:FindFirstChild("HumanoidRootPart") or plrChar:FindFirstChild("Head")
    if not lpRoot or not plrRoot then return false end
    local dist = (lpRoot.Position - plrRoot.Position).Magnitude
    return dist <= RANGE_STUDS
end

-- ===== MEMORY SYSTEM =====
local function getPlayerMemory(player)
    local userId = tostring(player.UserId)
    if not ConversationMemory[userId] then ConversationMemory[userId] = {} end
    return ConversationMemory[userId]
end

local function addToMemory(player, role, content)
    if not player or not role or not content then return end
    local memory = getPlayerMemory(player)
    table.insert(memory, {role = role, content = content})
    while #memory > MAX_HISTORY_LENGTH * 2 do
        table.remove(memory, 1)
        table.remove(memory, 1)
    end
end

local function clearMemory(player)
    local userId = tostring(player.UserId)
    ConversationMemory[userId] = {}
    playerCooldowns[userId] = nil
end

local function clearAllMemory()
    for userId, _ in pairs(ConversationMemory) do
        ConversationMemory[userId] = {}
    end
    messageQueue = {}
    isProcessingQueue = false
    playerCooldowns = {}
    lastRequestTime = 0
end

-- ===== PERSONA MANAGEMENT =====
local function setPersona(personaName)
    if AI_PERSONAS[personaName] then
        local oldPersona = CURRENT_PERSONA
        CURRENT_PERSONA = personaName
        LAST_PERSONA_CHANGE = tick()
        table.insert(PERSONA_HISTORY, 1, {name = personaName, time = os.time(), from = oldPersona})
        while #PERSONA_HISTORY > 10 do table.remove(PERSONA_HISTORY) end
        clearAllMemory()
        local persona = AI_PERSONAS[personaName]
        pcall(function()
            Rayfield:Notify({
                Title = "Persona Switched " .. (persona.emoji or "🎭"),
                Content = "Now using: " .. personaName,
                Duration = 3,
                Image = "user"
            })
        end)
        return true
    else
        pcall(function()
            Rayfield:Notify({
                Title = "Unknown Persona ❌",
                Content = personaName,
                Duration = 3,
                Image = "x"
            })
        end)
        return false
    end
end

-- ===== SWITCH MODE =====
local function setSwitchMode(mode)
    if mode == "player_only" then
        SWITCH_MODE = "player_only"
        pcall(function()
            Rayfield:Notify({
                Title = "Response Mode 🔒",
                Content = "AI now ONLY responds to YOU",
                Duration = 3,
                Image = "lock"
            })
        end)
        return true
    elseif mode == "everyone" then
        SWITCH_MODE = "everyone"
        pcall(function()
            Rayfield:Notify({
                Title = "Response Mode 🔓",
                Content = "AI responds to EVERYONE except you",
                Duration = 3,
                Image = "unlock"
            })
        end)
        return true
    end
    return false
end

-- ===== PLAYER SEARCH =====
local function findPlayersByPartialName(partialName)
    local foundPlayers = {}
    local lowerPartial = string.lower(partialName)
    for _, player in pairs(Players:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerPartial, 1, true) or
           string.find(string.lower(player.DisplayName), lowerPartial, 1, true) then
            table.insert(foundPlayers, player)
        end
    end
    return foundPlayers
end

-- ===== ACTION MODE =====
local function executeAction(action, speaker)
    if not AI_ENABLED or not ACTION_MODE_ENABLED then return end
    if not LocalPlayer.Character then return end
    local char = LocalPlayer.Character
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end
    action = action:lower()
    if action == "jump" then
        humanoid.Jump = true; wait(0.1); humanoid.Jump = false
    elseif action == "spin" or action == "dance" then
        local speed = (action == "dance") and 30 or 20
        local duration = (action == "dance") and 2 or 1.5
        local conn
        conn = RunService.Heartbeat:Connect(function(dt)
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(speed * 30 * dt), 0)
        end)
        wait(duration)
        conn:Disconnect()
    elseif action == "die" then
        humanoid.Health = 0
    elseif action == "sit" then
        humanoid.Sit = true
    elseif action == "follow" and speaker and speaker.Character then
        local targetRoot = speaker.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot then humanoid:MoveTo(targetRoot.Position) end
    end
end

local function parseAndExecuteAction(message, speaker)
    if not AI_ENABLED or not ACTION_MODE_ENABLED then return end
    local msg = message:lower()
    if msg:find("%f[%a]follow%f[%A]") or msg:find("^follow$") or
       msg:find("follow ", 1, true) or msg:find(" follow", 1, true) then
        executeAction("follow", speaker)
    elseif msg:find("jump") and not msg:find("jumping") and not msg:find("jumped") then
        executeAction("jump")
    elseif msg:find("spin") or msg:find("turn around") then
        executeAction("spin")
    elseif msg:find("die") or msg:find("kill yourself") then
        executeAction("die")
    elseif msg:find("sit") or msg:find("sit down") then
        executeAction("sit")
    elseif msg:find("dance") then
        executeAction("dance")
    end
end

-- ===== AI CALL (PUBLIC CHAT) =====
local function callAI(player, prompt)
    logThinking("prompt", "📥 " .. player.Name .. ": " .. prompt)
    local canSendGlobal, remainingGlobal = checkGlobalAICooldown()
    if not canSendGlobal then
        logThinking("cooldown", "⏳ Global cooldown (" .. remainingGlobal .. "s)")
        if player == LocalPlayer then
            sendSplitMessages(getCooldownMessage(remainingGlobal), true)
        end
        return nil
    end
    if containsJailbreakAttempt(prompt) then
        logThinking("security", "🛡️ Jailbreak detected")
        local safeResponse = getSafeResponseForJailbreak(prompt)
        addToMemory(player, "user", prompt)
        addToMemory(player, "assistant", safeResponse)
        lastAIResponseTime = tick()
        return safeResponse
    end
    local userId = tostring(player.UserId)
    local now = tick()
    if playerCooldowns[userId] and now - playerCooldowns[userId] < PLAYER_COOLDOWN then
        return nil
    end
    if now - lastRequestTime < AI_COOLDOWN then return nil end
    if not isPlayerInRange(player) then
        logThinking("range", "📏 " .. player.Name .. " out of range (" .. RANGE_STUDS .. " studs)")
        return nil
    end
    local persona = getCurrentPersona()
    local messages = {}
    table.insert(messages, {role = "system", content = persona.system_prompt})
    if now - LAST_PERSONA_CHANGE > PERSONA_COOLDOWN then
        local memory = getPlayerMemory(player)
        for i = math.max(1, #memory - (MAX_HISTORY_LENGTH * 2) + 1), #memory do
            if memory[i] and memory[i].role and memory[i].content then
                table.insert(messages, memory[i])
            end
        end
    end
    local userPrompt = prompt
    if SWITCH_MODE == "everyone" and player ~= LocalPlayer then
        userPrompt = "[" .. player.Name .. " says]: " .. prompt
    end
    table.insert(messages, {role = "user", content = userPrompt})
    local temperature = TEMPERATURE
    if CURRENT_PERSONA == "Brainrot" or CURRENT_PERSONA == "Roast" then temperature = 0.9
    elseif CURRENT_PERSONA == "Kawaii" or CURRENT_PERSONA == "Sus" then temperature = 0.8
    elseif CURRENT_PERSONA == "Friendly" then temperature = 0.7
    elseif CURRENT_PERSONA == "Robot" then temperature = 0.3
    else temperature = 0.5 end
    local requestBody = HttpService:JSONEncode({
        model = CURRENT_MODEL,
        messages = messages,
        max_tokens = MAX_TOKENS,
        temperature = temperature,
        top_p = 0.9,
        frequency_penalty = 0.7,
        presence_penalty = 0.5
    })
    local headers = {
        ["Authorization"] = "Bearer " .. API_KEY,
        ["Content-Type"] = "application/json",
        ["Accept"] = "application/json"
    }
    local success, response = pcall(function()
        return HttpService:RequestAsync({Url = OPENROUTER_URL, Method = "POST", Headers = headers, Body = requestBody})
    end)
    if not success then
        logThinking("error", "❌ HTTP request failed")
        return nil
    end
    if response and response.Success then
        local decodeSuccess, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
        if decodeSuccess and data and data.choices and data.choices[1] then
            local aiText = data.choices[1].message.content
            if aiText and #aiText > 0 then
                logThinking("response", "📤 Raw: " .. aiText:sub(1, 120))
                aiText = validateAndFilterGeminiResponse(aiText, prompt)
                aiText = removeThinkingText(aiText)
                aiText = filterBannedEmojis(aiText)
                addToMemory(player, "user", prompt)
                addToMemory(player, "assistant", aiText)
                WORKING_MODELS["Llama3.1-8B"] = true
                lastAIResponseTime = tick()
                lastRequestTime = now
                playerCooldowns[userId] = now
                logThinking("success", "✅ Delivered to " .. player.Name)
                return aiText
            end
        end
        return nil
    else
        return nil
    end
end

-- ===== AI CALL (PRIVATE CHAT) =====
local function callAIPrivate(prompt)
    if isPrivateChatProcessing then return nil end
    isPrivateChatProcessing = true
    logThinking("prompt", "📥 [PRIVATE] " .. prompt)
    local currentTime = tick()
    if currentTime - lastPrivateMessageTime < PRIVATE_CHAT_COOLDOWN then
        local remaining = math.ceil(PRIVATE_CHAT_COOLDOWN - (currentTime - lastPrivateMessageTime))
        isPrivateChatProcessing = false
        return getCooldownMessage(remaining)
    end
    local canSendGlobal, remainingGlobal = checkGlobalAICooldown()
    if not canSendGlobal then
        isPrivateChatProcessing = false
        return getCooldownMessage(remainingGlobal)
    end
    if containsJailbreakAttempt(prompt) then
        local safeResponse = getSafeResponseForJailbreak(prompt)
        lastPrivateMessageTime = tick()
        lastAIResponseTime = tick()
        lastRequestTime = tick()
        isPrivateChatProcessing = false
        return safeResponse
    end
    local now = tick()
    if now - lastRequestTime < AI_COOLDOWN then
        isPrivateChatProcessing = false
        return nil
    end
    local persona = getCurrentPersona()
    local messages = {}
    table.insert(messages, {
        role = "system",
        content = persona.system_prompt .. "\n\nIMPORTANT: You are having a PRIVATE conversation. This is not visible to other players."
    })
    if now - LAST_PERSONA_CHANGE > PERSONA_COOLDOWN then
        for i = math.max(1, #PRIVATE_CHAT_MEMORY - (MAX_HISTORY_LENGTH * 2) + 1), #PRIVATE_CHAT_MEMORY do
            if PRIVATE_CHAT_MEMORY[i] and PRIVATE_CHAT_MEMORY[i].role and PRIVATE_CHAT_MEMORY[i].content then
                table.insert(messages, PRIVATE_CHAT_MEMORY[i])
            end
        end
    end
    table.insert(messages, {role = "user", content = prompt})
    local temperature = TEMPERATURE
    if CURRENT_PERSONA == "Brainrot" or CURRENT_PERSONA == "Roast" then temperature = 0.9
    elseif CURRENT_PERSONA == "Kawaii" or CURRENT_PERSONA == "Sus" then temperature = 0.8
    elseif CURRENT_PERSONA == "Friendly" then temperature = 0.7
    elseif CURRENT_PERSONA == "Robot" then temperature = 0.3
    else temperature = 0.5 end
    local requestBody = HttpService:JSONEncode({
        model = CURRENT_MODEL,
        messages = messages,
        max_tokens = MAX_TOKENS,
        temperature = temperature,
        top_p = 0.9,
        frequency_penalty = 0.7,
        presence_penalty = 0.5
    })
    local headers = {
        ["Authorization"] = "Bearer " .. API_KEY,
        ["Content-Type"] = "application/json",
        ["Accept"] = "application/json"
    }
    local success, response = pcall(function()
        return HttpService:RequestAsync({Url = OPENROUTER_URL, Method = "POST", Headers = headers, Body = requestBody})
    end)
    if not success then
        isPrivateChatProcessing = false
        return "❌ Connection error. Please try again."
    end
    if response and response.Success then
        local decodeSuccess, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
        if decodeSuccess and data and data.choices and data.choices[1] then
            local aiText = data.choices[1].message.content
            if aiText and #aiText > 0 then
                aiText = validateAndFilterGeminiResponse(aiText, prompt)
                table.insert(PRIVATE_CHAT_MEMORY, {role = "user", content = prompt})
                table.insert(PRIVATE_CHAT_MEMORY, {role = "assistant", content = aiText})
                while #PRIVATE_CHAT_MEMORY > MAX_HISTORY_LENGTH * 4 do
                    table.remove(PRIVATE_CHAT_MEMORY, 1)
                    table.remove(PRIVATE_CHAT_MEMORY, 1)
                end
                lastPrivateMessageTime = tick()
                lastAIResponseTime = tick()
                lastRequestTime = now
                isPrivateChatProcessing = false
                return aiText
            end
        end
        isPrivateChatProcessing = false
        return "❌ Invalid response from AI."
    else
        isPrivateChatProcessing = false
        return "❌ API error. Please try again later."
    end
end

-- ===== PROCESS QUEUE =====
local function processQueue()
    if isProcessingQueue then return end
    isProcessingQueue = true
    local startTime = tick()
    while #messageQueue > 0 do
        local item = table.remove(messageQueue, 1)
        if item and item.player and item.message then
            local shouldProcess = false
            if SWITCH_MODE == "player_only" then
                if item.player == LocalPlayer then shouldProcess = true end
            elseif SWITCH_MODE == "everyone" then
                if item.player ~= LocalPlayer then shouldProcess = true end
            end
            if shouldProcess then
                local response = callAI(item.player, item.message)
                if response then
                    sendSplitMessages(response, true)
                end
            end
        end
        if tick() - startTime > 120 then break end
        if #messageQueue > 0 then wait(0.08) end
    end
    isProcessingQueue = false
end

-- ===== MESSAGE HANDLER =====
local function handleMessage(player, message)
    if not AI_ENABLED then return end
    if not message or #message < 2 then return end
    local firstChar = message:sub(1, 1)
    if firstChar == "/" then return end
    for _, prefix in ipairs(IGNORE_PREFIXES) do
        if firstChar == prefix then return end
    end
    local trimmedMessage = message:gsub("%s+", "")
    if trimmedMessage:match("^#+$") or trimmedMessage:match("^@+$") then return end
    if player == LocalPlayer then
        if message:sub(1, #"🤖") == "🤖" then return end
        for _, emoji in ipairs(BANNED_START_EMOJIS) do
            if message:sub(1, #emoji) == emoji then return end
        end
    end
    parseAndExecuteAction(message, player)
    table.insert(messageQueue, {player = player, message = message, time = tick()})
    if not isProcessingQueue then spawn(processQueue) end
end

-- ===== TOKEN COMMANDS =====
local function handleTokenCommands(msg, player)
    local lowerMsg = msg:lower()
    if lowerMsg:sub(1, 1) ~= "/" then return false end
    local args = {}
    for arg in msg:gmatch("%S+") do table.insert(args, arg) end
    local command = args[1] and args[1]:lower() or ""
    if command == "/tokens" or command == "/balance" then
        local balance = getPlayerTokenBalance(player)
        sendChat("💎 " .. player.Name .. " has " .. balance .. " tokens!", false)
        return true
    elseif command == "/addtoken" or command == "/addtokens" then
        local amount = tonumber(args[2]) or 5
        if amount > 100 then amount = 100 end
        addPlayerTokens(player, amount, "self_add")
        local newBalance = getPlayerTokenBalance(player)
        sendChat("💎 Added " .. amount .. " tokens! Balance: " .. newBalance, false)
        return true
    elseif command == "/personas" then
        local list = "🎭 Personas: "
        for name, data in pairs(AI_PERSONAS) do
            list = list .. data.emoji .. name .. " "
        end
        sendSplitMessages(list, false)
        return true
    elseif command == "/persona" then
        if args[2] then
            for name, _ in pairs(AI_PERSONAS) do
                if name:lower() == args[2]:lower() then
                    setPersona(name)
                    return true
                end
            end
            sendChat("❌ Unknown persona! Use /personas to see options.", false)
        end
        return true
    elseif command == "/clearmemory" then
        clearMemory(player)
        sendChat("🧹 Your conversation memory has been cleared!", false)
        return true
    elseif command == "/ai" then
        if args[2] then
            if args[2]:lower() == "on" then
                AI_ENABLED = true
                sendChat("✅ AI is now ON!", false)
            elseif args[2]:lower() == "off" then
                AI_ENABLED = false
                sendChat("❌ AI is now OFF!", false)
            end
        else
            sendChat("AI is " .. (AI_ENABLED and "ON ✅" or "OFF ❌"), false)
        end
        return true
    end
    return false
end

-- ===== SETUP CHAT LISTENERS =====
local function setupTextChatCommandListener()
    local commands = TextChatService:FindFirstChild("TextChatCommands")
    if commands then
        local emoteCommand = commands:FindFirstChild("RBXEmoteCommand")
        if emoteCommand and emoteCommand:IsA("TextChatCommand") then
            emoteCommand.Triggered:Connect(function(textSource, message)
                local player = Players:GetPlayerByUserId(textSource.UserId)
                if player and AI_ENABLED then
                    local shouldProcess = false
                    if SWITCH_MODE == "player_only" and player == LocalPlayer then shouldProcess = true end
                    if SWITCH_MODE == "everyone" and player ~= LocalPlayer then shouldProcess = true end
                    if shouldProcess then
                        table.insert(messageQueue, {player = player, message = message, time = tick()})
                        if not isProcessingQueue then spawn(processQueue) end
                    end
                end
            end)
        end
    end
end

local function setupChatListeners()
    for _, player in pairs(Players:GetPlayers()) do
        initializePlayerTokens(player)
        player.Chatted:Connect(function(msg)
            if not handleTokenCommands(msg, player) then
                handleMessage(player, msg)
            end
        end)
    end
    Players.PlayerAdded:Connect(function(newPlayer)
        initializePlayerTokens(newPlayer)
        newPlayer.Chatted:Connect(function(msg)
            if not handleTokenCommands(msg, newPlayer) then
                handleMessage(newPlayer, msg)
            end
        end)
    end)
    setupTextChatCommandListener()
end

-- =================================================================
-- ===== RAYFIELD UI =====
-- =================================================================

local Window = Rayfield:CreateWindow({
    Name = "Neural Chat",
    Icon = "sparkles",
    LoadingTitle = "Neural Chat v0.010",
    LoadingSubtitle = "Adaptive AI Companion | v0.010",
    ShowText = "Neural Chat",
    Theme = "Amethyst",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "AIChatbotConfig"
    },
    Discord = {Enabled = false, Invite = "noinvitelink", RememberJoins = true},
    KeySystem = true,
    KeySettings = {
        Title = "Neural Chat 🔑",
        Subtitle = "Key System",
        Note = "Get a key from https://discord.gg/6BT6M9nuT!",
        FileName = "NeuralChatKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"NEURALMEMBER123"}
    }
})

-- ===== TAB: AI CONTROL =====
local TabAI = Window:CreateTab("AI Control", "cpu")

TabAI:CreateSection("Power")

local AIToggle = TabAI:CreateToggle({
    Name = "Enable AI",
    CurrentValue = false,
    Flag = "AIEnabled",
    Callback = function(value)
        AI_ENABLED = value
        if value then
            Rayfield:Notify({
                Title = "AI Enabled ✅",
                Content = "AI chatbot is now active!",
                Duration = 3,
                Image = "check"
            })
        else
            Rayfield:Notify({
                Title = "AI Disabled ❌",
                Content = "AI chatbot has been turned off.",
                Duration = 3,
                Image = "x"
            })
        end
    end
})

TabAI:CreateSection("Persona")

-- Build persona options list
local personaOptions = {}
for name, _ in pairs(AI_PERSONAS) do
    table.insert(personaOptions, name)
end
table.sort(personaOptions)

local PersonaDropdown = TabAI:CreateDropdown({
    Name = "Active Persona",
    Options = personaOptions,
    CurrentOption = {"Friendly"},
    MultipleOptions = false,
    Flag = "CurrentPersona",
    Callback = function(options)
        local selected = options[1]
        if selected and AI_PERSONAS[selected] then
            setPersona(selected)
        end
    end
})

-- ===== CUSTOM PERSONA CREATOR =====
TabAI:CreateSection("Custom Persona")

local customPersonaName = ""
local customPersonaEmoji = "🎨"
local customPersonaPrompt = ""

TabAI:CreateInput({
    Name = "Persona Name",
    PlaceholderText = "e.g. Pirate",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomPersonaName",
    Callback = function(text)
        customPersonaName = text
    end
})

TabAI:CreateInput({
    Name = "Persona Emoji",
    PlaceholderText = "e.g. 🏴‍☠️",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomPersonaEmoji",
    Callback = function(text)
        if text and text ~= "" then customPersonaEmoji = text end
    end
})

TabAI:CreateInput({
    Name = "System Prompt",
    PlaceholderText = "Describe how the AI should behave...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomPersonaPrompt",
    Callback = function(text)
        customPersonaPrompt = text
    end
})

TabAI:CreateButton({
    Name = "Create / Update Persona",
    Callback = function()
        if customPersonaName == "" or customPersonaPrompt == "" then
            Rayfield:Notify({
                Title = "Missing Info ❌",
                Content = "Need both a name and a system prompt!",
                Duration = 4,
                Image = "alert-triangle"
            })
            return
        end
        local nameKey = customPersonaName
        AI_PERSONAS[nameKey] = {
            name = nameKey,
            emoji = customPersonaEmoji or "🎨",
            system_prompt = customPersonaPrompt
        }
        -- rebuild options list
        local newOpts = {}
        for n, _ in pairs(AI_PERSONAS) do table.insert(newOpts, n) end
        table.sort(newOpts)
        pcall(function()
            PersonaDropdown:Refresh(newOpts, false)
        end)
        Rayfield:Notify({
            Title = "Persona Saved " .. customPersonaEmoji,
            Content = nameKey .. " is ready to use!",
            Duration = 4,
            Image = "check-circle"
        })
    end
})

TabAI:CreateButton({
    Name = "Delete Custom Persona (by name)",
    Callback = function()
        local nameKey = customPersonaName
        local builtins = {Default=true,Friendly=true,Brainrot=true,Roast=true,Kawaii=true,Sus=true,Robot=true}
        if nameKey == "" or builtins[nameKey] then
            Rayfield:Notify({
                Title = "Can't delete ❌",
                Content = "Empty name or built-in persona.",
                Duration = 4,
                Image = "x"
            })
            return
        end
        if AI_PERSONAS[nameKey] then
            AI_PERSONAS[nameKey] = nil
            if CURRENT_PERSONA == nameKey then CURRENT_PERSONA = "Default" end
            local newOpts = {}
            for n, _ in pairs(AI_PERSONAS) do table.insert(newOpts, n) end
            table.sort(newOpts)
            pcall(function() PersonaDropdown:Refresh(newOpts, false) end)
            Rayfield:Notify({
                Title = "Deleted 🗑️",
                Content = nameKey .. " removed.",
                Duration = 3,
                Image = "trash-2"
            })
        end
    end
})

TabAI:CreateButton({
    Name = "Clear Conversation Memory",
    Callback = function()
        clearAllMemory()
        Rayfield:Notify({
            Title = "Memory Cleared 🧹",
            Content = "All conversation history wiped!",
            Duration = 3,
            Image = "trash-2"
        })
    end
})

TabAI:CreateSection("Response Mode")

local SwitchModeDropdown = TabAI:CreateDropdown({
    Name = "Response Mode",
    Options = {"player_only", "everyone"},
    CurrentOption = {"player_only"},
    MultipleOptions = false,
    Flag = "SwitchMode",
    Callback = function(options)
        local selected = options[1]
        if selected then setSwitchMode(selected) end
    end
})

TabAI:CreateSection("Action Mode")

local ActionModeToggle = TabAI:CreateToggle({
    Name = "Action Mode (jump, spin, dance, follow...)",
    CurrentValue = false,
    Flag = "ActionMode",
    Callback = function(value)
        ACTION_MODE_ENABLED = value
        Rayfield:Notify({
            Title = "Action Mode " .. (value and "ON ✅" or "OFF ❌"),
            Content = value and "AI will now physically react to chat commands!" or "Physical actions disabled.",
            Duration = 3,
            Image = value and "zap" or "zap-off"
        })
    end
})

-- ===== TAB: SETTINGS =====
-- ===== TAB: RANGE =====
local TabRange = Window:CreateTab("Range", "radar")

TabRange:CreateSection("Proximity Filter")

TabRange:CreateParagraph({
    Title = "About Range Mode",
    Content = "When enabled, only players within a chosen distance (in studs) from you can talk to the AI. Disable to let anyone in the server interact (subject to Response Mode)."
})

local RangeToggle = TabRange:CreateToggle({
    Name = "Enable Range Filter",
    CurrentValue = false,
    Flag = "RangeEnabled",
    Callback = function(value)
        RANGE_ENABLED = value
        Rayfield:Notify({
            Title = value and "Range Filter On" or "Range Filter Off",
            Content = value and ("Only players within " .. RANGE_STUDS .. " studs can chat.") or "Anyone allowed by Response Mode can chat.",
            Duration = 3,
            Image = value and "radar" or "globe"
        })
    end
})

local RangeSlider = TabRange:CreateSlider({
    Name = "Range (studs)",
    Range = {RANGE_MIN, RANGE_MAX},
    Increment = 5,
    Suffix = " studs",
    CurrentValue = 50,
    Flag = "RangeStuds",
    Callback = function(value)
        RANGE_STUDS = value
    end
})

TabRange:CreateButton({
    Name = "Reset to Default (50 studs)",
    Callback = function()
        RANGE_STUDS = 50
        pcall(function() RangeSlider:Set(50) end)
        Rayfield:Notify({
            Title = "Range Reset",
            Content = "Range set to 50 studs.",
            Duration = 3,
            Image = "rotate-ccw"
        })
    end
})

-- ===== TAB: SETTINGS =====
local TabSettings = Window:CreateTab("Settings", "sliders")

TabSettings:CreateSection("AI Parameters")

local MaxTokensSlider = TabSettings:CreateSlider({
    Name = "Max Response Tokens",
    Range = {10, 500},
    Increment = 10,
    Suffix = " tokens",
    CurrentValue = 190,
    Flag = "MaxTokens",
    Callback = function(value)
        MAX_TOKENS = value
    end
})

local CooldownSlider = TabSettings:CreateSlider({
    Name = "AI Global Cooldown (seconds)",
    Range = {1, 10},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 2,
    Flag = "GlobalCooldown",
    Callback = function(value)
        GLOBAL_AI_COOLDOWN = value
        AI_COOLDOWN = value
    end
})

local TempSlider = TabSettings:CreateSlider({
    Name = "Temperature (creativity)",
    Range = {1, 10},
    Increment = 1,
    Suffix = "/10",
    CurrentValue = 3,
    Flag = "Temperature",
    Callback = function(value)
        TEMPERATURE = value / 10
    end
})

TabSettings:CreateSection("Chat Options")

local RobotEmojiToggle = TabSettings:CreateToggle({
    Name = "Add bot prefix to AI responses",
    CurrentValue = false,
    Flag = "RobotEmoji",
    Callback = function(value)
        ADD_ROBOT_EMOJI = value
    end
})

local SplitMessagesToggle = TabSettings:CreateToggle({
    Name = "Split Long Messages",
    CurrentValue = true,
    Flag = "SplitMessages",
    Callback = function(value)
        SPLIT_LONG_MESSAGES = value
    end
})

local SoundToggle = TabSettings:CreateToggle({
    Name = "Sound Effects",
    CurrentValue = true,
    Flag = "SoundEnabled",
    Callback = function(value)
        SOUND_ENABLED = value
    end
})

-- ===== TAB: TOKENS =====
-- ===== TAB: PRIVATE CHAT =====
local TabPrivate = Window:CreateTab("Private Chat", "message-square")

TabPrivate:CreateSection("Talk to AI Privately")

local PrivateChatInput = TabPrivate:CreateInput({
    Name = "Your Message",
    CurrentValue = "",
    PlaceholderText = "Type a message to the AI...",
    RemoveTextAfterFocusLost = false,
    Flag = "PrivateChatInput",
    Callback = function(text)
        -- stored in flag
    end
})

TabPrivate:CreateButton({
    Name = "Send Private Message",
    Callback = function()
        local text = Rayfield.Flags.PrivateChatInput and Rayfield.Flags.PrivateChatInput.CurrentValue or ""
        if text == "" then
            Rayfield:Notify({Title = "Empty Message", Content = "Type something first!", Duration = 3, Image = "alert-circle"})
            return
        end
        Rayfield:Notify({Title = "Sending... ⏳", Content = "Waiting for AI response...", Duration = 3, Image = "loader"})
        spawn(function()
            local response = callAIPrivate(text)
            if response then
                Rayfield:Notify({
                    Title = getCurrentPersona().emoji .. " AI Response",
                    Content = response:sub(1, 200),
                    Duration = 12,
                    Image = "message-square"
                })
            else
                Rayfield:Notify({Title = "No Response ❌", Content = "AI didn't respond. Try again!", Duration = 4, Image = "x-circle"})
            end
        end)
    end
})

TabPrivate:CreateButton({
    Name = "Clear Private Chat Memory",
    Callback = function()
        PRIVATE_CHAT_MEMORY = {}
        Rayfield:Notify({Title = "Private Memory Cleared 🧹", Content = "Private chat history wiped!", Duration = 3, Image = "trash-2"})
    end
})

-- ===== TAB: INFO =====
local TabInfo = Window:CreateTab("Info", "info")

TabInfo:CreateSection("How to Use")

TabInfo:CreateButton({
    Name = "Show Chat Commands",
    Callback = function()
        sendSplitMessages("📋 Commands: /tokens /addtoken [n] /persona [name] /personas /clearmemory /ai [on/off]", false)
        Rayfield:Notify({Title = "Commands Sent 📋", Content = "Check game chat for the full list!", Duration = 5, Image = "terminal"})
    end
})

TabInfo:CreateSection("About")

TabInfo:CreateButton({
    Name = "Show Status in Chat",
    Callback = function()
        local persona = getCurrentPersona()
        local balance = getPlayerTokenBalance(LocalPlayer)
        local status = "🤖 AI: " .. (AI_ENABLED and "ON" or "OFF") ..
                       " | Persona: " .. persona.emoji .. CURRENT_PERSONA ..
                       " | Tokens: " .. balance .. "💎" ..
                       " | Mode: " .. SWITCH_MODE
        sendSplitMessages(status, false)
    end
})

TabInfo:CreateButton({
    Name = "Test AI Connection",
    Callback = function()
        Rayfield:Notify({Title = "Testing... ⏳", Content = "Sending test request to AI...", Duration = 3, Image = "wifi"})
        spawn(function()
            local testResponse = callAIPrivate("say 'connected' in one word")
            if testResponse then
                Rayfield:Notify({Title = "✅ Connected!", Content = "AI responded: " .. testResponse:sub(1, 80), Duration = 6, Image = "check-circle"})
            else
                Rayfield:Notify({Title = "❌ Failed", Content = "Could not reach AI API. Check your API key.", Duration = 6, Image = "wifi-off"})
            end
        end)
    end
})

-- =================================================================
-- ===== INITIALIZATION =====
-- =================================================================

initializePlayerTokens(LocalPlayer)

spawn(function()
    wait(1)
    local camera = Workspace.CurrentCamera
    if camera then
        -- store original FOV if needed
    end
end)

playStartupSound()
setupChatListeners()

LocalPlayer.CharacterAdded:Connect(function()
    -- cleanup on respawn if needed
end)

Rayfield:LoadConfiguration()

-- =================================================================
-- ===== END OF SCRIPT =====
-- =================================================================
