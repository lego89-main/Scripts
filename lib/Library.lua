local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local RequestFunction = request or http_request or HttpRequest or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (krnl and krnl.request) or (getgenv and getgenv().request) or (getgenv and getgenv().http_request) or (getgenv and getgenv().HttpRequest) or (getfenv and getfenv().request) or (getfenv and getfenv().http_request) or (getfenv and getfenv().HttpRequest)
local NotifyScreen
local LastWrap
local lib = {}

local PoseEasingStyles = {
    [Enum.PoseEasingStyle.Linear] = Enum.EasingStyle.Linear,
    [Enum.PoseEasingStyle.Elastic] = Enum.EasingStyle.Elastic,
    [Enum.PoseEasingStyle.Cubic] = Enum.EasingStyle.Cubic,
    [Enum.PoseEasingStyle.CubicV2] = Enum.EasingStyle.Cubic,
    [Enum.PoseEasingStyle.Bounce] = Enum.EasingStyle.Bounce
}
local AllowedMethods = {
    GetService = true,
    GetChildren = true,
    GetDescendants = true,
    FindFirstChild = true,
    FindFirstChildOfClass = true,
    FindFirstChildWhichIsA = true,
    FindFirstAncestor = true,
    FindFirstAncestorOfClass = true,
    FindFirstAncestorWhichIsA = true,
    FindFirstDescendant = true,
    WaitForChild = true,
}

lib.LoadAnimation = function(self, Settings)
	if self ~= lib then Settings = self end
	local Model, KeyFrameSequence, SpeedMult, Time, Loop = Settings.Model or Settings[1], Settings.KeyFrameSequence or Settings[2], Settings.Speed or Settings[3], Settings.Timeout or Settings[4], Settings.Loop or Settings[5]
    local Lib = {}
    local Frames, Motors, MotorMap = {}, {}, {}
    local Current = {}
    local ShouldStop = false
    local Connection
    local Speed = math.max(0, tonumber(SpeedMult) or 1)

    function Lib:Stop()
        ShouldStop = true
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end
    end

    function Lib:ChangeSpeed(Value)
        Value = tonumber(Value)
        if Value and Value >= 0 then
            Speed = Value
        end
    end
    
    function Lib:IsPlaying()
    	return not ShouldStop
    end

    for _, Descendant in ipairs(Model:GetDescendants()) do
        if Descendant:IsA("Motor6D") and Descendant.Part0 and Descendant.Part1 then
            local ParentMotors = MotorMap[Descendant.Part0.Name]
            if not ParentMotors then
                ParentMotors = {}
                MotorMap[Descendant.Part0.Name] = ParentMotors
            end
            ParentMotors[Descendant.Part1.Name] = Descendant
        end
    end

    local Keyframes = KeyFrameSequence:GetKeyframes()
    table.sort(Keyframes, function(a, b)
        return a.Time < b.Time
    end)

    for _, Keyframe in ipairs(Keyframes) do
        for _, Pose in ipairs(Keyframe:GetDescendants()) do
            if Pose:IsA("Pose") and Pose.Weight > 0 and Pose.Parent then
                local ParentMotors = MotorMap[Pose.Parent.Name]
                local Motor = ParentMotors and ParentMotors[Pose.Name]

                if Motor then
                    Motors[Pose.Name] = Motor
                    Current[Pose.Name] = {
                        Motor = Motor,
                        CFrame = Pose.CFrame,
                        EasingStyle = Pose.EasingStyle,
                        EasingDirection = Pose.EasingDirection
                    }
                end
            end
        end

        table.insert(Frames, {
            Time = Keyframe.Time,
            Poses = table.clone(Current)
        })
    end

    if #Frames == 0 then
        ShouldStop = true
        return Lib
    end

    for _, Data in pairs(Frames[1].Poses) do
        Data.Motor.Transform = Data.CFrame
    end

    if #Frames < 2 then
        ShouldStop = true
        return Lib
    end

    local FirstTime = Frames[1].Time
    local LastTime = Frames[#Frames].Time
    local Duration = LastTime - FirstTime
    local PlaybackTime = FirstTime
    local Elapsed = 0
    local Segment = 1

    local function ApplyFrame(Frame)
        for _, Data in pairs(Frame.Poses) do
            Data.Motor.Transform = Data.CFrame
        end
    end

    Connection = RunService.Heartbeat:Connect(function(DeltaTime)
        if ShouldStop then return end

        Elapsed = Elapsed + DeltaTime

        if Time and Elapsed >= Time then
            Lib:Stop()
            return
        end

        PlaybackTime = PlaybackTime + (DeltaTime * Speed)

        if PlaybackTime >= LastTime then
            if Loop and Duration > 0 then
                PlaybackTime = FirstTime + ((PlaybackTime - FirstTime) % Duration)
                Segment = 1
            else
                ApplyFrame(Frames[#Frames])
                Lib:Stop()
                return
            end
        end

        while Segment < #Frames - 1 and PlaybackTime >= Frames[Segment + 1].Time do
            Segment = Segment + 1
        end

        local Frame1, Frame2 = Frames[Segment], Frames[Segment + 1]
        local Interval = Frame2.Time - Frame1.Time
        local Alpha = Interval > 0 and math.clamp((PlaybackTime - Frame1.Time) / Interval, 0, 1) or 1

        for Name, Motor in pairs(Motors) do
            local Start = Frame1.Poses[Name]
            local Finish = Frame2.Poses[Name]

            if Start or Finish then
                Start = Start or Finish
                Finish = Finish or Start
                
				local EasedAlpha

				if Start.EasingStyle == Enum.PoseEasingStyle.Constant then
				    EasedAlpha = Alpha >= 1 and 1 or 0
				else
				    EasedAlpha = TweenService:GetValue(
				        Alpha,
				        PoseEasingStyles[Start.EasingStyle] or Enum.EasingStyle.Linear,
				        Enum.EasingDirection[Start.EasingDirection.Name]
				    )
				end
                Motor.Transform = Start.CFrame:Lerp(Finish.CFrame, EasedAlpha)
            end
        end
    end)

    return Lib
end
lib.LoadAccessory = function(self, Accessories)
	if self ~= lib then Accessories = self end
	if type(Accessories) ~= "table" then return end
	if not plr.Character then return end
	
	task.spawn(function()
		local Group = {}
		local MaxLength = 200
	
		local function FireGroup()
			if #Group > 0 then
				game:GetService("ReplicatedStorage")["01_server"]:FireServer(
					"cmd",
					"-gh "..table.concat(Group, " ")
				)
				table.clear(Group)
				task.wait(2)
			end
		end
	
		for i = 1, #Accessories do
			local id = tostring(Accessories[i])
			local current = "-gh "..table.concat(Group, " ")
			local test = #Group > 0 and current.." "..id or "-gh "..id
	
			if #test > MaxLength then
				FireGroup()
			end
			table.insert(Group, id)
		end
		FireGroup()
	end)
end
lib.WaitForAccessory = function(self, Settings)
	if self ~= lib then Settings = self end
	Settings = Settings or {}
	Settings.Parent = Settings.Parent or Settings[1]
	Settings.Count = Settings.Count or Settings[2]
	Settings.Timeout = Settings.Timeout or Settings[3]
	Settings.Callback = Settings.Callback or Settings[4]
	if not Settings.Parent then return end
	local results = {}
	local conn

	conn = Settings.Parent.ChildAdded:Connect(function(Child)
		if Child:IsA("Accessory") then
			results[#results+1] = Child
			if Settings.Callback then
				Settings.Callback(Child)
			end
	        if #results >= (Settings.Count or 1) then
	        	conn:Disconnect()
	        end
	    end
	end)
	
	local start = os.clock()
    while #results < (Settings.Count or 1) and os.clock() - start < (Settings.Timeout or 1) do
        task.wait()
    end

	return results
end
lib.CreateBody = function(self, Object, Position)
	if self ~= lib then Object = self Position = Object end
	if typeof(Object) ~= "Instance" or typeof(Position) ~= "Vector3" then return end
	local IsAccessory = Object:IsA("Accessory")
	if IsAccessory then Object:WaitForChild("Handle", 0.15) end
	if IsAccessory and not Object:FindFirstChild("Handle") then return end
	
	workspace.FallenPartsDestroyHeight = 0/0
	if (IsAccessory and not Object.Handle:FindFirstChild("SmoothBody")) or not Object:FindFirstChild("SmoothBody") then
		local BodyPosition = Instance.new("BodyPosition")
		BodyPosition.Parent = IsAccessory and Object.Handle or Object
		BodyPosition.Position = Position
		BodyPosition.Name = "SmoothBody"
		BodyPosition.MaxForce = Vector3.new(4000000, 4000000, 400000)
	end
	
	if IsAccessory and Object:FindFirstChild("Handle") then
		if Object.Handle:FindFirstChild("AccessoryWeld") then
			Object.Handle.AccessoryWeld:Destroy()
		end
		task.spawn(function()
			while Object do
				task.wait()
				local Handle = Object:FindFirstChild("Handle")
				if Handle then
					local AccessoryWeld = Handle:FindFirstChild("AccessoryWeld")
					if AccessoryWeld then
						AccessoryWeld:Destroy()
					end
				end
			end
		end)
	end
end
lib.GetCFrame = function(self, Object)
	if self ~= lib then Object = self end
	if typeof(Object) ~= "Instance" then return end
	if Object:IsA("BasePart") then
		return Object.CFrame
	elseif Object:IsA("Accessory") then
		local Handle = Object:FindFirstChild("Handle")
		if Handle and Handle:IsA("BasePart") then
			return Handle.CFrame
		else
			local BasePart = Object:FindFirstChildWhichIsA("BasePart", true)
			if BasePart then
				return BasePart.CFrame
			end
		end
	elseif Object:IsA("Tool") then
		local Handle = Object:FindFirstChild("Handle")
		if Handle and Handle:IsA("BasePart") then
			return Handle.CFrame
		else
			local BasePart = Object:FindFirstChildWhichIsA("BasePart", true)
			if BasePart then
				return BasePart.CFrame
			end
		end
	elseif Object:IsA("Model") then
		return Object:GetPivot()
	else
		local BasePart = Object:FindFirstChildWhichIsA("BasePart", true)
		if BasePart then
			return BasePart.CFrame
		end
	end
end
lib.SetCFrame = function(self, Object, _CFrame)
	if self ~= lib then Object = self _CFrame = Object end
	if typeof(Object) ~= "Instance" or typeof(_CFrame) ~= "CFrame" then return end
	sethiddenproperty(plr, "SimulationRadius", math.huge)
	if Object:IsA("BasePart") then
		Object.CFrame = _CFrame
		local SmoothBody = Object:FindFirstChild("SmoothBody")
		if SmoothBody then
			SmoothBody.Position = _CFrame.Position
		end
		Object.Velocity = Vector3.new(0, 3.14, 0)
	elseif Object:IsA("Accessory") then
		local Handle = Object:FindFirstChild("Handle")
		if Handle and Handle:IsA("BasePart") then
			Handle.CFrame = _CFrame
			local SmoothBody = Handle:FindFirstChild("SmoothBody")
			if SmoothBody then
				SmoothBody.Position = _CFrame.Position
			end
			Handle.Velocity = Vector3.new(0, 3.14, 0)
		end
	end
end
lib.ReanimateAccessory = function(self, Accessories)
	if self ~= lib then Accessories = self end
	if type(Accessories) ~= "table" then return end
	if not plr.Character then return end
	local Ids = {}
	local Indexes = {}
	local Count = 0
	
	for Index, Value in pairs(Accessories) do
		if Value ~= 0 then
			Count = Count + 1
			Ids[Count] = Value
			Indexes[Count] = Index
		end
	end
	lib:LoadAccessory(Ids)
	local Loaded = lib:WaitForAccessory({Parent = plr.Character, Count = Count, Timeout = Count, Callback = function(Child)
		if Child:IsA("Accessory") then
			lib:CreateBody(Child, Child:FindFirstChild("Handle") and Child.Handle.Position or Vector3.new())
		end
	end})
	local Accessorys = {}
	for Index, Value in pairs(Loaded) do
		Accessorys[Indexes[Index]] = Value
	end
	task.wait(1.5)
	ReplicatedStorage["01_server"]:FireServer("cmd", "-net")
	return Accessorys
end
lib.ReanimateCharacter = function(self, Character)
	if self ~= lib then Character = self end
	if not Character or not plr.Character then return end
	local char = plr.Character
	local hum = char and char:FindFirstChildWhichIsA("Humanoid")
	if hum.Health <= 0 then return end
	
	local Twins = {}
	local ReverseTwins = {}
	
	for Index, Value in pairs(char:GetChildren()) do
		if Value:IsA("BasePart") or Value:IsA("Accessory") then
			lib:CreateBody(Value, Vector3.new())
			if Value:IsA("BasePart") then
				Value.CanCollide = false
				Value.CanQuery = false
				Value.CanTouch = false
			end
		end
	end
	for Index1, Value1 in pairs(Character:GetChildren()) do
		if Value1:IsA("BasePart") or Value1:IsA("Accessory") then
			for Index2, Value2 in pairs(char:GetChildren()) do
				if (Value2:IsA("BasePart") or Value2:IsA("Accessory")) and not ReverseTwins[Value2] and Value1.Name == Value2.Name then
					ReverseTwins[Value2] = Value1
					Twins[Value1] = Value2
				end
			end
		end
	end
	
	local Reanimation = {}
	local Connection = RunService.PostSimulation:Connect(function()
		for Index, Value in pairs(Character:GetChildren()) do
			if Value:IsA("BasePart") then
				local TargetPart = Twins[Value]
				if TargetPart then
					TargetPart.CanCollide = false
					TargetPart.CanQuery = false
					TargetPart.CanTouch = false
					lib:SetCFrame(TargetPart, Value.CFrame)
				end
			elseif Value:IsA("Accessory") then
				local Handle = Value:FindFirstChild("Handle")
				local TargetPart = Twins[Value]
				local TargetHandle = TargetPart and TargetPart:FindFirstChild("Handle")
				if Handle and TargetHandle then
					lib:SetCFrame(TargetHandle, Handle.CFrame)
				end
			end
		end
	end)
	
	plr.Character = Character
	task.wait(4.5)
	char.Humanoid.Health = 0
	workspace.CurrentCamera.CameraSubject = Character
	
	function Reanimation:Disconnect()
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	return Reanimation
end
lib.GetHumanoidRootPart = function(self, Player)
	if self ~= lib then Player = self end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then return end
	return Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
end
lib.GetHumanoid = function(self, Player)
	if self ~= lib then Player = self end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then return end
	return Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
end
lib.FindPlayer = function(self, Name, SearchDisplayName, If)
	if self ~= lib then Name = self SearchDisplayName = Name If = SearchDisplayName end
	if type(Name) ~= "string" then return end
	for Index, Value in ipairs(Players:GetPlayers()) do
		if Value.Name:lower():find(Name:lower()) or (SearchDisplayName and Value.DisplayName:lower():find(Name:lower())) then
			if typeof(If) ~= "table" or (not If.Humanoid or lib.GetHumanoid(Value)) and (not If.HumanoidRootPart or lib.GetHumanoidRootPart(Value)) then
				return Value
			end
		end
	end
end
lib.RandomString = function(self, Length, PossibleText)
	if self ~= lib then Length = self PossibleText = Length end
	Length = tonumber(Length) or 0
	PossibleText = type(PossibleText) == "string" and PossibleText or "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local Result = ""
    for i = 1, Length do
        local Index = math.random(1, #PossibleText)
        Result = Result..PossibleText:sub(Index, Index)
    end

    return Result
end
lib.Request = function(self, Options)
	if self ~= lib then Options = self end
	
	Options = Options or {}
	Options.Url = Options.Url or Options.URL
	Options.URL = nil
	Options.Method = Options.Method or "GET"
	Options.Headers = Options.Headers or {}

	if typeof(Options.Body) == "table" then
		Options.Body = HttpService:JSONEncode(Options.Body)
		Options.Headers["Content-Type"] = "application/json"
	end
	local success, response = pcall(RequestFunction, Options)
	local Result = {
		Success = false,
		StatusCode = 0,
		Body = "",
		Json = nil,
		Headers = {},
		JsonSuccess = false
	}
	if not success or type(response) ~= "table" then
		Result.Body = tostring(response)
		return Result
	end
	Result.Body = response.Body or response.body or ""
	Result.StatusCode = response.StatusCode or response.Status or response.status or 0
	Result.Headers = response.Headers or response.headers or {}
	Result.Success = Result.StatusCode >= 200 and Result.StatusCode < 300

	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(Result.Body)
	end)
	if ok and type(decoded) == "table" then
		Result.Json = decoded
		Result.JsonSuccess = true
	end

	return Result
end
lib.PathToObject = function(self, Path)
	if self ~= lib then Instance = self end
    if type(Path) ~= "string" then return end
    local Success, Result = pcall(function()
        local Position = 1
        local Length = #Path
        local function Peek()
            return Path:sub(Position, Position)
        end
        local function SkipSpace()
            while Position <= Length and Peek():match("%s") do
                Position = Position + 1
            end
        end
        local function ReadString()
            local Quote = Peek()
            Position = Position + 1
            local Buffer = {}
            while true do
                if Position > Length then
                    error("Unterminated string")
                end
                local Char = Peek()
                if Char == "\\" then
                    Position = Position + 1
                    local Next = Peek()
                    if Next == "n" then Next = "\n"
                    elseif Next == "t" then Next = "\t"
                    elseif Next == "r" then Next = "\r" end
                    Buffer[#Buffer + 1] = Next
                elseif Char == Quote then
                    Position = Position + 1
                    break
                else
                    Buffer[#Buffer + 1] = Char
                end
                Position = Position + 1
            end
            return table.concat(Buffer)
        end
        local function ReadNumber()
            local Text = Path:match("^-?%d+%.?%d*", Position)
            if not Text then
                error("Invalid number")
            end
            Position = Position + #Text
            return tonumber(Text)
        end
        local function ReadBracket()
            Position = Position + 1
            SkipSpace()
            local Value
            local Char = Peek()
            if Char == '"' or Char == "'" then
                Value = ReadString()
            else
                Value = ReadNumber()
            end
            SkipSpace()
            if Peek() ~= "]" then
                error("Expected ']'")
            end
            Position = Position + 1
            return Value
        end
        local function ReadDotName()
            local Start = Position
            while Position <= Length do
                local Char = Peek()
                if Char == "." or Char == ":" or Char == "[" or Char == "(" then
                    break
                end
                Position = Position + 1
            end
            local Name = Path:sub(Start, Position - 1):match("^%s*(.-)%s*$")
            if Name == "" then
                error("Empty name")
            end
            return Name
        end
        local function ReadArguments()
            SkipSpace()
            if Peek() ~= "(" then
                error("Expected '('")
            end
            Position = Position + 1
            local Args, Count = {}, 0
            SkipSpace()
            if Peek() == ")" then
                Position = Position + 1
                return Args, 0
            end
            while true do
                SkipSpace()
                local Char = Peek()
                local Value
                if Char == '"' or Char == "'" then
                    Value = ReadString()
                elseif Char:match("[%d%-]") then
                    Value = ReadNumber()
                elseif Path:sub(Position, Position + 3) == "true" then
                    Value = true
                    Position = Position + 4
                elseif Path:sub(Position, Position + 4) == "false" then
                    Value = false
                    Position = Position + 5
                elseif Path:sub(Position, Position + 2) == "nil" then
                    Value = nil
                    Position = Position + 3
                else
                    error("Invalid argument")
                end
                Count = Count + 1
                Args[Count] = Value
                SkipSpace()
                local Next = Peek()
                Position = Position + 1
                if Next == ")" then
                    break
                elseif Next ~= "," then
                    error("Expected ',' or ')'")
                end
            end
            return Args, Count
        end
        local function Member(Object, Key)
            local Kind = typeof(Object)
            if Kind == "Instance" then
                if type(Key) ~= "string" then
                    return
                end
                local Ok, Value = pcall(function()
                    return Object[Key]
                end)
                if Ok and Value ~= nil then
                    return Value
                end
                return Object:FindFirstChild(Key)
            elseif Kind == "table" then
                return Object[Key]
            end
            return
        end
        local function Index(Object, Key)
            if typeof(Object) == "Instance" and type(Key) == "string" then
                return Object:FindFirstChild(Key) or Member(Object, Key)
            end
            return Member(Object, Key)
        end
        SkipSpace()
        local Object = game

        if Peek() == "[" then
            Object = Index(game, ReadBracket())
        else
            local Start = Position
            while Position <= Length do
                local Char = Peek()
                if Char == "." or Char == ":" or Char == "[" then
                    break
                end
                Position = Position + 1
            end
            local First = Path:sub(Start, Position - 1):match("^%s*(.-)%s*$")
            if First == "game" then
                Object = game
            elseif First == "workspace" or First == "Workspace" then
                Object = workspace
            elseif First == "script" then
                Object = script
            elseif First == "LocalPlayer" then
                Object = game:GetService("Players").LocalPlayer
            else
                local Ok, Service = pcall(game.GetService, game, First)
                Object = (Ok and Service) or game:FindFirstChild(First)
            end
        end
        while Object ~= nil do
            SkipSpace()
            if Position > Length then
                break
            end
            local Char = Peek()
            if Char == "." then
                Position = Position + 1
                Object = Member(Object, ReadDotName())
            elseif Char == "[" then
                Object = Index(Object, ReadBracket())
            elseif Char == ":" then
                Position = Position + 1
                SkipSpace()
                local Method = Path:match("^[%a_][%w_]*", Position)
                if not Method then
                    error("Invalid method name")
                end
                Position = Position + #Method
                if not AllowedMethods[Method] then
                    error("Unsupported method: " .. Method)
                end
                if typeof(Object) ~= "Instance" then
                    error("Method call on non-instance")
                end
                local Args, Count = ReadArguments()
                Object = Object[Method](Object, table.unpack(Args, 1, Count))
            else
                error("Unexpected character: " .. Char)
            end
        end
        return Object
    end)
    if Success then return Result end
    return
end
lib.GetFullPath = function(self, Instance)
	if self ~= lib then Instance = self end
	if typeof(Instance) ~= "Instance" then return end
    local Path = {}
    local Current = Instance

    while Current and Current ~= game do
        local Parent = Current.Parent
        local Name = Current.Name
        local SameName = {}
        local Index = 0
        if Parent then
            for i, Child in ipairs(Parent:GetChildren()) do
                if Child.Name == Name then
                    table.insert(SameName, Child)
                    if Child == Current then
                        Index = i
                    end
                end
            end
        end
        if #SameName > 1 then
            table.insert(Path, 1, ":GetChildren()["..Index.."]")
        elseif Name:match("^[%a_][%w_]*$") then
            table.insert(Path, 1, "."..Name)
        else
            table.insert(Path, 1, "["..string.format("%q", Name).."]")
        end
        Current = Parent
    end
    local Result = table.concat(Path)
    if Instance == workspace then
        return "workspace"
    elseif Instance:IsDescendantOf(workspace) then
        return "workspace" ..Result:sub(#workspace.Name + 2)
    end
    return "game"..Result
end
lib.ToString = function(self, Value, Store)
	if self ~= lib then Value = self Store = Value end
	local Type = typeof(Value)
	if Type == "Vector2" then
		return "Vector2.new("..(Value==Vector2.new()and ")" or Value.X..", "..Value.Y..")")
	elseif Type == "Vector3" then
		return "Vector3.new("..(Value==Vector3.new()and ")" or Value.X..", "..Value.Y..", "..Value.Z..")")
	elseif Type == "CFrame" then
		local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = CFrame.new():GetComponents()
		return "CFrame.new("..(Value==CFrame.new()and ")" or X..", "..Y..", "..Z..", "..R00..", "..R01..", "..R02..", "..R10..", "..R11..", "..R12..", "..R20..", "..R21..", "..R22..")")
	elseif Type == "Vector2int16" then
		return "Vector2int16.new("..(Value==Vector2int16.new()and ")" or Value.X..", "..Value.Y..")")
	elseif Type == "Vector3int16" then
		return "Vector3int16.new("..(Value==Vector3int16.new()and ")" or Value.X..", "..Value.Y..", "..Value.Z..")")
	elseif Type == "Color3" then
		return "Color3.new("..(Value==Color3.new()and ")" or Value.R..", "..Value.G..", "..Value.B..")")
	elseif Type == "BrickColor" then
		return "BrickColor.new("..string.format("%q", Value.Name)..")"
	elseif Type == "UDim" then
		return "UDim.new("..(Value==UDim.new()and ")" or Value.Scale..", "..Value.Offset..")")
	elseif Type == "UDim2" then
		return "UDim2.new("..(Value==UDim2.new()and ")" or Value.X.Scale..", "..Value.X.Offset..", "..Value.Y.Scale..", "..Value.Y.Offset..")")
	elseif Type == "Rect" then
		return "Rect.new("..(Value==Rect.new()and ")" or Value.Min.X..", "..Value.Min.Y..", "..Value.Max.X..", "..Value.Max.Y..")")
	elseif Type == "NumberRange" then
		return "NumberRange.new("..Value.Min..", "..Value.Max..")"
	elseif Type == "Ray" then
		return "Ray.new("..lib:ToString(Value.Origin)..", "..lib:ToString(Value.Direction)..")"
	elseif Type == "NumberSequence" then
		local Points = {}
		for _, Point in ipairs(Value.Keypoints) do
			table.insert(Points, "NumberSequenceKeypoint.new("..Point.Time..", "..Point.Value..", "..Point.Envelope..")")
		end
		return "NumberSequence.new({"..table.concat(Points, ", ").."})"
	elseif Type == "ColorSequence" then
		local Points = {}
		for _, Point in ipairs(Value.Keypoints) do
			table.insert(Points, "ColorSequenceKeypoint.new("..Point.Time..", "..lib:ToString(Point.Value)..")")
		end
		return "ColorSequence.new({"..table.concat(Points, ", ").."})"
	elseif Type == "EnumItem" then
		return tostring(Value)
	elseif Type == "Enum" then
		return "Enum."..tostring(Value)
	elseif Type == "Instance" then
		return Store[Value] or (Value==game and "game" or Value==workspace and "workspace") or "nil"
	elseif Type == "string" then
		return string.format("%q", Value)
	elseif Type == "number" or Type == "boolean" or Type == "nil" then
		return tostring(Value)
	elseif Type == "table" then
		local Parts = {}
		for Key, Item in pairs(Value) do
			table.insert(Parts, "["..lib:ToString(Key).."] = "..lib:ToString(Item))
		end
		return "{"..table.concat(Parts, ", ").."}"
	end
	return tostring(Value)
end
lib.QuoteString = function(self, String)
	if self ~= lib then String = self end
	if type(String) ~= "string" then return end
	local Level = 0
	while String:find("%]"..string.rep("=", Level).."%]") do
		Level = Level + 1
	end
	local Equal = string.rep("=", Level)
	if Level == 0 and not String:find("[\n\r]") then
		return '"'..String:gsub("\\", "\\\\"):gsub('"', '\\"')..'"'
	end
	return "["..Equal.."["..String.."]"..Equal.."]"
end
lib.TableToString = function(self, Table, Indent)
	if self ~= lib then Table = self Indent = Table end
	if typeof(Table) ~= "table" then return end
	Indent = Indent or 0
	if typeof(Table) == "string" then
		return QuoteString(Table)
	elseif typeof(Table) == "number" then
		return tostring(Table)
	elseif typeof(Table) == "boolean" then
		return tostring(Table)
	elseif Table == nil then
		return "nil"
	elseif typeof(Table) == "table" then
		local Result = "{"
		local NextIndent = Indent + 1
		for Index, Value in pairs(Table) do
			Result = Result.."\n"..string.rep("\t", NextIndent)
			if typeof(Index) == "string" and Index:match("^[%a_][%w_]*$") then
				Result = Result..Index
			else
				Result = Result.."["..lib:TableToString(Index, NextIndent).."]"
			end
			Result = Result.." = "..lib:TableToString(Value, NextIndent)..","
		end
		if next(Table) then
			Result = Result.."\n"..string.rep("\t", Indent)
		end
		return Result.."}"
	end
	return lib:QuoteString(tostring(Table))
end
lib.PrintTable = function(self, Table)
	if self ~= lib then Table = self end
	if typeof(Table) ~= "table" then return end
	for Index, Value in pairs(Table) do
		print("Index: ", Index, "Value: ", Value)
	end
end
lib.Setclipboard = function(self, Text)
	if self ~= lib then Text = self end
	local setclipboard = setclipboard or toclipboard
	if setclipboard then
		setclipboard(tostring(Text))
	else
		lib:Notify({Title = "Warning!", Text = "Your environment doesn't support setclipboard.", Duration = 4})
	end
end
lib.CreateFakeCharacter = function(self, UserId, RigType)
	if self ~= lib then UserId = self RigType = UserId end
	if not UserId then UserId = plr.UserId end
	if type(UserId) == "string" then
	    local Success, Result = pcall(Players.GetUserIdFromNameAsync, Players, UserId)
	    if not Success then return end
	    UserId = Result
	elseif type(UserId) ~= "number" then return end
	local Success, Description = pcall(Players.GetHumanoidDescriptionFromUserId, Players, UserId)
	if not Success then return end
	local Success, Character = pcall(
		Players.CreateHumanoidModelFromDescription,
		Players,
		Description,
		(RigType == Enum.HumanoidRigType.R15 or RigType == Enum.HumanoidRigType.R6) and RigType or Enum.HumanoidRigType.R6
	)
	if not Success then return end
	return Character
end
lib.Notify = function(self, Settings)
	if self ~= lib then Settings = self end
	local Name, Text, Duration = Settings.Name or Settings[1], Settings.Text or Settings[2], Settings.Duration or Settings[3]
	local TweenService = game:GetService("TweenService")
	Duration = Duration or 4
	
	if not NotifyScreen then
		NotifyScreen = Instance.new("ScreenGui")
		NotifyScreen.Name = "Notify"
		
		local Holder = Instance.new("Frame", NotifyScreen)
		Holder.Size = UDim2.new(0, 280, 1, -20)
		Holder.Position = UDim2.new(1, -10, 0, 10)
		Holder.AnchorPoint = Vector2.new(1, 0)
		Holder.BackgroundTransparency = 1
		
		local List = Instance.new("UIListLayout", Holder)
		List.Padding = UDim.new(0, 8)
		List.SortOrder = Enum.SortOrder.LayoutOrder
		List.HorizontalAlignment = Enum.HorizontalAlignment.Right
		List.VerticalAlignment = Enum.VerticalAlignment.Bottom
	end
	
	local Wrap = Instance.new("Frame", Holder)
	Wrap.Size = UDim2.new(1, 0, 0, 66)
	Wrap.BackgroundTransparency = 1
	Wrap.ZIndex = 999
	
	local Card = Instance.new("Frame", Wrap)
	Card.Size = UDim2.new(1, 0, 1, 0)
	Card.Name = "Card"
	Card.Position = UDim2.new(1.3, 0, 0, 0)
	Card.BackgroundColor3 = Color3.fromRGB(13, 13, 16)
	Card.ZIndex = 999
	
	local UICorner = Instance.new("UICorner", Card) 
	UICorner.CornerRadius = UDim.new(0, 3)
	
	local UIStroke = Instance.new("UIStroke", Card)
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 1
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	local Title = Instance.new("TextLabel", Card)
	Title.Size = UDim2.new(1, -24, 0, 18)
	Title.Position = UDim2.new(0, 12, 0, 8)
	Title.BackgroundTransparency = 1
	Title.Font = Enum.Font.GothamBold
	Title.Name = "Title"
	Title.TextSize = 14
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Text = tostring(Name)
	Title.ZIndex = 999
	
	local Message = Instance.new("TextLabel", Card)
	Message.Size = UDim2.new(1, -24, 0, 26)
	Message.Position = UDim2.new(0, 12, 0, 28)
	Message.BackgroundTransparency = 1
	Message.Font = Enum.Font.Gotham
	Message.TextSize = 13
	Message.Name = "Message"
	Message.TextColor3 = Color3.fromRGB(200, 200, 206)
	Message.TextXAlignment = Enum.TextXAlignment.Left
	Message.TextYAlignment = Enum.TextYAlignment.Top
	Message.TextWrapped = true
	Message.Text = tostring(Text)
	Message.ZIndex = 999
	
	local Track = Instance.new("Frame", Card)
	Track.Size = UDim2.new(1, -24, 0, 3)
	Track.Position = UDim2.new(0, 12, 1, -9)
	Track.BackgroundColor3 = Color3.fromRGB(38, 38, 44)
	Track.ZIndex = 999
	
	local UICorner = Instance.new("UICorner", Track)
	UICorner.CornerRadius = UDim.new(1, 0)
	
	local Fill = Instance.new("Frame", Track)
	Fill.Size = UDim2.new(1, 0, 1, 0)
	Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Fill.ZIndex = 999
	
	local UICorner = Instance.new("UICorner", Fill)
	UICorner.CornerRadius = UDim.new(1, 0)
	
	LastWrap = Wrap

	TweenService:Create(Card, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
	TweenService:Create(Fill, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
	
	task.delay(Duration, function()
		local out = TweenService:Create(Card, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1.3, 0, 0, 0)})
		out:Play()
		out.Completed:Wait()
		Wrap:Destroy()
		if LastWrap == Wrap then
			NotifyScreen:Destroy()
			NotifyScreen = nil
		end
	end)
end

local Custom = {
	UserService = game:GetService("UserService"),
	TestService = game:GetService("TestService"),
	RunService = game:GetService("RunService"),
	HttpService = game:GetService("HttpService"),
	TeleportService = game:GetService("TeleportService"),
	TextChatService = game:GetService("TextChatService"),
	UserInput = game:GetService("UserInputService"),
	SoundService = game:GetService("SoundService"),
	TweenService = game:GetService("TweenService"),
	Players = game:GetService("Players"),
	ChatService = game:GetService("Chat"),
	CoreGui = game:GetService("CoreGui"),
	Debris = game:GetService("Debris"),
	StatsService = game:GetService("Stats"),
	Lighting = game:GetService("Lighting"),
	VirtualUser = game:GetService("VirtualUser"),
	NetworkClient = game:GetService("NetworkClient"),
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	AvatarEditorService = game:GetService("AvatarEditorService"),
	MarketplaceService = game:GetService("MarketplaceService"),
	ContentProvider = game:GetService("ContentProvider"),
	plr = plr,
	char = function()
		return plr.Character
	end,
	hrp = function()
		return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
	end,
	hum = function()
		return plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid")
	end,
	lib = lib,
	temp = {},
}

local CurrentEnv = getfenv(2)
local Env = setmetatable({}, {
	__index = function(self, Key)
		if Custom[Key] ~= nil then
			return Custom[Key]
		end
		return CurrentEnv[Key]
	end,
})
setfenv(2, Env)
