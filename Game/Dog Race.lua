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

local CurrentArea = workspace.Areas:FindFirstChildWhichIsA("Model") or workspace.Areas:FindFirstChildWhichIsA("Folder")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EggList = {}
local EggConverter = {}
local SelectEgg = {}
local UpgradeList = {}
local UpgradeConverter = {}
local SelectUpgrade = {}
local Partners = {}
local TrailConverter = {}

local Settings = {
	AutoWin = false,
	AutoTrain = false,
	AutoBuyEgg = false,
	BuyEggCount = 1,
	AutoBuyTrail = false,
	AutoBuyPartner = false,
	AutoRebirth = false,
	AutoUpgrade = false,
	BuyAllUpgrade = false,
}

local Multiplier = {
	K = 1e3,
	M = 1e6,
	B = 1e9,
	T = 1e12
}

local function ConvertNumber(Text)
	local Number, Suffix = Text:match("([%d%.]+)%s*([KMBT])")
	if Number then
		return tonumber(Number) * Multiplier[Suffix]
	end

	return tonumber(Text:match("%d+")) or 0
end

local function GetCurrency(Name)
	if Name == "Win" then
		return plr.leaderstats["\240\159\143\134Wins"]. Value
	elseif Name == "Bone" then
		return ConvertNumber(plr.PlayerGui.HomeGui.LeftFrame.CurrencyFrame.DiamondFrame.AmountLabel.Text)
	elseif Name == "Power" then
		return plr.leaderstats["\226\154\161\239\184\143Power"].Value
	else
	    local Icon2Currency = {
	        ["rbxassetid://16572548460"] = plr.leaderstats["\226\154\161\239\184\143Power"].Value,
	        ["rbxassetid://16815264055"] = plr.leaderstats["\240\159\143\134Wins"].Value,
	    }
	    for i, v in pairs(plr.PlayerGui.HomeGui.LeftFrame.CurrencyFrame:GetChildren()) do
	        if v.Currency.Image ~= "rbxassetid://16572548460" or v.Currency.Image ~= "rbxassetid://16815264055" then
	            Icon2Currency[v.Currency.Image] = ConvertNumber(v.AmountLabel.Text)
	        end
	    end
	    
	    return Icon2Currency[Name]
	end
end
if CurrentArea:FindFirstChild("Eggs") then
    for _, v in pairs(CurrentArea.Eggs:GetChildren()) do
    	if v:IsA("Model") and not v.Name:find("_R_") and v.EggTitle.ImageLabel.Image ~= "rbxassetid://14601310897" then
    		EggList[#EggList+1] = v.Name
    		EggConverter[v.Name] = {Currency = v.EggTitle.ImageLabel.Image, Name = v.Name, Cost = ConvertNumber(v.EggTitle.PriceLabel.Text)}
    	end
    end
end
for i, v in pairs(plr.PlayerGui.TrailGui.Frame.TrailsFrame.ScrollingFrame:GetChildren()) do
	if v:IsA("Frame") and v.Name ~= "Template" and v.Visible then
		TrailConverter[v.Name]={Instance = v, Cost = ConvertNumber(v.Button.PirceLabel.Text)}
	end
end
for i, v in pairs(plr.PlayerGui.UpgradeGui.Frame.ScrollingFrame:GetChildren()) do
	if v:IsA("Frame") and v.Name ~= "Template" and v.Visible then
		local Name = v.NameLabel.Text
		UpgradeList[#UpgradeList+1]=Name
		UpgradeConverter[v.Name]={Name = Name, Instance = v, Cost = ConvertNumber(v.UpgradeButton.PriceLabel.Text)}
	end
end
if CurrentArea:FindFirstChild("PartnerBase") then
    for i, v in pairs(CurrentArea.PartnerBase:GetChildren()) do
    	if v:IsA("Model") and not v.Name:find("_R_") then
    		Partners[v.Name]={Instance = v, Cost = ConvertNumber(v.Title.BillboardGui.Desc.Text)}
    	end
    end
end

task.spawn(function()
    while not Rayfield:GetGui() do
        
            local NewArea = workspace.Areas:FindFirstChildWhichIsA("Model") or workspace.Areas:FindFirstChildWhichIsA("Folder")
            if NewArea ~= CurrentArea then
                CurrentArea = NewArea
                EggList = {}
                EggConverter = {}
                SelectEgg = {}
                UpgradeList = {}
                UpgradeConverter = {}
                SelectUpgrade = {}
                Partners = {}
                TrailConverter = {}
                
                if CurrentArea:FindFirstChild("Eggs") then
                    for _, v in pairs(CurrentArea.Eggs:GetChildren()) do
                    	if v:IsA("Model") and not v.Name:find("_R_") and v.EggTitle.ImageLabel.Image ~= "rbxassetid://14601310897" then
                    		EggList[#EggList+1] = v.Name
                    		EggConverter[v.Name] = {Currency = v.EggTitle.ImageLabel.Image, Name = v.Name, Cost = ConvertNumber(v.EggTitle.PriceLabel.Text)}
                    	end
                    end
                end
                for i, v in pairs(plr.PlayerGui.TrailGui.Frame.TrailsFrame.ScrollingFrame:GetChildren()) do
                	if v:IsA("Frame") and v.Name ~= "Template" and v.Visible then
                		TrailConverter[v.Name]={Instance = v, Cost = ConvertNumber(v.Button.PirceLabel.Text)}
                	end
                end
                for i, v in pairs(plr.PlayerGui.UpgradeGui.Frame.ScrollingFrame:GetChildren()) do
                	if v:IsA("Frame") and v.Name ~= "Template" and v.Visible then
                		local Name = v.NameLabel.Text
                		UpgradeList[#UpgradeList+1]=Name
                		UpgradeConverter[v.Name]={Name = Name, Instance = v, Cost = ConvertNumber(v.UpgradeButton.PriceLabel.Text)}
                	end
                end
                if CurrentArea:FindFirstChild("PartnerBase") then
                    for i, v in pairs(CurrentArea.PartnerBase:GetChildren()) do
                    	if v:IsA("Model") and not v.Name:find("_R_") then
                    		Partners[v.Name]={Instance = v, Cost = ConvertNumber(v.Title.BillboardGui.Desc.Text)}
                    	end
                    end
                end
                
                AllSave.EggList:Refresh(EggList)
                AllSave.UpgradeList:Refresh(UpgradeList)
            end
        
        task.wait()
    end
end)

task.spawn(function()
    local IsWinning = false
	while not Rayfield:GetGui() do
		task.wait(0.5)
		if Settings.AutoTrain then
		    ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("FightService"):WaitForChild("RE"):WaitForChild("QuitContestEvent"):FireServer(CurrentArea.Name)
			local BestTreadmill = ""
			local Amount
			for _, v in pairs(CurrentArea.Treadmills:GetChildren()) do
			    pcall(function()
    			    local Power = ConvertNumber(v.TitleGuiPart.TreadmillTitleGui.Frame.RequiredLabel.Text)
    			    if GetCurrency("Power") > Power then
        			    if not Amount then
        			        Amount = Power
        			        BestTreadmill = v.Name
        			    elseif Amount < Power then
        			        Amount = Power
        			        BestTreadmill = v.Name
        			    end
    			    end
			    end)
			end
			ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TrainService"):WaitForChild("RE"):WaitForChild("RunTrain"):FireServer(BestTreadmill)
		end
		if Settings.AutoRebirth then
		    if plr.PlayerGui.RebirthGui.Frame.ProgressFrame.Frame.ProgressBar.Size.X.Scale > 0.95 then
		        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("RebirthService"):WaitForChild("RF"):WaitForChild("Rebirth"):InvokeServer()
            end
		end
		if Settings.AutoBuyPartner then
		    for Name, Value in pairs(Partners) do
		        if Value.Cost <= GetCurrency("Win") and Value.Instance.Title.BillboardGui.Desc.Visible then
                    ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PrincessService"):WaitForChild("RE"):WaitForChild("UnlockPrincess"):FireServer(Name, "Wins")
                end
            end
		end
		if Settings.AutoBuyTrail then
		    for Name, Value in pairs(TrailConverter) do
		        if Value.Cost <= GetCurrency("Win") and Value.Instance.Button.PirceLabel.Visible and Value.Instance.Button.LockCover.Visible == false and Value.Instance.Button.CurrencyImage.Image ~= "rbxassetid://16823558061" then
		            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TrailService"):WaitForChild("RE"):WaitForChild("BuyTrailEvent"):FireServer(Name)
		        end
		    end
		end
		if Settings.AutoBuyEgg then
            if EggConverter[SelectEgg] and EggConverter[SelectEgg].Cost <= GetCurrency(EggConverter[SelectEgg].Currency) then
                local Name = EggConverter[SelectEgg].Name
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EggHatchService"):WaitForChild("RE"):WaitForChild("Hatch"):FireServer(Name, Settings.BuyEggCount)
            end
            if workspace.Camera:FindFirstChildWhichIsA("Model") then
                local Object = workspace.Camera:FindFirstChildWhichIsA("Model")
                Object:Destroy()
                plr.PlayerGui.HomeGui.Enabled = true
            end
		end
		if Settings.AutoUpgrade then
            for Name, Value in pairs(UpgradeConverter) do
                if ConvertNumber(Value.Instance.UpgradeButton.PriceLabel.Text) <= GetCurrency("Bone") and not Value.Instance.MaxLabel.Visible then
                    if Settings.BuyAllUpgrade or (table.find(SelectUpgrade, Value.Name)) then
                        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RE"):WaitForChild("Upgrade"):FireServer(Name)
                    end
                end
            end
		end
		if Settings.AutoWin and not IsWinning then
		    task.spawn(function()
		        IsWinning = true
		        for i, v in pairs(CurrentArea.WinGates:GetChildren()) do
		            pcall(function()
    		            task.wait()
    		            v:WaitForChild("Part", 1)
                        local args = {
                        	"Area_1"
                        }
                        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("FightService"):WaitForChild("RE"):WaitForChild("JoinContest"):FireServer(unpack(args))
                        
                        local args = {
                        	v.Name,
                        	v.Part.Position
                        }
                        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("FightService"):WaitForChild("RE"):WaitForChild("GetWinsEvent"):FireServer(unpack(args))
                    end)
		        end
		        task.wait(0.5)
                IsWinning = false
		    end)
		end
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

AllSave.AutoRebirth = Farm:CreateToggle({Name = "Auto Rebirth", CurrentValue = false, Flag = "AutoRebirth", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoRebirth"] = Value
end})

AllSave.AutoWin = Farm:CreateToggle({Name = "Auto Win", CurrentValue = false, Flag = "AutoWin", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoWin"] = Value
    if Value then
        pcall(function()AllSave.AutoTrain:Set(false)end)
    end
end})

AllSave.AutoTrain = Farm:CreateToggle({Name = "Auto Train", CurrentValue = false, Flag = "AutoTrain", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoTrain"] = Value
    if Value then
        pcall(function()AllSave.AutoWin:Set(false)end)
    end
end})

local Shop = Window:CreateTab("Shop", 10893267086)
Shop:CreateSection("Shop")

Shop:CreateLabel("Egg Shop", 7219714288)

AllSave.EggList = Shop:CreateDropdown({Name = "Egg List",  Options = EggList,  CurrentOption = "None",  MultipleOptions = false,  Flag = "EggList",  Callback = function(Value)  
    PlaySound("Click")  
    SelectEgg = Value
end})

AllSave.AutoBuyEgg = Shop:CreateToggle({Name = "Auto Buy Egg", CurrentValue = false, Flag = "AutoBuyEgg", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoBuyEgg"] = Value
end})

AllSave.BuyEggCount = Shop:CreateToggle({Name = "Open 10 Eggs At Once", CurrentValue = false, Flag = "BuyEggCount", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["BuyEggCount"] = Value and 10 or 1
end})

Shop:CreateDivider()
Shop:CreateLabel("Upgrade Shop", 7219714288)

AllSave.UpgradeList = Shop:CreateDropdown({Name = "Upgrade List",  Options = UpgradeList,  CurrentOption = "None",  MultipleOptions = true,  Flag = "UpgradeList",  Callback = function(Value)  
    PlaySound("Click")  
    SelectUpgrade = Value
end})

AllSave.BuyAllUpgrade = Shop:CreateToggle({Name = "Buy All", CurrentValue = false, Flag = "BuyAllUpgrade", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["BuyAllUpgrade"] = Value
end})

AllSave.AutoUpgrade = Shop:CreateToggle({Name = "Auto Upgrade", CurrentValue = false, Flag = "AutoUpgrade", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoUpgrade"] = Value
end})

Shop:CreateDivider()
Shop:CreateLabel("Shop", 7219714288)

AllSave.AutoBuyPartner = Shop:CreateToggle({Name = "Auto Buy Partner", CurrentValue = false, Flag = "AutoBuyPartner", Callback = function(Value, IsSet)
    if IsSet == false then PlaySound("Toggle", Value) end
    Settings["AutoBuyPartner"] = Value
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
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Dog%20Race.lua"))()
                ]])
            end
            TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
            break
        end
    end
end)
