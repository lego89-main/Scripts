repeat wait() until game.Players.LocalPlayer.Character ~= nil

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/LEGO89-Dev/Scripts/refs/heads/main/libs/Rayfield.lua'))()

local MarketplaceService = game:GetService("MarketplaceService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local TextChatService = game:GetService("TextChatService")
local ContentProvider = game:GetService("ContentProvider")
local NetworkClient = game:GetService("NetworkClient")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local UserService = game:GetService("UserService")
local TestService = game:GetService("TestService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
local Stats = game:GetService("Stats")

local SoundVolume = 1
local IsSound = true
local TurnOff = true

local ScriptName = "CyberX"

local Blur = Lighting:FindFirstChild("Blur")
if not Blur then
    Blur = Instance.new("BlurEffect")
    Blur.Parent = Lighting
    Blur.Size = 0
end

local function PlaySound(SoundType, Toggle)
    if not IsSound then return end
    local Sounds = {
        Click = 15675059323,
        ToggleOn = 9083627113,
        ToggleOff = 73801435898712,
        Loading = 0,
        Typing = 93927627634818,
        EnterClick = 6436180986,
        Slider = 17373418122
    }
    local Sound = Instance.new("Sound")
    Sound.Volume = 1 * SoundVolume
    Sound.PlaybackSpeed = 1
    if SoundType == "Toggle" then
        Sound.SoundId = "rbxassetid://" ..Sounds["Toggle"..(Toggle and "On" or "Off")]
    else
        Sound.SoundId = "rbxassetid://" ..Sounds[SoundType]
    end
    
    
    SoundService:PlayLocalSound(Sound)
    
    task.delay(3,function()
    	Sound:Destroy()
    end)
end

TweenService:Create(Blur, TweenInfo.new(1), {Size = 100}):Play()

local Window = Rayfield:CreateWindow({
   Name = ScriptName.." | by LE_GO89",
   FileName = ScriptName,
   Icon = 0,
   LoadingTitle = ScriptName,
   LoadingSubtitle = "by LE_GO89",
   Theme = "Default",
   ToggleUIKeybind = "H",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "",
      FileName = "data"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = ScriptName,
      Subtitle = "Key",
      Note = "Get the key by visit the website and wait 5 sec copy the key",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"Hi"}
    }
})

TweenService:Create(Blur, TweenInfo.new(1), {Size = 0}):Play()

local RunAntiAfk
local Timer = 0
local plr = game.Players.LocalPlayer
local Players = game.Players
local AllSave = {}
local ST = Instance.new("ScreenGui")
local T = Instance.new("ImageButton")
local Corner = Instance.new("UICorner")
ST.Name = "Toggle ScriptName"
ST.Parent = Rayfield:GetParent().Parent
ST.ResetOnSpawn = false
Corner.Name = "Corner"
Corner.Parent = T
T.Name = "T"
T.Parent = ST
T.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
T.Position = UDim2.new(0, 30, 0.08, 0)
T.Size = UDim2.new(0, 50, 0, 50)
T.Image = "rbxthumb://type=GameThumbnail&id="..game.PlaceId.."&w=256&h=144"
T.Active = true
T.Draggable = true
T.MouseButton1Click:connect(function()
    Rayfield:SetEnable(not Rayfield:GetEnable())
end)

local Lighting = game:GetService("Lighting")

local Stuff = {}
local Enabled = false

local ToDisable = {
	Textures = true,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true,
	FullBright = true
}

local function Save(obj, props)
	local data = {Object = obj, Properties = {}}
	for _, prop in ipairs(props) do
		data.Properties[prop] = obj[prop]
	end
	table.insert(Stuff, data)
end

local function EnableFPS()
	if Enabled then return end
	Enabled = true
	table.clear(Stuff)

	for _, v in ipairs(game:GetDescendants()) do
		if ToDisable.Parts and v:IsA("BasePart") then
			Save(v, {"Material"})
			v.Material = Enum.Material.SmoothPlastic
		end

		if ToDisable.Particles and (v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles")) then
			Save(v, {"Enabled"})
			v.Enabled = false
		end

		if ToDisable.VisualEffects and v:IsA("PostEffect") then
			Save(v, {"Enabled"})
			v.Enabled = false
		end

		if ToDisable.Textures and (v:IsA("Decal") or v:IsA("Texture")) then
			Save(v, {"Texture"})
			v.Texture = ""
		end

		if ToDisable.Sky and v:IsA("Sky") then
			Save(v, {"Parent"})
			v.Parent = nil
		end
	end

	if ToDisable.FullBright then
		Save(Lighting, {
			"FogColor","FogEnd","FogStart","Ambient","Brightness",
			"ColorShift_Bottom","ColorShift_Top","OutdoorAmbient"
		})

		Lighting.FogEnd = math.huge
		Lighting.FogStart = math.huge
		Lighting.Brightness = 5
		Lighting.Ambient = Color3.new(1,1,1)
		Lighting.OutdoorAmbient = Color3.new(1,1,1)
	end
end

local function DisableFPS()
	if not Enabled then return end
	Enabled = false

	for _, data in ipairs(Stuff) do
		if data.Object then
			for prop, value in pairs(data.Properties) do
				pcall(function()
					data.Object[prop] = value
				end)
			end
		end
	end

	table.clear(Stuff)
end

local function ToggleFPS(Value)
	if Value then
		EnableFPS()
	else
		DisableFPS()
	end
end

--#####################[[ SCIRPT LOGIC ]]#######################--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

if hrp then
    local SaveCFrame = hrp.CFrame
    hrp.CFrame = workspace.Zones.DiceShop.CFrame
    task.wait(0.1)
    hrp.CFrame = SaveCFrame
    task.wait(0.5)
end

local LogicSettings = {
    AutoCollectMoney = false,
    AutoRebirth = false,
    AutoBuyDice = false,
    AutoUpgradeCharacter = false,
    AutoUpgrade = false,
}

local Plot
local DiceList = {}
local SelectDice = "Normal"
for Index, Value in pairs(workspace.Plots.Claimed:GetChildren()) do
    if Value.Label.BillboardGui.PlayerName.Text == "LEGO89" then
        Plot = Value
        break
    end
end
for Index, Value in pairs(plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame:GetChildren()) do
    if Value:IsA("Frame") and Value.Visible then
        DiceList[#DiceList+1] = Value.Name
    end
end
plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame.ChildAdded:Connect(function(Child)
    if Child:IsA("Frame") and Child.Visible then
        DiceList[#DiceList+1] = Child.Name
    end
end)

local function ConvertNumber(String)
	local Number, Unit = String:lower():match("^([%d%.]+)%s*([a-z]+)$")

	if not Number then
		return tonumber(String)
	end

	Number = tonumber(Number)

	local Units = {
		k = 3,
		m = 6,
		b = 9,
		t = 12,
		qd = 15,
		qi = 18,
		sx = 21,
		sp = 24,
		oc = 27,
		no = 30,
		udc = 33,
		ddc = 36,
		tdc = 39,
		qadc = 42,
		qidc = 45,
		sxdc = 48,
		spdc = 51,
		ocdc = 54,
		ndc = 57
	}

	local Power = Units[Unit]

	if not Power then
		return nil
	end

	return Number * 10^Power
end

task.spawn(function()
    while not Rayfield:GetGui() do
        if LogicSettings["AutoCollectMoney"] then
            for Index, Value in pairs(Plot["Slots"]:GetChildren()) do
                if Value.Locked.Enabled ~= true then
                    ReplicatedStorage:WaitForChild("Network"):WaitForChild("PlotService"):WaitForChild("RE"):WaitForChild("CollectBalance"):FireServer(tonumber(Value.Name))
                end
            end
        end
        if LogicSettings["AutoRebirth"] then
            if plr.PlayerGui.Root.Menus.Rebirth.Requirement.ProgressBar.InnerBar.Size.X.Scale == 1 then
                ReplicatedStorage:WaitForChild("Network"):WaitForChild("RebirthService"):WaitForChild("RE"):WaitForChild("Rebirth"):FireServer()
            end
        end
        task.spawn(function()
            if LogicSettings["AutoUpgradeCharacter"] then
                for Index, Value in pairs(Plot["Slots"]:GetChildren()) do
                    if Value:FindFirstChild("Upgrade") and ConvertNumber((Value.Upgrade.Board.SurfaceGui.Frame.Price.Text:gsub("%$", ""))) <= ConvertNumber(plr.leaderstats.Money.Value) then
                        ReplicatedStorage:WaitForChild("Network"):WaitForChild("PlotService"):WaitForChild("RE"):WaitForChild("LevelUpSlot"):FireServer(tonumber(Value.Name))
                        task.wait(0.1)
                    end
                end
            end
        end)
        task.spawn(function()
            if LogicSettings["AutoBuyDice"] then
                for Index, Value in pairs(plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame:GetChildren()) do
                    if Value:IsA("Frame") and Value.Visible and Value.Buttons.Buy.Frame.Info.Price.Text ~= "Equip" and Value.Buttons.Buy.Frame.Info.Price.Text ~= "Equipped" then
                        if ConvertNumber((Value.Buttons.Buy.Frame.Info.Price.Text:gsub("%$", ""))) <= ConvertNumber(plr.leaderstats.Money.Value) then
                            local Event = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("DiceShopService"):WaitForChild("RE"):WaitForChild("BuyDice")
                            Event:FireServer(
                                Value.Name
                            )
                            task.wait(0.1)
                        end
                    end
                end
            end
        end)
        if LogicSettings["AutoUpgrade"] then
            for Index, Value in pairs(plr.PlayerGui.Root.Upgrades.Screen:GetChildren()) do
                if Value:IsA("ImageButton") and Value.Visible and Value.Tile.Price.Visible and ConvertNumber((Value.Tile.Price.TextLabel.Text:gsub("%$", ""))) <= ConvertNumber(plr.leaderstats.Money.Value) then
                    ReplicatedStorage:WaitForChild("Network"):WaitForChild("RE"):WaitForChild("BuyUpgrade"):FireServer(
                        Value.Tile.TextLabel.Text
                    )
                end
            end
        end
        if LogicSettings["AutoEquipBestDice"] then
            local CurrentDiceLuck = -1
            local TheLuck = 0
            local Name = ""
            for Index, Value in pairs(plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame:GetChildren()) do
                if Value:IsA("Frame") and Value.Visible then
                    local Luck = tonumber(Value.Info.Luck.Luck.Text:gsub("%D", ""))
                    if Value.Buttons.Buy.Frame.Info.Price.Text == "Equip" then
                        if TheLuck < Luck then
                            TheLuck = Luck
                            Name = Value.Name
                        end
                    elseif Value.Buttons.Buy.Frame.Info.Price.Text == "Equipped" then
                        CurrentDiceLuck = Luck
                    end
                end
            end
            if CurrentDiceLuck < TheLuck then
                CurrentDiceLuck = TheLuck
                ReplicatedStorage:WaitForChild("Network"):WaitForChild("DiceShopService"):WaitForChild("RE"):WaitForChild("EquipDice"):FireServer(Name)
            end
        end
        task.wait(1)
    end
end)

--##############################################################--

local Main = Window:CreateTab("Main", 125058207637011)
Main:CreateSection("Main")

Main:CreateLabel("Server: "..game.JobId, 9692125126)

AllSave.EnableFPST = Main:CreateToggle({Name = "Enable FPS Booster", CurrentValue = false, Flag = "EnableFPST", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    ToggleFPS(Value)
end})

AllSave.AntiAFKBypassT = Main:CreateToggle({
    Name = "Anti AFK Bypass",
    CurrentValue = false,
    Flag = "AntiAFKBypassT",
    Callback = function(Value)
        if IsSet == false then PlaySound("Toggle", Value) end
        if Value then
            RunAntiAfk = Players.LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        else
            if RunAntiAfk then
                RunAntiAfk:Disconnect()
                RunAntiAfk = nil
            end
        end
    end
})

AllSave.AutoRejoinAfter15minT = Main:CreateToggle({Name = "Auto Rejoin After 15min", CurrentValue = false, Flag = "AutoRejoinAfter15minT", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    AutoRejoinAfter15min = Value
    if Value then
        Rayfield:Notify({
            Title = "✅ Successfully",
            Content = "Timer Start Now",
            Duration = 3.5,
            Image = 11745872910,
        })
    else
        Rayfield:Notify({
            Title = "✅ Successfully",
            Content = "Timer Reset",
            Duration = 3.5,
            Image = 11745872910,
        })
        Timer = 0
    end
end})

AllSave.AutoExecute = Main:CreateToggle({Name = "Auto Execute", CurrentValue = false, Flag = "AutoExecute", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    AutoExecute = Value
end})

Main:CreateInput({Name = "Server", CurrentValue = "", PlaceholderText = "ServerId", RemoveTextAfterFocusLost = true, Callback = function(Value)
    PlaySound("EnterClick")
    TeleportService:TeleportToPlaceInstance(game.PlaceId, Value, plr)
end})

Main:CreateButton({Name = "Rejoin", Callback = function()
    PlaySound("Click")
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end})

Main:CreateButton({Name = "Server Hop", Callback = function()
    PlaySound("Click")
    local servers = {}
    local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
    local body = HttpService:JSONDecode(req)

    if body and body.data then
        for i, v in next, body.data do
            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                table.insert(servers, 1, v.id)
            end
        end
    end

    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], plr)
    end
end})

local Farm = Window:CreateTab("Farm", 13060262529)
Farm:CreateSection("Farm")

AllSave.AutoCollectMoney = Farm:CreateToggle({Name = "Auto Collect Money", CurrentValue = false, Flag = "AutoCollectMoney", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoCollectMoney"] = Value
end})

AllSave.AutoRebirth = Farm:CreateToggle({Name = "Auto Rebirth", CurrentValue = false, Flag = "AutoRebirth", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoRebirth"] = Value
end})

AllSave.AutoUpgradeCharacter = Farm:CreateToggle({Name = "Auto Upgrade Character", CurrentValue = false, Flag = "AutoUpgradeCharacter", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoUpgradeCharacter"] = Value
end})

AllSave.AutoUpgrade = Farm:CreateToggle({Name = "Auto Upgrade", CurrentValue = false, Flag = "AutoUpgrade", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoUpgrade"] = Value
end})

local Shop = Window:CreateTab("Shop", 10893267086)
Shop:CreateSection("Shop")

AllSave.AutoBuyDice = Shop:CreateToggle({Name = "Auto Buy Dice", CurrentValue = false, Flag = "AutoBuyDice", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoBuyDice"] = Value
end})

AllSave.DiceList = Shop:CreateDropdown({Name = "Dice List",  Options = DiceList, CurrentOption = SelectDice,  MultipleOptions = false,  Flag = "DiceList",  Callback = function(Value)  
    PlaySound("Click")  
    SelectDice = Value
end})

Shop:CreateButton({Name = "Equip", Callback = function()
    PlaySound("Click")
    if plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame[SelectDice].Buttons.Buy.Frame.Info.Price.Text == "Equip" then
        if plr.PlayerGui.Root.Menus.DiceShop.Content.ScrollingFrame[SelectDice].Buttons.Buy.Frame.Info.Price.Text ~= "Equipped" then
            ReplicatedStorage:WaitForChild("Network"):WaitForChild("DiceShopService"):WaitForChild("RE"):WaitForChild("EquipDice"):FireServer(SelectDice)
        end
    else
        Rayfield:Notify({
            Title = "⚠️ Warn!",
            Content = "You don't own this dice.",
            Duration = 3.5,
            Image = 11745872910,
        })
    end
end})

AllSave.AutoEquipBestDice = Shop:CreateToggle({Name = "Auto Equip Best Dice", CurrentValue = false, Flag = "AutoEquipBestDice", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    LogicSettings["AutoEquipBestDice"] = Value
end})

local Setting = Window:CreateTab("Setting", 11713339600)
Setting:CreateSection("System Setting")

local FontStyles = {}
local FontSizes = {}

for _, v in ipairs(Rayfield:GetParent():GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        table.insert(FontStyles, {v.Font, v})
    end
end

for _, v in ipairs(Rayfield:GetParent():GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        table.insert(FontSizes, {v.TextSize, v})
    end
end

for _, v in ipairs(Rayfield:GetParent():GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        v.Font = Enum.Font.FredokaOne
    end
end

Window.ModifyTheme("Amethyst")

if not Rayfield:GetMain():FindFirstChild("ImageBackground") then
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ImageBackground"
    ImageLabel.Parent = Rayfield:GetMain()
    ImageLabel.Active = true
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Size = UDim2.new(1,0,1,0)
    ImageLabel.ZIndex = -1
    ImageLabel.Image = "rbxassetid://13141610892"
    ImageLabel.Transparency = 1
    
    local UICorner = Instance.new("UICorner")
    UICorner.Name = "UICorner"
    UICorner.Parent = ImageLabel
    UICorner.CornerRadius = UDim.new(0,15)
end

Rayfield:GetMain().ImageBackground.ImageTransparency = 0
Rayfield:GetMain().ImageBackground.Visible = true
Rayfield:GetMain().BackgroundTransparency = 1
Rayfield:GetParent().Notifications.Template.Interact.Active = false

AllSave.TurnOff = Setting:CreateToggle({Name = "Turn Off All Thing When Close", CurrentValue = true, Flag = "Turn Off All Thing When Close", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    TurnOff = Value
end})

AllSave.IsSound = Setting:CreateToggle({Name = "Sound Effect", CurrentValue = true, Flag = "Sound Effect", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    IsSound = Value
end})

AllSave.Notifications = Setting:CreateToggle({Name = "Notifications", CurrentValue = true, Flag = "Notifications", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Rayfield:GetParent().Notifications.Visible = Value
end})

AllSave.SoundVolume = Setting:CreateSlider({Name = "Sound Volume", Range = {0, 100}, Increment = 1, Suffix = "%", CurrentValue = 100, Flag = "SoundVolume", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Slider") end
    SoundVolume = Value / 100
end})

Setting:CreateSection("UI Setting")

local BackgroundTransparency = 0

AllSave.ImageBackground = Setting:CreateToggle({Name = "Image Background", CurrentValue = true, Flag = "ImageBackground", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    local Main = Rayfield:GetMain()
    local Topbar = Main.Topbar
    local TabList = Main.TabList
    local Elements = Main.Elements
    
    if Value then
        Main.ImageBackground.ImageTransparency = BackgroundTransparency
        Main.ImageBackground.Visible = true
        Main.BackgroundTransparency = 1
    else
        Main.ImageBackground.ImageTransparency = BackgroundTransparency
        Main.ImageBackground.Visible = false
        Main.BackgroundTransparency = BackgroundTransparency
    end
end})

local function IsImage(id)
    local numId = tonumber(id)
    if not numId then
        return false
    end

    local success, info = pcall(MarketplaceService.GetProductInfo, MarketplaceService, numId)

    return success and info and info.AssetTypeId == 1
end

local ImageBackgroundId = "rbxassetid://13141610892"

AllSave.LoadBackgroundImage = Setting:CreateInput({Name = "Load Background Image", CurrentValue = "", PlaceholderText = "Image ID", RemoveTextAfterFocusLost = true, Flag = "LoadBackgroundImage", Callback = function(txt)
    PlaySound("EnterClick")
    local id = ""
    if string.find(txt, "http://www.roblox.com") then
        id = string.gsub(txt, "http://www.roblox.com/asset/?id=", "rbxassetid://")
    elseif string.find(txt, "rbxassetid://") then
        id = txt
    elseif txt ~= "" then
        id = "rbxassetid://" ..txt
    else
        Rayfield:Notify({
            Title = "⚠️ Warn!",
            Content = "Invalid ID",
            Duration = 3.5,
            Image = 11745872910,
        })
        return
    end
        
    if IsImage(NumberCoverter(id)) then
        local Main = Rayfield:GetMain()
        Main.ImageBackground.Image = id
    else
        Rayfield:Notify({
            Title = "⚠️ Warn!",
            Content = "Invalid ID",
            Duration = 3.5,
            Image = 11745872910,
        })
    end
end})

local FontLists = {}

table.insert(FontLists, "Default")

for _, v in ipairs(Enum.Font:GetEnumItems()) do
    table.insert(FontLists, v.Name)
end

AllSave.FontStyle = Setting:CreateDropdown({Name = "Font Style",  Options = FontLists,  CurrentOption = "FredokaOne",  MultipleOptions = false,  Flag = "FontStyle",  Callback = function(name)  
    PlaySound("Click")  
    if name == "Default" then
        for i, v in pairs(FontStyles) do
            v[2].Font = v[1]
        end
    else
        for _, v in ipairs(Rayfield:GetParent():GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                v.Font = Enum.Font[name]
            end
        end
    end
end})

AllSave.FontColor = Setting:CreateColorPicker({Name = "Font Color", Color = Color3.fromRGB(255,255,255), Flag = "FontColor", Callback = function(Value, IsSet)
    PlaySound("Slider")
    for _, v in ipairs(Rayfield:GetParent():GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
            v.TextColor3 = Value
        end
    end
end})

AllSave.FontSize = Setting:CreateSlider({Name = "Font Size", Range = {0, 2}, Increment = 0.1, Suffix = "x", CurrentValue = 1, Flag = "FontSize", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Slider") end
    for i, v in pairs(FontSizes) do
        v[2].TextSize = v[1] * Value
    end
end})

Setting:CreateButton({Name = "Default", Callback = function()
    PlaySound("Click")
    local Main = Rayfield:GetMain()
    
    for i, v in pairs(Main:GetDescendants()) do
        if v:IsA("UIGradient") and v.Name == "UIGradient" then
            v.Enabled = false
        end
    end
    
    Main.ImageBackground.Image = "rbxassetid://13141610892"
    
    Window.ModifyTheme("Amethyst")
    if Main.ImageBackground.Visible then
        Main.ImageBackground.ImageTransparency = BackgroundTransparency
    else
        Main.BackgroundTransparency = BackgroundTransparency
    end
    task.wait()
    Window.ModifyTheme("Amethyst")
end})

Setting:CreateImageButton({Name = "Red", Img = "rbxassetid://109073552523484", Callback = function()
    PlaySound("Click")
    local Main = Rayfield:GetMain()
    local Topbar = Main.Topbar
    local TabList = Main.TabList
    local Elements = Main.Elements

    for i, TabPage in pairs(Elements:GetChildren()) do
        for i, Element in pairs(TabPage:GetChildren()) do
            if Element.ClassName == "Frame"
            and Element.Name ~= "Placeholder"
            and Element.Name ~= "SectionSpacing"
            and Element.Name ~= "Divider"
            and Element.Name ~= "SectionTitle"
            and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
    
                if not Element:FindFirstChild("UIGradient") then
                    local UIGradient = Instance.new("UIGradient")
                    UIGradient.Parent = Element
                    UIGradient.Name = "UIGradient"
                    UIGradient.Rotation = 90
                end
    
                Element.UIGradient.Rotation = 90
                Element.BackgroundColor3 = Color3.new(1,1,1)
                Element.UIGradient.Enabled = true
                Element.UIGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
                    ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 0))
                })
            end
            if Element:IsA("ScrollingFrame") then
				for i, v in pairs(Element:GetChildren()) do
					if v.ClassName == "Frame"
                    and v.Name ~= "Placeholder"
                    and v.Name ~= "SectionSpacing"
                    and v.Name ~= "Divider"
                    and v.Name ~= "SectionTitle"
                    and v.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
            
                        if not v:FindFirstChild("UIGradient") then
                            local UIGradient = Instance.new("UIGradient")
                            UIGradient.Parent = v
                            UIGradient.Name = "UIGradient"
                            UIGradient.Rotation = 90
                        end
            
                        v.UIGradient.Rotation = 90
                        v.BackgroundColor3 = Color3.new(1,1,1)
                        v.UIGradient.Enabled = true
                        v.UIGradient.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
                            ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 0))
                        })
                    end
				end
			end
        end
    end
    
    for i, v in pairs(TabList:GetChildren()) do
        if v:IsA("Frame") and v.Visible then
            if not v:FindFirstChild("UIGradient") then
                local UIGradient = Instance.new("UIGradient")
                UIGradient.Parent = v
                UIGradient.Name = "UIGradient"
            end
            v.BackgroundColor3 = Color3.new(1,1,1)
            v.UIGradient.Enabled = true
            v.UIGradient.Rotation = 0
            v.UIGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0.666667, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
            })
        end
    end
    
    if not Topbar:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar
        UIGradient.Name = "UIGradient"
    end
    if not Topbar.CornerRepair:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar.CornerRepair
        UIGradient.Name = "UIGradient"
    end
    if not Main:FindFirstChild("ImageBackground") then
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "ImageBackground"
        ImageLabel.Parent = Main
        ImageLabel.Active = true
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Size = UDim2.new(1,0,1,0)
        ImageLabel.ZIndex = -1
        ImageLabel.Image = "rbxassetid://109073552523484"
        ImageLabel.Transparency = 1
        
        local UICorner = Instance.new("UICorner")
        UICorner.Name = "UICorner"
        UICorner.Parent = ImageLabel
        UICorner.CornerRadius = UDim.new(0,15)
    end
    Topbar.UIGradient.Enabled = true
    Topbar.CornerRepair.UIGradient.Enabled = true
    Topbar.UIGradient.Rotation = 90
    Topbar.CornerRepair.UIGradient.Rotation = 90
    Topbar.UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.311558, 0.311558, 0.311558)),
        ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 0))
    })
    Topbar.CornerRepair.UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 0))
    })
    
    Main.ImageBackground.ImageTransparency = BackgroundTransparency
    Main.ImageBackground.Visible = true
    Main.ImageBackground.Image = "rbxassetid://109073552523484"
    Main.BackgroundTransparency = 1
    
    Window.ModifyTheme({TextColor=Color3.fromRGB(255,255,255),Background=Color3.fromRGB(0,0,0),Topbar=Color3.fromRGB(34,34,34),Shadow=Color3.fromRGB(20,20,20),NotificationBackground=Color3.fromRGB(20,20,20),NotificationActionsBackground=Color3.fromRGB(230,230,230),TabBackground=Color3.fromRGB(80,80,80),TabStroke=Color3.fromRGB(0,0,0),TabBackgroundSelected=Color3.fromRGB(210,210,210),TabTextColor=Color3.fromRGB(255,255,255),SelectedTabTextColor=Color3.fromRGB(50,50,50),ElementBackground=Color3.fromRGB(0,133,133),ElementBackgroundHover=Color3.fromRGB(170,170,170),SecondaryElementBackground=Color3.fromRGB(160,160,160),ElementStroke=Color3.fromRGB(0,0,0),SecondaryElementStroke=Color3.fromRGB(0,0,0),SliderBackground=Color3.fromRGB(0,170,255),SliderProgress=Color3.fromRGB(0,170,255),SliderStroke=Color3.fromRGB(0,0,0),ToggleBackground=Color3.fromRGB(0,170,85),ToggleEnabled=Color3.fromRGB(150,0,0),ToggleDisabled=Color3.fromRGB(100,100,100),ToggleEnabledStroke=Color3.fromRGB(0,0,0),ToggleDisabledStroke=Color3.fromRGB(0,0,0),ToggleEnabledOuterStroke=Color3.fromRGB(0,0,0),ToggleDisabledOuterStroke=Color3.fromRGB(0,0,0),DropdownSelected=Color3.fromRGB(170,85,0),DropdownUnselected=Color3.fromRGB(150,65,0),InputBackground=Color3.fromRGB(30,40,20),InputStroke=Color3.fromRGB(0,0,0),PlaceholderColor=Color3.fromRGB(178,178,178)})
    
    Window.ModifyTheme(
        {
			TextColor = Color3.fromRGB(255, 255, 255),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(0, 0, 0),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(255, 255, 255),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(133, 133, 133),
			ElementBackgroundHover = Color3.fromRGB(170, 170, 170),
			SecondaryElementBackground = Color3.fromRGB(160, 160, 160),
			ElementStroke = Color3.fromRGB(0, 0, 0),
			SecondaryElementStroke = Color3.fromRGB(0, 0, 0),

			SliderBackground = Color3.fromRGB(50, 138, 220),
			SliderProgress = Color3.fromRGB(170, 85, 0),
			SliderStroke = Color3.fromRGB(0, 0, 0),

			ToggleBackground = Color3.fromRGB(170, 85, 0),
			ToggleEnabled = Color3.fromRGB(150, 0, 0),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),

			DropdownSelected = Color3.fromRGB(170, 85, 0),
			DropdownUnselected = Color3.fromRGB(150, 65, 0),

			InputBackground = Color3.fromRGB(30, 40, 20),
			InputStroke = Color3.fromRGB(0, 0, 0),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		}
    )
    
    Topbar.BackgroundColor3 = Color3.new(1,1,1)
    Topbar.CornerRepair.BackgroundColor3 = Color3.new(1,1,1)
end})

Setting:CreateImageButton({Name = "Yellow", Img = "rbxassetid://78149961212822", Callback = function()
    PlaySound("Click")
    local Main = Rayfield:GetMain()
    local Topbar = Main.Topbar
    local TabList = Main.TabList
    local Elements = Main.Elements

    for i, TabPage in pairs(Elements:GetChildren()) do
        for i, Element in pairs(TabPage:GetChildren()) do
            if Element.ClassName == "Frame"
            and Element.Name ~= "Placeholder"
            and Element.Name ~= "SectionSpacing"
            and Element.Name ~= "Divider"
            and Element.Name ~= "SectionTitle"
            and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
    
                if not Element:FindFirstChild("UIGradient") then
                    local UIGradient = Instance.new("UIGradient")
                    UIGradient.Parent = Element
                    UIGradient.Name = "UIGradient"
                    UIGradient.Rotation = 90
                end
                
                Element.UIGradient.Rotation = 90
                Element.BackgroundColor3 = Color3.new(1,1,1)
                Element.UIGradient.Enabled = true
                Element.UIGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 0.4)),
                    ColorSequenceKeypoint.new(0.4, Color3.new(1, 0.85, 0.1)),
                    ColorSequenceKeypoint.new(1, Color3.new(0.7, 0.55, 0))
                }
            end
            if Element:IsA("ScrollingFrame") then
				for i, v in pairs(Element:GetChildren()) do
					if v.ClassName == "Frame"
                    and v.Name ~= "Placeholder"
                    and v.Name ~= "SectionSpacing"
                    and v.Name ~= "Divider"
                    and v.Name ~= "SectionTitle"
                    and v.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
            
                        if not v:FindFirstChild("UIGradient") then
                            local UIGradient = Instance.new("UIGradient")
                            UIGradient.Parent = v
                            UIGradient.Name = "UIGradient"
                            UIGradient.Rotation = 90
                        end
                        
                        v.UIGradient.Rotation = 90
                        v.BackgroundColor3 = Color3.new(1,1,1)
                        v.UIGradient.Enabled = true
                        v.UIGradient.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 0.4)),
                            ColorSequenceKeypoint.new(0.4, Color3.new(1, 0.85, 0.1)),
                            ColorSequenceKeypoint.new(1, Color3.new(0.7, 0.55, 0))
                        }
                    end
				end
			end
        end
    end
    
    for i, v in pairs(TabList:GetChildren()) do
        if v:IsA("Frame") and v.Visible then
            if not v:FindFirstChild("UIGradient") then
                local UIGradient = Instance.new("UIGradient")
                UIGradient.Parent = v
                UIGradient.Name = "UIGradient"
            end
            v.BackgroundColor3 = Color3.new(1,1,1)
            v.UIGradient.Enabled = true
            v.UIGradient.Rotation = 0
            v.UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0.7, 0.6, 0.1)),
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.45, 0.05))
            }
        end
    end
    
    if not Topbar:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar
        UIGradient.Name = "UIGradient"
    end
    if not Topbar.CornerRepair:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar.CornerRepair
        UIGradient.Name = "UIGradient"
    end
    if not Main:FindFirstChild("ImageBackground") then
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "ImageBackground"
        ImageLabel.Parent = Main
        ImageLabel.Active = true
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Size = UDim2.new(1,0,1,0)
        ImageLabel.ZIndex = -1
        ImageLabel.Image = "rbxassetid://78149961212822"
        ImageLabel.Transparency = 1
        
        local UICorner = Instance.new("UICorner")
        UICorner.Name = "UICorner"
        UICorner.Parent = ImageLabel
        UICorner.CornerRadius = UDim.new(0,15)
    end
    Topbar.UIGradient.Enabled = true
    Topbar.CornerRepair.UIGradient.Enabled = true
    Topbar.UIGradient.Rotation = 90
    Topbar.CornerRepair.UIGradient.Rotation = 90
    Topbar.UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 0.6)),
        ColorSequenceKeypoint.new(0.3, Color3.new(1, 0.9, 0.3)),
        ColorSequenceKeypoint.new(1, Color3.new(0.75, 0.6, 0))
    }
    Topbar.CornerRepair.UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 0.6)),
        ColorSequenceKeypoint.new(0.3, Color3.new(1, 0.9, 0.3)),
        ColorSequenceKeypoint.new(1, Color3.new(0.75, 0.6, 0))
    }
    
    Main.ImageBackground.ImageTransparency = BackgroundTransparency
    Main.ImageBackground.Visible = true
    Main.ImageBackground.Image = "rbxassetid://78149961212822"
    Main.BackgroundTransparency = 1
    
    Window.ModifyTheme({TextColor=Color3.fromRGB(255,255,255),Background=Color3.fromRGB(0,0,0),Topbar=Color3.fromRGB(34,34,34),Shadow=Color3.fromRGB(20,20,20),NotificationBackground=Color3.fromRGB(20,20,20),NotificationActionsBackground=Color3.fromRGB(230,230,230),TabBackground=Color3.fromRGB(80,80,80),TabStroke=Color3.fromRGB(0,0,0),TabBackgroundSelected=Color3.fromRGB(210,210,210),TabTextColor=Color3.fromRGB(255,255,255),SelectedTabTextColor=Color3.fromRGB(50,50,50),ElementBackground=Color3.fromRGB(0,133,133),ElementBackgroundHover=Color3.fromRGB(170,170,170),SecondaryElementBackground=Color3.fromRGB(160,160,160),ElementStroke=Color3.fromRGB(0,0,0),SecondaryElementStroke=Color3.fromRGB(0,0,0),SliderBackground=Color3.fromRGB(0,170,255),SliderProgress=Color3.fromRGB(0,170,255),SliderStroke=Color3.fromRGB(0,0,0),ToggleBackground=Color3.fromRGB(0,170,85),ToggleEnabled=Color3.fromRGB(150,0,0),ToggleDisabled=Color3.fromRGB(100,100,100),ToggleEnabledStroke=Color3.fromRGB(0,0,0),ToggleDisabledStroke=Color3.fromRGB(0,0,0),ToggleEnabledOuterStroke=Color3.fromRGB(0,0,0),ToggleDisabledOuterStroke=Color3.fromRGB(0,0,0),DropdownSelected=Color3.fromRGB(170,85,0),DropdownUnselected=Color3.fromRGB(150,65,0),InputBackground=Color3.fromRGB(30,40,20),InputStroke=Color3.fromRGB(0,0,0),PlaceholderColor=Color3.fromRGB(178,178,178)})
    
    Window.ModifyTheme(
        {
			TextColor = Color3.fromRGB(255, 255, 255),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(0, 0, 0),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(255, 255, 255),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(133, 133, 133),
			ElementBackgroundHover = Color3.fromRGB(170, 170, 170),
			SecondaryElementBackground = Color3.fromRGB(160, 160, 160),
			ElementStroke = Color3.fromRGB(0, 0, 0),
			SecondaryElementStroke = Color3.fromRGB(0, 0, 0),

			SliderBackground = Color3.fromRGB(0, 200, 200),
			SliderProgress = Color3.fromRGB(200, 200, 0),
			SliderStroke = Color3.fromRGB(0, 0, 0),

			ToggleBackground = Color3.fromRGB(170, 85, 0),
			ToggleEnabled = Color3.fromRGB(150, 150, 0),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),

			DropdownSelected = Color3.fromRGB(170, 85, 0),
			DropdownUnselected = Color3.fromRGB(150, 65, 0),

			InputBackground = Color3.fromRGB(30, 40, 20),
			InputStroke = Color3.fromRGB(0, 0, 0),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		}
    )
    
    Topbar.BackgroundColor3 = Color3.new(1,1,1)
    Topbar.CornerRepair.BackgroundColor3 = Color3.new(1,1,1)
end})

Setting:CreateImageButton({Name = "Blue And Orange", Img = "rbxassetid://4790828484", Callback = function()
    PlaySound("Click")
    local Main = Rayfield:GetMain()
    local Topbar = Main.Topbar
    local TabList = Main.TabList
    local Elements = Main.Elements

    for i, TabPage in pairs(Elements:GetChildren()) do
        for i, Element in pairs(TabPage:GetChildren()) do
            if Element.ClassName == "Frame"
            and Element.Name ~= "Placeholder"
            and Element.Name ~= "SectionSpacing"
            and Element.Name ~= "Divider"
            and Element.Name ~= "SectionTitle"
            and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
    
                if not Element:FindFirstChild("UIGradient") then
                    local UIGradient = Instance.new("UIGradient")
                    UIGradient.Parent = Element
                    UIGradient.Name = "UIGradient"
                    UIGradient.Rotation = 90
                end
    
                Element.UIGradient.Rotation = 90
                Element.BackgroundColor3 = Color3.new(1,1,1)
                Element.UIGradient.Enabled = true
                Element.UIGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0.666667, 1)),
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0.498039))
                }
            end
            
            if Element:IsA("ScrollingFrame") then
				for i, v in pairs(Element:GetChildren()) do
				    if v.ClassName == "Frame"
                    and v.Name ~= "Placeholder"
                    and v.Name ~= "SectionSpacing"
                    and v.Name ~= "Divider"
                    and v.Name ~= "SectionTitle"
                    and v.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
            
                        if not v:FindFirstChild("UIGradient") then
                            local UIGradient = Instance.new("UIGradient")
                            UIGradient.Parent = v
                            UIGradient.Name = "UIGradient"
                            UIGradient.Rotation = 90
                        end
            
                        v.UIGradient.Rotation = 90
                        v.BackgroundColor3 = Color3.new(1,1,1)
                        v.UIGradient.Enabled = true
                        v.UIGradient.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.new(0, 0.666667, 1)),
                            ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0.498039))
                        }
                    end
				end
			end
        end
    end
    
    for i, v in pairs(TabList:GetChildren()) do
        if v:IsA("Frame") and v.Visible then
            if not v:FindFirstChild("UIGradient") then
                local UIGradient = Instance.new("UIGradient")
                UIGradient.Parent = v
                UIGradient.Name = "UIGradient"
            end
            v.BackgroundColor3 = Color3.new(1,1,1)
            v.UIGradient.Enabled = true
            v.UIGradient.Rotation = 0
            v.UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0.4, 0.6, 1)),
                ColorSequenceKeypoint.new(1, Color3.new(1, 0.6, 0.3))
            }
        end
    end
    
    if not Topbar:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar
        UIGradient.Name = "UIGradient"
    end
    if not Topbar.CornerRepair:FindFirstChild("UIGradient") then
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Parent = Topbar.CornerRepair
        UIGradient.Name = "UIGradient"
    end
    if not Main:FindFirstChild("ImageBackground") then
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "ImageBackground"
        ImageLabel.Parent = Main
        ImageLabel.Active = true
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Size = UDim2.new(1,0,1,0)
        ImageLabel.ZIndex = -1
        ImageLabel.Image = "rbxassetid://4790828484"
        ImageLabel.Transparency = 1
        
        local UICorner = Instance.new("UICorner")
        UICorner.Name = "UICorner"
        UICorner.Parent = ImageLabel
        UICorner.CornerRadius = UDim.new(0,15)
    end
    
    Topbar.UIGradient.Enabled = true
    Topbar.CornerRepair.UIGradient.Enabled = true
    Topbar.UIGradient.Rotation = 90
    Topbar.CornerRepair.UIGradient.Rotation = 90
    Topbar.UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(0.333333, 0, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0.333333, 0))
    }
    Topbar.CornerRepair.UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(0.333333, 0, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0.333333, 0))
    }
    
    Main.ImageBackground.ImageTransparency = BackgroundTransparency
    Main.ImageBackground.Visible = true
    Main.ImageBackground.Image = "rbxassetid://4790828484"
    Main.BackgroundTransparency = 1
    
    Window.ModifyTheme({TextColor=Color3.fromRGB(255,255,255),Background=Color3.fromRGB(0,0,0),Topbar=Color3.fromRGB(34,34,34),Shadow=Color3.fromRGB(20,20,20),NotificationBackground=Color3.fromRGB(20,20,20),NotificationActionsBackground=Color3.fromRGB(230,230,230),TabBackground=Color3.fromRGB(80,80,80),TabStroke=Color3.fromRGB(0,0,0),TabBackgroundSelected=Color3.fromRGB(210,210,210),TabTextColor=Color3.fromRGB(255,255,255),SelectedTabTextColor=Color3.fromRGB(50,50,50),ElementBackground=Color3.fromRGB(0,133,133),ElementBackgroundHover=Color3.fromRGB(170,170,170),SecondaryElementBackground=Color3.fromRGB(160,160,160),ElementStroke=Color3.fromRGB(0,0,0),SecondaryElementStroke=Color3.fromRGB(0,0,0),SliderBackground=Color3.fromRGB(0,170,255),SliderProgress=Color3.fromRGB(0,170,255),SliderStroke=Color3.fromRGB(0,0,0),ToggleBackground=Color3.fromRGB(0,170,85),ToggleEnabled=Color3.fromRGB(150,0,0),ToggleDisabled=Color3.fromRGB(100,100,100),ToggleEnabledStroke=Color3.fromRGB(0,0,0),ToggleDisabledStroke=Color3.fromRGB(0,0,0),ToggleEnabledOuterStroke=Color3.fromRGB(0,0,0),ToggleDisabledOuterStroke=Color3.fromRGB(0,0,0),DropdownSelected=Color3.fromRGB(170,85,0),DropdownUnselected=Color3.fromRGB(150,65,0),InputBackground=Color3.fromRGB(30,40,20),InputStroke=Color3.fromRGB(0,0,0),PlaceholderColor=Color3.fromRGB(178,178,178)})
    
    Window.ModifyTheme(
        {
			TextColor = Color3.fromRGB(255, 255, 255),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(0, 0, 0),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(255, 255, 255),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(133, 133, 133),
			ElementBackgroundHover = Color3.fromRGB(170, 170, 170),
			SecondaryElementBackground = Color3.fromRGB(160, 160, 160),
			ElementStroke = Color3.fromRGB(0, 0, 0),
			SecondaryElementStroke = Color3.fromRGB(0, 0, 0),

			SliderBackground = Color3.fromRGB(0, 170, 255),
			SliderProgress = Color3.fromRGB(0, 170, 255),
			SliderStroke = Color3.fromRGB(0, 0, 0),

			ToggleBackground = Color3.fromRGB(0, 170, 150),
			ToggleEnabled = Color3.fromRGB(0, 170, 255),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),

			DropdownSelected = Color3.fromRGB(170, 85, 0),
			DropdownUnselected = Color3.fromRGB(150, 65, 0),

			InputBackground = Color3.fromRGB(30, 40, 20),
			InputStroke = Color3.fromRGB(0, 0, 0),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		}
    )
    
    Topbar.BackgroundColor3 = Color3.new(1,1,1)
    Topbar.CornerRepair.BackgroundColor3 = Color3.new(1,1,1)
end})

AllSave.BackgroundTransparency = Setting:CreateSlider({Name = "Background Transparency", Range = {0, 100}, Increment = 1, Suffix = "%", CurrentValue = 0, Flag = "BackgroundTransparency", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Slider") end
    local Main = Rayfield:GetMain()
    
    BackgroundTransparency = Value / 100
    if Main:FindFirstChild("ImageBackground") and Main.ImageBackground.Visible == true then
        Main.ImageBackground.ImageTransparency = BackgroundTransparency
    else
        Main.BackgroundTransparency = BackgroundTransparency
    end
end})

Run = RunService.RenderStepped:Connect(function()
    if not Rayfield:GetGui() then
        
    else
        if ST then
            ST:Destroy()
        end
        if Run then
            Run:Disconnect()
            Run = nil
        end
    end
end)

Rayfield:LoadConfiguration()

task.spawn(function()
    while not Rayfield:GetGui() or not TurnOff do
        task.wait(2)
        if AutoRejoinAfter15min then
            Timer = Timer + 2
        end
        if Timer >= 900 then
            local Players = game:GetService("Players")
            local TeleportService = game:GetService("TeleportService")
                
            if AutoExecute then
                local queue =
                    (getgenv and getgenv().queue_on_teleport)
                    or queue_on_teleport
                    or (syn and syn.queue_on_teleport)
                    or (fluxus and fluxus.queue_on_teleport)
                
                queue([[
                    repeat task.wait() until game:IsLoaded()
                    task.wait(3)
                    loadstring(game:HttpGet(""))()
                ]])
            end
            TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
            break
        end
    end
end)
