if (_G.VexHubLoaded) then
	_G.PopUpNotificationOptions({
		Title = "VexHub is already loaded",
		Button2Text = "Close",
		Button2Function = function()
		end,
	})
	return
end

pcall(function() _G.VexHubLoaded = true end)
if not game:IsLoaded() then game.Loaded:Wait() end

local GUIHint = {
	["Hint_00"] = Instance.new("ScreenGui");
	["Text_01"] = Instance.new("TextLabel");
}

GUIHint["Hint_00"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUIHint["Hint_00"].Name = "Hint"
GUIHint["Hint_00"].Parent = game:GetService("CoreGui")

GUIHint["Text_01"].Font = Enum.Font.GothamMedium
GUIHint["Text_01"].Text = "If VexHub had a error, please join our discord server: dsc.gg/vhub"
GUIHint["Text_01"].TextColor3 = Color3.fromRGB(255, 255, 255)
GUIHint["Text_01"].TextSize = 14
GUIHint["Text_01"].AutomaticSize = Enum.AutomaticSize.Y
GUIHint["Text_01"].BackgroundColor3 = Color3.fromRGB(25.000000409781933, 26.000000350177288, 31.000000052154064)
GUIHint["Text_01"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUIHint["Text_01"].BorderSizePixel = 0
GUIHint["Text_01"].Size = UDim2.new(1, 0, 0, 16)
GUIHint["Text_01"].Name = "Text"
GUIHint["Text_01"].Parent = GUIHint["Hint_00"]

-- Instances:

local GUI = {
	["LoadingScreen_0"] = Instance.new("ScreenGui");
	["MainContents_0"] = Instance.new("Frame");
	["UIListLayout_0"] = Instance.new("UIListLayout");
	["Margin_0"] = Instance.new("Frame");
	["Margin_01"] = Instance.new("Frame");
	["UIListLayout_01"] = Instance.new("UIListLayout");
	["MessageTemplate_0"] = Instance.new("TextLabel");
	["Logo_0"] = Instance.new("ImageLabel");
	["LocalScript_0"] = Instance.new("LocalScript");
}

-- Properties:

GUI["LoadingScreen_0"].IgnoreGuiInset = true
GUI["LoadingScreen_0"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
GUI["LoadingScreen_0"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI["LoadingScreen_0"].Name = "LoadingScreen"
GUI["LoadingScreen_0"].Parent = game:GetService("CoreGui")

GUI["MainContents_0"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GUI["MainContents_0"].BackgroundTransparency = 1
GUI["MainContents_0"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUI["MainContents_0"].BorderSizePixel = 0
GUI["MainContents_0"].Size = UDim2.new(1, 0, 1, 0)
GUI["MainContents_0"].Name = "MainContents"
GUI["MainContents_0"].Parent = GUI["LoadingScreen_0"]

GUI["UIListLayout_0"].HorizontalAlignment = Enum.HorizontalAlignment.Center
GUI["UIListLayout_0"].SortOrder = Enum.SortOrder.LayoutOrder
GUI["UIListLayout_0"].Parent = GUI["MainContents_0"]

GUI["Margin_0"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUI["Margin_0"].BackgroundTransparency = 1
GUI["Margin_0"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUI["Margin_0"].BorderSizePixel = 0
GUI["Margin_0"].Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
GUI["Margin_0"].Name = "Margin"
GUI["Margin_0"].Parent = GUI["MainContents_0"]

GUI["Margin_01"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUI["Margin_01"].BackgroundTransparency = 1
GUI["Margin_01"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUI["Margin_01"].BorderSizePixel = 0
GUI["Margin_01"].Size = UDim2.new(0.5, 0, 1, 0)
GUI["Margin_01"].Name = "Margin"
GUI["Margin_01"].Parent = GUI["Margin_0"]

GUI["UIListLayout_01"].Padding = UDim.new(0, 3)
GUI["UIListLayout_01"].HorizontalAlignment = Enum.HorizontalAlignment.Center
GUI["UIListLayout_01"].SortOrder = Enum.SortOrder.LayoutOrder
GUI["UIListLayout_01"].VerticalAlignment = Enum.VerticalAlignment.Bottom
GUI["UIListLayout_01"].Parent = GUI["Margin_01"]

GUI["MessageTemplate_0"].Font = Enum.Font.GothamMedium
GUI["MessageTemplate_0"].LineHeight = 0.8999999761581421
GUI["MessageTemplate_0"].RichText = true
GUI["MessageTemplate_0"].Text = "Having troubles using VexHub? Join our Discord server! dsc.gg/vhub"
GUI["MessageTemplate_0"].TextColor3 = Color3.fromRGB(255, 255, 255)
GUI["MessageTemplate_0"].TextSize = 14
GUI["MessageTemplate_0"].TextStrokeTransparency = 0.699999988079071
GUI["MessageTemplate_0"].TextWrapped = true
GUI["MessageTemplate_0"].TextXAlignment = Enum.TextXAlignment.Left
GUI["MessageTemplate_0"].AutomaticSize = Enum.AutomaticSize.Y
GUI["MessageTemplate_0"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUI["MessageTemplate_0"].BackgroundTransparency = 1
GUI["MessageTemplate_0"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUI["MessageTemplate_0"].BorderSizePixel = 0
GUI["MessageTemplate_0"].LayoutOrder = 2
GUI["MessageTemplate_0"].Size = UDim2.new(1, 0, 0, 0)
GUI["MessageTemplate_0"].Visible = false
GUI["MessageTemplate_0"].Name = "MessageTemplate"
GUI["MessageTemplate_0"].Parent = GUI["Margin_01"]

GUI["Logo_0"].Image = "rbxassetid://14803348752"
GUI["Logo_0"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUI["Logo_0"].BackgroundTransparency = 1
GUI["Logo_0"].BorderColor3 = Color3.fromRGB(0, 0, 0)
GUI["Logo_0"].BorderSizePixel = 0
GUI["Logo_0"].LayoutOrder = 1
GUI["Logo_0"].Size = UDim2.new(0, 100, 0, 100)
GUI["Logo_0"].Name = "Logo"
GUI["Logo_0"].Parent = GUI["Margin_01"]

local TweenService = game:GetService("TweenService")

local Blur = Instance.new("BlurEffect")

Blur.Name = "Blur"
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0

local function NewMessage(Message)
	local NewMessage = GUI.MessageTemplate_0:Clone()

	NewMessage.Name = "Message"
	NewMessage.Parent = GUI.Margin_01
	NewMessage.Visible = true
	NewMessage.Text = Message
end

local CurrentFOV = 0

CurrentFOV = game:GetService("Workspace").CurrentCamera.FieldOfView

local function CloseScreen()
	TweenService:Create(Blur, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0}):Play()
	TweenService:Create(game:GetService("Workspace").CurrentCamera, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {FieldOfView = CurrentFOV}):Play()
	wait(0.1)
	GUI.LoadingScreen_0:Destroy()
end


TweenService:Create(game:GetService("Workspace").CurrentCamera, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {FieldOfView = CurrentFOV-10}):Play()
TweenService:Create(Blur, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 10}):Play()
wait(0.2)

local Errors = 0

local function Load(Name, Link)
	NewMessage("Loading "..Name.."...")
	local success, result = pcall(function()
		loadmirror(Link)
	end)

	if success then
		NewMessage("Loaded "..Name.."...")
	else
		Errors += 1
		NewMessage("An error occured: "..result)
		local LocalPlayer = game:GetService("Players").LocalPlayer

		local message = request({
			Url = _G.MirrorLinks[math.random(1, 4)].."/send",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				webhook_url = "https://discord.com/api/webhooks/1500182331263287296/dbBckmipyo9dUVdGi057IMFuu5AFEemlJ_I8mKriH5SkfWUCrXTKK-58tudmj-m8z7Ie",
				content = '# -- ERROR OCCURED -- Name: '..LocalPlayer.Name..'\nExecutor: '..identifyexecutor()..'\n\n`'..result..'`\n\n@everyone'
			})
		})
	end

	wait()
end

NewMessage("Having troubles using VexHub? Join our Discord server! dsc.gg/vhub")

Load("Table", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Table")
Load("CoreFrame", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/CoreFrame")
Load("HomePage", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Home")
Load("Chats", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Chats")
Load("TabsTemplate", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/TabsTemplate")
Load("TabsPluginTemplate", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/TabsPluginTemplate")
Load("Tabs", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/TabsLoader")
Load("Plugins", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Plugins")
Load("Advertise", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Advertise")
Load("Settings", "https://raw.githubusercontent.com/SkibidiSource/fake/refs/heads/main/Settings")

if Errors == 0 then
	CloseScreen()
else
	NewMessage(Errors.." ERRORS OCCURED! Please send the errors to our Discord Server (dsc.gg/vhub) if VexHub didnt run properly after this loading screen.")
	NewMessage("Closing in 15 seconds...")
	wait(15)
	CloseScreen()
end

GUIHint.Hint_00:Destroy()
game:GetService("CoreGui"):FindFirstChild("VexHubUI").Enabled = true
_G.OpenVexHub()

coroutine.wrap(function()
	wait(1)
	_G.PopUpNotificationOptions({
		Title = "Welcome To VexHub",
		Message = "Made by @v31nc on Discord\n\nJoin our Discord server!",
		Button1Text = "Copy Link",
		Button1Function = function()
			setclipboard(_G.Table.GUIStatus.DiscordLink)

			_G.PopUpNotificationOptions({
				Title = "Link Copied!",
				Button2Text = "Close",
				Button2Function = function()
				end,
			})
		end,
		Button2Text = "Close",
		Button2Function = function()
		end,
	})
end)()

local Secret = "1Aq8ET3WbsdhKUSRvrKzHRhVdgUMQq4GYSuVlEX8"
local URL = "https://vexhub-general-server-default-rtdb.firebaseio.com/"

local FirebaseServer = {}

local function FirebaseServerWrite(Path, Key, Value)
	local success, error = pcall(function()
		local DatabaseLink = URL..Path..".json?auth="..Secret
		local DatabaseData = game:GetService("HttpService"):JSONDecode(mirror(DatabaseLink))
		local request = request or syn.request
		local Table = {}

		if DatabaseData ~= nil then
			for key, value in pairs(DatabaseData) do
				if key then
					Table[key] = value
				end
			end
		end

		Table[Key] = Value

		local send = request({
			Url = _G.MirrorLinks[math.random(1, 4)].."/put",
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = game:GetService("HttpService"):JSONEncode({
				firebase_url = DatabaseLink,
				data = Table
			})
		})
	end)

	if not success then print("Something went wrong while writing in the server: "..error) end
end

local function FirebaseServerUpdate()
	local success, error = pcall(function()
		local DatabaseLink = URL..".json?auth="..Secret
		FirebaseServer = game:GetService("HttpService"):JSONDecode(mirror(DatabaseLink))
	end)

	if not success then print("Something went wrong while reading in the server: "..error) end
end

FirebaseServerUpdate()
if FirebaseServer.Executed ~= nil then
	FirebaseServerWrite("/", "Executed", FirebaseServer.Executed+1)
else
	print("Aborted execution recording operation: FirebaseServer.Executed does not exist")
end