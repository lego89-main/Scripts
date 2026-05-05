-- Click Fling Remake By Swiftz!



local TS = _G[script]
if TS == nil then
	TS = {
		try = function(body, handler)
			local ok, result = pcall(body)
			if not ok and handler then
				handler(result)
			end
			return result
		end,
	}
end
local getGlobalEnv = if type(getgenv) == "function" then getgenv else function()
	return _G
end
local env = getGlobalEnv()
local _condition = env.config
if _condition == nil then
	env.config = {
		intro = true,
		method = "weld",
		showHRPs = false,
		power = "Strong",
	}
	_condition = (env.config)
end

local config = setmetatable({}, {
	__index = function(_, k) return env.config[k] end,
	__newindex = function(_, k, v) env.config[k] = v end,
})

local method = if config.method == "tp" then "tp" else "weld"
local function ensureConfig(name, value)
	if config[name] == nil then
		config[name] = value
	end
end
ensureConfig("activationMode", "keybind")
ensureConfig("primaryBindKind", "KeyCode")
ensureConfig("primaryBindCode", "LeftControl")
ensureConfig("secondaryBindKind", "UserInputType")
ensureConfig("secondaryBindCode", "MouseButton1")
ensureConfig("touchFlingBindKind", "KeyCode")
ensureConfig("touchFlingBindCode", "R")
ensureConfig("freeFlingBindKind", "KeyCode")
ensureConfig("freeFlingBindCode", "T")
ensureConfig("customVelocityMult", 1)
ensureConfig("customAngularMult", 1)
ensureConfig("freeFlingCursorOffsetX", 0)
ensureConfig("freeFlingCursorOffsetY", -58)
if config.freeFlingCursorOffsetY == -12 then
	config.freeFlingCursorOffsetY = -58
end
local custom = {
	introTitle = config.introTitle or "Swiftz CF",
	introSubtitle = config.introSubtitle or "Monochrome Industries",
	introHint = config.introHint or "Ctrl + Click / Tap Player",
	introDuration = config.introDuration or 3.15,
	introVolume = config.introVolume or 0.6,
	introPlaybackSpeed = config.introPlaybackSpeed or 1,
	watermark = config.watermark or "Swiftz CF // locked in",
	cardColor = config.cardColor or Color3.fromRGB(14, 18, 24),
	topBarColor = config.topBarColor or Color3.fromRGB(8, 12, 18),
	shadeColor = config.shadeColor or Color3.fromRGB(2, 5, 10),
	accentA = config.accentA or Color3.fromRGB(200, 200, 210),
	accentB = config.accentB or Color3.fromRGB(220, 220, 225),
	accentC = config.accentC or Color3.fromRGB(255, 255, 255),
	accentD = config.accentD or Color3.fromRGB(180, 180, 190),
	accentE = config.accentE or Color3.fromRGB(160, 160, 170),
	flingDuration = config.flingDuration or 2.65,
	weldPredictionLead = config.weldPredictionLead or 0.058,
	tpPredictionLead = config.tpPredictionLead or 0.105,
	tpPredictionPulse = config.tpPredictionPulse or 0.028,
	flingVelocityBackoff = config.flingVelocityBackoff or 125,
	flingVerticalBackoff = config.flingVerticalBackoff or 95,
	flingDistanceBackoff = config.flingDistanceBackoff or 52,
	flingWarmup = config.flingWarmup or 0.16,
	sessionWalkSpeed = config.sessionWalkSpeed or 20,
	sessionJumpPower = config.sessionJumpPower or 56,
	guideDropVelocity = config.guideDropVelocity or -165,
	guideAngularMin = config.guideAngularMin or -28,
	guideAngularMax = config.guideAngularMax or 28,
	spinSpeed = config.spinSpeed or 1.22,
}

local powerSettings = {
	Weak = { velocityMult = 0.5, angularMult = 0.5 },
	Mild = { velocityMult = 0.75, angularMult = 0.75 },
	Strong = { velocityMult = 1, angularMult = 1 },
	["SUPER strong"] = { velocityMult = 2, angularMult = 2 },
	["SUPER DUPER Strong"] = { velocityMult = 3, angularMult = 3 },
	["Absolute Infinity ∞"] = { velocityMult = 100, angularMult = 100 },
	Custom = { velocityMult = tonumber(config.customVelocityMult) or 1, angularMult = tonumber(config.customAngularMult) or 1 },
}

local anims = {
	R6 = {
		idle = "rbxassetid://180435571",
		idleAlt = "rbxassetid://180435792",
		walk = "rbxassetid://180426354",
		run = nil,
		jump = "rbxassetid://125750702",
		fall = "rbxassetid://180436148",
	},
	R15 = {
		idle = "rbxassetid://507766666",
		walk = "rbxassetid://507777826",
		run = "rbxassetid://507767714",
		jump = "rbxassetid://507765000",
		fall = "rbxassetid://507767968",
	},
}
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local inputService = game:GetService("UserInputService")
local contextService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local world = game:GetService("Workspace")
local debrisService = game:GetService("Debris")
local soundService = game:GetService("SoundService")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()
local cam = world.CurrentCamera
local signatureUserId = 10512489482
local releaseScriptUrl = "https://github.com/xaviersupreme/nbf9000/releases/latest/download/nbf9000.client.luau"
local cachedScriptPath = "assets/script.lua"
local function safeCall(fn, ...)
	if type(fn) ~= "function" then
		return false
	end
	return pcall(fn, ...)
end
local function safeDisconnect(c)
	if c then
		pcall(function()
			return c:Disconnect()
		end)
	end
end
local function uiParent()
	local ok, parent = safeCall(if type(gethui) == "function" then gethui else nil)
	if ok and typeof(parent) == "Instance" then
		return parent
	end
	local okCore, coreGui = pcall(function()
		return game:GetService("CoreGui")
	end)
	if okCore and coreGui then
		return coreGui
	end
	return localPlayer:WaitForChild("PlayerGui")
end
local function safeIsFile(path)
	local ok, result = safeCall(if type(isfile) == "function" then isfile else nil, path)
	return ok and result == true
end
local function safeReadFile(path)
	local ok, data = safeCall(if type(readfile) == "function" then readfile else nil, path)
	return if ok and type(data) == "string" then data else nil
end
local function safeWriteFile(path, data)
	return safeCall(if type(writefile) == "function" then writefile else nil, path, data)
end
local function safeMakeFolder(path)
	return safeCall(if type(makefolder) == "function" then makefolder else nil, path)
end
local function safeCustomAsset(path)
	local ok, id = safeCall(if type(getcustomasset) == "function" then getcustomasset else nil, path)
	return if ok and type(id) == "string" and #id > 0 then id else nil
end
local function safeHiddenProperty(obj, property, value)
	return safeCall(if type(sethiddenproperty) == "function" then sethiddenproperty else nil, obj, property, value)
end
local oldRuntime = env.nbf9000
local oldStop
local oldDestroyHeight = world.FallenPartsDestroyHeight
if oldRuntime then
	oldStop = oldRuntime.stop
	if oldRuntime.oldDestroyHeight ~= nil then
		oldDestroyHeight = oldRuntime.oldDestroyHeight
	end
end
local originalDestroyHeight = if oldDestroyHeight ~= oldDestroyHeight then -500 else oldDestroyHeight
local destroyHeightSet = false
if oldStop then
	pcall(oldStop)
end
local function setDestroyH(v)
	pcall(function()
		world.FallenPartsDestroyHeight = v
	end)
end
local function setFlingDestroyH()
	if destroyHeightSet then
		return nil
	end
	setDestroyH(0 / 0)
	destroyHeightSet = true
end
local runtime = {}
local connections = {}
local queue = {}
local cooldowns = {}
local savedTransparency = {}
local savedCollision = {}
local targetCollision = {}
local sessionModel
local guidePart
local guideOutline
local guideOutlineAlt
local guideTick = os.clock()
local introGui
local introConn
local introSound
local watermarkGui
local watermarkConn
local watermarkLabel
local watermarkStroke
local savedHumanoidState
local maskedChar
local deathConn
local busy = false
local lastInput
local lastWasGui = false
local lastTapTime = 0
local lastTapPos = Vector3.zero
local hrpOutlines = {}
local loaderFrames = { "|", "/", "-", "\\" }
local _vector3 = Vector3.new(math.random(), math.random(), math.random())
local _arg0 = math.pi * 2
local guideSpinOffset = _vector3 * _arg0
local keys = {
	w = false,
	a = false,
	s = false,
	d = false,
	jump = false,
	stick = Vector2.zero,
	padJump = false,
	move = Vector3.zero,
	wantJump = false,
}
local function track(c)
	local _c = c
	table.insert(connections, _c)
	return c
end
local function wrap(n)
	return ((n % 1) + 1) % 1
end
local function accentColor(n)
	local x = wrap(n) * 5
	local i = math.floor(x)
	local a = x - i
	if i == 0 then
		return custom.accentA:Lerp(custom.accentB, a)
	end
	if i == 1 then
		return custom.accentB:Lerp(custom.accentC, a)
	end
	if i == 2 then
		return custom.accentC:Lerp(custom.accentD, a)
	end
	if i == 3 then
		return custom.accentD:Lerp(custom.accentE, a)
	end
	return custom.accentE:Lerp(custom.accentA, a)
end
local function accentSequence()
	return ColorSequence.new({ ColorSequenceKeypoint.new(0, custom.accentA), ColorSequenceKeypoint.new(0.26, custom.accentB), ColorSequenceKeypoint.new(0.52, custom.accentC), ColorSequenceKeypoint.new(0.76, custom.accentD), ColorSequenceKeypoint.new(1, custom.accentE) })
end
local function accentLoopSequence()
	return ColorSequence.new({ ColorSequenceKeypoint.new(0, custom.accentA), ColorSequenceKeypoint.new(0.18, custom.accentB), ColorSequenceKeypoint.new(0.36, custom.accentC), ColorSequenceKeypoint.new(0.54, custom.accentD), ColorSequenceKeypoint.new(0.72, custom.accentE), ColorSequenceKeypoint.new(1, custom.accentA) })
end
local function accentGradient(parent, rot)
	if rot == nil then
		rot = 0
	end
	local g = Instance.new("UIGradient")
	g.Color = accentSequence()
	g.Rotation = rot
	g.Parent = parent
	return g
end
local function charParts(char)
	local _hum = char
	if _hum ~= nil then
		_hum = _hum:FindFirstChildOfClass("Humanoid")
	end
	local hum = _hum
	local _result = hum
	if _result ~= nil then
		_result = _result.RootPart
	end
	local _condition_1 = _result
	if _condition_1 == nil then
		local _result_1 = char
		if _result_1 ~= nil then
			_result_1 = _result_1:FindFirstChild("HumanoidRootPart")
		end
		_condition_1 = _result_1
	end
	local rp = _condition_1
	local _result_1 = rp
	if _result_1 ~= nil then
		_result_1 = _result_1:IsA("BasePart")
	end
	return hum, if _result_1 then rp else nil
end
local function isDead(hum)
	if not hum then
		return false
	end
	return hum.Health <= 0 or hum:GetState() == Enum.HumanoidStateType.Dead
end
local function clearGuide()
	if guideOutline then
		guideOutline:Destroy()
	end
	if guideOutlineAlt then
		guideOutlineAlt:Destroy()
	end
	if guidePart then
		guidePart:Destroy()
	end
	guideOutline = nil
	guideOutlineAlt = nil
	guidePart = nil
end
local function releaseGuide()
	local p = guidePart
	if not p then
		return nil
	end
	guidePart = nil
	guideOutline = nil
	guideTick = os.clock()
	p.Anchored = false
	p.Massless = false
	p.CanCollide = false
	p.CanTouch = false
	p.CanQuery = false
	local currentPower = config.power or "Strong"
	local powerData = powerSettings[currentPower] or powerSettings.Strong
	local velMult = powerData.velocityMult
	local angMult = powerData.angularMult
	p.AssemblyLinearVelocity = Vector3.new(0, custom.guideDropVelocity * velMult, 0)
	p.AssemblyAngularVelocity = Vector3.new(math.random(custom.guideAngularMin, custom.guideAngularMax)*angMult, math.random(custom.guideAngularMin, custom.guideAngularMax)*angMult, math.random(custom.guideAngularMin, custom.guideAngularMax)*angMult)
	p.Velocity = p.AssemblyLinearVelocity
	p.RotVelocity = p.AssemblyAngularVelocity
	debrisService:AddItem(p, 2.5)
end
local function killIntro()
	if introConn then
		safeDisconnect(introConn)
	end
	if introSound then
		introSound.Volume = 0
		introSound:Stop()
		introSound:Destroy()
	end
	if introGui then
		introGui:Destroy()
	end
	introConn = nil
	introSound = nil
	introGui = nil
	local _result = watermarkLabel
	if _result ~= nil then
		_result = _result.Parent
	end
	if _result then
		tweenService:Create(watermarkLabel, TweenInfo.new(0.18), {
			TextTransparency = 0.08,
			TextStrokeTransparency = 0.38,
		}):Play()
	end
	local _result_1 = watermarkStroke
	if _result_1 ~= nil then
		_result_1 = _result_1.Parent
	end
	if _result_1 then
		tweenService:Create(watermarkStroke, TweenInfo.new(0.18), {
			Transparency = 0.24,
		}):Play()
	end
end
local function clearHrpOutlines()
	for _, box in hrpOutlines do
		if box.Parent then
			box:Destroy()
		end
	end
	table.clear(hrpOutlines)
end
local function getSignaturePlayer()
	for _, player in players:GetPlayers() do
		if player.UserId == signatureUserId then
			return player
		end
	end
end
local function clearWatermark()
	if watermarkConn then
		safeDisconnect(watermarkConn)
	end
	if watermarkGui then
		watermarkGui:Destroy()
	end
	watermarkConn = nil
	watermarkGui = nil
	watermarkLabel = nil
	watermarkStroke = nil
end
local function updateWatermark()
	local signaturePlayer = getSignaturePlayer()
	if not signaturePlayer then
		clearWatermark()
		return nil
	end
	local _result = watermarkGui
	if _result ~= nil then
		_result = _result.Parent
	end
	if _result then
		return nil
	end
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "swiftzCFMark"
	screenGui.IgnoreGuiInset = true
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 2147483646
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = uiParent()
	watermarkGui = screenGui
	local label = Instance.new("TextLabel")
	label.AnchorPoint = Vector2.new(1, 1)
	label.Position = UDim2.new(1, -12, 1, -10)
	label.Size = UDim2.new(0, 340, 0, 22)
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.Font = Enum.Font.Code
	label.Text = `{custom.watermark} ({signaturePlayer.Name}/{signaturePlayer.DisplayName})`
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Right
	label.TextColor3 = Color3.fromRGB(230, 230, 236)
	local introActive = config.intro ~= false and introGui ~= nil
	label.TextTransparency = if introActive then 1 else 0.08
	label.TextStrokeTransparency = if introActive then 1 else 0.38
	label.ZIndex = 50
	label.Parent = screenGui
	watermarkLabel = label
	local grad = Instance.new("UIGradient")
	grad.Color = accentLoopSequence()
	grad.Rotation = 0
	grad.Parent = label
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Transparency = if introActive then 1 else 0.24
	stroke.Parent = label
	watermarkStroke = stroke
	watermarkConn = runService.RenderStepped:Connect(function()
		if not label.Parent then
			if watermarkConn then
				safeDisconnect(watermarkConn)
			end
			watermarkConn = nil
			return nil
		end
		local t = os.clock()
		grad.Offset = Vector2.new(wrap(t * 0.22) * 2 - 1, 0)
	end)
end
local function updateHrpOutlines()
	if config.showHRPs ~= true then
		clearHrpOutlines()
		return nil
	end
	local live = {}
	for _, player in players:GetPlayers() do
		if player == localPlayer then
			continue
		end
		live[player] = true
		local _1, root = charParts(player.Character)
		local box = hrpOutlines[player]
		if not root or not root.Parent then
			if box then
				box:Destroy()
				hrpOutlines[player] = nil
			end
			continue
		end
		if not box or box.Adornee ~= root or not box.Parent then
			if box then
				box:Destroy()
			end
			box = Instance.new("SelectionBox")
			box.Name = "HRP Mark"
			box.Adornee = root
			box.LineThickness = 0.02
			box.SurfaceTransparency = 1
			box.Parent = root
			local _box = box
			hrpOutlines[player] = _box
		end
		box.Color3 = accentColor(os.clock() * 0.55 + 0.26)
	end
	for player, box in hrpOutlines do
		if not (live[player] ~= nil) then
			box:Destroy()
			hrpOutlines[player] = nil
		end
	end
end
local function makeIntroText(parent, s, size, y, high)
	if high == nil then
		high = false
	end
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.Position = UDim2.new(0.5, 0, 0, y)
	label.Size = UDim2.new(1, -28, 0, size + 10)
	label.Font = if high then Enum.Font.Arcade else Enum.Font.Code
	label.Text = s
	label.TextSize = size
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextStrokeTransparency = if high then 0.25 else 0.55
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.ZIndex = 6
	label.Parent = parent
	return label
end
local function customAsset(path)
	if safeIsFile(path) then
		local data = safeReadFile(path)
		if type(data) == "string" and #data < 100000 then
			return nil
		end
		local id = safeCustomAsset(path)
		if id then
			return id
		end
	end
end
local function introAsset()
	local path = "assets/nbf9000-intro.mp3"
	for _, p in { path } do
		local asset = customAsset(p)
		if asset ~= "" and asset then
			return asset
		end
	end
	pcall(function()
		safeMakeFolder("assets")
		local httpGet = game.HttpGet
		local data = httpGet(game, "https://raw.githubusercontent.com/xaviersupreme/nbf9000/main/assets/nbf9000-intro.mp3")
		if #data > 100000 then
			safeWriteFile(path, data)
		end
	end)
	local asset = customAsset(path)
	if not (asset ~= "" and asset) then
		warn("nbf9000 intro sound missing: assets/nbf9000-intro.mp3 did not download or is not a valid mp3")
	end
	return asset
end
local function cacheScript(state)
	local setStep = function(step)
		if state then
			state.step = step
		end
	end
	if state then
		state.total = 3
		state.step = 0
		state.done = false
		state.failed = false
		state.cached = false
	end
	if safeIsFile(cachedScriptPath) then
		local data = safeReadFile(cachedScriptPath)
		if type(data) == "string" and #data > 1000 then
			if state then
				state.step = state.total
				state.done = true
				state.cached = true
			end
			return nil
		end
	end
	TS.try(function()
		setStep(1)
		safeMakeFolder("assets")
		local httpGet = game.HttpGet
		local data = httpGet(game, releaseScriptUrl)
		setStep(2)
		if #data > 1000 then
			safeWriteFile(cachedScriptPath, data)
		end
		setStep(3)
		if state then
			state.done = true
		end
	end, function(err)
		if state then
			state.failed = true
			state.done = true
		end
		warn(`nbf9000 script cache failed: {err}`)
	end)
end
local function playIntro()
	killIntro()
	local loader = {
		step = 0,
		total = 3,
		done = false,
		failed = false,
		cached = false,
	}
	task.spawn(function()
		return cacheScript(loader)
	end)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "swiftzCFIntro"
	screenGui.IgnoreGuiInset = true
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 2147483647
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = uiParent()
	introGui = screenGui
	local asset = introAsset()
	if asset ~= "" and asset then
		local snd = Instance.new("Sound")
		snd.Name = "swiftzCFIntro"
		snd.SoundId = asset
		snd.Volume = custom.introVolume
		snd.Looped = false
		snd.PlaybackSpeed = custom.introPlaybackSpeed
		snd.Parent = soundService
		task.spawn(function()
			if not snd.Parent then
				return nil
			end
			do
				local i = 0
				local _shouldIncrement = false
				while true do
					if _shouldIncrement then
						i += 1
					else
						_shouldIncrement = true
					end
					if not (i < 180 and not snd.IsLoaded) then
						break
					end
					runService.RenderStepped:Wait()
				end
			end
			snd:Stop()
			task.wait()
			snd.TimePosition = 0
			task.wait()
			soundService:PlayLocalSound(snd)
		end)
		introSound = snd
	end
	local shade = Instance.new("Frame")
	shade.Size = UDim2.fromScale(1, 1)
	shade.BackgroundColor3 = custom.shadeColor
	shade.BackgroundTransparency = 1
	shade.BorderSizePixel = 0
	shade.ZIndex = 1
	shade.Parent = screenGui
	local borderFrames = {}
	local borderGrads = {}
	local borderSpecs = { {
		pos = UDim2.new(0, 0, 0, 0),
		size = UDim2.new(1, 0, 0, 2),
		rot = 0,
	}, {
		pos = UDim2.new(0, 0, 1, -2),
		size = UDim2.new(1, 0, 0, 2),
		rot = 180,
	}, {
		pos = UDim2.new(0, 0, 0, 0),
		size = UDim2.new(0, 2, 1, 0),
		rot = 90,
	}, {
		pos = UDim2.new(1, -2, 0, 0),
		size = UDim2.new(0, 2, 1, 0),
		rot = 270,
	} }
	for _, spec in borderSpecs do
		local frame = Instance.new("Frame")
		frame.Position = spec.pos
		frame.Size = spec.size
		frame.BackgroundColor3 = Color3.new(1, 1, 1)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.ZIndex = 2
		frame.Parent = screenGui
		table.insert(borderFrames, frame)
		local grad = Instance.new("UIGradient")
		grad.Color = accentSequence()
		grad.Rotation = spec.rot
		grad.Parent = frame
		table.insert(borderGrads, grad)
	end
	local card = Instance.new("Frame")
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.new(0.82, 0, 0, 136)
	card.BackgroundColor3 = custom.cardColor
	card.BackgroundTransparency = 1
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.ZIndex = 3
	card.Parent = screenGui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 7)
	corner.Parent = card
	local cardSize = Instance.new("UISizeConstraint")
	cardSize.MinSize = Vector2.new(260, 136)
	cardSize.MaxSize = Vector2.new(390, 136)
	cardSize.Parent = card
	local scale = Instance.new("UIScale")
	scale.Scale = 0.94
	scale.Parent = card
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = Color3.new(1, 1, 1)
	stroke.Transparency = 1
	stroke.Parent = card
	local edge = Instance.new("UIGradient")
	edge.Color = accentSequence()
	edge.Parent = stroke
	local top = Instance.new("Frame")
	top.Position = UDim2.new(0, 0, 0, 0)
	top.Size = UDim2.new(1, 0, 0, 18)
	top.BackgroundColor3 = custom.topBarColor
	top.BackgroundTransparency = 1
	top.BorderSizePixel = 0
	top.ZIndex = 4
	top.Parent = card
	local topCorner = Instance.new("UICorner")
	topCorner.CornerRadius = UDim.new(0, 7)
	topCorner.Parent = top
	local topFill = Instance.new("Frame")
	topFill.Position = UDim2.new(0, 0, 0, 7)
	topFill.Size = UDim2.new(1, 0, 1, -7)
	topFill.BackgroundColor3 = top.BackgroundColor3
	topFill.BackgroundTransparency = 1
	topFill.BorderSizePixel = 0
	topFill.ZIndex = 4
	topFill.Parent = top
	local title = makeIntroText(card, custom.introTitle, 28, 45, true)
	local sub = makeIntroText(card, custom.introSubtitle, 13, 78)
	title.TextTransparency = 1
	title.TextStrokeTransparency = 1
	sub.TextTransparency = 1
	sub.TextStrokeTransparency = 1
	local boot = makeIntroText(card, custom.introHint, 12, 100)
	boot.TextTransparency = 1
	boot.TextStrokeTransparency = 1
	local titleGrad = accentGradient(title)
	local subGrad = accentGradient(sub)
	local barBox = Instance.new("Frame")
	barBox.AnchorPoint = Vector2.new(0.5, 1)
	barBox.Position = UDim2.new(0.5, -2, 1, 0)
	barBox.Size = UDim2.new(1, -22, 0, 42)
	barBox.BackgroundTransparency = 1
	barBox.BorderSizePixel = 0
	barBox.ZIndex = 4
	barBox.Parent = card
	local bars = {}
	local barGoal = {}
	for i = 0, 26 do
		local bar = Instance.new("Frame")
		bar.AnchorPoint = Vector2.new(0, 1)
		bar.Position = UDim2.new(i / 26, 0, 1, 0)
		bar.Size = UDim2.new(0, 7, 0, 3)
		bar.BackgroundColor3 = Color3.new(1, 1, 1)
		bar.BackgroundTransparency = 0.18
		bar.BorderSizePixel = 0
		bar.ZIndex = 4
		bar.Parent = barBox
		table.insert(bars, bar)
		table.insert(barGoal, 8)
	end
	local scanlines = {}
	for i = 0, 8 do
		local line = Instance.new("Frame")
		line.Position = UDim2.new(0, 0, 0, 24 + i * 13)
		line.Size = UDim2.new(1, 0, 0, 1)
		line.BackgroundColor3 = Color3.new(1, 1, 1)
		line.BackgroundTransparency = 0.94
		line.BorderSizePixel = 0
		line.ZIndex = 3
		line.Parent = card
		table.insert(scanlines, line)
	end
	local flash = Instance.new("Frame")
	flash.Size = UDim2.fromScale(1, 1)
	flash.BackgroundColor3 = Color3.new(1, 1, 1)
	flash.BackgroundTransparency = 1
	flash.BorderSizePixel = 0
	flash.ZIndex = 20
	flash.Parent = screenGui
	tweenService:Create(scale, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Scale = 1,
	}):Play()
	tweenService:Create(shade, TweenInfo.new(0.12), {
		BackgroundTransparency = 0.18,
	}):Play()
	tweenService:Create(card, TweenInfo.new(0.12), {
		BackgroundTransparency = 0.04,
	}):Play()
	tweenService:Create(top, TweenInfo.new(0.12), {
		BackgroundTransparency = 0,
	}):Play()
	tweenService:Create(topFill, TweenInfo.new(0.12), {
		BackgroundTransparency = 0,
	}):Play()
	tweenService:Create(stroke, TweenInfo.new(0.12), {
		Transparency = 0,
	}):Play()
	for _, frame in borderFrames do
		tweenService:Create(frame, TweenInfo.new(0.12), {
			BackgroundTransparency = 0.18,
		}):Play()
	end
	tweenService:Create(title, TweenInfo.new(0.12), {
		TextTransparency = 0,
		TextStrokeTransparency = 0.25,
	}):Play()
	tweenService:Create(sub, TweenInfo.new(0.12), {
		TextTransparency = 0.12,
		TextStrokeTransparency = 0.55,
	}):Play()
	tweenService:Create(boot, TweenInfo.new(0.12), {
		TextTransparency = 0.26,
		TextStrokeTransparency = 0.55,
	}):Play()
	local start = os.clock()
	local lastBar = 0
	local lastUi = 0
	local lastLoud = 0
	local lastLoader = 0
	local loaderFrame = 0
	local loud = 0.35
	local closing = false
	introConn = runService.RenderStepped:Connect(function()
		local t = os.clock() - start
		if t - lastLoud > 0.08 then
			lastLoud = t
			loud = if introSound then math.clamp(introSound.PlaybackLoudness / 650, 0, 1) else 0.35
		end
		if t - lastUi < 1 / 30 then
			if t <= custom.introDuration or closing then
				return nil
			end
		else
			lastUi = t
		end
		local borderThick = math.floor(2 + loud * 2)
		borderFrames[1].Size = UDim2.new(1, 0, 0, borderThick)
		borderFrames[2].Position = UDim2.new(0, 0, 1, -borderThick)
		borderFrames[2].Size = UDim2.new(1, 0, 0, borderThick)
		borderFrames[3].Size = UDim2.new(0, borderThick, 1, 0)
		borderFrames[4].Position = UDim2.new(1, -borderThick, 0, 0)
		borderFrames[4].Size = UDim2.new(0, borderThick, 1, 0)
		for i, grad in ipairs(borderGrads) do
			grad.Offset = Vector2.new(math.sin(t * 0.42 + i * 0.6) * 0.18, math.cos(t * 0.31 + i * 0.45) * 0.08)
		end
		for _, frame in borderFrames do
			frame.BackgroundTransparency = 0.24 - loud * 0.08
		end
		edge.Rotation = (edge.Rotation + 1.4) % 360
		edge.Offset = Vector2.new(math.sin(t * 0.26) * 0.25, 0)
		local textOffset = Vector2.new(math.sin(t * 4) * 0.28, 0)
		titleGrad.Offset = textOffset
		subGrad.Offset = textOffset
		boot.TextColor3 = if loader.failed then Color3.fromRGB(255, 164, 164) else Color3.fromRGB(170, 170, 176)
		if t - lastLoader > 0.09 then
			lastLoader = t
			loaderFrame = (loaderFrame + 1) % #loaderFrames
			local glyph = loaderFrames[loaderFrame + 1]
			boot.Text = if loader.done then custom.introHint else `Downloading {loader.step}/{loader.total} {glyph}`
		end
		if t - lastBar > 0.055 then
			lastBar = t
			for i = 0, #bars - 1 do
				local wave = math.abs(math.sin(t * 5.5 + i * 0.42))
				barGoal[i + 1] = 6 + math.random(0, 12) + wave * 8 + loud * (14 + wave * 30 + math.random(0, 12))
			end
		end
		for i, bar in ipairs(bars) do
			local _condition_1 = barGoal[i]
			if _condition_1 == nil then
				_condition_1 = 8
			end
			local h = _condition_1
			bar.Size = UDim2.new(0, 7, 0, h)
			bar.BackgroundColor3 = accentColor(t * 0.32 + i * 0.065)
		end
		if t > custom.introDuration and introGui and not closing then
			closing = true
			local con = introConn
			introConn = nil
			if con then
				con:Disconnect()
			end
			flash.BackgroundTransparency = 0
			shade.BackgroundTransparency = 1
			for _, frame in borderFrames do
				frame.BackgroundTransparency = 1
			end
			card.BackgroundTransparency = 1
			top.BackgroundTransparency = 1
			topFill.BackgroundTransparency = 1
			tweenService:Create(flash, TweenInfo.new(0.22), {
				BackgroundTransparency = 1,
			}):Play()
			tweenService:Create(stroke, TweenInfo.new(0.22), {
				Transparency = 1,
			}):Play()
			for _, label in { title, sub, boot } do
				tweenService:Create(label, TweenInfo.new(0.18), {
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
			end
			tweenService:Create(barBox, TweenInfo.new(0.18), {
				BackgroundTransparency = 1,
			}):Play()
			for _, bar in bars do
				tweenService:Create(bar, TweenInfo.new(0.18), {
					BackgroundTransparency = 1,
				}):Play()
			end
			for _, line in scanlines do
				tweenService:Create(line, TweenInfo.new(0.18), {
					BackgroundTransparency = 1,
				}):Play()
			end
			tweenService:Create(scale, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Scale = 0.985,
			}):Play()
			local snd = introSound
			if snd then
				task.spawn(function()
					local vol = snd.Volume
					do
						local i = 1
						local _shouldIncrement = false
						while true do
							if _shouldIncrement then
								i += 1
							else
								_shouldIncrement = true
							end
							if not (i <= 6 and snd.Parent) then
								break
							end
							snd.Volume = vol * (1 - i / 6)
							runService.RenderStepped:Wait()
						end
					end
					if snd.Parent then
						snd.Volume = 0
					end
				end)
			end
			task.delay(0.42, function()
				if introGui == screenGui then
					killIntro()
				elseif screenGui.Parent then
					screenGui:Destroy()
				end
			end)
		end
	end)
end
local function updateGuide()
	local hum, rp = charParts(localPlayer.Character)
	if isDead(hum) then
		releaseGuide()
		return nil
	end
	local _, sessionRoot = charParts(sessionModel)
	local root = if busy then rp else (sessionRoot or rp)
	if not root then
		clearGuide()
		return nil
	end
	local t = os.clock()
	local spin = CFrame.Angles(math.sin(t * 2.7 + guideSpinOffset.X) * 2.6 + t * 108 * custom.spinSpeed, math.cos(t * 3.4 + guideSpinOffset.Y) * 3.4 + t * 156 * custom.spinSpeed, math.sin(t * 4.3 + guideSpinOffset.Z) * 2.2 + t * 92 * custom.spinSpeed)
	local wanted = root.CFrame * spin
	if not guidePart then
		local p = Instance.new("Part")
		p.Name = "HRP"
		p.Size = Vector3.new(2, 2, 1)
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.Massless = true
		p.Transparency = 1
		p.CFrame = wanted
		local box = Instance.new("SelectionBox")
		box.Name = "HRP Outline"
		box.Adornee = p
		box.LineThickness = 0.03
		box.SurfaceTransparency = 1
		box.Parent = p
		local boxAlt = Instance.new("SelectionBox")
		boxAlt.Name = "HRP Outline Alt"
		boxAlt.Adornee = p
		boxAlt.LineThickness = 0.015
		boxAlt.SurfaceTransparency = 1
		boxAlt.Parent = p
		p.Parent = world
		guidePart = p
		guideOutline = box
		guideOutlineAlt = boxAlt
		guideTick = t
	end
	local dt = math.min(t - guideTick, 1 / 15)
	guideTick = t
	local _position = wanted.Position
	local _position_1 = guidePart.Position
	local diff = _position - _position_1
	local dist = diff.Magnitude
	if dist > 3 then
		local move = math.min(dist, math.max(650, dist * 40) * dt)
		local _position_2 = guidePart.Position
		local _arg0_1 = diff.Unit * move
		local pos = _position_2 + _arg0_1
		local _cFrame = CFrame.new(pos)
		local _rotation = wanted.Rotation
		guidePart.CFrame = _cFrame * _rotation
	else
		guidePart.CFrame = wanted
	end
	if guideOutline then
		guideOutline.Color3 = accentColor(os.clock() * 0.55)
	end
	if guideOutlineAlt then
		guideOutlineAlt.Color3 = accentColor(os.clock() * 0.55 + 0.26)
	end
end
local function resetRoot()
	local hum, rp = charParts(localPlayer.Character)
	if rp then
		pcall(function()
			return safeHiddenProperty(rp, "PhysicsRepRootPart", nil)
		end)
		rp.AssemblyLinearVelocity = Vector3.zero
		rp.AssemblyAngularVelocity = Vector3.zero
		rp.Velocity = Vector3.zero
		rp.RotVelocity = Vector3.zero
	end
	if hum then
		hum.AutoRotate = true
		pcall(function()
			return safeHiddenProperty(hum, "MoveDirectionInternal", Vector3.zero)
		end)
	end
end
local function saveHumanoidState(hum)
	local _result = savedHumanoidState
	if _result ~= nil then
		_result = _result.hum
	end
	if _result == hum then
		return nil
	end
	savedHumanoidState = {
		hum = hum,
		autoRotate = hum.AutoRotate,
		walkSpeed = hum.WalkSpeed,
		jumpPower = hum.JumpPower,
		jumpHeight = hum.JumpHeight,
		useJumpPower = hum.UseJumpPower,
		requiresNeck = hum.RequiresNeck,
		breakJointsOnDeath = hum.BreakJointsOnDeath,
	}
end
local function restoreHumanoidState()
	local state = savedHumanoidState
	savedHumanoidState = nil
	if not state or not state.hum.Parent then
		return nil
	end
	state.hum.AutoRotate = state.autoRotate
	state.hum.WalkSpeed = state.walkSpeed
	state.hum.UseJumpPower = state.useJumpPower
	state.hum.JumpPower = state.jumpPower
	state.hum.JumpHeight = state.jumpHeight
	state.hum.RequiresNeck = state.requiresNeck
	state.hum.BreakJointsOnDeath = state.breakJointsOnDeath
end
local function restoreAlpha()
	for p, a in savedTransparency do
		if p.Parent then
			p.LocalTransparencyModifier = a
		end
	end
	for p, c in savedCollision do
		if p.Parent then
			p.CanCollide = c
		end
	end
	table.clear(savedTransparency)
	table.clear(savedCollision)
	maskedChar = nil
end
local function restoreTargetCollision()
	for p, c in targetCollision do
		if p.Parent then
			p.CanCollide = c
		end
	end
	table.clear(targetCollision)
end
local charFromPart
local function noCollideTarget(tgt)
	local _tgt = tgt
	if not (typeof(_tgt) == "Instance") then
		return nil
	end
	local char = if tgt:IsA("Model") then tgt else (if tgt:IsA("BasePart") then charFromPart(tgt) else nil)
	if not char or char == localPlayer.Character or char == sessionModel then
		return nil
	end
	for _, obj in char:GetDescendants() do
		if obj:IsA("BasePart") then
			if not (targetCollision[obj] ~= nil) then
				local _canCollide = obj.CanCollide
				targetCollision[obj] = _canCollide
			end
			obj.CanCollide = false
		end
	end
end
local function maskChar(char)
	if not char then
		return nil
	end
	if maskedChar and maskedChar ~= char then
		restoreAlpha()
	end
	maskedChar = char
	for _, obj in char:GetDescendants() do
		if obj:IsA("BasePart") then
			if not (savedTransparency[obj] ~= nil) then
				local _localTransparencyModifier = obj.LocalTransparencyModifier
				savedTransparency[obj] = _localTransparencyModifier
			end
			if not (savedCollision[obj] ~= nil) then
				local _canCollide = obj.CanCollide
				savedCollision[obj] = _canCollide
			end
			obj.LocalTransparencyModifier = 1
			obj.CanCollide = false
			obj.Velocity = Vector3.zero
			obj.RotVelocity = Vector3.zero
		end
	end
end
local function clearSessionModel(sync)
	local model = sessionModel
	local _, sessionRoot = charParts(model)
	local hum, rp = charParts(localPlayer.Character)
	local retCf = if sync and sessionRoot then sessionRoot.CFrame else nil
	local retVel = if sync and sessionRoot then sessionRoot.AssemblyLinearVelocity else Vector3.zero
	busy = false
	if model then
		model:Destroy()
	end
	sessionModel = nil
	runtime.sessionModel = nil
	restoreTargetCollision()
	restoreAlpha()
	resetRoot()
	restoreHumanoidState()
	if retCf and rp then
		rp.CFrame = retCf
		rp.AssemblyLinearVelocity = retVel
		rp.AssemblyAngularVelocity = Vector3.zero
		rp.Velocity = retVel
		rp.RotVelocity = Vector3.zero
	end
	setDestroyH(originalDestroyHeight)
	destroyHeightSet = false
	if hum and cam then
		cam.CameraSubject = hum
	end
end
local function dropDeadChar(char)
	if not char then
		return nil
	end
	table.clear(queue)
	table.clear(cooldowns)
	busy = false
	releaseGuide()
	clearSessionModel(false)
end

-- UI State
local controlGui, controlVisible = nil, false
local settingsGui, settingsVisible = nil, false
local controlFadeIn, controlFadeOut
local settingsFadeIn, settingsFadeOut
local scriptPaused = false
local startupReady = false
local startupGui
local noticeGui
local noticeToken = 0
local bindCapture
local clickShieldGui
local clickGuardBound = false
local touchFlingEnabled = false
local freeFlingEnabled = false
local freeFlingHeld = false
local freeFlingItem
local touchFlingConnections = {}
local activationTool
local toolEquipped = false
local heldInputs = {}
local activationAllowed
local showNotice
local updateClickShield

local function stop()
	for _, c in connections do
		safeDisconnect(c)
	end
	table.clear(connections)
	if deathConn then
		safeDisconnect(deathConn)
		deathConn = nil
	end
	table.clear(queue)
	table.clear(cooldowns)
	runService:UnbindFromRenderStep("swiftzCFCameraLock")
	runService:UnbindFromRenderStep("swiftzCF")
	clearSessionModel(false)
	clearGuide()
	clearHrpOutlines()
	killIntro()
	clearWatermark()
	if controlGui then
		controlGui:Destroy()
	end
	if settingsGui then
		settingsGui:Destroy()
	end
	controlGui = nil
	settingsGui = nil
	controlVisible = false
	settingsVisible = false
	controlFadeIn = nil
	controlFadeOut = nil
	settingsFadeIn = nil
	settingsFadeOut = nil
	if startupGui then
		startupGui:Destroy()
	end
	if noticeGui then
		noticeGui:Destroy()
	end
	if clickShieldGui then
		clickShieldGui:Destroy()
	end
	if clickGuardBound then
		pcall(function()
			contextService:UnbindAction("swiftzCFClickGuard")
		end)
	end
	if activationTool then
		activationTool:Destroy()
	end
	for _, c in touchFlingConnections do
		safeDisconnect(c)
	end
	startupGui = nil
	noticeGui = nil
	clickShieldGui = nil
	clickGuardBound = false
	activationTool = nil
	toolEquipped = false
	touchFlingEnabled = false
	freeFlingEnabled = false
	freeFlingHeld = false
	freeFlingItem = nil
	bindCapture = nil
	table.clear(touchFlingConnections)
	table.clear(heldInputs)
end
local function bindCharacter(char)
	if deathConn then
		safeDisconnect(deathConn)
		deathConn = nil
	end
	setDestroyH(originalDestroyHeight)
	destroyHeightSet = false
	if not char then
		return nil
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then
		return nil
	end
	deathConn = hum.Died:Connect(function()
		dropDeadChar(char)
	end)
end
local function prepareSessionModel(char)
	for _, obj in char:GetDescendants() do
		if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("Animator") then
			obj:Destroy()
		elseif obj:IsA("Motor6D") then
			obj.Transform = CFrame.identity
		elseif obj:IsA("BasePart") then
			obj.Anchored = false
			obj.CanTouch = false
			obj.CanQuery = false
			obj.CanCollide = obj.Name == "HumanoidRootPart"
			obj.LocalTransparencyModifier = 0
		elseif obj:IsA("ForceField") then
			obj.Visible = false
		end
	end
end
local function createTrack(anim, id, pri, loop)
	if not (id ~= "" and id) or #id == 0 then
		return nil
	end
	local a = Instance.new("Animation")
	a.AnimationId = id
	local ok, t = pcall(function()
		return anim:LoadAnimation(a)
	end)
	a:Destroy()
	if ok and t then
		t.Priority = pri
		t.Looped = loop
		return t
	end
end
local function animateSessionModel(char, hum)
	local anim = Instance.new("Animator")
	anim.Parent = hum
	local isR15 = hum.RigType == Enum.HumanoidRigType.R15
	local set = if isR15 then anims.R15 else anims.R6
	local idlePriority = if isR15 then Enum.AnimationPriority.Idle else Enum.AnimationPriority.Core
	local movePriority = if isR15 then Enum.AnimationPriority.Movement else Enum.AnimationPriority.Core
	local actionPriority = if isR15 then Enum.AnimationPriority.Action else Enum.AnimationPriority.Core
	local currentName
	local currentTrack
	local function animationId(name)
		if name == "idle" and not isR15 then
			return if math.random(1, 10) == 10 then anims.R6.idleAlt else anims.R6.idle
		end
		if name == "walk" then
			return set.walk
		end
		if name == "run" then
			return set.run
		end
		if name == "jump" then
			return set.jump
		end
		if name == "fall" then
			return set.fall
		end
		return set.idle
	end
	local function animationPriority(name)
		if name == "walk" or name == "run" then
			return movePriority
		end
		if name == "jump" or name == "fall" then
			return actionPriority
		end
		return idlePriority
	end
	local function animationLooped(name)
		return name ~= "jump"
	end
	local function play(name, fade)
		local _condition_1 = currentName == name
		if _condition_1 then
			local _result = currentTrack
			if _result ~= nil then
				_result = _result.IsPlaying
			end
			_condition_1 = _result
		end
		if _condition_1 then
			return nil
		end
		local id = animationId(name)
		local track = createTrack(anim, id, animationPriority(name), animationLooped(name))
		if not track then
			return nil
		end
		if currentTrack then
			currentTrack:Stop(fade)
			currentTrack:Destroy()
		end
		currentName = name
		currentTrack = track
		track:Play(fade)
	end
	local function setAnimationSpeed(speed)
		local _result = currentTrack
		if _result ~= nil then
			_result:AdjustSpeed(speed)
		end
	end
	local function moveSpeed()
		local _, root = charParts(char)
		local flatVelocity = if root then Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z).Magnitude else 0
		local inputSpeed = hum.WalkSpeed * math.min(keys.move.Magnitude, 1)
		return math.max(flatVelocity, inputSpeed)
	end
	local function playMove(speed)
		if speed == nil then
			speed = moveSpeed()
		end
		if not isR15 then
			play("walk", 0.1)
			setAnimationSpeed(math.max(speed / 14.5, 0.1))
			return nil
		end
		local _value = speed > 7 and set.run
		local name = if _value ~= "" and _value then "run" else "walk"
		play(name, 0.15)
		setAnimationSpeed(math.max(speed / 16, 0.1))
	end
	local jumpTime = 0
	local lastTick = os.clock()
	local cn
	cn = runService.PreAnimation:Connect(function()
		if not sessionModel or not sessionModel.Parent or not hum.Parent then
			cn:Disconnect()
			return nil
		end
		local now = os.clock()
		local dt = now - lastTick
		lastTick = now
		if jumpTime > 0 then
			jumpTime = math.max(jumpTime - dt, 0)
		end
		local st = hum:GetState()
		local speed = moveSpeed()
		local inputMoving = keys.move.Magnitude > 0.05
		local moving = inputMoving or speed > (if busy then 3.4 else 4.2)
		if st == Enum.HumanoidStateType.Jumping or hum.Jump then
			jumpTime = 0.3
			play("jump", 0.1)
		elseif st == Enum.HumanoidStateType.Freefall or st == Enum.HumanoidStateType.FallingDown then
			if jumpTime > 0 then
				play("jump", 0.1)
				return nil
			end
			play("fall", 0.2)
		elseif moving then
			playMove(speed)
		else
			play("idle", 0.2)
		end
	end)
	char.Destroying:Once(function()
		cn:Disconnect()
		if currentTrack then
			currentTrack:Stop(0)
			currentTrack:Destroy()
		end
	end)
end
local function spawnSessionModel()
	local char = localPlayer.Character
	local _, rp = charParts(char)
	if not char or not rp then
		return nil
	end
	if sessionModel then
		sessionModel:Destroy()
	end
	local arc = char.Archivable
	char.Archivable = true
	local g = char:Clone()
	char.Archivable = arc
	if not g then
		return nil
	end
	g.Name = "swiftzCFRig"
	prepareSessionModel(g)
	g.Parent = world
	g:PivotTo(rp.CFrame)
	local sessionHum, sessionRoot = charParts(g)
	if not sessionHum or not sessionRoot then
		g:Destroy()
		return nil
	end
	sessionHum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	sessionHum.RequiresNeck = false
	sessionHum.BreakJointsOnDeath = false
	sessionHum.UseJumpPower = true
	sessionHum.WalkSpeed = math.max(sessionHum.WalkSpeed, custom.sessionWalkSpeed)
	sessionHum.JumpPower = math.max(sessionHum.JumpPower, custom.sessionJumpPower)
	sessionHum.Health = sessionHum.MaxHealth
	sessionHum.AutoRotate = true
	sessionHum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
	sessionRoot.RootPriority = 67
	sessionModel = g
	runtime.sessionModel = g
	animateSessionModel(g, sessionHum)
	if cam then
		cam.CameraSubject = sessionHum
	end
	return g, sessionHum, sessionRoot
end
local function lockCameraToSession()
	local sessionHum = charParts(sessionModel)
	if not sessionHum then
		return nil
	end
	cam = world.CurrentCamera
	if cam and cam.CameraSubject ~= sessionHum then
		cam.CameraSubject = sessionHum
	end
end
local function targetPart(char)
	local _, root = charParts(char)
	if root then
		return root
	end
	if char.PrimaryPart then
		return char.PrimaryPart
	end
	local best
	local bestSize = 0
	for _1, obj in char:GetDescendants() do
		if obj:IsA("BasePart") and not obj:FindFirstAncestorOfClass("Accessory") then
			local size = obj.Size.X * obj.Size.Y * obj.Size.Z
			if size > bestSize then
				best = obj
				bestSize = size
			end
		end
	end
	return best or root
end
local function flingPart(tgt)
	local _tgt = tgt
	if typeof(_tgt) == "Instance" then
		if tgt:IsA("Model") then
			return targetPart(tgt)
		end
		if tgt:IsA("BasePart") then
			local char = charFromPart(tgt)
			return if char then targetPart(char) or tgt else tgt
		end
	end
end
local function predict(tgt)
	local _tgt = tgt
	if typeof(_tgt) == "Instance" then
		local part = flingPart(tgt)
		if part then
			if not part:IsDescendantOf(world) then
				return CFrame.identity, true
			end
			local t = os.clock()
			local lead = if method == "weld" then custom.weldPredictionLead else custom.tpPredictionLead + math.sin(t * 15) * custom.tpPredictionPulse
			local cf = CFrame.new(part.Position)
			local oldPos = part:GetAttribute("lastPosition")
			if typeof(oldPos) == "Vector3" and (part.Position - oldPos).Magnitude > 200 then
				part:SetAttribute("lastPosition", nil)
				return cf, true
			end
			part:SetAttribute("lastPosition", part.Position)
			local _cf = cf
			local _arg0_1 = part.AssemblyLinearVelocity * lead
			cf = _cf + _arg0_1
			if method ~= "weld" then
				local _cf_1 = cf
				local _vector3_1 = Vector3.new(0, -world.Gravity * 0.5 * lead * lead + math.sin(t * 60), 0)
				cf = _cf_1 + _vector3_1
				if cf.Position.Y < part.Position.Y - 1 then
					local _rotation = cf.Rotation
					local _vector3_2 = Vector3.new(cf.Position.X, part.Position.Y - 1, cf.Position.Z)
					cf = _rotation + _vector3_2
				end
			end
			return cf, false
		end
	end
	local _tgt_1 = tgt
	if typeof(_tgt_1) == "CFrame" then
		return tgt, false
	end
	local _tgt_2 = tgt
	if typeof(_tgt_2) == "Vector3" then
		return CFrame.new(tgt), false
	end
	return CFrame.identity, true
end
local getPart
local function shouldBackOff(item)
	local now = os.clock()
	local _condition_1 = item.start
	if _condition_1 == nil then
		_condition_1 = now
	end
	item.start = _condition_1
	local _condition_2 = item["end"]
	if _condition_2 == nil then
		local _condition_3 = item.dur
		if _condition_3 == nil then
			_condition_3 = custom.flingDuration
		end
		_condition_2 = now + _condition_3
	end
	item["end"] = _condition_2
	if now > item["end"] then
		return true
	end
	local part = getPart(item.tgt)
	if not part then
		return false
	end
	if not part:IsDescendantOf(world) then
		return true
	end
	item.startPos = item.startPos or part.Position
	if now - item.start < custom.flingWarmup then
		return false
	end
	local velocity = part.AssemblyLinearVelocity
	if velocity.Magnitude > custom.flingVelocityBackoff or math.abs(velocity.Y) > custom.flingVerticalBackoff then
		return true
	end
	local _position = part.Position
	local _startPos = item.startPos
	if (_position - _startPos).Magnitude > custom.flingDistanceBackoff then
		return true
	end
	return false
end
function getPart(tgt)
	local _tgt = tgt
	if typeof(_tgt) == "Instance" then
		if tgt:IsA("Model") then
			return targetPart(tgt)
		end
		if tgt:IsA("BasePart") then
			local char = charFromPart(tgt)
			return if char then targetPart(char) or tgt else tgt
		end
	end
end
local function doHighlight(tgt)
	local _tgt = tgt
	if not (typeof(_tgt) == "Instance") then
		return nil
	end
	local char = if tgt:IsA("Model") then tgt else (if tgt:IsA("BasePart") then charFromPart(tgt) else nil)
	if not char then
		return nil
	end
	local hl = Instance.new("Highlight")
	hl.Adornee = char
	hl.FillColor = accentColor(0)
	hl.OutlineColor = accentColor(0.3)
	hl.FillTransparency = 0.72
	hl.OutlineTransparency = 0
	hl.Parent = tgt
	local born = os.clock()
	local conn
	conn = runService.RenderStepped:Connect(function()
		if not hl.Parent then
			conn:Disconnect()
			return nil
		end
		local t = os.clock() - born
		hl.FillColor = accentColor(t * 0.55)
		hl.OutlineColor = accentColor(t * 0.55 + 0.22)
	end)
	hl.Destroying:Once(function()
		return conn:Disconnect()
	end)
	tweenService:Create(hl, TweenInfo.new(5), {
		FillTransparency = 1,
		OutlineTransparency = 1,
	}):Play()
	debrisService:AddItem(hl, 5)
end
local function fling(tgt, dur)
	if not tgt then
		return false
	end
	for _, q in queue do
		if q.tgt == tgt then
			return false
		end
	end
	if tgt == sessionModel or tgt == localPlayer.Character then
		return false
	end
	local _tgt = tgt
	if typeof(_tgt) == "Instance" then
		if localPlayer.Character and tgt:IsDescendantOf(localPlayer.Character) then
			return false
		end
		if sessionModel and tgt:IsDescendantOf(sessionModel) then
			return false
		end
	end
	local _tgt_1 = tgt
	if typeof(_tgt_1) == "Instance" then
		local _tgt_2 = tgt
		if cooldowns[_tgt_2] ~= nil then
			return nil
		end
		local _tgt_3 = tgt
		cooldowns[_tgt_3] = true
		task.delay(1, function()
			local _tgt_4 = tgt
			cooldowns[_tgt_4] = nil
		end)
	end
	local _arg0_1 = {
		tgt = tgt,
		dur = dur or custom.flingDuration,
	}
	table.insert(queue, _arg0_1)
	busy = true
	if not sessionModel then
		spawnSessionModel()
	end
	maskChar(localPlayer.Character)
	doHighlight(tgt)
	return true
end
function charFromPart(part)
	local _m = part
	if _m ~= nil then
		_m = _m.Parent
	end
	local m = _m
	if not m then
		return nil
	end
	if m:IsA("Accessory") then
		m = m.Parent
	end
	if m and m:FindFirstChildOfClass("Humanoid") then
		return m
	end
end
local function clearTouchFlingParts()
	for _, c in touchFlingConnections do
		safeDisconnect(c)
	end
	table.clear(touchFlingConnections)
end
local function onTouchFlingHit(hit)
	if not touchFlingEnabled or not activationAllowed() or scriptPaused then
		return nil
	end
	local char = if hit then charFromPart(hit) else nil
	if not char or char == localPlayer.Character or char == sessionModel then
		return nil
	end
	fling(char)
end
local function bindTouchFlingParts()
	clearTouchFlingParts()
	local char = localPlayer.Character
	if not char then
		return nil
	end
	for _, obj in char:GetDescendants() do
		if obj:IsA("BasePart") then
			local c = obj.Touched:Connect(onTouchFlingHit)
			table.insert(touchFlingConnections, c)
		end
	end
end
local function setTouchFlingEnabled(enabled)
	touchFlingEnabled = enabled == true
	if touchFlingEnabled then
		bindTouchFlingParts()
	else
		clearTouchFlingParts()
	end
	showNotice(if touchFlingEnabled then "Touch Fling Enabled!" else "Touch Fling Disabled!")
end
local function toggleTouchFling()
	setTouchFlingEnabled(not touchFlingEnabled)
end
local function rayTarget(pos)
	cam = world.CurrentCamera
	if not cam then
		return nil
	end
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Exclude
	local ignore = {}
	if localPlayer.Character then
		local _character = localPlayer.Character
		table.insert(ignore, _character)
	end
	if sessionModel then
		local _sessionModel = sessionModel
		table.insert(ignore, _sessionModel)
	end
	rp.FilterDescendantsInstances = ignore
	rp.IgnoreWater = true
	local ok, screenRay = pcall(function()
		return cam:ScreenPointToRay(pos.X, pos.Y)
	end)
	local ray = if ok and screenRay then screenRay else cam:ViewportPointToRay(pos.X, pos.Y)
	local hit = world:Raycast(ray.Origin, ray.Direction * 1000, rp)
	return if hit and charFromPart(hit.Instance) then hit.Instance else nil
end
local function pointerRay(pos)
	cam = world.CurrentCamera
	if not cam then
		return nil
	end
	local ok, ray = pcall(function()
		return cam:ScreenPointToRay(pos.X, pos.Y)
	end)
	return if ok and ray then ray else cam:ViewportPointToRay(pos.X, pos.Y)
end
local function freeFlingAimPosition(pos)
	local offsetX = tonumber(config.freeFlingCursorOffsetX) or 0
	local offsetY = tonumber(config.freeFlingCursorOffsetY) or -58
	return Vector3.new(pos.X + offsetX, pos.Y + offsetY, 0)
end
local function currentPointerPosition()
	local loc = inputService:GetMouseLocation()
	return Vector3.new(loc.X, loc.Y, 0)
end
local function freeFlingCFrame(pos)
	pos = freeFlingAimPosition(pos)
	local ray = pointerRay(pos)
	if not ray then
		return nil
	end
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Exclude
	local ignore = {}
	if localPlayer.Character then
		table.insert(ignore, localPlayer.Character)
	end
	if sessionModel then
		table.insert(ignore, sessionModel)
	end
	rp.FilterDescendantsInstances = ignore
	rp.IgnoreWater = true
	local hit = world:Raycast(ray.Origin, ray.Direction * 1000, rp)
	local _, sessionRoot = charParts(sessionModel)
	local _, localRoot = charParts(localPlayer.Character)
	local refRoot = sessionRoot or localRoot
	local depth = if refRoot then math.clamp((refRoot.Position - ray.Origin):Dot(ray.Direction), 12, 500) else 90
	local point = if hit then hit.Position else ray.Origin + ray.Direction * depth
	return CFrame.new(point)
end
local function beginFreeFling(pos)
	if not freeFlingEnabled or not activationAllowed() or scriptPaused then
		return nil
	end
	local cf = freeFlingCFrame(pos)
	if not cf then
		return nil
	end
	freeFlingHeld = true
	if freeFlingItem then
		freeFlingItem.tgt = cf
		freeFlingItem["end"] = os.clock() + 3600
		return nil
	end
	freeFlingItem = {
		tgt = cf,
		dur = 3600,
		start = os.clock(),
		["end"] = os.clock() + 3600,
	}
	table.insert(queue, freeFlingItem)
	busy = true
	if not sessionModel then
		spawnSessionModel()
	end
	maskChar(localPlayer.Character)
end
local function updateFreeFling(pos)
	if not freeFlingHeld or not freeFlingItem then
		return nil
	end
	local cf = freeFlingCFrame(pos)
	if cf then
		freeFlingItem.tgt = cf
		freeFlingItem["end"] = os.clock() + 3600
	end
end
local function endFreeFling()
	freeFlingHeld = false
	if freeFlingItem then
		freeFlingItem["end"] = 0
		freeFlingItem = nil
	end
end
local function setFreeFlingEnabled(enabled)
	freeFlingEnabled = enabled == true
	if not freeFlingEnabled then
		endFreeFling()
	end
	showNotice(if freeFlingEnabled then "Free Fling Enabled!" else "Free Fling Disabled!")
	updateClickShield()
end
local function toggleFreeFling()
	setFreeFlingEnabled(not freeFlingEnabled)
end
local function clicked(pos, touchFirst)
	if touchFirst then
		local t = rayTarget(pos)
		if t then
			return t
		end
	end
	return if mouse.Target and charFromPart(mouse.Target) then mouse.Target else rayTarget(pos)
end
local function tryFlingTap(pos, touchFirst)
	local t = clicked(pos, touchFirst)
	if t then
		fling(t)
	end
end
local function pointerPosition(inp)
	if inp.UserInputType == Enum.UserInputType.Keyboard then
		return Vector3.new(mouse.X, mouse.Y, 0)
	end
	return inp.Position
end
local function calcMove()
	local v = Vector3.zero
	if keys.w then
		local _v = v
		local _vector3_1 = Vector3.new(0, 0, -1)
		v = _v + _vector3_1
	end
	if keys.s then
		local _v = v
		local _vector3_1 = Vector3.new(0, 0, 1)
		v = _v + _vector3_1
	end
	if keys.a then
		local _v = v
		local _vector3_1 = Vector3.new(-1, 0, 0)
		v = _v + _vector3_1
	end
	if keys.d then
		local _v = v
		local _vector3_1 = Vector3.new(1, 0, 0)
		v = _v + _vector3_1
	end
	if keys.stick.Magnitude > 0.2 then
		local _v = v
		local _vector3_1 = Vector3.new(keys.stick.X, 0, keys.stick.Y)
		v = _v + _vector3_1
	end
	if v.Magnitude > 1 then
		v = v.Unit
	end
	keys.move = v
	keys.wantJump = keys.jump or keys.padJump
end
local function clearMove()
	keys.w = false
	keys.a = false
	keys.s = false
	keys.d = false
	keys.jump = false
	keys.stick = Vector2.zero
	keys.padJump = false
	keys.move = Vector3.zero
	keys.wantJump = false
end

local function bindConfigKeys(name)
	return name .. "BindKind", name .. "BindCode"
end
local function inputBindKey(kind, code)
	return kind .. ":" .. code
end
local function inputToBind(inp)
	if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode ~= Enum.KeyCode.Unknown then
		return "KeyCode", inp.KeyCode.Name
	end
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 or inp.UserInputType == Enum.UserInputType.MouseButton3 then
		return "UserInputType", inp.UserInputType.Name
	end
end
local function setHeldInput(inp, down)
	local kind, code = inputToBind(inp)
	if not kind then
		return nil
	end
	heldInputs[inputBindKey(kind, code)] = down or nil
end
local function getBind(name)
	local kindKey, codeKey = bindConfigKeys(name)
	return config[kindKey], config[codeKey]
end
local function bindText(name)
	local kind, code = getBind(name)
	if kind == "UserInputType" then
		if code == "MouseButton1" then
			return "Left Mouse"
		end
		if code == "MouseButton2" then
			return "Right Mouse"
		end
		if code == "MouseButton3" then
			return "Middle Mouse"
		end
	end
	if code == "LeftControl" or code == "RightControl" then
		return "Ctrl"
	end
	return code or "Unbound"
end
local function inputMatchesBind(inp, name)
	local kind, code = getBind(name)
	local inputKind, inputCode = inputToBind(inp)
	if not inputKind then
		return false
	end
	if kind == "KeyCode" and (code == "LeftControl" or code == "RightControl") then
		return inputKind == "KeyCode" and (inputCode == "LeftControl" or inputCode == "RightControl")
	end
	return inputKind == kind and inputCode == code
end
local function beginBindCapture(name, button)
	if bindCapture and bindCapture.button and bindCapture.button.Parent then
		bindCapture.button.Text = bindText(bindCapture.name)
	end
	bindCapture = {
		name = name,
		button = button,
	}
	button.Text = "Click Any Key To Bind"
end
local function consumeBindCapture(inp)
	if not bindCapture then
		return false
	end
	local kind, code = inputToBind(inp)
	if not kind then
		return true
	end
	local kindKey, codeKey = bindConfigKeys(bindCapture.name)
	config[kindKey] = kind
	config[codeKey] = code
	if bindCapture.button and bindCapture.button.Parent then
		bindCapture.button.Text = bindText(bindCapture.name)
	end
	bindCapture = nil
	return true
end
local function bindDown(name)
	local kind, code = getBind(name)
	if kind == "KeyCode" and (code == "LeftControl" or code == "RightControl") then
		return inputService:IsKeyDown(Enum.KeyCode.LeftControl) or inputService:IsKeyDown(Enum.KeyCode.RightControl)
	end
	if not kind or not code then
		return false
	end
	return heldInputs[inputBindKey(kind, code)] == true
end
local function currentActivationMode()
	return if config.activationMode == "tool" then "tool" else "keybind"
end
activationAllowed = function()
	return startupReady and (currentActivationMode() ~= "tool" or toolEquipped)
end
showNotice = function(text)
	noticeToken += 1
	local token = noticeToken
	if noticeGui then
		noticeGui:Destroy()
	end
	local gui = Instance.new("ScreenGui")
	gui.Name = "swiftzCFNotice"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 2147483647
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = uiParent()
	noticeGui = gui
	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.fromScale(0.5, 0.5)
	frame.Size = UDim2.new(0, 300, 0, 52)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = Color3.fromRGB(200, 200, 210)
	stroke.Transparency = 1
	stroke.Parent = frame
	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextTransparency = 1
	label.TextSize = 15
	label.Font = Enum.Font.Code
	label.Parent = frame
	tweenService:Create(frame, TweenInfo.new(0.18), { BackgroundTransparency = 0 }):Play()
	tweenService:Create(stroke, TweenInfo.new(0.18), { Transparency = 0.18 }):Play()
	tweenService:Create(label, TweenInfo.new(0.18), { TextTransparency = 0 }):Play()
	task.delay(1.25, function()
		if token ~= noticeToken or noticeGui ~= gui then
			return nil
		end
		tweenService:Create(frame, TweenInfo.new(0.22), { BackgroundTransparency = 1 }):Play()
		tweenService:Create(stroke, TweenInfo.new(0.22), { Transparency = 1 }):Play()
		tweenService:Create(label, TweenInfo.new(0.22), { TextTransparency = 1 }):Play()
		task.delay(0.25, function()
			if token == noticeToken and noticeGui == gui then
				gui:Destroy()
				noticeGui = nil
			end
		end)
	end)
end
local function primaryDown()
	return bindDown("primary")
end
local function flingHoldReady()
	if currentActivationMode() == "tool" then
		return toolEquipped
	end
	return primaryDown()
end
local function ctrlDown()
	return primaryDown()
end
local function clickGuardShouldSink()
	if not startupReady or not activationAllowed() or controlVisible or settingsVisible or bindCapture ~= nil or inputService:GetFocusedTextBox() then
		return false
	end
	return flingHoldReady()
end
local function bindClickGuard()
	if clickGuardBound then
		return nil
	end
	contextService:BindActionAtPriority("swiftzCFClickGuard", function()
		if clickGuardShouldSink() then
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, 3000, Enum.UserInputType.MouseButton1)
	clickGuardBound = true
end
local function ensureClickShield()
	if clickShieldGui then
		bindClickGuard()
		return nil
	end
	local gui = Instance.new("ScreenGui")
	gui.Name = "swiftzCFClickPulse"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 2147483644
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = uiParent()
	clickShieldGui = gui
	bindClickGuard()
end
local function clickShieldActive()
	return clickGuardShouldSink()
end
updateClickShield = function()
	if not startupReady then
		return nil
	end
	ensureClickShield()
end
local function showClickPulse(pos)
	ensureClickShield()
	if not clickShieldGui then
		return nil
	end
	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.new(0, pos.X, 0, pos.Y)
	frame.Size = UDim2.new(0, 42, 0, 32)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BackgroundTransparency = 0.08
	frame.BorderSizePixel = 0
	frame.Parent = clickShieldGui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 7)
	corner.Parent = frame
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = Color3.fromRGB(200, 200, 210)
	stroke.Transparency = 0.18
	stroke.Parent = frame
	tweenService:Create(frame, TweenInfo.new(0.16), { BackgroundTransparency = 1, Size = UDim2.new(0, 54, 0, 40) }):Play()
	tweenService:Create(stroke, TweenInfo.new(0.16), { Transparency = 1 }):Play()
	task.delay(0.18, function()
		if frame.Parent then
			frame:Destroy()
		end
	end)
end

-- Control & Settings UI Functions
local function toggleControlUI()
	if not controlGui then
		controlGui = Instance.new("ScreenGui")
		controlGui.Name = "swiftzCFControl"
		controlGui.IgnoreGuiInset = true
		controlGui.ResetOnSpawn = false
		controlGui.DisplayOrder = 2147483645
		controlGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		controlGui.Parent = uiParent()
		controlGui.Enabled = false

		local main = Instance.new("Frame")
		main.Size = UDim2.new(0, 200, 0, 120)
		main.Position = UDim2.new(1, -210, 0, 10)
		main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		main.BackgroundTransparency = 1
		main.BorderSizePixel = 0
		main.Parent = controlGui

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = main

		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 1
		stroke.Color = Color3.fromRGB(200, 200, 210)
		stroke.Parent = main

		local killBtn = Instance.new("TextButton")
		killBtn.Size = UDim2.new(0.9, 0, 0, 40)
		killBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
		killBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		killBtn.BackgroundTransparency = 0.2
		killBtn.Text = "Kill Script"
		killBtn.TextColor3 = Color3.new(1, 1, 1)
		killBtn.TextSize = 14
		killBtn.Font = Enum.Font.Code
		killBtn.Parent = main

		local kCorner = Instance.new("UICorner")
		kCorner.CornerRadius = UDim.new(0, 5)
		kCorner.Parent = killBtn

		killBtn.MouseEnter:Connect(function()
			tweenService:Create(killBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
		end)
		killBtn.MouseLeave:Connect(function()
			tweenService:Create(killBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
		end)
		killBtn.MouseButton1Click:Connect(function()
			stop()
		end)

		local pauseBtn = Instance.new("TextButton")
		pauseBtn.Size = UDim2.new(0.9, 0, 0, 40)
		pauseBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
		pauseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		pauseBtn.BackgroundTransparency = 0.2
		pauseBtn.Text = "Pause Script"
		pauseBtn.TextColor3 = Color3.new(1, 1, 1)
		pauseBtn.TextSize = 14
		pauseBtn.Font = Enum.Font.Code
		pauseBtn.Parent = main

		local pCorner = Instance.new("UICorner")
		pCorner.CornerRadius = UDim.new(0, 5)
		pCorner.Parent = pauseBtn

		pauseBtn.MouseEnter:Connect(function()
			tweenService:Create(pauseBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
		end)
		pauseBtn.MouseLeave:Connect(function()
			tweenService:Create(pauseBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
		end)
		pauseBtn.MouseButton1Click:Connect(function()
			scriptPaused = not scriptPaused
			pauseBtn.Text = scriptPaused and "Resume Script" or "Pause Script"
			runtime.paused = scriptPaused
		end)

		controlFadeIn = function()
			if controlVisible then return end
			controlVisible = true
			controlGui.Enabled = true
			tweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
			tweenService:Create(killBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
			tweenService:Create(pauseBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
		end

		controlFadeOut = function()
			if not controlVisible then return end
			controlVisible = false
			tweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			tweenService:Create(killBtn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			tweenService:Create(pauseBtn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			task.delay(0.22, function()
				if controlGui and not controlVisible then
					controlGui.Enabled = false
				end
			end)
		end
	end
	if controlVisible then controlFadeOut() else controlFadeIn() end
end

local powerLevels = {"Weak", "Mild", "Strong", "SUPER strong", "SUPER DUPER Strong", "Absolute Infinity ∞", "Custom"}

local function toggleSettingsUI()
	if not settingsGui then
		settingsGui = Instance.new("ScreenGui")
		settingsGui.Name = "swiftzCFSettings"
		settingsGui.IgnoreGuiInset = true
		settingsGui.ResetOnSpawn = false
		settingsGui.DisplayOrder = 2147483645
		settingsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		settingsGui.Parent = uiParent()
		settingsGui.Enabled = false

		local main = Instance.new("Frame")
		main.Size = UDim2.new(0, 280, 0, 420)
		main.Position = UDim2.new(0.5, -140, 0.5, -210)
		main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		main.BackgroundTransparency = 1
		main.BorderSizePixel = 0
		main.Parent = settingsGui

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = main

		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 1
		stroke.Color = Color3.fromRGB(200, 200, 210)
		stroke.Parent = main

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 30)
		title.BackgroundTransparency = 1
		title.Text = "Swiftz CF Settings"
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextSize = 16
		title.Font = Enum.Font.Code
		title.Parent = main
		
		local scroll = Instance.new("ScrollingFrame")
		scroll.Position = UDim2.new(0, 0, 0, 34)
		scroll.Size = UDim2.new(1, 0, 1, -40)
		scroll.BackgroundTransparency = 1
		scroll.BorderSizePixel = 0
		scroll.ScrollBarThickness = 4
		scroll.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 210)
		scroll.CanvasSize = UDim2.new(0, 0, 0, 620)
		scroll.Parent = main

		local powerLabel = Instance.new("TextLabel")
		powerLabel.Size = UDim2.new(1, -20, 0, 20)
		powerLabel.Position = UDim2.new(0, 10, 0, 6)
		powerLabel.BackgroundTransparency = 1
		powerLabel.Text = "Power Level"
		powerLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
		powerLabel.TextSize = 14
		powerLabel.Font = Enum.Font.Code
		powerLabel.TextXAlignment = Enum.TextXAlignment.Left
		powerLabel.Parent = scroll
		local customPanel
		local customArrow

		for i, power in ipairs(powerLevels) do
			local isCustom = power == "Custom"
			local btn = Instance.new("TextButton")
			btn.Size = if isCustom then UDim2.new(0.74, 0, 0, 30) else UDim2.new(0.9, 0, 0, 30)
			btn.Position = UDim2.new(0.05, 0, 0, 31 + (i-1)*35)
			btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			btn.BackgroundTransparency = 0.2
			btn.Text = power
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.TextSize = 12
			btn.Font = Enum.Font.Code
			btn.Parent = scroll

			local bCorner = Instance.new("UICorner")
			bCorner.CornerRadius = UDim.new(0, 5)
			bCorner.Parent = btn

			local function updateBtn()
				btn.BackgroundColor3 = config.power == power and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
				btn.TextColor3 = config.power == power and Color3.fromRGB(220, 220, 225) or Color3.new(1, 1, 1)
			end
			updateBtn()

			btn.MouseButton1Click:Connect(function()
				config.power = power
				for _, child in scroll:GetChildren() do
					if child:IsA("TextButton") and table.find(powerLevels, child.Text) then
						child.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						child.TextColor3 = Color3.new(1, 1, 1)
					end
				end
				updateBtn()
				if customPanel then
					customPanel.Visible = power == "Custom"
					if customArrow then
						customArrow.Text = if customPanel.Visible then "^" else "v"
					end
				end
			end)

			btn.MouseEnter:Connect(function()
				if config.power ~= power then
					tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
				end
			end)
			btn.MouseLeave:Connect(function()
				if config.power ~= power then
					tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
				end
			end)
			if isCustom then
				customArrow = Instance.new("TextButton")
				customArrow.Size = UDim2.new(0.14, 0, 0, 30)
				customArrow.Position = UDim2.new(0.81, 0, 0, 31 + (i-1)*35)
				customArrow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				customArrow.BackgroundTransparency = 0.2
				customArrow.Text = "v"
				customArrow.TextColor3 = Color3.new(1, 1, 1)
				customArrow.TextSize = 14
				customArrow.Font = Enum.Font.Code
				customArrow.Parent = scroll
				local arrowCorner = Instance.new("UICorner")
				arrowCorner.CornerRadius = UDim.new(0, 5)
				arrowCorner.Parent = customArrow
				customArrow.MouseButton1Click:Connect(function()
					if customPanel then
						customPanel.Visible = not customPanel.Visible
						customArrow.Text = if customPanel.Visible then "^" else "v"
					end
				end)
			end
		end

		local customPanelY = 31 + #powerLevels*35 + 2
		customPanel = Instance.new("Frame")
		customPanel.Size = UDim2.new(0.9, 0, 0, 96)
		customPanel.Position = UDim2.new(0.05, 0, 0, customPanelY)
		customPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		customPanel.BackgroundTransparency = 0.15
		customPanel.BorderSizePixel = 0
		customPanel.Visible = config.power == "Custom"
		customPanel.Parent = scroll
		if customArrow then
			customArrow.Text = if customPanel.Visible then "^" else "v"
		end
		local customCorner = Instance.new("UICorner")
		customCorner.CornerRadius = UDim.new(0, 6)
		customCorner.Parent = customPanel
		local customStroke = Instance.new("UIStroke")
		customStroke.Thickness = 1
		customStroke.Color = Color3.fromRGB(90, 90, 96)
		customStroke.Transparency = 0.25
		customStroke.Parent = customPanel
		local function addCustomInput(labelText, configKey, y)
			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(0.52, -12, 0, 24)
			label.Position = UDim2.new(0, 10, 0, y)
			label.BackgroundTransparency = 1
			label.Text = labelText
			label.TextColor3 = Color3.fromRGB(200, 200, 210)
			label.TextSize = 12
			label.Font = Enum.Font.Code
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Parent = customPanel
			local box = Instance.new("TextBox")
			box.Size = UDim2.new(0.42, 0, 0, 24)
			box.Position = UDim2.new(0.55, 0, 0, y)
			box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			box.BackgroundTransparency = 0.1
			box.ClearTextOnFocus = false
			box.Text = tostring(config[configKey])
			box.PlaceholderText = "1"
			box.TextColor3 = Color3.new(1, 1, 1)
			box.TextSize = 12
			box.Font = Enum.Font.Code
			box.Parent = customPanel
			local boxCorner = Instance.new("UICorner")
			boxCorner.CornerRadius = UDim.new(0, 5)
			boxCorner.Parent = box
			box.FocusLost:Connect(function()
				local value = tonumber(box.Text)
				if not value then
					value = config[configKey] or 1
				end
				value = math.clamp(value, 0, 250)
				config[configKey] = value
				box.Text = tostring(value)
				powerSettings.Custom.velocityMult = tonumber(config.customVelocityMult) or 1
				powerSettings.Custom.angularMult = tonumber(config.customAngularMult) or 1
			end)
		end
		addCustomInput("Velocity Mult", "customVelocityMult", 14)
		addCustomInput("Angular Mult", "customAngularMult", 54)

		local otherY = customPanelY + 112
		local introBtn = Instance.new("TextButton")
		introBtn.Size = UDim2.new(0.9, 0, 0, 30)
		introBtn.Position = UDim2.new(0.05, 0, 0, otherY)
		introBtn.BackgroundColor3 = config.intro and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
		introBtn.Text = "Intro: " .. tostring(config.intro)
		introBtn.TextColor3 = Color3.new(1, 1, 1)
		introBtn.TextSize = 12
		introBtn.Font = Enum.Font.Code
		introBtn.Parent = scroll

		local iCorner = Instance.new("UICorner")
		iCorner.CornerRadius = UDim.new(0, 5)
		iCorner.Parent = introBtn

		introBtn.MouseButton1Click:Connect(function()
			config.intro = not config.intro
			introBtn.Text = "Intro: " .. tostring(config.intro)
			introBtn.BackgroundColor3 = config.intro and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
		end)

		local methodBtn = Instance.new("TextButton")
		methodBtn.Size = UDim2.new(0.9, 0, 0, 30)
		methodBtn.Position = UDim2.new(0.05, 0, 0, otherY+40)
		methodBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		methodBtn.Text = "Method: " .. config.method
		methodBtn.TextColor3 = Color3.new(1, 1, 1)
		methodBtn.TextSize = 12
		methodBtn.Font = Enum.Font.Code
		methodBtn.Parent = scroll

		local mCorner = Instance.new("UICorner")
		mCorner.CornerRadius = UDim.new(0, 5)
		mCorner.Parent = methodBtn

		methodBtn.MouseButton1Click:Connect(function()
			config.method = config.method == "weld" and "tp" or "weld"
			method = config.method
			methodBtn.Text = "Method: " .. config.method
		end)

		local hrpsBtn = Instance.new("TextButton")
		hrpsBtn.Size = UDim2.new(0.9, 0, 0, 30)
		hrpsBtn.Position = UDim2.new(0.05, 0, 0, otherY+80)
		hrpsBtn.BackgroundColor3 = config.showHRPs and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
		hrpsBtn.Text = "Show HRPs: " .. tostring(config.showHRPs)
		hrpsBtn.TextColor3 = Color3.new(1, 1, 1)
		hrpsBtn.TextSize = 12
		hrpsBtn.Font = Enum.Font.Code
		hrpsBtn.Parent = scroll

		local hCorner = Instance.new("UICorner")
		hCorner.CornerRadius = UDim.new(0, 5)
		hCorner.Parent = hrpsBtn

		hrpsBtn.MouseButton1Click:Connect(function()
			config.showHRPs = not config.showHRPs
			hrpsBtn.Text = "Show HRPs: " .. tostring(config.showHRPs)
			hrpsBtn.BackgroundColor3 = config.showHRPs and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
		end)
		
		local function addBindRow(labelText, bindName, y)
			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, -20, 0, 20)
			label.Position = UDim2.new(0, 10, 0, y)
			label.BackgroundTransparency = 1
			label.Text = labelText
			label.TextColor3 = Color3.fromRGB(200, 200, 210)
			label.TextSize = 13
			label.Font = Enum.Font.Code
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Parent = scroll
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(0.9, 0, 0, 30)
			btn.Position = UDim2.new(0.05, 0, 0, y + 22)
			btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			btn.BackgroundTransparency = 0.2
			btn.Text = bindText(bindName)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.TextSize = 12
			btn.Font = Enum.Font.Code
			btn.Parent = scroll
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 5)
			corner.Parent = btn
			btn.MouseButton1Click:Connect(function()
				beginBindCapture(bindName, btn)
			end)
			btn.MouseEnter:Connect(function()
				if not (bindCapture and bindCapture.button == btn) then
					tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
				end
			end)
			btn.MouseLeave:Connect(function()
				if not (bindCapture and bindCapture.button == btn) then
					tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
				end
			end)
		end
		local bindY = otherY + 125
		addBindRow("Primary Keybind", "primary", bindY)
		addBindRow("Secondary Keybind", "secondary", bindY + 58)
		addBindRow("Touch Fling Keybind", "touchFling", bindY + 116)
		addBindRow("Free Fling Keybind", "freeFling", bindY + 174)
		scroll.CanvasSize = UDim2.new(0, 0, 0, bindY + 230)

		settingsFadeIn = function()
			if settingsVisible then return end
			settingsVisible = true
			settingsGui.Enabled = true
			tweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
		end

		settingsFadeOut = function()
			if not settingsVisible then return end
			settingsVisible = false
			tweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			task.delay(0.22, function()
				if settingsGui and not settingsVisible then
					settingsGui.Enabled = false
				end
			end)
		end
	end
	if settingsVisible then settingsFadeOut() else settingsFadeIn() end
end

local function createActivationTool()
	if activationTool then
		activationTool:Destroy()
	end
	local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)
	if not backpack then
		showNotice("Backpack Missing")
		return nil
	end
	local tool = Instance.new("Tool")
	tool.Name = "Swiftz CF"
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = backpack
	activationTool = tool
	track(tool.Equipped:Connect(function()
		toolEquipped = true
		updateClickShield()
	end))
	track(tool.Unequipped:Connect(function()
		toolEquipped = false
		if controlVisible and controlFadeOut then
			controlFadeOut()
		end
		if settingsVisible and settingsFadeOut then
			settingsFadeOut()
		end
		updateClickShield()
	end))
end
local function finishStartup(mode)
	if startupReady then
		return nil
	end
	config.activationMode = mode
	startupReady = true
	if mode == "tool" then
		createActivationTool()
	end
	ensureClickShield()
	if startupGui then
		local gui = startupGui
		startupGui = nil
		for _, obj in gui:GetDescendants() do
			if obj:IsA("Frame") or obj:IsA("TextButton") then
				tweenService:Create(obj, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
			elseif obj:IsA("TextLabel") then
				tweenService:Create(obj, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
			elseif obj:IsA("UIStroke") then
				tweenService:Create(obj, TweenInfo.new(0.2), { Transparency = 1 }):Play()
			end
		end
		task.delay(0.24, function()
			if gui.Parent then
				gui:Destroy()
			end
		end)
	end
	if config.intro ~= false then
		playIntro()
	end
	updateWatermark()
end
local function showStartupSelector()
	local gui = Instance.new("ScreenGui")
	gui.Name = "swiftzCFStartup"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 2147483647
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = uiParent()
	startupGui = gui
	local main = Instance.new("Frame")
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.Position = UDim2.fromScale(0.5, 0.5)
	main.Size = UDim2.new(0, 330, 0, 160)
	main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	main.BackgroundTransparency = 1
	main.BorderSizePixel = 0
	main.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = main
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = Color3.fromRGB(200, 200, 210)
	stroke.Transparency = 1
	stroke.Parent = main
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -20, 0, 34)
	title.Position = UDim2.new(0, 10, 0, 12)
	title.BackgroundTransparency = 1
	title.Text = "Choose Fling Method"
	title.TextColor3 = Color3.new(1, 1, 1)
	title.TextTransparency = 1
	title.TextSize = 17
	title.Font = Enum.Font.Code
	title.Parent = main
	local function makeChoiceButton(text, y, mode)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0.88, 0, 0, 38)
		btn.Position = UDim2.new(0.06, 0, 0, y)
		btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		btn.BackgroundTransparency = 1
		btn.Text = text
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.TextTransparency = 1
		btn.TextSize = 13
		btn.Font = Enum.Font.Code
		btn.Parent = main
		local btnCorner = Instance.new("UICorner")
		btnCorner.CornerRadius = UDim.new(0, 5)
		btnCorner.Parent = btn
		btn.MouseEnter:Connect(function()
			tweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(60, 60, 60) }):Play()
		end)
		btn.MouseLeave:Connect(function()
			tweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) }):Play()
		end)
		btn.MouseButton1Click:Connect(function()
			finishStartup(mode)
		end)
		return btn
	end
	local toolBtn = makeChoiceButton("Tool", 58, "tool")
	local keyBtn = makeChoiceButton("Keybind + Keybind  (Ctrl + Click)", 104, "keybind")
	tweenService:Create(main, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
	tweenService:Create(stroke, TweenInfo.new(0.2), { Transparency = 0.18 }):Play()
	tweenService:Create(title, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
	tweenService:Create(toolBtn, TweenInfo.new(0.2), { BackgroundTransparency = 0.2, TextTransparency = 0 }):Play()
	tweenService:Create(keyBtn, TweenInfo.new(0.2), { BackgroundTransparency = 0.2, TextTransparency = 0 }):Play()
end

-- input
track(inputService.InputBegan:Connect(function(inp, gp)
	setHeldInput(inp, true)
	if consumeBindCapture(inp) then
		return nil
	end
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
		lastInput = inp
		lastWasGui = gp
		lastTapTime = os.clock()
		lastTapPos = pointerPosition(inp)
	end
	if guiService.MenuIsOpen or inputService:GetFocusedTextBox() then
		return nil
	end
	if not startupReady then
		return nil
	end
	if inp.UserInputType == Enum.UserInputType.Keyboard then
		if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.Up then
			keys.w = true
		end
		if inp.KeyCode == Enum.KeyCode.S or inp.KeyCode == Enum.KeyCode.Down then
			keys.s = true
		end
		if inp.KeyCode == Enum.KeyCode.A then
			keys.a = true
		end
		if inp.KeyCode == Enum.KeyCode.D then
			keys.d = true
		end
		if inp.KeyCode == Enum.KeyCode.Space then
			keys.jump = true
		end
	end
	if inp.KeyCode == Enum.KeyCode.ButtonA then
		keys.padJump = true
	end
	if not activationAllowed() then
		return nil
	end
	if inputMatchesBind(inp, "touchFling") then
		toggleTouchFling()
		return nil
	end
	if inputMatchesBind(inp, "freeFling") then
		toggleFreeFling()
		return nil
	end
	if inp.KeyCode == Enum.KeyCode.LeftBracket then
		toggleSettingsUI()
	end
	if inp.KeyCode == Enum.KeyCode.RightBracket then
		toggleControlUI()
	end
	local secondaryDown = inputMatchesBind(inp, "secondary")
	local blockedByGui = gp and not clickGuardShouldSink()
	if secondaryDown and not freeFlingEnabled then
		if flingHoldReady() and not blockedByGui then
			showClickPulse(pointerPosition(inp))
		end
	end
	if secondaryDown and freeFlingEnabled and flingHoldReady() and not blockedByGui then
		beginFreeFling(pointerPosition(inp))
	end
end))
track(inputService.InputChanged:Connect(function(inp)
	if freeFlingHeld and not flingHoldReady() then
		endFreeFling()
	end
	if freeFlingHeld and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch or inputMatchesBind(inp, "secondary")) then
		updateFreeFling(pointerPosition(inp))
	end
	if guiService.MenuIsOpen or inputService:GetFocusedTextBox() then
		return nil
	end
	if inp.KeyCode == Enum.KeyCode.Thumbstick1 then
		keys.stick = Vector2.new(inp.Position.X, -inp.Position.Y)
	end
end))
track(inputService.InputEnded:Connect(function(inp)
	setHeldInput(inp, false)
	if freeFlingHeld and not flingHoldReady() then
		endFreeFling()
	end
	if lastInput and lastInput == inp and not guiService.MenuIsOpen and not inputService:GetFocusedTextBox() and startupReady and activationAllowed() then
		local blockedByGui = lastWasGui and not clickShieldActive()
		local secondary = inputMatchesBind(inp, "secondary")
		if secondary and freeFlingHeld then
			endFreeFling()
			return nil
		end
		local toolClick = currentActivationMode() == "tool" and toolEquipped and secondary
		local keybindClick = currentActivationMode() == "keybind" and secondary and primaryDown()
		local click = inp.UserInputType == Enum.UserInputType.MouseButton1 and not blockedByGui and (toolClick or keybindClick)
		local _condition_1 = inp.UserInputType == Enum.UserInputType.Touch and not lastWasGui and os.clock() - lastTapTime < 0.3
		if _condition_1 then
			local _position = inp.Position
			local _lastTapPos = lastTapPos
			_condition_1 = (_position - _lastTapPos).Magnitude < 10
		end
		local tap = _condition_1 and (currentActivationMode() == "tool" or primaryDown())
		if click or tap then
			tryFlingTap(pointerPosition(inp), inp.UserInputType == Enum.UserInputType.Touch)
		end
	end
	if guiService.MenuIsOpen or inputService:GetFocusedTextBox() then
		return nil
	end
	if inp.UserInputType == Enum.UserInputType.Keyboard then
		if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.Up then
			keys.w = false
		end
		if inp.KeyCode == Enum.KeyCode.S or inp.KeyCode == Enum.KeyCode.Down then
			keys.s = false
		end
		if inp.KeyCode == Enum.KeyCode.A then
			keys.a = false
		end
		if inp.KeyCode == Enum.KeyCode.D then
			keys.d = false
		end
		if inp.KeyCode == Enum.KeyCode.Space then
			keys.jump = false
		end
	end
	if inp.KeyCode == Enum.KeyCode.ButtonA then
		keys.padJump = false
	end
	if inp.KeyCode == Enum.KeyCode.Thumbstick1 then
		keys.stick = Vector2.zero
	end
end))
track(inputService.TouchTap:Connect(function(touchPositions, gp)
	if gp or guiService.MenuIsOpen or inputService:GetFocusedTextBox() or not startupReady or not activationAllowed() or freeFlingEnabled then
		return nil
	end
	local pos = touchPositions[1]
	if not pos then
		return nil
	end
	showClickPulse(Vector3.new(pos.X, pos.Y, 0))
	tryFlingTap(Vector3.new(pos.X, pos.Y, 0), true)
end))
-- render
runService:BindToRenderStep("swiftzCFCameraLock", Enum.RenderPriority.Camera.Value - 1, function()
	if sessionModel then
		lockCameraToSession()
	end
end)
runService:BindToRenderStep("swiftzCF", Enum.RenderPriority.Last.Value, function()
	updateClickShield()
	if sessionModel then
		lockCameraToSession()
	end
	if freeFlingHeld then
		if flingHoldReady() then
			updateFreeFling(currentPointerPosition())
		else
			endFreeFling()
		end
	end
	updateGuide()
	updateHrpOutlines()
	if sessionModel then
		maskChar(localPlayer.Character)
	end
	if inputService:GetFocusedTextBox() then
		clearMove()
	else
		calcMove()
	end
end)
track(runService.PreAnimation:Connect(function()
	local sessionHum, sessionRoot = charParts(sessionModel)
	if not sessionModel or not sessionHum or not sessionRoot then
		return nil
	end
	lockCameraToSession()
	local _result = cam
	if _result ~= nil then
		_result = _result.CFrame
	end
	local _condition_1 = _result
	if _condition_1 == nil then
		_condition_1 = sessionRoot.CFrame
	end
	local cf = _condition_1
	local _, yaw = cf:ToEulerAnglesYXZ()
	sessionHum:Move(CFrame.Angles(0, yaw, 0):VectorToWorldSpace(keys.move))
	sessionHum.Jump = keys.wantJump
end))
local function nextItem()
	local now = os.clock()
	while queue[1] do
		local q = queue[1]
		if q["end"] ~= nil and now > q["end"] then
			table.remove(queue, 1)
			restoreTargetCollision()
		else
			return q
		end
	end
end
local function doFling(rp, hum, tgt, cf)
	local tp = getPart(tgt)
	local rep = flingPart(tgt) or tp
	local useWeld = method == "weld" and tp ~= nil
	if not rp:IsGrounded() then
		if useWeld then
			pcall(function()
				return safeHiddenProperty(rp, "PhysicsRepRootPart", rep)
			end)
			local _cf = cf
			local _vector3_1 = Vector3.new(0, 0, math.random(0, 1) * 0.005)
			rp.CFrame = _cf + _vector3_1
		else
			local _position = cf.Position
			local _vector3_1 = Vector3.new(0, 0, math.random(0, 1) * 0.005)
			local _cFrame = CFrame.new(_position + _vector3_1)
			local _arg0_1 = CFrame.Angles(0, os.clock() * 15, 0)
			rp.CFrame = _cFrame * _arg0_1
			pcall(function()
				return safeHiddenProperty(rp, "PhysicsRepRootPart", rep)
			end)
		end
		rp.Velocity = Vector3.zero
		rp.RotVelocity = Vector3.zero
		rp.AssemblyLinearVelocity = Vector3.zero
		rp.AssemblyAngularVelocity = Vector3.zero
	end
	pcall(function()
		return safeHiddenProperty(hum, "MoveDirectionInternal", Vector3.new(0 / 0, 0 / 0, 0 / 0))
	end)
	pcall(function()
		return safeHiddenProperty(hum, "NetworkHumanoidState", Enum.HumanoidStateType.Freefall)
	end)
end
-- sim
track(runService.PreSimulation:Connect(function()
	if scriptPaused then return end
	if not startupReady then return end
	local char = localPlayer.Character
	local hum, rp = charParts(char)
	if not char or not hum or not rp then
		return nil
	end
	if isDead(hum) then
		dropDeadChar(char)
		return nil
	end
	if not queue[1] and not sessionModel then
		return nil
	end
	if queue[1] and not sessionModel then
		spawnSessionModel()
	end
	local sessionHum, sessionRoot = charParts(sessionModel)
	if not sessionModel or not sessionHum or not sessionRoot then
		return nil
	end
	setFlingDestroyH()
	saveHumanoidState(hum)
	maskChar(char)
	hum.AutoRotate = false
	hum.RequiresNeck = false
	hum.BreakJointsOnDeath = false
	if hum.WalkSpeed < 1 then
		hum.WalkSpeed = custom.sessionWalkSpeed
	end
	if hum.JumpPower < 1 then
		hum.JumpPower = custom.sessionJumpPower
	end
	hum:ChangeState(Enum.HumanoidStateType.Freefall)
	local item = nextItem()
	if not item then
		clearSessionModel(true)
		return nil
	end
	if shouldBackOff(item) then
		table.remove(queue, 1)
		clearSessionModel(true)
		return nil
	end
	local cf, done = predict(item.tgt)
	if done then
		table.remove(queue, 1)
		clearSessionModel(true)
		return nil
	end
	busy = true
	noCollideTarget(item.tgt)
	doFling(rp, hum, item.tgt, cf)
end))
runtime.stop = stop
runtime.fling = fling
runtime.clear = resetRoot
runtime.oldDestroyHeight = originalDestroyHeight
runtime.sessionModel = sessionModel
runtime.config = custom
runtime.util = {
	predict = predict,
	getPart = getPart,
}
env.nbf9000 = runtime
bindCharacter(localPlayer.Character)
track(localPlayer.CharacterAdded:Connect(function(char)
	bindCharacter(char)
	if touchFlingEnabled then
		task.defer(bindTouchFlingParts)
	end
	if startupReady and currentActivationMode() == "tool" then
		task.defer(function()
			task.wait(0.25)
			if startupReady and currentActivationMode() == "tool" then
				createActivationTool()
			end
		end)
	end
end))
track(players.PlayerAdded:Connect(function()
	return updateWatermark()
end))
track(players.PlayerRemoving:Connect(function()
	return task.defer(updateWatermark)
end))
showStartupSelector()
-- congrats you read all of it