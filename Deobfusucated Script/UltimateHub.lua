-- [[ ULTIMATE HUB - INTEGRATED VERSION ]]


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

-- ==================== DEVICE CHECK ====================
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    Players.LocalPlayer:Kick("(PC Only)")
    return
end

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ==================== STATES ====================
local flyEnabled = false
local flySpeed = 50
local noclipEnabled = false
local airwalkEnabled = false
local infJumpEnabled = false
local espHighlight = false
local espTracers = false
local espBoxes = false
local espNames = false
local espHealth = false
local espDistance = false
local teamCheck = false
local fullbright = false
local antiAfkEnabled = false
local espColor = Color3.fromRGB(255, 60, 60)

-- Aimbot States
local aimbotEnabled = false
local aimWallCheck = false
local aimTeamCheck = false
local aimFovRadius = 100
local aimShowFov = false
local aimRgbFov = false
local aimToggleRmb = false
local aimSmoothness = 1 

local flyConnection = nil
local noclipConnection = nil
local airwalkConnection = nil
local airwalkPart = nil
local originalCollisions = {}
local antiAfkConnection = nil

local origAmbient = Lighting.Ambient
local origBrightness = Lighting.Brightness
local origClockTime = Lighting.ClockTime
local origFogEnd = Lighting.FogEnd
local origGlobalShadows = Lighting.GlobalShadows
local origGravity = workspace.Gravity

-- ==================== AIMBOT LOGIC ====================
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1
fovCircle.NumSides = 100
fovCircle.Filled = false
fovCircle.Transparency = 1
fovCircle.Color = Color3.fromRGB(255, 255, 255)

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then
            
            if aimTeamCheck and v.Team == player.Team then continue end
            
            local headPos, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
            if onScreen then
                local mousePos = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(headPos.X, headPos.Y) - mousePos).Magnitude
                
                if distance <= aimFovRadius and distance < shortestDistance then
                    if aimWallCheck then
                        local parts = camera:GetPartsObscuringTarget({v.Character.Head.Position}, {character, v.Character})
                        if #parts == 0 then
                            closestPlayer = v
                            shortestDistance = distance
                        end
                    else
                        closestPlayer = v
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    fovCircle.Visible = aimShowFov
    fovCircle.Radius = aimFovRadius
    fovCircle.Position = UserInputService:GetMouseLocation()
    
    if aimRgbFov then
        fovCircle.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    else
        fovCircle.Color = Color3.fromRGB(255, 255, 255)
    end

    if aimbotEnabled then
        local isRmbPressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if (aimToggleRmb and isRmbPressed) or not aimToggleRmb then
            local target = getClosestPlayer()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                local targetCFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
                camera.CFrame = camera.CFrame:Lerp(targetCFrame, 1 / aimSmoothness)
            end
        end
    end
end)

-- ==================== TP TOOL LOGIC ====================
local function giveTpTool()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/manueljrtalidano14-wq/0e871d4d90f371635e441cc613178ba9/raw/"))()
end

-- ==================== CHARACTER RESPAWN ====================
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    rootPart = newChar:WaitForChild("HumanoidRootPart")
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
end)

-- ==================== FLY ====================
local function startFly()
    if flyConnection then flyConnection:Disconnect() end

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.zero
    bv.Parent = rootPart

    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    bg.D = 100
    bg.Parent = rootPart

    humanoid.PlatformStand = true

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flyEnabled then
            bv:Destroy()
            bg:Destroy()
            if humanoid then humanoid.PlatformStand = false end
            flyConnection:Disconnect()
            flyConnection = nil
            return
        end
        local cf = camera.CFrame
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0, 1, 0) end
        bv.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.zero
        bg.CFrame = cf
    end)
end

-- ==================== NOCLIP ====================
local function enableNoclip()
    if noclipConnection then noclipConnection:Disconnect() end
    originalCollisions = {}
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                originalCollisions[part] = part.CanCollide
            end
        end
    end
    noclipConnection = RunService.Stepped:Connect(function()
        if not noclipEnabled or not character then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function disableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                if part.Name == "HumanoidRootPart" then
                    part.CanCollide = false
                elseif originalCollisions[part] ~= nil then
                    part.CanCollide = originalCollisions[part]
                else
                    part.CanCollide = true
                end
            end
        end
    end
    originalCollisions = {}
end

-- ==================== AIRWALK ====================
local function enableAirwalk()
    if airwalkPart then airwalkPart:Destroy() end

    airwalkPart = Instance.new("Part")
    airwalkPart.Size = Vector3.new(3.5, 0.05, 3.5)
    airwalkPart.Anchored = true
    airwalkPart.CanCollide = true
    airwalkPart.Transparency = 1
    airwalkPart.CanTouch = false
    airwalkPart.Name = "AirwalkPlatform"
    airwalkPart.Material = Enum.Material.SmoothPlastic
    airwalkPart.Parent = workspace

    local lockedY = rootPart.Position.Y - 2.9
    airwalkPart.CFrame = CFrame.new(rootPart.Position.X, lockedY, rootPart.Position.Z)

    airwalkConnection = RunService.Heartbeat:Connect(function()
        if not airwalkEnabled or not rootPart then
            if airwalkPart then airwalkPart:Destroy(); airwalkPart = nil end
            if airwalkConnection then airwalkConnection:Disconnect(); airwalkConnection = nil end
            return
        end
        local pos = rootPart.Position
        local floorY = pos.Y - 2.9
        if floorY < lockedY then
            lockedY = floorY
        end
        airwalkPart.CFrame = CFrame.new(pos.X, lockedY, pos.Z)
    end)
end

local function disableAirwalk()
    airwalkEnabled = false
    if airwalkConnection then airwalkConnection:Disconnect(); airwalkConnection = nil end
    if airwalkPart then airwalkPart:Destroy(); airwalkPart = nil end
end

-- ==================== INFINITE JUMP ====================
UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ==================== FULLBRIGHT ====================
local function enableFullbright()
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end

local function disableFullbright()
    Lighting.Ambient = origAmbient
    Lighting.Brightness = origBrightness
    Lighting.ClockTime = origClockTime
    Lighting.FogEnd = origFogEnd
    Lighting.GlobalShadows = origGlobalShadows
end

-- ==================== ANTI AFK ====================
local function enableAntiAfk()
    if antiAfkConnection then antiAfkConnection:Disconnect() end
    local afkTimer = 0
    antiAfkConnection = RunService.Heartbeat:Connect(function(dt)
        afkTimer = afkTimer + dt
        if afkTimer >= 60 then
            afkTimer = 0
            player:Move(Vector3.new(0, 0, 0), false)
        end
    end)
end

local function disableAntiAfk()
    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
    end
end

-- ==================== ESP ====================
local highlights = {}
local playerDrawings = {}

local function isSameTeam(targetPlayer)
    if not teamCheck then return false end
    if player.Team ~= nil and targetPlayer.Team ~= nil then
        return player.Team == targetPlayer.Team
    end
    if player.TeamColor and targetPlayer.TeamColor then
        return player.TeamColor == targetPlayer.TeamColor
    end
    return false
end

local function removeHighlight(targetPlayer)
    if highlights[targetPlayer] then
        highlights[targetPlayer]:Destroy()
        highlights[targetPlayer] = nil
    end
end

local function removeDrawings(targetPlayer)
    if playerDrawings[targetPlayer] then
        for _, d in pairs(playerDrawings[targetPlayer]) do
            pcall(function() d:Remove() end)
        end
        playerDrawings[targetPlayer] = nil
    end
end

local function getDrawings(targetPlayer)
    if not playerDrawings[targetPlayer] then
        local tracer = Drawing.new("Line")
        tracer.Color = espColor; tracer.Thickness = 1.5; tracer.Visible = false

        local boxT = Drawing.new("Line"); boxT.Color = espColor; boxT.Thickness = 1.5; boxT.Visible = false
        local boxB = Drawing.new("Line"); boxB.Color = espColor; boxB.Thickness = 1.5; boxB.Visible = false
        local boxL = Drawing.new("Line"); boxL.Color = espColor; boxL.Thickness = 1.5; boxL.Visible = false
        local boxR = Drawing.new("Line"); boxR.Color = espColor; boxR.Thickness = 1.5; boxR.Visible = false

        local nameTag = Drawing.new("Text")
        nameTag.Size = 13; nameTag.Color = Color3.fromRGB(255,255,255)
        nameTag.Outline = true; nameTag.Center = true; nameTag.Visible = false; nameTag.Font = 2

        local healthTag = Drawing.new("Text")
        healthTag.Size = 12; healthTag.Color = Color3.fromRGB(50, 255, 100)
        healthTag.Outline = true; healthTag.Center = true; healthTag.Visible = false; healthTag.Font = 2

        local distTag = Drawing.new("Text")
        distTag.Size = 11; distTag.Color = Color3.fromRGB(200, 200, 200)
        distTag.Outline = true; distTag.Center = true; distTag.Visible = false; distTag.Font = 2

        playerDrawings[targetPlayer] = {
            tracer = tracer,
            boxT = boxT, boxB = boxB, boxL = boxL, boxR = boxR,
            name = nameTag, health = healthTag, distance = distTag
        }
    end
    return playerDrawings[targetPlayer]
end

local function updateAllDrawingColors()
    for _, d in pairs(playerDrawings) do
        if d.tracer then d.tracer.Color = espColor end
        if d.boxT then d.boxT.Color = espColor end
        if d.boxB then d.boxB.Color = espColor end
        if d.boxL then d.boxL.Color = espColor end
        if d.boxR then d.boxR.Color = espColor end
    end
    for _, h in pairs(highlights) do
        h.FillColor = espColor
    end
end

RunService.RenderStepped:Connect(function()
    for _, target in ipairs(Players:GetPlayers()) do
        if target == player then continue end

        local char = target.Character
        local tRoot = char and char:FindFirstChild("HumanoidRootPart")
        local tHum = char and char:FindFirstChildOfClass("Humanoid")
        local alive = tHum and tHum.Health > 0
        local sameTeam = isSameTeam(target)

        if espHighlight and char and alive and not sameTeam then
            if not highlights[target] then
                local h = Instance.new("Highlight")
                h.FillColor = espColor
                h.OutlineColor = Color3.fromRGB(255, 255, 255)
                h.FillTransparency = 0.5
                h.Adornee = char
                h.Parent = char
                highlights[target] = h
            end
        else
            removeHighlight(target)
        end

        local anyESP = espTracers or espBoxes or espNames or espHealth or espDistance
        if not anyESP or not char or not tRoot or not alive or sameTeam then
            local d = playerDrawings[target]
            if d then for _, obj in pairs(d) do obj.Visible = false end end
            continue
        end

        local d = getDrawings(target)
        local headPos = tRoot.Position + Vector3.new(0, 3.2, 0)
        local feetPos = tRoot.Position - Vector3.new(0, 3.2, 0)

        local headSc, headVis = camera:WorldToViewportPoint(headPos)
        local feetSc, feetVis = camera:WorldToViewportPoint(feetPos)
        local rootSc, rootVis = camera:WorldToViewportPoint(tRoot.Position)
        local vis = headVis or feetVis or rootVis

        if espTracers and vis then
            local vp = camera.ViewportSize
            d.tracer.From = Vector2.new(vp.X / 2, vp.Y)
            d.tracer.To = Vector2.new(feetSc.X, feetSc.Y)
            d.tracer.Color = espColor
            d.tracer.Visible = true
        else
            d.tracer.Visible = false
        end

        if espBoxes and vis then
            local h2 = math.abs(headSc.Y - feetSc.Y)
            local w = h2 * 0.42
            local cx = rootSc.X
            local top, bot = headSc.Y, feetSc.Y
            local lft, rgt = cx - w, cx + w
            d.boxT.From = Vector2.new(lft, top); d.boxT.To = Vector2.new(rgt, top); d.boxT.Color = espColor; d.boxT.Visible = true
            d.boxB.From = Vector2.new(lft, bot); d.boxB.To = Vector2.new(rgt, bot); d.boxB.Color = espColor; d.boxB.Visible = true
            d.boxL.From = Vector2.new(lft, top); d.boxL.To = Vector2.new(lft, bot); d.boxL.Color = espColor; d.boxL.Visible = true
            d.boxR.From = Vector2.new(rgt, top); d.boxR.To = Vector2.new(rgt, bot); d.boxR.Color = espColor; d.boxR.Visible = true
        else
            d.boxT.Visible = false; d.boxB.Visible = false
            d.boxL.Visible = false; d.boxR.Visible = false
        end

        if espNames and vis then
            local offset = espHealth and -40 or -18
            d.name.Position = Vector2.new(headSc.X, headSc.Y + offset)
            d.name.Text = target.DisplayName
            d.name.Visible = true
        else
            d.name.Visible = false
        end

        if espHealth and vis then
            d.health.Position = Vector2.new(headSc.X, headSc.Y - 18)
            d.health.Text = math.floor(tHum.Health) .. " / " .. math.floor(tHum.MaxHealth) .. " HP"
            d.health.Visible = true
        else
            d.health.Visible = false
        end

        if espDistance and vis and rootPart then
            local dist = math.floor((rootPart.Position - tRoot.Position).Magnitude)
            d.distance.Position = Vector2.new(feetSc.X, feetSc.Y + 4)
            d.distance.Text = dist .. " studs"
            d.distance.Visible = true
        else
            d.distance.Visible = false
        end
    end
end)

Players.PlayerRemoving:Connect(function(target)
    removeHighlight(target)
    removeDrawings(target)
end)

-- ==================== RAYFIELD WINDOW ====================
local Window = Rayfield:CreateWindow({
    Name = "✦ Ultimate Hub",
    Icon = 0,
    LoadingTitle = "✦ Ultimate Hub",
    LoadingSubtitle = "By Em_Jay225",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- ==================== MAIN TAB ====================
local Main = Window:CreateTab("⚡ Main", nil)

Main:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "WS",
    CurrentValue = 16,
    Callback = function(v)
        if humanoid then humanoid.WalkSpeed = v end
    end,
})

Main:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 1,
    Suffix = "JP",
    CurrentValue = 50,
    Callback = function(v)
        if humanoid then humanoid.JumpPower = v end
    end,
})

Main:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(v)
        flyEnabled = v
        if v then startFly() end
    end,
})

Main:CreateSlider({
    Name = "Fly Speed",
    Range = {5, 500},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Callback = function(v)
        flySpeed = v
    end,
})

Main:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(v)
        noclipEnabled = v
        if v then enableNoclip() else disableNoclip() end
    end,
})

Main:CreateToggle({
    Name = "Airwalk",
    CurrentValue = false,
    Callback = function(v)
        airwalkEnabled = v
        if v then enableAirwalk() else disableAirwalk() end
    end,
})

Main:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        infJumpEnabled = v
    end,
})

Main:CreateParagraph({
    Title = "Fly Controls",
    Content = "W/A/S/D — Move   |   Space — Up   |   Left Shift — Down",
})

-- ==================== VISUALS TAB ====================
local Visuals = Window:CreateTab("👁 Visuals", nil)

Visuals:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 60, 60),
    Flag = "ESPColor",
    Callback = function(v)
        espColor = v
        updateAllDrawingColors()
    end,
})

Visuals:CreateToggle({
    Name = "Highlight Players",
    CurrentValue = false,
    Callback = function(v)
        espHighlight = v
        if not v then
            for _, p in ipairs(Players:GetPlayers()) do removeHighlight(p) end
        end
    end,
})

Visuals:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Callback = function(v) espTracers = v end,
})

Visuals:CreateToggle({
    Name = "Boxes",
    CurrentValue = false,
    Callback = function(v) espBoxes = v end,
})

Visuals:CreateToggle({
    Name = "Names",
    CurrentValue = false,
    Callback = function(v) espNames = v end,
})

Visuals:CreateToggle({
    Name = "Health",
    CurrentValue = false,
    Callback = function(v) espHealth = v end,
})

Visuals:CreateToggle({
    Name = "Distance",
    CurrentValue = false,
    Callback = function(v) espDistance = v end,
})

Visuals:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Callback = function(v) teamCheck = v end,
})

Visuals:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Callback = function(v)
        fullbright = v
        if v then enableFullbright() else disableFullbright() end
    end,
})

-- ==================== AIMBOT TAB ====================
local Combat = Window:CreateTab("🎯 Aimbot", nil)

Combat:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(v)
        aimbotEnabled = v
    end,
})

Combat:CreateSlider({
    Name = "Smoothness",
    Range = {1, 20},
    Increment = 1,
    Suffix = "lvl",
    CurrentValue = 1,
    Callback = function(v)
        aimSmoothness = v
    end,
})

Combat:CreateToggle({
    Name = "Wall Check",
    CurrentValue = false,
    Callback = function(v)
        aimWallCheck = v
    end,
})

Combat:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Callback = function(v)
        aimTeamCheck = v
    end,
})

Combat:CreateSlider({
    Name = "FOV Radius",
    Range = {10, 800},
    Increment = 10,
    Suffix = "px",
    CurrentValue = 100,
    Callback = function(v)
        aimFovRadius = v
    end,
})

Combat:CreateToggle({
    Name = "Show FOV",
    CurrentValue = false,
    Callback = function(v)
        aimShowFov = v
    end,
})

Combat:CreateToggle({
    Name = "RGB FOV",
    CurrentValue = false,
    Callback = function(v)
        aimRgbFov = v
    end,
})

Combat:CreateToggle({
    Name = "Toggle by RMB",
    CurrentValue = false,
    Callback = function(v)
        aimToggleRmb = v
    end,
})

-- ==================== EXTRAS TAB ====================
local Extras = Window:CreateTab("🛠 Extras", nil)

Extras:CreateButton({
    Name = "TP List",
    Callback = function()
        loadstring(game:HttpGet"https://pastefy.app/ypGIY08v/raw")()
        Rayfield:Notify({
            Title = "TP List",
            Content = "TP List script loaded successfully!",
            Duration = 4,
        })
    end,
})

Extras:CreateButton({
    Name = "Give TP Tool",
    Callback = function()
        giveTpTool()
        Rayfield:Notify({
            Title = "TP Tool",
            Content = "Teleport tool successfully loaded!",
            Duration = 3,
        })
    end,
})

Extras:CreateButton({
    Name = "Open Invisible GUI",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/maks1165/b49e0fd87fc998e138433aaa1e854111/raw/760f4c82d8e3425f48512f14e8a52bfd359ac1d3/Invisible"))()
        Rayfield:Notify({
            Title = "Invisible GUI",
            Content = "Invisible GUI has been loaded!",
            Duration = 4,
        })
    end,
})

Extras:CreateSlider({
    Name = "Gravity",
    Range = {5, 300},
    Increment = 5,
    Suffix = "G",
    CurrentValue = 196,
    Callback = function(v)
        workspace.Gravity = v
    end,
})

Extras:CreateButton({
    Name = "Reset Gravity",
    Callback = function()
        workspace.Gravity = origGravity
        Rayfield:Notify({ Title = "Gravity", Content = "Gravity reset to default.", Duration = 3 })
    end,
})

Extras:CreateSlider({
    Name = "Time of Day",
    Range = {0, 24},
    Increment = 1,
    Suffix = ":00",
    CurrentValue = math.floor(Lighting.ClockTime),
    Callback = function(v)
        Lighting.ClockTime = v
    end,
})

Extras:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Callback = function(v)
        antiAfkEnabled = v
        if v then enableAntiAfk() else disableAntiAfk() end
    end,
})

-- ==================== MISC TAB ====================
local Misc = Window:CreateTab("🔧 Misc", nil)

Misc:CreateButton({
    Name = "Rejoin",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, player)
    end,
})

Misc:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local ok, res = pcall(function()
            return game:HttpGet(
                "https://games.roblox.com/v1/games/"
                .. game.PlaceId
                .. "/servers/Public?sortOrder=Asc&limit=100"
            )
        end)
        if ok then
            local data = HttpService:JSONDecode(res)
            for _, s in ipairs(data.data) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                    return
                end
            end
            Rayfield:Notify({ Title = "Server Hop", Content = "No open servers found!", Duration = 3 })
        else
            Rayfield:Notify({ Title = "Server Hop", Content = "Failed to fetch servers.", Duration = 3 })
        end
    end,
})

Misc:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        flyEnabled = false
        noclipEnabled = false
        airwalkEnabled = false
        aimbotEnabled = false
        aimShowFov = false
        fovCircle:Remove()
        disableNoclip()
        disableAirwalk()
        disableFullbright()
        disableAntiAfk()
        workspace.Gravity = origGravity
        for _, p in ipairs(Players:GetPlayers()) do
            removeHighlight(p)
            removeDrawings(p)
        end
        Rayfield:Destroy()
    end,
})

-- ==================== INFO TAB (LAST) ====================
local InfoTab = Window:CreateTab("ℹ Info", nil)

InfoTab:CreateParagraph({
    Title = "Hub Information",
    Content = "Creator: Em_Jay225\nHub Name: Ultimate Hub\nFeatures: 32 Features\nLast Updated: May 3, 2026"
})

Rayfield:Notify({
    Title = "✦ Ultimate Hub Loaded",
    Content = "All features ready!",
    Duration = 5,
    Image = 4483362458,
})
