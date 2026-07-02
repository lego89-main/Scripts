local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Phantom Hub | Strongest Battleground",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "PhantomHubConfig",
    IntroText = "Phantom Hub"
})

local key = "131248120074"
local isUnlocked = false

OrionLib:MakeNotification({
    Name = "Welcome to Phantom Hub",
    Content = "Please enter the key to unlock the script.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

local KeyTab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        if value == key then
            isUnlocked = true
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Key is correct! Script unlocked.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Incorrect key. Please try again.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

KeyTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.com/invite/ZwBTD6kvwa")
        OrionLib:MakeNotification({
            Name = "Copied",
            Content = "Discord link copied to clipboard.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local function checkUnlock(callback)
    return function(...)
        if isUnlocked then
            callback(...)
        else
            OrionLib:MakeNotification({
                Name = "Locked",
                Content = "Please enter the correct key to unlock.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
end

MainTab:AddButton({
    Name = "No/Less Stun [Click Once]",
    Callback = checkUnlock(function()
        local function isNumber(str)
            return tonumber(str) ~= nil or str == 'inf'
        end
        
        local tspeed = 0.3
        local hb = game:GetService("RunService").Heartbeat
        local tpwalking = true
        local player = game:GetService("Players").LocalPlayer
        local chr = player.Character
        
        while tpwalking and hb:Wait() and chr and chr.Parent do
            local hum = chr:FindFirstChildOfClass("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                if tspeed and isNumber(tspeed) then
                    chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
                else
                    chr:TranslateBy(hum.MoveDirection)
                end
            end
        end
    end)
})

MainTab:AddButton({
    Name = "Reach",
    Callback = checkUnlock(function()
        print("Reach Value 69")
    end)
})

MainTab:AddButton({
    Name = "Camera Lock",
    Callback = checkUnlock(function()
        loadstring(game:HttpGet('https://rentry.co/forkoritothegoat/raw'))()
    end)
})

MainTab:AddButton({
    Name = "Infinite Yield",
    Callback = checkUnlock(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
})

MainTab:AddButton({
    Name = "Anti-Combo",
    Callback = checkUnlock(function()
        print("Anti stuck in combos of others")
    end)
})

MainTab:AddButton({
    Name = "Speed",
    Callback = checkUnlock(function()
        local function isNumber(str)
            return tonumber(str) ~= nil or str == 'inf'
        end
        
        local tspeed = 1
        local hb = game:GetService("RunService").Heartbeat
        local tpwalking = true
        local player = game:GetService("Players").LocalPlayer
        local chr = player.Character
        
        while tpwalking and hb:Wait() and chr and chr.Parent do
            local hum = chr:FindFirstChildOfClass("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                if tspeed and isNumber(tspeed) then
                    chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
                else
                    chr:TranslateBy(hum.MoveDirection)
                end
            end
        end
    end)
})

MainTab:AddButton({
    Name = "Esp",
    Callback = checkUnlock(function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        local function createBox()
            local box = Instance.new("BoxHandleAdornment")
            box.Size = Vector3.new(5, 5, 2)
            box.Color3 = Color3.new(1, 0, 0)
            box.Transparency = 0.1
            box.ZIndex = 5
            return box
        end
        
        local function updateEsp(player, box)
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                box.Visible = true
                box.Adornee = character.HumanoidRootPart
                box.Parent = character.HumanoidRootPart
            else
                box.Visible = false
                box.Adornee = nil
                box.Parent = nil
            end
        end
        
        local function onPlayerAdded(player)
            local box = createBox()
            updateEsp(player, box)
            
            player.CharacterAdded:Connect(function()
                updateEsp(player, box)
            end)
            
            player.CharacterRemoving:Connect(function()
                updateEsp(player, box)
            end)
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            onPlayerAdded(player)
        end
        
        Players.PlayerAdded:Connect(function(player)
            onPlayerAdded(player)
        end)
        
        RunService.RenderStepped:Connect(function()
            for _, player in ipairs(Players:GetPlayers()) do
                updateEsp(player)
            end
        end)
    end)
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CreditsTab:AddLabel("Owner - Hawk")
CreditsTab:AddLabel("Phantom Hub")
CreditsTab:AddLabel("Hello Fix Bugs Report In Discord")

CreditsTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.com/invite/ZwBTD6kvwa")
        OrionLib:MakeNotification({
            Name = "Copied",
            Content = "Discord link copied to clipboard.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

CreditsTab:AddButton({
    Name = "Orion Lib",
    Callback = function()
        print("Orion Lib button pressed")
    end
})

local Section = MainTab:AddSection({
    Name = "HUBS"
})

Section:AddButton({
    Name = "Killer Hub",
    Callback = checkUnlock(function()
        loadstring(game:HttpGet("https://pastefy.app/74w2zF6p/raw", true))()
    end)
})

Section:AddButton({
    Name = "BEDOL HUB",
    Callback = checkUnlock(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/TSBG.jsx"))()
    end)
})

Section:AddButton({
    Name = "Light tux",
    Callback = checkUnlock(function()
        loadstring(game:HttpGet('https://pastebin.com/raw/zx3081xc'))()
    end)
})
