local a = game.PlaceId
local b = 13864667823
local c = 14775231477
local d = 13864661000
local e = "https://raw.githubusercontent.com/shlexware/Orion/main/source"
local f = "Phantom HUB | Break in 2"
local g = "Free Gamepasses"
local h = "rbxassetid://4483345998"
local i = game:GetService("ReplicatedStorage")
local j = i.RemoteEvents
local k = "Phone"
local l = true
local m = false
local n = "Book"
local o = "https://discord.com/invite/ZwBTD6kvwa"
local p = setclipboard
local q = "Copied"
local r = "Discord link copied to clipboard."
local s = 5

if a ~= b then
    if a == c or a == d then
        local t = loadstring(game:HttpGet(e))()
        local u = t:MakeWindow({Name = f, HidePremium = false, SaveConfig = true, ConfigFolder = "PhantomHubConfig", IntroText = "Phantom Hub"})
        local v = u:MakeTab({Name = g, Icon = h, PremiumOnly = false})
        v:AddButton({Name = "Free Hacker Role", Callback = function()
            j.OutsideRole:FireServer(k, l, m)
        end})
        v:AddButton({Name = "Free Nerd Kid Role", Callback = function()
            j.OutsideRole:FireServer(n, l, m)
        end})
        v:AddButton({Name = "Discord Link", Callback = function()
            p(o)
            t:MakeNotification({Title = q, Content = r, Image = h, Time = s})
        end})
        t:Init()
        for w, x in pairs(game:GetService("Workspace"):GetChildren()) do
            if x.Name == "Part" and x:FindFirstChild("TouchInterest") then
                firetouchinterest(x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0)
            end
        end
    else
        game:GetService("Players").LocalPlayer:Kick("Error! Game Not Supported!")
    end
else
    local y = Instance.new("Part")
    y.Size = Vector3.new(5, 1, 5)
    y.Parent = game:GetService("Workspace")
    y.Anchored = true
    y.Transparency = 1

    local z = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/OrionLibKeybind.lua')))()
    local aa = i:WaitForChild("Events")
    local ab = "Med Kit"
    local ac = 5
    local ad
    local ae = false
    local af = game:GetService("Players").LocalPlayer
    local ag = game:GetService("Lighting")
    local ah = af.Character.Humanoid.WalkSpeed
    local ai = af.Character.Humanoid.JumpPower
    local aj = 50
    local ak = 100
    local al = ag.Brightness
    local am = ag.FogEnd
    local an = ag.GlobalShadows
    local ao = game:GetService("Workspace").Hails:Clone()
    getgenv().RemoveSlipping = false
    getgenv().SemiGodmode = false

    local ap = getrawmetatable(game)
    local aq = ap.__namecall
    setreadonly(ap, false)
    ap.__namecall = newcclosure(function(self, ...)
        local ar = { ... }
        if getnamecallmethod() == 'FireServer' and self.Name == 'IceSlip' and RemoveSlipping == true then
            return task.wait(387420489)
        end
        return aq(self, unpack(ar))
    end)

    ad = hookmetamethod(game, "__namecall", function(self, ...)
        local as = { ... }
        if getnamecallmethod() == 'FireServer' and self.Name == 'Energy' then
            if SemiGodmode == true then
                if as[1] < 0 then
                    as[1] = 0
                end
            else
                as[1] = as[1]
            end
            return ad(self, unpack(as))
        end
        return ad(self, ...)
    end)

    local at = {"HatCollected", "MaskCollected", "CrowbarCollected"}
    local au = {"Crowbar 1", "Crowbar 2", "Bat", "Pitchfork", "Hammer", "Wrench", "Broom", "Armor", "Med Kit", "Key", "Gold Key", "Louise", "Lollipop", "Chips", "Golden Apple", "Pizza", "Gold Pizza", "Rainbow Pizza", "Rainbow Pizza Box", "Book", "Phone", "Cookie", "Apple", "Bloxy Cola", "Expired Bloxy Cola", "Bottle", "Ladder", "Battery"}

    local function av(name, content, image, time)
        z:MakeNotification({Name = name, Content = content, Image = image, Time = time})
    end

    local function aw(instance)
        pcall(function()
            aa:WaitForChild("OnDoorHit"):FireServer(instance)
        end)
    end

    local function ax()
        for w, x in pairs(af.Character:GetChildren()) do
            if x:IsA("Tool") then
                x.Parent = af.Backpack
            end
        end
    end

    local function ay()
        for w, x in pairs(af.Backpack:GetChildren()) do
            if x:IsA("Tool") then
                x.Parent = af.Character
            end
        end
    end

    local function az(item)
        if item == "Armor" then
            aa:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(af), 1)
        elseif item == "Crowbar 1" or item == "Crowbar 2" or item == "Bat" or item == "Pitchfork" or item == "Hammer" or item == "Wrench" or item == "Broom" then
            aa.Vending:FireServer(3, tostring(item:gsub(" ", "")), "Weapons", af.Name, 1)
            av('Credits To', "Leo Dicap On V3rmillion For Making This Feature!", 'rbxassetid://4483345998', 3)
        else
            aa:WaitForChild("GiveTool"):FireServer(tostring(item:gsub(" ", "")))
        end
    end

    local function ba()
        for w, x in pairs(af.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
            if x.Name:match("Circle") and x.Visible == true then
                az(tostring(x.Name:gsub("Circle", "")))
            end
        end
    end

    local function bb(ability)
        aa:WaitForChild("RainbowWhatStat"):FireServer(ability)
    end

    local function bc(amount)
        aa:WaitForChild("Energy"):FireServer(-amount, false, false)
    end

    local function bd(cframeArg)
        af.Character.HumanoidRootPart.CFrame = cframeArg
    end

    local function be()
        ba()
        task.wait(.1)
        az("Armor")
        task.wait(.1)
        for bf = 1, 5 do
            bb("Speed")
            bb("Strength")
        end
        task.wait(.1)
        ax()
        for bf = 1, 15 do
            az("Gold Pizza")
            task.wait(0.05)
        end
    end

    local function bg()
        ax()
        task.wait(.2)
        az("Golden Apple")
        task.wait(.5)
        af.Backpack:WaitForChild("GoldenApple").Parent = af.Character
        task.wait(.5)
        aa:WaitForChild("HealTheNoobs"):FireServer()
    end

    local function bh()
        az("Pizza")
        aa.Energy:FireServer(25, "Pizza")
    end

    local function bi()
        for w, x in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
            for w = 1, 20 do
                if x:FindFirstChild("TreeHitPart") then
                    aa.RoadMissionEvent:FireServer(1, x.TreeHitPart, 5)
                end
            end
        end
    end

    local function bj()
        for w, x in pairs(game:GetService("Workspace").Keys:GetChildren()) do
            if x.Name == "Key" then
                firetouchinterest(af.Character.HumanoidRootPart, x, 0)
                firetouchinterest(af.Character.HumanoidRootPart, x, 1)
            end
        end
    end

    local bk = z:MakeWindow({Name = f, HidePremium = false, SaveConfig = true, ConfigFolder = "PhantomHubConfig", IntroText = "Phantom Hub"})
        local bl = bk:MakeTab({Name = "Main", Icon = h, PremiumOnly = false})
    bl:AddButton({Name = "Equip All Tools", Callback = function()
        ay()
    end})
    bl:AddButton({Name = "Unequip All Tools", Callback = function()
        ax()
    end})
    bl:AddButton({Name = "Give All Items", Callback = function()
        be()
    end})
    bl:AddButton({Name = "Heal All Players", Callback = function()
        bg()
    end})
    bl:AddButton({Name = "Heal Yourself", Callback = function()
        bh()
    end})
    bl:AddButton({Name = "Break Barricades", Callback = function()
        bi()
    end})
    bl:AddButton({Name = "Get Key", Callback = function()
        bj()
    end})
    bl:AddButton({Name = "Teleport to Floating Part", Callback = function()
        bd(y.CFrame)
    end})
    bl:AddToggle({Name = "Remove Slipping", Default = false, Callback = function(state)
        getgenv().RemoveSlipping = state
    end})
    bl:AddToggle({Name = "Semi-Godmode", Default = false, Callback = function(state)
        getgenv().SemiGodmode = state
    end})
    bl:AddSlider({Name = "Set Walkspeed", Min = 16, Max = 200, Default = ah, Color = Color3.fromRGB(255, 255, 255), Increment = 1, ValueName = "Walkspeed", Callback = function(value)
        af.Character.Humanoid.WalkSpeed = value
    end})
    bl:AddSlider({Name = "Set JumpPower", Min = 50, Max = 200, Default = ai, Color = Color3.fromRGB(255, 255, 255), Increment = 1, ValueName = "JumpPower", Callback = function(value)
        af.Character.Humanoid.JumpPower = value
    end})
    bl:AddButton({Name = "Restore Original Lighting", Callback = function()
        ag.Brightness = al
        ag.FogEnd = am
        ag.GlobalShadows = an
    end})
    
    z:Init()
    if not ae then
        ae = true
        be()
        av("Loaded", "Phantom HUB Loaded Successfully", h, 5)
    end
end
