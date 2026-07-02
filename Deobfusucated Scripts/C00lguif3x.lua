local CoreGui = game:GetService("CoreGui")
local guiname = "CoolGui"


local removeme = CoreGui:FindFirstChild(guiname)

if removeme then
    removeme:Destroy()
else
    print("workingkkskskakl")
end

blak = Color3.new(0,0,0)
rede = Color3.new(255/255,0/255,0/255)
tef = "SourceSans"
whit = Color3.new(255/255,255/255,255/255)
local cka = Instance.new("ScreenGui", game.CoreGui)
cka.Name= "CoolGui"
local frame = Instance.new("Frame")
	frame.Parent = cka
	frame.BackgroundColor3 = blak
	frame.BorderColor3 = rede
	frame.BorderSizePixel = 3
	frame.Name = "Frame"
	frame.Position = UDim2.new(0,3,0.3,0)
	frame.Size = UDim2.new(0,300,0,400)
local pges = Instance.new("Frame")
	pges.Parent = frame
	pges.BackgroundColor3 = blak
	pges.BorderColor3 = rede
	pges.BorderSizePixel = 3
	pges.Name = "Pages"
	pges.Position = UDim2.new(0,0,0,0)
	pges.Size = UDim2.new(1,0,1,0)
local cope = Instance.new("TextButton")
	cope.Parent = cka
	cope.Active = true
	cope.AutoButtonColor = true
	cope.BackgroundColor3 = blak
	cope.BorderColor3 = rede
	cope.BorderSizePixel = 3
	cope.Name = "Close/Open"
	cope.Position = UDim2.new(0,3,0.3,380)
	cope.Selectable = true
	cope.Size = UDim2.new(0,300,0,20)
	cope.ZIndex = 3
	cope.Font = "SourceSans"
	cope.FontSize = "Size18"
	cope.Text = "Close"
	cope.TextColor3 = Color3.new(255,255,255)
	cope.TextXAlignment = "Center"
	cope.TextYAlignment = "Center"
	cope.MouseButton1Down:connect(function()
		if cope.Text == "Close" then
		frame.Visible = false
		cope.Text = "Open" else
		frame.Visible = true
		cope.Text = "Close"	
		end	
	end)
local page1 = Instance.new("Frame")
	page1.Parent = pges	
	page1.BackgroundColor3 = blak
	page1.BorderColor3 = rede
	page1.BorderSizePixel = 3
	page1.Name = "Page1"
	page1.Position = UDim2.new(0,0,0,83)
	page1.Size = UDim2.new(1,0,1,-106)
	page1.ZIndex = 2
	page1.Visible = true
local page2 = Instance.new("Frame")
	page2.Parent = pges
	page2.BackgroundColor3 = blak
	page2.BorderColor3 = rede
	page2.BorderSizePixel = 3
	page2.Name = "Page2"
	page2.Position = UDim2.new(0,0,0,83)
	page2.Size = UDim2.new(1,0,1,-106)
	page2.ZIndex = 2
	page2.Visible = false
local page3 = Instance.new("Frame")
	page3.Parent = pges
	page3.BackgroundColor3 = blak
	page3.BorderColor3 = rede
	page3.BorderSizePixel = 3
	page3.Name = "Page3"
	page3.Position = UDim2.new(0,0,0,83)
	page3.Size = UDim2.new(1,0,1,-106)
	page3.ZIndex = 2
	page3.Visible = false
local page4 = Instance.new("Frame")
	page4.Parent = pges
	page4.BackgroundColor3 = blak
	page4.BorderColor3 = rede
	page4.BorderSizePixel = 3
	page4.Name = "Page4"
	page4.Position = UDim2.new(0,0,0,83)
	page4.Size = UDim2.new(1,0,1,-106)
	page4.ZIndex = 2
	page4.Visible = false
local page5 = Instance.new("Frame")
	page5.Parent = pges
	page5.BackgroundColor3 = blak
	page5.BorderColor3 = rede
	page5.BorderSizePixel = 3
	page5.Name = "Page5"
	page5.Position = UDim2.new(0,0,0,83)
	page5.Size = UDim2.new(1,0,1,-106)
	page5.ZIndex = 2
	page5.Visible = false
page = Instance.new("Frame")
	page.Parent = frame
	page.BackgroundColor3 = blak
	page.BorderColor3 = rede
	page.BorderSizePixel = 3
	page.Name = "Settings"
	page.Position = UDim2.new(1,3,0,0)
	page.Size = UDim2.new(1,0,1,0)
	page.ZIndex = 1
	page.Visible = true
right = Instance.new("TextButton")
	right.Parent = frame	
	right.BackgroundColor3 = blak
	right.BorderColor3 = rede
	right.BorderSizePixel = 3
	right.Name = ">"
	right.Position = UDim2.new(0.5,3,0,40)
	right.Size = UDim2.new(0.5,-3,0,40)
	right.ZIndex = 2
	right.Font = tef
	right.FontSize = "Size48"
	right.Text = ">"
	right.TextColor3 = whit
addonr = Instance.new("TextButton")
	addonr.Parent = page5	
	addonr.BackgroundColor3 = blak
	addonr.BorderColor3 = rede
	addonr.BorderSizePixel = 3
	addonr.Name = "addonr"
	addonr.Position = UDim2.new(0,153,0,-40)
	addonr.Size = UDim2.new(0.49,0,0.125,0)
	addonr.Font = tef
	addonr.FontSize = "Size48"
	addonr.Text = ">"
	addonr.TextColor3 = whit
	addonr.ZIndex = 3
left = Instance.new("TextButton")
	left.Parent = frame	
	left.BackgroundColor3 = blak
	left.BorderColor3 = rede
	left.BorderSizePixel = 3
	left.Name = "<"
	left.Position = UDim2.new(0,0,0,40)
	left.Size = UDim2.new(0.5,-3,0,40)
	left.ZIndex = 2
	left.Font = tef
	left.FontSize = "Size48"
	left.Text = "<"
	left.TextColor3 = whit
addonl = Instance.new("TextButton")
	addonl.Parent = page1	
	addonl.BackgroundColor3 = blak
	addonl.BorderColor3 = rede
	addonl.BorderSizePixel = 3
	addonl.Name = "addonl"
	addonl.Position = UDim2.new(0,0,0,-40)
	addonl.Size = UDim2.new(0.49,0,0.125,0)
	addonl.Font = tef
	addonl.FontSize = "Size48"
	addonl.Text = "<"
	addonl.TextColor3 = whit
	addonl.ZIndex = 3
local title = Instance.new("TextLabel")
	title.Parent = frame
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Position = UDim2.new(0,0,0,0)
	title.Size = UDim2.new(1,0,0,40)
	title.ZIndex = 2
	title.Font = tef
	title.FontSize = "Size24"
	title.Text = "c00lgui Reborn Rc7 By v3rx"
	title.TextColor3 = whit
--           inside pages        --
local acg = Instance.new("Frame")
	acg.Parent = page1
	acg.BackgroundColor3 = blak
	acg.BorderColor3 = rede
	acg.BorderSizePixel = 3
	acg.Name = "Admin Commands/Guis"
	acg.Position = UDim2.new(0.5,3,0,0)
	acg.Size = UDim2.new(0.5,-3,1,0)
	acg.ZIndex = 2
local sd = Instance.new("Frame")
	sd.Parent = page1
	sd.BackgroundColor3 = blak
	sd.BorderColor3 = rede
	sd.BorderSizePixel = 3
	sd.Name = "Server Destruction"
	sd.Position = UDim2.new(0,0,0,0)
	sd.Size = UDim2.new(0.5,-3,1,0)
	sd.ZIndex = 2
local gt = Instance.new("Frame")
	gt.Parent = page2
	gt.BackgroundColor3 = blak
	gt.BorderColor3 = rede
	gt.BorderSizePixel = 3
	gt.Name = "Gear/Tools"
	gt.Position = UDim2.new(0.5,3,0,0)
	gt.Size = UDim2.new(0.5,-3,1,0)
	gt.ZIndex = 2
local ws = Instance.new("Frame")
	ws.Parent = page2
	ws.BackgroundColor3 = blak
	ws.BorderColor3 = rede
	ws.BorderSizePixel = 3
	ws.Name = "Weapon Scripts"
	ws.Position = UDim2.new(0,0,0,0)
	ws.Size = UDim2.new(0.5,-3,1,0)
	ws.ZIndex = 2
local localp = Instance.new("Frame")
	localp.Parent = page3
	localp.BackgroundColor3 = blak
	localp.BorderColor3 = rede
	localp.BorderSizePixel = 3
	localp.Name = "LocalPlayer"
	localp.Position = UDim2.new(0.5,3,0,0)
	localp.Size = UDim2.new(0.5,-3,1,0)
	localp.ZIndex = 2
local misc = Instance.new("Frame")
	misc.Parent = page3
	misc.BackgroundColor3 = blak
	misc.BorderColor3 = rede
	misc.BorderSizePixel = 3
	misc.Name = "Misc"
	misc.Position = UDim2.new(0,0,0,0)
	misc.Size = UDim2.new(0.5,-3,1,0)
	misc.ZIndex = 2
pmi = Instance.new("Frame")
	pmi.Parent = page4
	pmi.BackgroundColor3 = blak
	pmi.BorderColor3 = rede
	pmi.BorderSizePixel = 3
	pmi.Name = "Preset Music IDs"
	pmi.Position = UDim2.new(0.5,3,0,0)
	pmi.Size = UDim2.new(0.5,-3,1,0)
	pmi.ZIndex = 2
local psd = Instance.new("Frame")
	psd.Parent = page4
	psd.BackgroundColor3 = blak
	psd.BorderColor3 = rede
	psd.BorderSizePixel = 3
	psd.Name = "Preset Skybox/Decal IDs"
	psd.Position = UDim2.new(0,0,0,0)
	psd.Size = UDim2.new(0.5,-3,1,0)
	psd.ZIndex = 2
local edn = Instance.new("Frame")
	edn.Parent = page5
	edn.BackgroundColor3 = blak
	edn.BorderColor3 = rede
	edn.BorderSizePixel = 3
	edn.Name = "End"
	edn.Position = UDim2.new(0.5,3,0,0)
	edn.Size = UDim2.new(0.5,-3,1,0)
	edn.ZIndex = 2
local pgi = Instance.new("Frame")
	pgi.Parent = page5
	pgi.BackgroundColor3 = blak
	pgi.BorderColor3 = rede
	pgi.BorderSizePixel = 3
	pgi.Name = "Preset Gear IDs"
	pgi.Position = UDim2.new(0,0,0,0)
	pgi.Size = UDim2.new(0.5,-3,1,0)
	pgi.ZIndex = 2
--      inside pages end        --
-- Admin Commands/Guis --
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "iOrb"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "i0rb"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- หา SyncAPI
local tool
for _,v in ipairs(player:GetDescendants()) do
if v.Name == "SyncAPI" then tool = v.Parent end
end
for _,v in ipairs(ReplicatedStorage:GetDescendants()) do
if v.Name == "SyncAPI" then tool = v.Parent end
end

local remote = tool.SyncAPI.ServerEndpoint
local function _(args)
remote:InvokeServer(unpack(args))
end

-- ฟังก์ชัน F3X
local function CreatePart(cf,parent) _( {"CreatePart","Ball",cf,parent} ) end
local function MovePart(part,cf) _( {"SyncMove",{ {Part=part, CFrame=cf} } } ) end
local function Resize(part,size,cf) _( {"SyncResize",{ {Part=part, Size=size, CFrame=cf} } } ) end
local function SetAnchor(bool,part) _( {"SyncAnchor",{ {Part=part, Anchored=bool} } } ) end
local function SetCollision(part,bool) _( {"SyncCollision",{ {Part=part, CanCollide=bool} } } ) end
local function SetName(part,name) _( {"SetName",{part},name} ) end
local function Color(part,color) _( {"SyncColor",{ {Part=part, Color=color, UnionColoring=false} } } ) end

-- ฟังก์ชันเพิ่มไฟ SyncAPI
function AddFire(part, size, color, color2, heat)
local createArgs = {
[1] = "CreateDecorations",
[2] = {
[1] = {
["Part"] = part,
["DecorationType"] = "Fire"
}
}
}

local syncArgs = {
[1] = "SyncDecorate",
[2] = {
[1] = {
["Part"] = part,
["DecorationType"] = "Fire",
["Size"] = size,
["Heat"] = heat,
["Color"] = color,
["SecondaryColor"] = color2
}
}
}

_(createArgs)
_(syncArgs)

end

-- สร้างลูกบอลหมุนรอบตัวผู้เล่นแบบวงรี/โค้ง
local function createOrbitBall()
local radius = 5
local verticalAmplitude = 3 -- ความสูงแกว่งขึ้นลง
local speed = math.rad(100)
local angle = 0

-- สร้างลูกบอล
local initialCF = hrp.CFrame * CFrame.new(radius, -0.1, 0)
CreatePart(initialCF, workspace)

local ball
repeat task.wait()
for _,v in ipairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and (v.Position - initialCF.Position).Magnitude < 0.1 then
ball = v
break
end
end
until ball

SetName(ball,"OrbitBall")
Resize(ball, Vector3.new(0.9,0.9,0.9), initialCF)
Color(ball, Color3.new(0, 0, 0)) -- สีฟ้าอ่อน
SetAnchor(true, ball)
SetCollision(ball, false)
AddFire(ball, 0.5, Color3.new(0, 0, 0), Color3.new(0, 0, 0), 15)

-- หมุนรอบตัวผู้เล่นแบบลูป + เฉียงขึ้นลง
RunService.Heartbeat:Connect(function(dt)
angle = angle + dt * speed
local x = math.cos(angle) * radius
local z = math.sin(angle) * radius
local y = 2 + math.sin(angle*2) * verticalAmplitude -- แกว่งขึ้นลงแบบวงรี

-- หมุนให้ลูกบอลหันตามแนวการเคลื่อนที่    
local lookDir = Vector3.new(-math.sin(angle), math.cos(angle*2)*0.1, math.cos(angle))    
local newCF = CFrame.new(hrp.Position + Vector3.new(x,y,z), hrp.Position + Vector3.new(x,y,z) + lookDir)    
MovePart(ball, newCF)

end)

end

createOrbitBall()



	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Kohls Admin"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Rocky2u's Project Duck"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
--[[
---------------------------------------------------------------
|   _____           _           _     _____             _      |
|  |  __ \         (_)         | |   |  __ \           | |     |
|  | |__) | __ ___  _  ___  ___| |_  | |  | |_   _  ___| | __  |
|  |  ___/ '__/ _ \| |/ _ \/ __| __| | |  | | | | |/ __| |/ /  |
|  | |   | | | (_) | |  __/ (__| |_  | |__| | |_| | (__|   <   |
|  |_|   |_|  \___/| |\___|\___|\__| |_____/ \__,_|\___|_|\_\  |
|                 _/ |                                         |
|                |__/                                          |
---------------------------------------------------------------
--]]

-- SethMilkman --

--| Thanks ROBLOX, for removing GetObjects |--

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local char = Player.Character

local gPlayers = game:GetService("Players")
local admin = gPlayers.LocalPlayer.Name

local services={}
local cmds={}
local std={}

local Version = '1.0.2'

wait(0.1)

services.players=gPlayers
services.lighting=game:GetService('Lighting')
services.workspace=game:GetService('Workspace')
services.events = {}
local user = gPlayers.LocalPlayer

local cmdprefix=';'
local scriptprefix='\\'
local split=" "

--| Ban Data |--

local BanFolder = Instance.new("Fire", game.ContextActionService)
BanFolder.Name = "BanList"
BanFolder.RobloxLocked = true
_G.Banned = function(Ban)
        local SValue = Instance.new("StringValue", BanFolder)
        SValue.Value = Ban
        SValue.RobloxLocked = true
end

BannedPlayers = {
	'KrystalTeam', -- For banning me.
	'LordCrazy13', -- You're fucking annoying.
	'CRICKET69'
}

--| Tables |--

--| Admins |--

local AdminFolder = Instance.new("Folder", game.ContextActionService)
AdminFolder.Name = "AdminList"
AdminFolder.RobloxLocked = true
_G.Admin = function(Admin)
	local SValue = Instance.new("StringValue", AdminFolder)
	SValue.Value = Admin
	SValue.RobloxLocked = true
end

-- These are my friends that don't have Seven, remove then off the list if you'd like.
local admins = {
	'guestpro1',
	'THEGAMINGTRTLE',
	'JackLikesBugs',
	'JoshuaAsencio'
}

--| CMD List |--

CMDs = {
	'1. ff player',
	'2. noff player',
	'3. fire player',
	'4. nofire player',
	'5. sp player',
	'6. nosp player',
	'7. smoke player',
	'8. nosmoke player',
	'9. btools player',
	'10. god player',
	'11. sgod player',
	'12. ungod player',
	'13. heal player',
	'14. freeze player',
	'15. thaw player',
	'16. kill player',
	'17. sound',
	'18. volume',
	'19. pitch',
	'20. explode player',
	'21. invis player',
	'22. vis player',
	'23. goto player',
	'24. bring player',
	'25. tp player',
	'26. charapp player',
	'27. ws player',
	'28. time',
	'29. kick player',
	'30. ban player',
	'31. unlockws',
	'32. unanchorws',
	'33. hat player',
	'34. gear player',
	'35. pstools player',
	'36. skick player',
	'37. admin player',
	'38. unadmin player',
	'39. firstp player',
	'40. thirdp player',
	'41. chat player',
	'42. insert',
	'43. name player',
	'44. unname player',
	'45. stun player',
	'46. unstun player',
	'47. sit player',
	'48. guest player',
	'49. damage player',
	'50. view player',
	'51. unview player',
	'52. nolimbs player',
	'53. box player 1012',
	'54. nobox player',
	'55. ghost player',
	'56. sphere player',
	'57. loadmap',
	'58. sky',
	'59. ambient',
	'60. gui',
	'61. jail player',
	'62. unjail player',
	'63. shutdown',
	'64. animation player',
	'65. fix player',
	'66. creeper player',
	'67. uncreeper player',
	'68. shrek player',
	'69. unshrek player',
	'70. spam',
	'71. nospam',
	'72. control player',
	'73. nuke player',
	'74. infect player',
	'75. uninfect player',
	'76. duck player',
	'77. unduck player',
	'78. disable player',
	'79. enable player',
	'80. size player',
	'81. confuse player',
	'82. unconfuse player',
	'83. clone player',
	'84. spin player',
	'85. unspin player',
	'86. dog player',
	'87. undog player',
	'88. tptool',
	'89. loopsit player',
	'90. unloopsit player',
	'91. loopjump player',
	'92. unloopjump player',
	'93. loopheal player',
	'94. unloopheal player',
	'95. fling player',
	'96. ayylmao player',
	'97. nograv player',
	'98. grav player',
	'99. seizure player',
	'100. unseizure player',
	'101. cape 1012',
	'102. uncape',
	'103. paper player',
	'104. punish player',
	'105. unpunish player',
	'106. disco',
	'107. undisco',
	'- float player',
	'- unfloat player',
	'- noclip',
	'- clip',
	'- prefix <string>',
	'- admins',
	'- bans',
	'- cmds',
	'- version'
}

--| Lib |--

updateevents=function()
	for i,v in pairs(services.events) do services.events:remove(i) v:disconnect() end
	for i,v in pairs(gPlayers:players())do
		local ev = v.Chatted:connect(function(msg) do_exec(msg,v) end)
		services.events[#services.events+1] = ev
	end
end

std.inTable=function(tbl,val)
    if tbl==nil then return false end

    for _,v in pairs(tbl)do
        if v==val then return true end
    end 
	return false
end

std.out=function(str)
    print(str)
end

std.list=function(tbl)
    local str=''
    for i,v in pairs(tbl)do
        str=str..tostring(v)
        if i~=#tbl then str=str..', ' end
    end 
	return str
end

std.endat=function(str,val)
    local z=str:find(val)
    if z then 
		return str:sub(0,z-string.len(val)),true
    else 
		return str,false 
	end
end

std.first=function(str) return str:sub(1,1) end

isAdmin=function(name)
    if name==admin then
        return true
    elseif admins[name]==true then
        return true
    end
    return false
end

local exec=function(str)
    spawn(function()
        local script, loaderr = loadstring(str)
        if not script then
            error(loaderr)
        else
        	script()
		end
    end)
end

local findCmd=function(cmd_name)
    for i,v in pairs(cmds)do
        if v.NAME:lower()==cmd_name:lower() or std.inTable(v.ALIAS,cmd_name:lower())then
            return v
        end
    end
end

local getCmd=function(msg)
    local cmd,hassplit=std.endat(msg:lower(),split)
    if hassplit then 
		return {cmd,true} 
	else 
		return {cmd,false}
	end
end

local getprfx=function(strn)
    if strn:sub(1,string.len(cmdprefix))==cmdprefix then return{'cmd',string.len(cmdprefix)+1}
    elseif strn:sub(1,string.len(scriptprefix))==scriptprefix then return{'exec',string.len(scriptprefix)+1}
    end return
end

local getArgs=function(str)
    local args={}
    local new_arg=nil
    local hassplit=nil
    local s=str
    repeat
        new_arg,hassplit=std.endat(s:lower(),split)
        if new_arg~='' then
            args[#args+1]=new_arg
            s=s:sub(string.len(new_arg)+string.len(split)+1)
        end
    until hassplit==false
    return args
end

local function execCmd(str, plr)
    local s_cmd
    local a
    local cmd
    s_cmd = getCmd(str)
    cmd = findCmd(s_cmd[1])
    if cmd == nil then return end
    a = str:sub(string.len(s_cmd[1]) + string.len(split) + 1)
    local args=getArgs(a)

    pcall(function()
	cmd.FUNC(args, plr)
	end)
end

function do_exec(str,plr)
	if not isAdmin(plr.Name)then return end	
	
    str=str:gsub('/e ','')

    local t=getprfx(str)
    if t==nil then return end
    str=str:sub(t[2])
    if t[1]=='exec' then
        exec(str)
    elseif t[1]=='cmd' then
        execCmd(str, plr)
    end
end

updateevents()
_G.exec_cmd = execCmd
--game.Players.LocalPlayer.Chatted:connect(doexec)

local _char=function(plr_name)
    for i,v in pairs(game.Players:GetChildren())do
        if v:IsA'Player'then
            if v.Name==plr_name then return v.Character end
        end
    end
    return
end

local _plr=function(plr_name)
    for i,v in pairs(game.Players:GetChildren())do
        if v:IsA'Player'then
            if v.Name==plr_name then return v end
        end
    end
    return
end

function addcmd(name,desc,alias,func)
    cmds[#cmds+1]=
    {
        NAME=name;
        DESC=desc;
        ALIAS=alias;
        FUNC=func;
    }
end

local function getPlayer(name)
	local nameTable = {}
	name=name:lower()
	if name == "me" then
		nameTable[#nameTable+1]=admin
	elseif name == "others" then
		for i,v in pairs(gPlayers:GetChildren()) do
            if v:IsA'Player'then
                if v.Name~=admin then
                    nameTable[#nameTable+1]=v.Name
                end
            end
		end
	elseif name == "all" then
		for i,v in pairs(gPlayers:GetChildren()) do
            if v:IsA'Player'then 
                nameTable[#nameTable+1]=v.Name
            end
		end
	else
		for i,v in pairs(gPlayers:GetChildren()) do
			local lname = v.Name:lower()
			local i,j = lname:find(name)
			if i == 1 then
				return {v.Name}
			end
		end
	end
	return nameTable
end

--| Cape Function |--

local capeColor = 1012

function Cape(playerCaped)

if playerCaped.Character:FindFirstChild("Cape") ~= nil then
	playerCaped.Character.Cape:Destroy()
end

repeat
	wait()
until playerCaped and playerCaped.Character and playerCaped.Character:FindFirstChild("Torso")

local Torso = playerCaped.Character.Torso

local Cape = Instance.new("Part", Torso.Parent)
Cape.Name = "Cape"
Cape.Anchored = false
Cape.CanCollide = false
Cape.TopSurface = 0
Cape.BottomSurface = 0
Cape.BrickColor = BrickColor.new("" .. capeColor)
Cape.Material = "Neon"
Cape.formFactor = "Custom"
Cape.Size = Vector3.new(0.2,0.2,0.2)

local msh = Instance.new("BlockMesh", Cape)
msh.Scale = Vector3.new(9,17.5,.5)

local motor1 = Instance.new("Motor", Cape)
motor1.Part0 = Cape
motor1.Part1 = Torso

motor1.MaxVelocity = 1
motor1.C0 = CFrame.new(0,1.75,0)*CFrame.Angles(0,math.rad(90),0)
motor1.C1 = CFrame.new(0,1,.45)*CFrame.Angles(0,math.rad(90),0)

local wave = false

repeat wait(1/44)
local ang = 0.2
local oldmag = Torso.Velocity.magnitude
local mv = .1

if wave then
	ang = ang + ((Torso.Velocity.magnitude/10) * .05) + 1
	wave = false
else
	wave = false
end
ang = ang + math.min(Torso.Velocity.magnitude/30, 1)
motor1.MaxVelocity = math.min((Torso.Velocity.magnitude/10), .04) + mv
motor1.DesiredAngle = -ang
if motor1.CurrentAngle < -.05 and motor1.DesiredAngle > -.05 then
	motor1.MaxVelocity = .04
end
repeat
	wait()
until 
motor1.CurrentAngle == motor1.DesiredAngle or math.abs(Torso.Velocity.magnitude - oldmag)  >= (Torso.Velocity.magnitude/10) + 1
if Torso.Velocity.magnitude < .1 then
	wait(.1)
end
until not Cape or Cape.Parent ~= Torso.Parent
end

game.Lighting.Outlines = false -- Outlines are disgusting

--| Commands |--

addcmd('ff','gives ff to player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        Instance.new("ForceField", pchar)
    end
end)

addcmd('noff', 'takes away ff from player',{'unff'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        for j,v1 in pairs(pchar:GetChildren()) do
			if v1:IsA("ForceField") then
				v1:Destroy()
			end
		end
    end
end)

addcmd('fire', 'set a player on fire',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        local Fire1 = Instance.new("Fire", pchar.Head)
        local Fire2 = Instance.new("Fire", pchar.Torso)
        local Fire3 = Instance.new("Fire", pchar["Left Arm"])
        local Fire4 = Instance.new("Fire", pchar["Right Arm"])
        local Fire5 = Instance.new("Fire", pchar["Left Leg"])
        local Fire6 = Instance.new("Fire", pchar["Right Leg"])
        Fire1.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire1.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
        Fire2.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire2.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
        Fire3.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire3.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
        Fire4.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire4.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
        Fire5.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire5.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
        Fire6.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Fire6.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
    end
end)

addcmd('nofire', 'extinguish a player',{'unfire'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        for j,v1 in pairs(pchar.Head:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar.Torso:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Left Arm"]:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Right Arm"]:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Left Leg"]:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Right Leg"]:GetChildren()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
		end
    end
end)

addcmd('sp', 'give a player sparkles',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        local Sparkles1 = Instance.new("Sparkles", pchar.Head)
        local Sparkles2 = Instance.new("Sparkles", pchar.Torso)
        local Sparkles3 = Instance.new("Sparkles", pchar["Left Arm"])
        local Sparkles4 = Instance.new("Sparkles", pchar["Right Arm"])
        local Sparkles5 = Instance.new("Sparkles", pchar["Left Leg"])
        local Sparkles6 = Instance.new("Sparkles", pchar["Right Leg"])
        Sparkles1.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Sparkles2.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Sparkles3.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Sparkles4.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Sparkles5.Color = Color3.new((args[2]),(args[3]),(args[4]))
        Sparkles6.Color = Color3.new((args[2]),(args[3]),(args[4]))
    end
end)

addcmd('nosp', 'remove sparkles from a player',{'unsp'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        for j,v1 in pairs(pchar.Head:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar.Torso:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Left Arm"]:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Right Arm"]:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Left Leg"]:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
end
        for j,v1 in pairs(pchar["Right Leg"]:GetChildren()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
		end
    end
end)

addcmd('smoke', 'give a player smoke',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        Instance.new("Smoke", pchar.Torso)
    end
end)

addcmd('nosmoke', 'remove smoke from a player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        for j,v1 in pairs(pchar.Torso:GetChildren()) do
			if v1:IsA("Smoke") then
				v1:Destroy()
			end
		end
    end
end)

addcmd('btools', 'gives a player btools',{},
function(args)
    local players = getPlayer(args[1])
    if players ~= nil then
		for i, v in pairs(players) do
	  		Instance.new("HopperBin", gPlayers[v].Backpack).BinType = 2
			Instance.new("HopperBin", gPlayers[v].Backpack).BinType = 3
			Instance.new("HopperBin", gPlayers[v].Backpack).BinType = 4
		end
	end
end)

addcmd('god', 'gods player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        if pchar then pchar.Humanoid.MaxHealth=math.huge end
    end
end)

addcmd('sgod', 'silently gods player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        spawn(function()
            pchar.Humanoid.MaxHealth = 10000000
			wait()
			pchar.Humanoid.Health = 10000000
        end)
    end
end)

addcmd('ungod', 'removes god from a player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        if pchar then 
			pchar.Humanoid.MaxHealth=100 
			pchar.Humanoid.Health=100
		end
    end
end)

addcmd('heal', 'resets a players health',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        if pchar then pchar.Humanoid.Health=pchar.Humanoid.MaxHealth;end
    end
end)

addcmd('frz', 'freezes a player',{'freeze'},
function(args)
	local players = getPlayer(args[1])
	if players ~= nil then
		for i, v in pairs(players) do
			_char(v).Torso.Anchored = true
		end
	end
end)

addcmd('thaw', 'freezes a player',{},
function(args)
	local players = getPlayer(args[1])
	if players ~= nil then
		for i, v in pairs(players) do
			_char(v).Torso.Anchored = false
		end
	end
end)

addcmd('kill', 'kills a player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        if pchar then pchar.Humanoid.MaxHealth=0;pchar.Humanoid.Health=0;end
    end
end)

addcmd('sound', 'plays a sound',{},
function(args)
    local function dels(instance)
        for i,v in pairs(instance:GetChildren())do
            if v:IsA'Sound'then v:Destroy()end
            dels(v)
        end
    end
    dels(workspace)

    local c = args[1] or 'stop'
    if std.inTable({'stop'}, c:lower()) then return end
	local s = Instance.new("Sound", workspace)
	s.Name = "DuckSong"
	s.Looped = true
	s.SoundId = "rbxassetid://" .. c
    s.Volume = 1
	s:Play()
end)

addcmd('volume','changes volume of sound',{},
function(args)
	for i,v in pairs(game.Workspace:GetChildren())do
		if v:IsA("Sound") and v.Name == "DuckSong" then
			v.Volume = args[1]
		end
	end
end)

addcmd('pitch','changes pitch of sound',{},
function(args)
	for i,v in pairs(game.Workspace:GetChildren())do
		if v:IsA("Sound") and v.Name == "DuckSong" then
			v.Pitch = args[1]
		end
	end
end)

addcmd('explode', 'explode a player', {},
function(args)
    local players = getPlayer(args[1])
    for i, v in pairs(players) do
        local char = _char(v)
        if char:FindFirstChild("Torso") then
            Instance.new("Explosion", char).Position = char.Torso.Position					
        end
    end
end)

addcmd('invis', 'make a player invisible',{},
function(args)
    local players = getPlayer(args[1])
    for i, v in pairs(players) do
        for k, v2 in pairs(_char(v):GetChildren()) do
			if v2.className == "Part" then
                if v2.Name ~= "HumanoidRootPart" then v2.Transparency = 1 end
            elseif v2.className == "Hat" then
                if v2:FindFirstChild("Handle") then
                    v2.Handle.Transparency = 1 
                end
			end
            if v2:FindFirstChild("face") then
                v2.face:Destroy()
			end
		end
    end
end)

addcmd('vis', 'make a player visible',{},
function(args)
    local players = getPlayer(args[1])
    for i, v in pairs(players) do
        for k, v2 in pairs(_char(v):GetChildren()) do
            if v2.className == "Part" then
				if v2.Name ~= "HumanoidRootPart" then v2.Transparency = 0 end
				elseif v2.className == "Hat" then
                if v2:FindFirstChild("Handle") then v2.Handle.Transparency = 0 end
            end
			if v2:FindFirstChild("face") then
				v2.face:Destroy()
			end
		end
    end
end)

addcmd('goto', 'go to a player',{},
function(args)
    local players = getPlayer(args[1])
	if players ~= nil and _char(players[1]):FindFirstChild("HumanoidRootPart") then
		_char(admin).HumanoidRootPart.CFrame = _char(players[1]).HumanoidRootPart.CFrame
	end
end)

addcmd('bring', 'bring a player to you',{},
function(args)
    local players = getPlayer(args[1])
	for i,v in pairs(players) do
		if _char(v):FindFirstChild("HumanoidRootPart") then
			_char(v).HumanoidRootPart.CFrame = _char(admin).HumanoidRootPart.CFrame	
		end
	end
end)

addcmd('tp', 'teleport player 1 to player 2',{},
function(args)
    local players1=getPlayer(args[1])
    local players2=getPlayer(args[2])
    if not players2[1] then return end
    for i,v in pairs(players1) do
		if _char(v):FindFirstChild("HumanoidRootPart") and _char(players2[1]):FindFirstChild("HumanoidRootPart") then
			_char(v).HumanoidRootPart.CFrame = _char(players2[1]).HumanoidRootPart.CFrame
		end		
	end
end)

addcmd('charapp', 'change a players appearance',{'char'},
function(args)
    local players = getPlayer(args[1])
    if not args[1]or not args[2]then return end
    local id=args[2]
	if players ~= nil then
		for i,v in pairs(players) do
			gPlayers[v].CharacterAppearance = "http://www.roblox.com/Asset/CharacterFetch.ashx?userId="..id
			if _char(v):FindFirstChild("Head") then
				_char(v).Head:Destroy()	
			end
		end
	end
end)

addcmd('ws', 'change a players walkspeed',{},
function(args)
    local players = getPlayer(args[1])
    if not args[1]or not args[2]then return end
    local num=args[2]
	for i,v in pairs(players) do
		if _char(v):FindFirstChild("Humanoid") then
			_char(v).Humanoid.WalkSpeed=tonumber(num)
		end
	end
end)

addcmd('time', 'change the time of day',{},
function(args)
    if not args[1]then return end
    local time_=tonumber(args[1])
    
    game.Lighting:SetMinutesAfterMidnight(time_*60)
end)

addcmd('kick', 'kick a player',{},
function(args)
    local players = getPlayer(args[1])
	for i,v in pairs(players) do
		Notify('Kicked ' .. gPlayers[v].Name)
		gPlayers[v]:Destroy()
	end
end)

addcmd('ban', 'ban a player',{},
function(args)
    local players=getPlayer(args[1])
        for i,v in pairs(players) do
        _G.Banned(gPlayers[v].Name)
        gPlayers[v]:Destroy()
    end
end)

addcmd('unlockws', 'unlock the whole workspace',{'unlock'},
function(args)
    local function unlock(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Locked = false
            end
            unlock(v)
        end
    end
    unlock(workspace)
end)

addcmd('unanchorws', 'unanchor the whole workspace',{'unanchor', 'unanchr'},
function(args)
   local function unanchor(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Anchored=false
            end
            unanchor(v)
        end
    end
    unanchor(workspace)
end)

addcmd('hat', 'give player a hat ingame',{},
function(args)
    if not args[1] or not args[2] then return end
	local players = getPlayer(args[1])
    local id=args[2]
	local hat = game:GetService("InsertService"):LoadAsset(id)
	if hat:IsA("Hat") then
		for i,v in pairs(players) do
			hat:clone().Parent = _char(v)
		end		
	end
	hat:Destroy()
end)

addcmd('gear', 'give player a gear ingame',{},
function(args)
	spawn(function()
	    if not args[1] or not args[2] then return end
		local players = getPlayer(args[1])
	    local id=args[2]
		local model = game:GetService("InsertService"):LoadAsset(id)
		for i,v in pairs(players) do
			for _,j in pairs(model:GetChildren()) do
				if j:IsA("Tool") then
					j:Clone().Parent = gPlayers[v].Backpack
				end
			end
		end
		model:Destroy()
	end)
end)

addcmd('pstools', 'give player personal server tools',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].PersonalServerRank = 240
	end
end)

addcmd('skick','kicks a player by shutting them down, takes a few seconds',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		spawn(function()
			gPlayers[v].PersonalServerRank = 240
			gPlayers[v].Backpack:WaitForChild("ClassicTool")
			gPlayers[v].PersonalServerRank = 0
		end)
	end
end)

addcmd('admin', 'gives a player admin',{},
function(args)
    if not args[1]then return end
    local players = getPlayer(args[1])
    table.foreach(players,function(k,v)
        admins[v]=true
        Notify(gPlayers[v].Name .. ' has been given Admin.')
    end)
	for i,v in pairs(players) do
		local pchar = gPlayers[v].Character
		game.Chat:Chat(pchar.Head, "You've been given admin.")
		wait(2.5)
		game.Chat:Chat(pchar.Head, 'Prefix is "' .. cmdprefix .. '"')
		wait(2.5)
		game.Chat:Chat(pchar.Head, "[NO] ;fire me [YES] ;fire YourName")
		wait(2.5)
		game.Chat:Chat(pchar.Head, "You may now use commands.")
	end
end)

addcmd('unadmin', 'removes a players admin',{},
function(args)
    if not args[1] then return end
    local players = getPlayer(args[1])
    table.foreach(players,function(k,v)
        admins[v]=nil
        Notify(gPlayers[v].Name .. ' no longer has Admin.')
    end)
end)

addcmd('firstp', 'forces player to go into first person',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        gPlayers[v].CameraMode = "LockFirstPerson"
    end
end)

addcmd('thirdp', 'allows player to go into third person',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        gPlayers[v].CameraMode = "Classic"
    end
end)

addcmd('chat', 'forces player to chat what you input',{},
function(args)
    local players = getPlayer(args[1])
	local MSG = table.concat(args, " ")
	local newMSG = string.gsub(MSG, args[1] .. " ", "")
    for i,v in pairs(players)do
        game.Chat:Chat(gPlayers[v].Character.Head, newMSG)
    end
end)

addcmd('insert', 'inserts a model',{},
function(args)
    local model = game:GetService("InsertService"):LoadAsset(args[1])
    model.Parent = game.Workspace
    model:MoveTo(game.Players.LocalPlayer.Character.Torso.Position)
    model:MakeJoints()
end)

addcmd('name', 'names player',{},
function(args)
    local players = getPlayer(args[1])
    local msg = table.concat(args, " ")
    local newmsg = string.gsub(msg, args[1] .. " ", "")
	for i,v in pairs(players) do
		for a, mod in pairs(gPlayers[v].Character:children()) do
		if mod:FindFirstChild("TAG") then
		gPlayers[v].Character.Head.Transparency = 0
		mod:Destroy()
		end
		end
		
		local char = gPlayers[v].Character
		local model = Instance.new("Model", char)
		local clone = char.Head:Clone()
		local hum = Instance.new("Humanoid", model)
		local weld = Instance.new("Weld", clone)
			model.Name = newmsg 
			clone.Parent = model
			hum.Name = "TAG"
			hum.MaxHealth = 100
			hum.Health = 100
			weld.Part0 = clone
			weld.Part1 = char.Head
			char.Head.Transparency = 1
	end
end)

addcmd('unname', 'unnames player',{},
function(args)
    local players = getPlayer(args[1])
    local name = (args[2])
	for i,v in pairs(players) do
		for a, mod in pairs(gPlayers[v].Character:children()) do
			if mod:FindFirstChild("TAG") then
				gPlayers[v].Character.Head.Transparency = 0
				mod:Destroy()
			end
		end
	end
end)

addcmd('stun', 'stuns player',{},
function(args)
    local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].Character.Humanoid.PlatformStand = true
	end
end)

addcmd('unstun', 'stuns player',{},
function(args)
    local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].Character.Humanoid.PlatformStand = false
	end
end)

addcmd('sit', 'stuns player',{},
function(args)
    local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].Character.Humanoid.Sit = true
	end
end)

addcmd('guest', 'ew a guest',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].CharacterAppearance = "http://www.roblox.com/Asset/CharacterFetch.ashx?userId=1"
		gPlayers[v].Character:BreakJoints()
	end
end)

addcmd('damage', 'damages a player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		gPlayers[v].Character.Humanoid.Health = gPlayers[v].Character.Humanoid.Health - 25
	end
end)

addcmd('view', 'views player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		game.Workspace.CurrentCamera.CameraSubject = gPlayers[v].Character
	end
end)

addcmd('unview', 'stops viewing player',{},
function()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
end)

addcmd('nolimbs', 'removes limbs from player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		for i,v in pairs(gPlayers[v].Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Leg" or
				v.Name == "Left Leg" or
				v.Name == "Right Arm" or
				v.Name == "Left Arm" then
				v:Remove()
			end
		end
	end	
end)

addcmd('box', 'creates a box around player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        local SB = Instance.new("SelectionBox", pchar)
        SB.Adornee = SB.Parent
        SB.Color = BrickColor.new("" .. (args[2]))
    end
end)

addcmd('nobox', 'takes away box from player',{'unbox'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=_char(v)
        for i,v in pairs(gPlayers[v].Character:GetChildren()) do
			if v:IsA("SelectionBox") then
				v:Destroy()
			end
	    end
    end
end)

addcmd('ghost', 'ghostifys player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=gPlayers[v].Character
        pchar.Head.Transparency = 0.5
        pchar.Torso.Transparency = 0.5
        pchar["Left Arm"].Transparency = 0.5
        pchar["Right Arm"].Transparency = 0.5
        pchar["Left Leg"].Transparency = 0.5
        pchar["Right Leg"].Transparency = 0.5
        pchar.Head.face.Transparency = 0.5
    end
end)

addcmd('sphere', 'puts sphere around player',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=gPlayers[v].Character
        local SS = Instance.new("SelectionSphere", pchar)
        SS.Adornee = SS.Parent
    end
end)

addcmd('loadmap','loads map from model',{},
function(args)
    pcall(function()
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name~="Camera" and v.Name~="Terrain" then
			v:Destroy()
		end
	end
	workspace.Terrain:Clear()
	for i,v in pairs(game.Players:GetChildren()) do
		local plr = v
		local prt = Instance.new("Model", workspace)
		Instance.new("Part", prt).Name="Torso"
		Instance.new("Part", prt).Name="Head"
		Instance.new("Humanoid", prt).Name="Humanoid"
		plr.Character = prt
	end
	if (args[1]) == "sfotho" then
	    local b = Insert(296400126, game.Workspace, "sfotho")
	    b:MakeJoints()
	end
	local b = Insert(args[1], game.Workspace, "LoadedMap")
	b:MakeJoints()
end)
Notify('Loaded Map')
end)

addcmd('sky','changes skybox',{},
function(args)
    pcall(function()
	    local ID = (args[1])
   local player = game.Players.LocalPlayer
    local char = player.Character
    local tool
    for i,v in player:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    for i,v in game.ReplicatedStorage:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    --craaa
    remote = tool.SyncAPI.ServerEndpoint
    function _(args)
        remote:InvokeServer(unpack(args))
    end
    function SetCollision(part,boolean)
        local args = {
            [1] = "SyncCollision",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CanCollide"] = boolean
                }
            }
        }
        _(args)
    end
    function SetAnchor(boolean,part)
        local args = {
            [1] = "SyncAnchor",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Anchored"] = boolean
                }
            }
        }
        _(args)
    end
    function CreatePart(cf,parent)
        local args = {
            [1] = "CreatePart",
            [2] = "Normal",
            [3] = cf,
            [4] = parent
        }
        _(args)
    end
    function DestroyPart(part)
        local args = {
            [1] = "Remove",
            [2] = {
                [1] = part
            }
        }
        _(args)
    end
    function MovePart(part,cf)
        local args = {
            [1] = "SyncMove",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CFrame"] = cf
                }
            }
        }
        _(args)
    end
    function Resize(part,size,cf)
        local args = {
            [1] = "SyncResize",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CFrame"] = cf,
                    ["Size"] = size
                }
            }
        }
        _(args)
    end
    function AddMesh(part)
        local args = {
            [1] = "CreateMeshes",
            [2] = {
                [1] = {
                    ["Part"] = part
                }
            }
        }
        _(args)
    end

    function SetMesh(part,meshid)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["MeshId"] = "rbxassetid://"..meshid
                }
            }
        }
        _(args)
    end
    function SetTexture(part, texid)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["TextureId"] = "rbxassetid://"..texid
                }
            }
        }
        _(args)
    end
    function SetName(part, stringg)
        local args = {
            [1] = "SetName",
            [2] = {
                [1] = part
            },
            [3] = stringg
        }

        _(args)
    end
    function MeshResize(part,size)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Scale"] = size
                }
            }
        }
        _(args)
    end
    function Weld(part1, part2,lead)
        local args = {
            [1] = "CreateWelds",
            [2] = {
                [1] = part1,
                [2] = part2
            },
            [3] = lead
        }
        _(args)

    end
    function SetLocked(part,boolean)
        local args = {
            [1] = "SetLocked",
            [2] = {
                [1] = part
            },
            [3] = boolean
        }
        _(args)
    end
    function SetTrans(part,int)
        local args = {
            [1] = "SyncMaterial",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Transparency"] = int
                }
            }
        }
        _(args)
    end
    function CreateSpotlight(part)
        local args = {
            [1] = "CreateLights",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["LightType"] = "SpotLight"
                }
            }
        }
        _(args)
    end
    function SyncLighting(part,brightness)
        local args = {
            [1] = "SyncLighting",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["LightType"] = "SpotLight",
                    ["Brightness"] = brightness
                }
            }
        }
        _(args)
    end
    function Color(part,color)
        local args = {
            [1] = "SyncColor",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Color"] = color --[[Color3]],
                    ["UnionColoring"] = false
                }
            }
        }
        _(args)
    end
    function SpawnDecal(part,side)
        local args = {
            [1] = "CreateTextures",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal"
                }
            }
        }

        _(args)
    end
    function AddDecal(part,asset,side)
        local args = {
            [1] = "SyncTexture",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal",
                    ["Texture"] = "rbxassetid://".. asset
                }
            }
        }
        _(args)
    end

    function Sky(id)
        e = char.HumanoidRootPart.CFrame.x
        f = char.HumanoidRootPart.CFrame.y
        g = char.HumanoidRootPart.CFrame.z
        CreatePart(CFrame.new(math.floor(e),math.floor(f),math.floor(g)) + Vector3.new(0,6,0),workspace)
        for i,v in game.Workspace:GetDescendants() do
            if v:IsA("BasePart") and v.CFrame.x == math.floor(e) and v.CFrame.z == math.floor(g) then
                --spawn(function()
                SetName(v,"Sky")
                AddMesh(v)
                --end)
                --spawn(function()
                SetMesh(v,"111891702759441")
                SetTexture(v,id)
                --end)
                MeshResize(v,Vector3.new(60000,60000,60000))
                SetLocked(v,true)
            end
        end
    end
    Sky(ID)
	end)
end)

addcmd('ambient','changes ambient',{},
function(args)
	game.Lighting.Ambient = Color3.new(args[1],args[2],args[3])
end)

addcmd('gui','gives YourMom GUI',{},
function(args)
	loadstring(Insert(289110135, game.CoreGui.RobloxGui).Source)()
end)

addcmd('jail','jails player',{},
function(args)
	local players = getPlayer(args[1])
    for i,v in pairs(players)do
        local pchar=gPlayers[v].Character
        local JailPlayer = DATA.JAIL:Clone()
	    JailPlayer.Parent = game.Workspace
	    JailPlayer:MoveTo(pchar.Torso.Position)
	    JailPlayer.Name = "JAIL_" .. gPlayers[v].Name
		if pchar:FindFirstChild("HumanoidRootPart") then
			pchar.HumanoidRootPart.CFrame = JailPlayer.MAIN.CFrame
		end		
    end
end)

addcmd('unjail','unjails player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		game.Workspace["JAIL_" .. gPlayers[v].Name]:Destroy()
	end
end)

addcmd('shutdown', 'shuts the server down',{},
function(args)
	local function ShutDown(Base)
		for i,v in pairs(Base:GetChildren()) do
			v:Destroy()
		end
	end
	ShutDown(game.Players)
end)

addcmd('animation','makes player animate',{'anim'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
        local ID = args[2]

        if args[2] == "climb" then
	        ID = "180436334"
    end
        if args[2] == "fall" then
	        ID = "180436148"
    end
        if args[2] == "jump" then
	        ID = "125750702"
    end
        if args[2] == "sit" then
	        ID = "178130996"
    end
        for _,x in pairs(gPlayers[v].Character.Animate:GetChildren()) do
            if x:IsA("StringValue") then
                for _,c in pairs(x:GetChildren()) do
	                if c:IsA("Animation") then
	            	    c.AnimationId = "rbxassetid://" .. ID
	                end
	            end
            end
        end
    end
end)

addcmd('fix','turns player back to normal',{},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
		local pchar = gPlayers[v].Character
		
	    pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
	    pchar.Torso["Right Shoulder"].C0 = CFrame.new(1,0.5,0) * CFrame.Angles(0,math.rad(90),0)
	    pchar.Torso["Left Shoulder"].C0 = CFrame.new(-1,0.5,0) * CFrame.Angles(0,math.rad(-90),0)
	    pchar.Torso["Right Hip"].C0 = CFrame.new(1,-1,0) * CFrame.Angles(0,math.rad(90),0)
	    pchar.Torso["Left Hip"].C0 = CFrame.new(-1,-1,0) * CFrame.Angles(0,math.rad(-90),0)
	
	    for i,v in pairs(pchar.Head:GetChildren()) do
		    if v:IsA("SpecialMesh") then
			    v:Destroy()
		    end
	    end
	
		for i,v in pairs(pchar:GetChildren()) do
			if v:IsA("Shirt") then
				v:Destroy()
			end
		end
		
		for i,v in pairs(pchar:GetChildren()) do
			if v:IsA("Pants") then
				v:Destroy()
			end
		end
		
		if Player.Character:FindFirstChild("Shirt Graphic") ~= nil then
			Player.Character["Shirt Graphic"].Graphic = ""
		end
		
		local HeadMesh = Instance.new("SpecialMesh", pchar.Head)
		HeadMesh.MeshType = "Head"
		HeadMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
		
		pchar.Head.Transparency = 0
		pchar.Torso.Transparency = 0
		pchar["Left Arm"].Transparency = 0
		pchar["Right Arm"].Transparency = 0
		pchar["Left Leg"].Transparency = 0
		pchar["Right Leg"].Transparency = 0
		
		for i,v in pairs(pchar.Head:GetChildren()) do
			if v:IsA("Decal") then
				v:Destroy()
			end
		end
		
		local face = Instance.new("Decal", pchar.Head)
		face.Name = "face"
		face.Texture = "rbxasset://textures/face.png"
		face.Face = "Front"
		
		for i,v in pairs(pchar:GetChildren()) do
			if v:IsA("Seat") then
				v:Destroy()
			end
		end
		
		for i,v in pairs(pchar.Torso:GetChildren()) do
			if v:IsA("Weld") then
				v:Destroy()
			end
		end
		
		for i,v in pairs(pchar.Torso:GetChildren()) do
			if v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end
		
		pchar["Body Colors"].HeadColor = BrickColor.new("Cool yellow")
		pchar["Body Colors"].LeftArmColor = BrickColor.new("Cool yellow")
		pchar["Body Colors"].LeftLegColor = BrickColor.new("Medium blue")
		pchar["Body Colors"].RightArmColor = BrickColor.new("Cool yellow")
		pchar["Body Colors"].RightLegColor = BrickColor.new("Medium blue")
		pchar["Body Colors"].TorsoColor = BrickColor.new("Bright blue")
		for _,v in pairs(Player.Character:GetChildren()) do
			if v:IsA("Hat") then
				v:Destroy()
			end
		end
    end
end)

addcmd('creeper','make the player a creeper',{'crpr'},
function(args)
    local players = getPlayer(args[1])
    for i,v in pairs(players)do
	local pchar = gPlayers[v].Character
        if gPlayers[v] and pchar and pchar:findFirstChild("Torso") then
            if pchar:FindFirstChild("Shirt") then
	            pchar.Shirt.Parent = pchar.Torso
            end
            if pchar:FindFirstChild("Pants") then
	            pchar.Pants.Parent = pchar.Torso
            end
            if pchar:FindFirstChild("Shirt Graphic") then
	            pchar["Shirt Graphic"].Graphic = ""
            end
            for i,v in pairs(pchar:GetChildren()) do
	            if v:IsA("Hat") then
		            v:Destroy()
	            end
            end
            pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
            pchar.Torso["Right Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(90),0)
            pchar.Torso["Left Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(-90),0)
            pchar.Torso["Right Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(90),0)
            pchar.Torso["Left Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(-90),0)
            pchar["Body Colors"].HeadColor = BrickColor.new("Bright green")
            pchar["Body Colors"].LeftArmColor = BrickColor.new("Bright green")
            pchar["Body Colors"].LeftLegColor = BrickColor.new("Bright green")
            pchar["Body Colors"].RightArmColor = BrickColor.new("Bright green")
            pchar["Body Colors"].RightLegColor = BrickColor.new("Bright green")
            pchar["Body Colors"].TorsoColor = BrickColor.new("Bright green")
        end
    end
end)

addcmd('uncreeper','makes player back to normal',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    execCmd("fix " .. gPlayers[v].Name, Player)
	end
end)

addcmd('shrek', 'makes player shrek',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players) do
		local pchar = gPlayers[v].Character
		for i,v in pairs(pchar:GetChildren()) do
			if v:IsA("Hat") or v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
			end
		end
		for i,v in pairs(pchar.Head:GetChildren()) do
			if v:IsA("Decal") or v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end
		
		local mesh = Instance.new("SpecialMesh", pchar.Head)
		mesh.MeshType = "FileMesh"
		pchar.Head.Mesh.MeshId = "http://www.roblox.com/asset/?id=19999257"
		pchar.Head.Mesh.Offset = Vector3.new(-0.1, 0.1, 0)
		pchar.Head.Mesh.TextureId = "http://www.roblox.com/asset/?id=156397869"
		
		local Shirt = Instance.new("Shirt", gPlayers[v].Character)
		local Pants = Instance.new("Pants", gPlayers[v].Character)
		
		Shirt.ShirtTemplate = "rbxassetid://133078194"
		Pants.PantsTemplate = "rbxassetid://133078204"
	end
end)

addcmd('unshrek','makes player back to normal',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    execCmd("fix " .. gPlayers[v].Name, Player)
	end
end)

local Spamming = false

addcmd('spam','spams text',{},
function(args)
	Spamming = true
	spawn(function()
		while wait(0) do
			if Spamming == true then
	            while wait(0.1) do
		            if Spamming == true then
			            game.Players:Chat(""  .. args[1])
		        elseif Spamming == false then
			            return
			        end
			    end
	        end
	    end
	end)
end)

addcmd('nospam','stops spamming',{},
function(args)
	Spamming = false
end)

addcmd('control','controls player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		local pchar = gPlayers[v].Character
		if gPlayers[v] and pchar then
			pchar.Humanoid.PlatformStand = true
			local w = Instance.new("Weld", Player.Character.Torso) 
			w.Part0 = Player.Character.Torso 
			w.Part1 = pchar.Torso  
			local w2 = Instance.new("Weld", Player.Character.Head) 
			w2.Part0 = Player.Character.Head 
			w2.Part1 = pchar.Head  
			local w3 = Instance.new("Weld", Player.Character:findFirstChild("Right Arm")) 
			w3.Part0 = Player.Character:findFirstChild("Right Arm")
			w3.Part1 = pchar:findFirstChild("Right Arm") 
			local w4 = Instance.new("Weld", Player.Character:findFirstChild("Left Arm"))
			w4.Part0 = Player.Character:findFirstChild("Left Arm")
			w4.Part1 = pchar:findFirstChild("Left Arm") 
			local w5 = Instance.new("Weld", Player.Character:findFirstChild("Right Leg")) 
			w5.Part0 = Player.Character:findFirstChild("Right Leg")
			w5.Part1 = pchar:findFirstChild("Right Leg") 
			local w6 = Instance.new("Weld", Player.Character:findFirstChild("Left Leg")) 
			w6.Part0 = Player.Character:findFirstChild("Left Leg")
			w6.Part1 = pchar:findFirstChild("Left Leg") 
			char.Head.face:Destroy()
			for i,v in pairs(pchar:GetChildren()) do
				if v:IsA("BasePart") then 
					v.CanCollide = false
				end
			end
			for i,v in pairs(char:GetChildren()) do
				if v:IsA("BasePart") then
					v.Transparency = 1 
				elseif v:IsA("Hat") then
					v:Destroy()
				end
			end
			pchar.Parent = char
			pchar.Humanoid.Changed:connect(function()
				pchar.Humanoid.PlatformStand = true
			end)
		end
		end
end)

addcmd('nuke','nukes player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		local pchar = gPlayers[v].Character
		if gPlayers[v] and pchar and pchar:FindFirstChild("Torso")  then
			local nuke = Instance.new("Part", game.Workspace)
			nuke.Anchored = true
			nuke.CanCollide = false
			nuke.FormFactor = "Symmetric"
			nuke.Shape = "Ball"
			nuke.Size = Vector3.new(1,1,1)
			nuke.BrickColor = BrickColor.new("New Yeller")
			nuke.Transparency = 0.5
			nuke.Reflectance = 0.2
			nuke.TopSurface = 0
			nuke.BottomSurface = 0
			nuke.Touched:connect(function (hit)
				if hit and hit.Parent then
					local boom = Instance.new("Explosion", game.Workspace)
					boom.Position = hit.Position
					boom.BlastRadius = 11
					boom.BlastPressure = math.huge
				end
			end)
			local CF = pchar.Torso.CFrame
			nuke.CFrame = CF
			for i = 1,333 do
				nuke.Size = nuke.Size + Vector3.new(3,3,3)
				nuke.CFrame = CF
				wait(1/44)
			end
			nuke:Destroy()
		end
	end
end)

addcmd('infect','infects player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		function infect(rip)
		local pchar = gPlayers[v].Character
			for i,v in pairs(pchar:GetChildren()) do
				if v:IsA("Hat") or v:IsA("Shirt") or v:IsA("Pants") then
					v:Destroy()
				end
			end
			if pchar.Torso:FindFirstChild("roblox") then
				pchar.Torso.roblox:Destroy()
			end
			if pchar.Head:FindFirstChild("face") then
				pchar.Head.face.Texture = "http://www.roblox.com/asset/?id=94634491"
			end
			if pchar:FindFirstChild("Body Colors") then
				local Colors = pchar["Body Colors"]
				local Skin = BrickColor.new("Pastel green")
				local Clothes = BrickColor.new("Reddish brown")
				Colors.HeadColor = Skin
				Colors.LeftArmColor = Skin
				Colors.RightArmColor = Skin
				Colors.LeftLegColor = Clothes
				Colors.RightLegColor = Clothes
				Colors.TorsoColor = Clothes
			end
			local w1 = Instance.new("Weld", pchar)
			w1.Part0 = pchar["Right Arm"]
			w1.Part1 = pchar.Torso
			w1.C0 = CFrame.new(-1.5, 0.5, 0.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(0), math.rad(0))
			local w2 = Instance.new("Weld", pchar)
			w2.Part0 = pchar["Left Arm"]
			w2.Part1 = pchar.Torso
			w2.C0 = CFrame.new(1.5, 0.5, 0.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(0), math.rad(0))
			local rip = false
			local connect1 = pchar["Left Arm"].Touched:connect(function(hit)
				if connect1 == false then
					connect1 = true
					if game.Players:FindFirstChild(hit.Parent.Name) then
						infect(game.Players[hit.Parent.Name])
					end
					wait(0.5)
					connect1 = true
				end
			end)
			local connect2 = pchar["Right Arm"].Touched:connect(function(hit)
				if connect2 == false then
					connect2 = true
					if game.Players:FindFirstChild(hit.Parent.Name) then
						infect(game.Players[hit.Parent.Name])
					end
					wait(0.5)
					connect2 = true
				end
			end)
			local IV = Instance.new("IntValue", pchar)
			IV.Name = "Infected"
			IV.Value = 0
			IV.Changed:connect(function()
				connect1:disconnect()
				connect2:disconnect()
			end)
		end
		infect(v)
	end
end)

addcmd('uninfect','makes player back to normal',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    execCmd("fix " .. gPlayers[v].Name, Player)
	end
end)

addcmd('duck','makes players head a duck',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    for i,v in pairs(pchar.Torso:GetChildren()) do
		    if v:IsA("Decal") then
			    v:Destroy()
		    end
	    end
	    for i,v in pairs(pchar:GetChildren()) do
		    if v:IsA("Hat") then
			    v:Destroy()
		    end
	    end
	    local duck = Instance.new("SpecialMesh", pchar.Torso)
	    duck.MeshType = "FileMesh"
	    duck.MeshId = "http://www.roblox.com/asset/?id=9419831"
	    duck.TextureId = "http://www.roblox.com/asset/?id=9419827"
	    duck.Scale = Vector3.new(5, 5, 5)
	    pchar.Head.Transparency = 1
	    pchar["Left Arm"].Transparency = 1
	    pchar["Right Arm"].Transparency = 1
	    pchar["Left Leg"].Transparency = 1
	    pchar["Right Leg"].Transparency = 1
	    pchar.Head.face.Transparency = 1
	end
end)

addcmd('unduck','makes player back to normal',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    execCmd("fix " .. gPlayers[v].Name, Player)
	end
end)

addcmd('disable','removes players humanoid',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Humanoid") then
		   pchar.Humanoid.Name = "HUMANOID_" .. gPlayers[v].Name
		   local humanoid = pchar["HUMANOID_" .. gPlayers[v].Name]
		   humanoid.Parent = game.ContextActionService
	    end
	end
end)

addcmd('enable','gives player humanoid',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
		local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Humanoid") then
		    return
	    else
		    local humanoid = game.ContextActionService["HUMANOID_" .. gPlayers[v].Name]
		    humanoid.Parent = pchar
		    humanoid.Name = "Humanoid"
	    end
	end
end)

addcmd('size','changes size of player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	local pchar = gPlayers[v].Character
		local function scale(chr,scl)
		
			for _,v in pairs(pchar:GetChildren()) do
				if v:IsA("Hat") then
					v:Clone()
					v.Parent = game.Lighting
				end
			end
				
		    local Head = chr['Head']
		    local Torso = chr['Torso']
		    local LA = chr['Left Arm']
		    local RA = chr['Right Arm']
		    local LL = chr['Left Leg']
		    local RL = chr['Right Leg']
		    local HRP = chr['HumanoidRootPart']
		
		    wait(0.1)
		   
		    Head.formFactor = 3
		    Torso.formFactor = 3
		    LA.formFactor = 3
		    RA.formFactor = 3
		    LL.formFactor = 3
		    RL.formFactor = 3
		    HRP.formFactor = 3
		    
		    Head.Size = Vector3.new(scl * 2, scl, scl)
		    Torso.Size = Vector3.new(scl * 2, scl * 2, scl)
		    LA.Size = Vector3.new(scl, scl * 2, scl)
		    RA.Size = Vector3.new(scl, scl * 2, scl)
		    LL.Size = Vector3.new(scl, scl * 2, scl)
		    RL.Size = Vector3.new(scl, scl * 2, scl)
		    HRP.Size = Vector3.new(scl * 2, scl * 2, scl)
		    
		    local Motor1 = Instance.new('Motor6D', Torso)
		    Motor1.Part0 = Torso
		    Motor1.Part1 = Head
	    	Motor1.C0 = CFrame.new(0, 1 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.C1 = CFrame.new(0, -0.5 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.Name = "Neck"
				    
	    	local Motor2 = Instance.new('Motor6D', Torso)
	    	Motor2.Part0 = Torso
	    	Motor2.Part1 = LA
	    	Motor2.C0 = CFrame.new(-1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.C1 = CFrame.new(0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.Name = "Left Shoulder"
	    	
	    	local Motor3 = Instance.new('Motor6D', Torso)
	   		Motor3.Part0 = Torso
	    	Motor3.Part1 = RA
	    	Motor3.C0 = CFrame.new(1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.C1 = CFrame.new(-0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.Name = "Right Shoulder"
	    	
	    	local Motor4 = Instance.new('Motor6D', Torso)
	    	Motor4.Part0 = Torso
	    	Motor4.Part1 = LL
	    	Motor4.C0 = CFrame.new(-1 * scl, -1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.C1 = CFrame.new(-0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.Name = "Left Hip"
	    	
	    	local Motor5 = Instance.new('Motor6D', Torso)
	    	Motor5.Part0 = Torso
	    	Motor5.Part1 = RL
	    	Motor5.C0 = CFrame.new(1 * scl, -1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.C1 = CFrame.new(0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.Name = "Right Hip"
	    	
	    	local Motor6 = Instance.new('Motor6D', HRP)
	    	Motor6.Part0 = HRP
	    	Motor6.Part1 = Torso
	    	Motor6.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
	    	Motor6.C1 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
	    	    
		end
		
		scale(pchar, args[2])
	
		for _,v in pairs(game.Lighting:GetChildren()) do
			if v:IsA("Hat") then
				v.Parent = pchar
			end
		end
	end
end)

addcmd('confuse','reverses players speed',{'reverse'},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    pchar.Humanoid.WalkSpeed = tonumber(-16)
	end
end)

addcmd('unconfuse','reverses players speed',{'unreverse'},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    pchar.Humanoid.WalkSpeed = tonumber(16)
	end
end)

addcmd('clone','clones player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    pchar.Archivable = true
	    local clone = pchar:Clone()
	    clone.Parent = game.Workspace
	    clone:MoveTo(pchar:GetModelCFrame().p)
	    clone:MakeJoints()
	    pchar.Archivable = false
	end
end)

addcmd('spin','spins player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    for i,v in pairs(pchar.Torso:GetChildren()) do
		    if v.Name == "Spinning" then
			    v:Destroy()
		    end
	    end
	    local Torso = pchar.Torso
	    local BG = Instance.new("BodyGyro", Torso)
	    BG.Name = "Spinning"
	    BG.maxTorque = Vector3.new(0, math.huge, 0)
	    BG.P = 11111
	    BG.cframe = Torso.CFrame
	    repeat wait(1/44)
		    BG.CFrame = BG.CFrame * CFrame.Angles(0,math.rad(30),0)
	    until not BG or BG.Parent ~= Torso
	end
end)

addcmd('unspin','stops spinning player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    for i,v in pairs(pchar.Torso:GetChildren()) do
		    if v.Name == "Spinning" then
			    v:Destroy()
		    end
	    end
	end
end)

addcmd('dog','makes player a dog',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Shirt") then
		    pchar.Shirt:Destroy()
	    end
	    if pchar:FindFirstChild("Pants") then
		    pchar.Pants:Destroy()
	    end
	    if pchar:FindFirstChild("Shirt Graphic") then
		    pchar["Shirt Graphic"].Graphic = ""
	    end
	    pchar.Torso.Transparency = 1
	    pchar.Torso.Neck.C0 = CFrame.new(0,-.5,-2) * CFrame.Angles(math.rad(90),math.rad(180),0)
	    pchar.Torso["Right Shoulder"].C0 = CFrame.new(.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(90),0)
	    pchar.Torso["Left Shoulder"].C0 = CFrame.new(-.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(-90),0)
	    pchar.Torso["Right Hip"].C0 = CFrame.new(1.5,-1,1.5) * CFrame.Angles(0,math.rad(90),0)
	    pchar.Torso["Left Hip"].C0 = CFrame.new(-1.5,-1,1.5) * CFrame.Angles(0,math.rad(-90),0)
	    local FakeTorso = Instance.new("Seat", pchar)
	    FakeTorso.Name = "FakeTorso"
	    FakeTorso.FormFactor = "Symmetric"
	    FakeTorso.TopSurface = 0
	    FakeTorso.BottomSurface = 0
	    FakeTorso.Size = Vector3.new(3,1,4)
	    FakeTorso.BrickColor = BrickColor.new("Brown")
	    FakeTorso.CFrame = pchar.Torso.CFrame
	    local BF = Instance.new("BodyForce", FakeTorso)
	    BF.Force = Vector3.new(0, FakeTorso:GetMass() * 196.25, 0)
	    local W = Instance.new("Weld", pchar.Torso)
	    W.Part0 = pchar.Torso
	    W.Part1 = FakeTorso
	    W.C0 = CFrame.new(0,-.5,0)
	    local BC = pchar["Body Colors"]
	    BC.HeadColor = BrickColor.new("Brown")
	    BC.LeftArmColor = BrickColor.new("Brown")
	    BC.LeftLegColor = BrickColor.new("Brown")
	    BC.RightArmColor = BrickColor.new("Brown")
	    BC.RightLegColor = BrickColor.new("Brown")
	    BC.TorsoColor = BrickColor.new("Brown")
	end
end)

addcmd('undog','makes player back to normal',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    execCmd("fix " .. gPlayers[v].Name, Player)
	end
end)

addcmd('tptool','gives player tptool',{''},
function(args)
	local tool = DATA.Teleport:Clone()
	tool.Parent = Player.Backpack
end)

addcmd('loopsit','loop sits player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopSit") then
		    pchar.LoopSit.Name = "NotLoopSit"
		    wait(0.1)
		    pchar.NotLoopSit:Destroy()
	    end
	    local LoopSit = Instance.new("StringValue", pchar)
	    LoopSit.Name = "LoopSit"
	    repeat wait(0.1)
		    pchar.Humanoid.Sit = true
	    until LoopSit.Name == "NotLoopSit"
	end
end)

addcmd('unloopsit','stops loop sit on player',{'noloopsit'},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopSit") then
		    pchar.LoopSit.Name = "NotLoopSit"
		    wait(0.1)
		    pchar.NotLoopSit:Destroy()
	    end
	end
end)

addcmd('loopjump','loop jumps player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopJump") then
		    pchar.LoopJump.Name = "NotLoopJump"
		    wait(0.1)
		    pchar.NotLoopJump:Destroy()
	    end
	    local LoopJump = Instance.new("StringValue", pchar)
	    LoopJump.Name = "LoopJump"
	    repeat wait(0.1)
		    pchar.Humanoid.Jump = true
	    until LoopJump.Name == "NotLoopJump"
	end
end)

addcmd('unloopjump','stops loop jump on player',{'noloopjump'},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopJump") then
		    pchar.LoopJump.Name = "NotLoopJump"
		    wait(0.1)
		    pchar.NotLoopJump:Destroy()
	    end
	end
end)

addcmd('loopheal','loop heals player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopHeal") then
		    pchar.LoopHeal.Name = "NotLoopHeal"
		    wait(0.1)
		    pchar.NotLoopHeal:Destroy()
	    end
	    local LoopHeal = Instance.new("StringValue", pchar)
	    LoopHeal.Name = "LoopHeal"
	    repeat wait(0.1)
		    pchar.Humanoid.Health = pchar.Humanoid.MaxHealth
	    until LoopHeal.Name == "NotLoopHeal"
	end
end)

addcmd('unloopheal','stops loop heal on player',{'noloopheal'},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("LoopHeal") then
		    pchar.LoopHeal.Name = "NotLoopHeal"
		    wait(0.1)
		    pchar.NotLoopHeal:Destroy()
	    end
	end
end)

addcmd('fling','flings player',{},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
		if pchar:FindFirstChild("Humanoid") then
			local xran
			local zran
			repeat
				xran = math.random(-9999,9999)
			until math.abs(xran) >= 5555
			repeat
				zran = math.random(-9999,9999)
			until math.abs(zran) >= 5555
			pchar.Humanoid.Sit = true
			pchar.Torso.Velocity = Vector3.new(0,0,0)
			local BF = Instance.new("BodyForce", pchar.Torso)
			BF.force = Vector3.new(xran * 4, 9999 * 5, zran * 4)
		end
	end
end)

addcmd('nograv','makes player have moon gravity',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    for i,v in pairs(pchar.Torso:GetChildren()) do
		    if v.Name == "NoGrav" then
			    v:Destroy()
		    end
	    end
	    local BF = Instance.new("BodyForce", pchar.Torso)
	    BF.Name = "NoGrav"
	    BF.Force = Vector3.new(0,2700,0)
	end
end)

addcmd('grav','makes player have normal gravity',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    for i,v in pairs(pchar.Torso:GetChildren()) do
		    if v.Name == "NoGrav" then
			    v:Destroy()
		    end
	    end
	end
end)

addcmd('seizure','makes player have a seizure',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Seizure") then
		    
	    end
	    local Seizure = Instance.new("StringValue", pchar)
	    Seizure.Name = "Seizure"
	    pchar.Humanoid.PlatformStand = true
		repeat wait()
		    pchar.Torso.Velocity = Vector3.new(math.random(-10,10),-5,math.random(-10,10))
		    pchar.Torso.RotVelocity = Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
		until Seizure.Name == "NotSeizure"
	end
end)

addcmd('unseizure','makes player stop having a seizure',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Seizure") then
	        pchar.Humanoid.PlatformStand = false
		    pchar.Seizure.Name = "NotSeizure"
		    wait(0.1)
		    pchar.NotSeizure:Destroy()
	    end
	end
end)

addcmd('cape','gives you a cape',{''},
function(args)
    if not args[1] then
		args[1] = 1012
	end
	capeColor = args[1]
    Cape(Player)
end)

addcmd('uncape','takes cape away from you',{''},
function(args)
	if char:FindFirstChild("Cape") ~= nil then
	    char.Cape:Destroy()
	end
end)

addcmd('paper','makes player thin as paper',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    local LA = DATA.Paper:Clone()
	    LA.Parent = pchar["Left Arm"]
	    local RA = DATA.Paper:Clone()
	    RA.Parent = pchar["Right Arm"]
	    local LL = DATA.Paper:Clone()
	    LL.Parent = pchar["Left Leg"]
	    local RL = DATA.Paper:Clone()
	    RL.Parent = pchar["Right Leg"]
	    local T = DATA.Paper:Clone()
	    T.Parent = pchar.Torso
		local H = DATA.Paper:Clone()
		H.Parent = pchar.Head
		pchar.Head.face:Destroy()
	end
end)

addcmd('punish','punishs player',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    pchar.Parent = game.Lighting
	end
end)

addcmd('unpunish','unpunishs player',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    if game.Lighting:FindFirstChild("" .. gPlayers[v].Name) then
	        game.Lighting:FindFirstChild("" .. gPlayers[v].Name).Parent = game.Workspace
	    end
	end
end)

addcmd('disco','disco party',{''},
function(args)
	Disco = true
	if Disco == true then
		repeat wait(0.3)
		    game.Lighting.Ambient = Color3.new(math.random(),math.random(),math.random())
		until Disco == false
	end
end)

addcmd('undisco','rip disco party',{''},
function(args)
	Disco = false
	wait(0.1)
	game.Lighting.Ambient = Color3.new(0.5,0.5,0.5)
end)

-- Extras --

Floating = false

addcmd('float', 'makes player float',{},
function(args,speaker)
	Floating = true
	local players = getPlayer(args[1])
	for _,v in pairs(players) do
		local pchar = gPlayers[v].Character
		if gPlayers[v] and pchar and not pchar:FindFirstChild("Float") then
			spawn(function()
				local float = DATA.Float:Clone()
				float.Parent = pchar
				float.CFrame = pchar.Torso.CFrame * CFrame.new(0,-3.5,0)
				spawn(function()
					while wait(0.1) do
						if pchar:FindFirstChild("Float") then
							float.CFrame = pchar.Torso.CFrame * CFrame.new(0,-3.5,0)
						else
							break
						end
					end
				end)
			end)
		end
	end
end)

addcmd('unfloat','disables floating',{},
function(args)
	Floating = false
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Float") then
		    pchar.Float:Destroy()
	    end
	end
end)

local Clip = true

addcmd('noclip','enables noclip',{},
function(args)
Notify('NoClip Enabled')
Clip = false
	wait(1)
	Name = game.Players.LocalPlayer.Name
	game:GetService('Players').LocalPlayer.PlayerGui.ChildAdded:connect(function (NC)
		delay(0, function()
			if NC.Name ~= "OuputGUI" then
				NC:Destroy()
			end
		end)
	end)
	game:GetService('RunService').Stepped:connect(function ()
    game.Workspace[Name].Torso.CanCollide = Clip
    game.Workspace[Name].Head.CanCollide = Clip
	end)
	game.Workspace[Name].Torso.Changed:connect(function()
    game.Workspace[Name].Torso.CanCollide = Clip
	game.Workspace[Name].Head.CanCollide = Clip
	end)
end)

addcmd('clip','disables noclip',{},
function(args)
	Notify('NoClip Disabled')
	Clip = true
end)

wait(0.1)

addcmd('prefix','changes prefix',{},
function(args)
	cmdprefix = args[1]
	Notify('Changed prefix to "' .. args[1] .. '"')
end)

addcmd('admins','prints admins',{},
function(args)
	for i,v in pairs(AdminFolder:GetChildren()) do
		if v:IsA("StringValue") then
			print("-" .. v.Value)
			Notify('Printed Admins, Check Console')
		end
	end
end)

addcmd('bans','prints bans',{},
function(args)
	for i,v in pairs(BanFolder:GetChildren()) do
		if v:IsA("StringValue") then
			print("-" .. v.Value)
			Notify('Printed Bans, Check Console')
		end
	end
end)

addcmd('version','shows version',{''},
function(args)
	Notify("Version is " .. Version)
end)

--| Floating |--

Mouse.KeyDown:connect(function (Key)
	if Key:byte() == 29 then
		if Floating == false then
			execCmd("float me", Player)
			Floating = true
		elseif Floating == true then
			execCmd("unfloat me", Player)
			Floating = false
		end
	end
end)

--| Ban Data |--

for i,v in pairs(BannedPlayers) do
	local ban = Instance.new("StringValue", BanFolder)
	ban.Value = v
	ban.RobloxLocked = true
end

spawn(function ()
    while wait(0.1) do
		for _,a in pairs(game.ContextActionService:GetChildren()) do
		    if a.Name == "BanList" then
			    for _,b in pairs(a:GetChildren()) do
				    if b:IsA("StringValue") then
					    for _,c in pairs(game.Players:GetChildren()) do
						    if c.Name == b.Value then
							    c.PersonalServerRank = 200
							    wait(0.1)
							    c.PersonalServerRank = 0
						    end
					    end
				    end
			    end
		    end
	    end
    end
end)

--| Admin |--

for i,v in pairs(admins) do
	local admin = Instance.new("StringValue", AdminFolder)
	admin.Value = v
	admin.RobloxLocked = true
end

spawn(function ()
    while wait(0.1) do
		for _,a in pairs(game.ContextActionService:GetChildren()) do
		    if a.Name == "AdminList" then
			    for _,b in pairs(a:GetChildren()) do
				    if b:IsA("StringValue") then
					    for _,c in pairs(game.Players:GetChildren()) do
						    if c.Name == b.Value then
							    execCmd('admin ' .. c.Name)
						    end
					    end
				    end
			    end
		    end
	    end
    end
end)





















--| Don't.. Touch.. |--






--| CMD Bar |--

CMDbar = Instance.new('ScreenGui', game.CoreGui)
CMDbar.Name = 'GUI'
cmdBAR = Instance.new('TextBox', CMDbar)
cmdBAR.Name = 'CMDbar'
cmdBAR.Active = true
cmdBAR.BackgroundColor = BrickColor.new(0,0,0)
cmdBAR.BackgroundTransparency = 0.5
cmdBAR.BorderColor = BrickColor.new(0,0,0)
cmdBAR.BorderSizePixel = 0
cmdBAR.Position = UDim2.new(0,0,1,-25)
cmdBAR.Size = UDim2.new(0,200,0,20)
cmdBAR.Font = 'SourceSans'
cmdBAR.FontSize = 'Size18'
cmdBAR.Text = 'Press ; to Execute a Command'
cmdBAR.TextColor = BrickColor.new(255,255,255)

--| Data |--

DATA = Instance.new('Folder', game.ContextActionService)
DATA.Name = 'Data'

Paper = Instance.new('BlockMesh', DATA)
Paper.Name = 'Paper'
Paper.Scale = Vector3.new(1,1,0.1)

ayylmao = Instance.new('Hat', DATA)
ayylmao.Name = 'ayylmao'
ayyHandle = Instance.new('Part', ayylmao)
ayyHandle.Name = 'Handle'
ayyHandle.Size = Vector3.new(2,2.4,2)
ayyHandle.FormFactor = 'Plate'
ayyMesh = Instance.new('SpecialMesh', ayyHandle)
ayyMesh.Scale = Vector3.new(1,1.02,1)
ayyMesh.MeshType = 'FileMesh'
ayyMesh.MeshId = 'http://www.roblox.com/asset/?id=13827689'
ayyMesh.TextureId = 'http://www.roblox.com/asset/?id=13827796'

Float = Instance.new('Part', DATA)
Float.Name = 'Float'
Float.Transparency = 1
Float.Size = Vector3.new(6,1,6)
Float.Anchored = true

cmdGUI = Instance.new('ScreenGui', DATA)
cmdGUI.Name = 'CMDs'
cmdMAIN = Instance.new('Frame', cmdGUI)
cmdMAIN.Name = 'MAIN'
cmdMAIN.Active = true
cmdMAIN.BackgroundColor = BrickColor.new(0,0,0)
cmdMAIN.BackgroundTransparency = 0.5
cmdMAIN.BorderColor = BrickColor.new(0,0,0)
cmdMAIN.BorderSizePixel = 0
cmdMAIN.Position = UDim2.new(0,10,0,350)
cmdMAIN.Size = UDim2.new(0,170,0,15)
cmdMAIN.Draggable = true
cmdCMDs = Instance.new('ScrollingFrame', cmdMAIN)
cmdCMDs.Name = 'CMDs'
cmdCMDs.BackgroundColor = BrickColor.new(0,0,0)
cmdCMDs.BackgroundTransparency = 0.8
cmdCMDs.BorderColor = BrickColor.new(0,0,0)
cmdCMDs.BorderSizePixel = 0
cmdCMDs.Position = UDim2.new(0,0,0,15)
cmdCMDs.Size = UDim2.new(0,200,0,150)
cmdCMDs.CanvasSize = UDim2.new(0,0,0,0)
cmdCMDs.TopImage = 'rbxasset://textures/blackBkg_square.png'
cmdCMDs.MidImage = 'rbxasset://textures/blackBkg_square.png'
cmdCMDs.BottomImage = 'rbxasset://textures/blackBkg_square.png'
cmdCMDs.ScrollBarThickness = 2
cmdExit = Instance.new('TextButton', cmdMAIN)
cmdExit.Name = 'Exit'
cmdExit.BackgroundColor = BrickColor.new(255,0,0)
cmdExit.BackgroundTransparency = 0.5
cmdExit.BorderColor = BrickColor.new(255,0,0)
cmdExit.BorderSizePixel = 0
cmdExit.Position = UDim2.new(0,185,0,0)
cmdExit.Size = UDim2.new(0,15,0,15)
cmdExit.Text = ""
ExitScript = Instance.new('LocalScript', cmdExit)
ExitScript.Source =
[[
script.Parent.MouseButton1Down:connect(function()
	script.Parent.Parent.Parent:Destroy()
end)
]]
cmdMin = Instance.new('TextButton', cmdMAIN)
cmdMin.Name = 'MM'
cmdMin.BackgroundColor = BrickColor.new(140,140,140)
cmdMin.BackgroundTransparency = 0.5
cmdMin.BorderColor = BrickColor.new(140,140,140)
cmdMin.BorderSizePixel = 0
cmdMin.Position = UDim2.new(0,170,0,0)
cmdMin.Size = UDim2.new(0,15,0,15)
cmdMin.Text = ""
MinScript = Instance.new('LocalScript', cmdMin)
MinScript.Source =
[[
local CMDs = script.Parent.Parent.CMDs

script.Parent.MouseButton1Down:connect(function()
	if CMDs.Visible == true then
		CMDs.Visible = false
	elseif CMDs.Visible == false then
		CMDs.Visible = true
	end
end)
]]
cmdEx = Instance.new('TextLabel', cmdMAIN)
cmdEx.Name = 'Example'
cmdEx.BackgroundColor = BrickColor.new(0,0,0)
cmdEx.BackgroundTransparency = 0.8
cmdEx.BorderColor = BrickColor.new(0,0,0)
cmdEx.BorderSizePixel = 0
cmdEx.Position = UDim2.new(0,5,0,20)
cmdEx.Size = UDim2.new(0,190,0,20)
cmdEx.Visible = false
cmdEx.TextColor = BrickColor.new(255,255,255)
cmdEx.TextXAlignment = 'Left'

duckGUI = Instance.new('ScreenGui', DATA)
duckGUI.Name = 'Duck'
duckImage = Instance.new('ImageLabel', duckGUI)
duckImage.BackgroundTransparency = 1
duckImage.Position = UDim2.new(0,-300,1,-150)
duckImage.Size = UDim2.new(0,300,0,300)
duckImage.Rotation = -30
duckImage.Image = 'rbxassetid://301388647'
duckScript = Instance.new('LocalScript', duckGUI)
duckScript.Source =
[[
local duck = script.Parent.ImageLabel

wait(2)

duck:TweenPosition(UDim2.new(1, 0, 1, -150), "InOut", "Quad", 3, true, nil)
]]

espMAIN = Instance.new('BillboardGui', DATA)
espMAIN.Name = 'MAIN'
espMAIN.AlwaysOnTop = true
espMAIN.ExtentsOffset = Vector3.new(0,1,0)
espMAIN.Size = UDim2.new(0,5,0,5)
espMAIN.StudsOffset = Vector3.new(0,1,0)
espDot = Instance.new('Frame', espMAIN)
espDot.BackgroundColor = BrickColor.new(42,181,255)
espDot.BackgroundTransparency = 0.3
espDot.BorderSizePixel = 0
espDot.Position = UDim2.new(-0.5,0,-0.5,0)
espDot.Size = UDim2.new(2,0,2,0)
espDot.Visible = false
espDot.ZIndex = 10
espName = Instance.new('TextLabel', espMAIN)
espName.Name = 'Name'
espName.BackgroundColor = BrickColor.new(0,0,0)
espName.BackgroundTransparency = 1
espName.BorderColor = BrickColor.new(0,0,0)
espName.BorderSizePixel = 0
espName.Position = UDim2.new(0,0,0,-35)
espName.Size = UDim2.new(1,0,10,0)
espName.Visible = false
espName.ZIndex = 10

notifyMAIN = Instance.new('ScreenGui', DATA)
notifyMAIN.Name = 'Notification'
notifyNOT = Instance.new('Frame', notifyMAIN)
notifyNOT.Name = 'NOTIFY'
notifyNOT.BackgroundColor = BrickColor.new(0,0,0)
notifyNOT.BackgroundTransparency = 0.5
notifyNOT.BorderColor = BrickColor.new(255,255,255)
notifyNOT.BorderSizePixel = 2
notifyNOT.Position = UDim2.new(0,-200,0.7,0)
notifyNOT.Size = UDim2.new(0,200,0,30)
notifyNOTE = Instance.new('TextLabel', notifyNOT)
notifyNOTE.Name = 'NOTE'
notifyNOTE.BackgroundColor = BrickColor.new(255,255,255)
notifyNOTE.BackgroundTransparency = 1
notifyNOTE.BorderColor = BrickColor.new(255,255,255)
notifyNOTE.BorderSizePixel = 0
notifyNOTE.Size = UDim2.new(1,0,1,0)
notifyNOTE.ZIndex = 10
notifyNOTE.FontSize = 'Size18'
notifyNOTE.Font = 'SourceSans'
notifyNOTE.Text = 'NOTIFY'
notifyNOTE.TextColor = BrickColor.new(255,255,255)
notifyNOTE.TextStrokeColor3 = Color3.new(255,255,255)
notifyNOTE.TextStrokeTransparency = 0.8

tpTool = Instance.new('HopperBin', DATA)
tpTool.Name = 'Teleport'
tpScript = Instance.new('LocalScript', tpTool)
tpScript.Source =
[[
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local Tool = script.Parent

Mouse.Button1Down:connect(function()
	if Mouse.Target and Tool.Active then
		Player.Character.HumanoidRootPart.CFrame = Mouse.Hit + Vector3.new(0,2,0)
	end
end)
]]

modJAIL = Instance.new('Model', DATA)
modJAIL.Name = 'JAIL'
botJAIL = Instance.new('Part', modJAIL)
botJAIL.Name = 'BOTTOM'
botJAIL.BrickColor = BrickColor.new('Black')
botJAIL.Transparency = 0.5
botJAIL.Position = Vector3.new(-6.2,0.5,-11.6)
botJAIL.Anchored = true
botJAIL.Locked = true
botJAIL.Size = Vector3.new(6,1,6)
botJAIL.TopSurface = 'Smooth'
botJAIL.BottomSurface = 'Smooth'
topJAIL = Instance.new('Part', modJAIL)
topJAIL.Name = 'BOTTOM'
topJAIL.BrickColor = BrickColor.new('Black')
topJAIL.Transparency = 0.5
topJAIL.Position = Vector3.new(-6.2,7.5,-11.6)
topJAIL.Anchored = true
topJAIL.Locked = true
topJAIL.Size = Vector3.new(6,1,6)
topJAIL.TopSurface = 'Smooth'
topJAIL.BottomSurface = 'Smooth'
p1 = Instance.new('Part', modJAIL)
p1.Name = 'MAIN'
p1.BrickColor = BrickColor.new('Black')
p1.Transparency = 1
p1.Position = Vector3.new(-8.7,4,-11.6)
p1.Rotation = Vector3.new(-180,0,-180)
p1.Anchored = true
p1.Locked = true
p1.Size = Vector3.new(1,6,4)
p1.TopSurface = 'Smooth'
p1.BottomSurface = 'Smooth'
p2 = Instance.new('Part', modJAIL)
p2.BrickColor = BrickColor.new('Black')
p2.Transparency = 0.5
p2.Position = Vector3.new(-3.7,4,-14.1)
p2.Anchored = true
p2.Locked = true
p2.Size = Vector3.new(1,6,1)
p2.TopSurface = 'Smooth'
p2.BottomSurface = 'Smooth'
p3 = Instance.new('Part', modJAIL)
p3.BrickColor = BrickColor.new('Black')
p3.Transparency = 0.5
p3.Position = Vector3.new(-8.7,4,-9.1)
p3.Anchored = true
p3.Locked = true
p3.Size = Vector3.new(1,6,1)
p3.TopSurface = 'Smooth'
p3.BottomSurface = 'Smooth'
p4 = Instance.new('Part', modJAIL)
p4.BrickColor = BrickColor.new('Black')
p4.Transparency = 0.5
p4.Position = Vector3.new(-3.7,4,-9.1)
p4.Anchored = true
p4.Locked = true
p4.Size = Vector3.new(1,6,1)
p4.TopSurface = 'Smooth'
p4.BottomSurface = 'Smooth'
p5 = Instance.new('Part', modJAIL)
p5.BrickColor = BrickColor.new('Black')
p5.Transparency = 0.5
p5.Position = Vector3.new(-8.7,4,-14.1)
p5.Anchored = true
p5.Locked = true
p5.Size = Vector3.new(1,6,1)
p5.TopSurface = 'Smooth'
p5.BottomSurface = 'Smooth'
p6 = Instance.new('Part', modJAIL)
p6.BrickColor = BrickColor.new('Black')
p6.Transparency = 1
p6.Position = Vector3.new(-6.2,4,-14.1)
p6.Rotation = Vector3.new(0,90,0)
p6.Anchored = true
p6.Locked = true
p6.Size = Vector3.new(1,6,4)
p6.TopSurface = 'Smooth'
p6.BottomSurface = 'Smooth'
p7 = Instance.new('Part', modJAIL)
p7.BrickColor = BrickColor.new('Black')
p7.Transparency = 1
p7.Position = Vector3.new(-3.7,4,-11.6)
p7.Anchored = true
p7.Locked = true
p7.Size = Vector3.new(1,6,4)
p7.TopSurface = 'Smooth'
p7.BottomSurface = 'Smooth'
p8 = Instance.new('Part', modJAIL)
p8.BrickColor = BrickColor.new('Black')
p8.Transparency = 1
p8.Position = Vector3.new(-6.2,4,-9.1)
p8.Rotation = Vector3.new(0,90,0)
p8.Anchored = true
p8.Locked = true
p8.Size = Vector3.new(1,6,4)
p8.TopSurface = 'Smooth'
p8.BottomSurface = 'Smooth'

--| Some Commands |--

addcmd('ayylmao','ayy lmao',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	    if pchar:FindFirstChild("Shirt") then
		    pchar.Shirt:Destroy()
	    end
	    if pchar:FindFirstChild("Pants") then
		    pchar.Pants:Destroy()
	    end
	    if pchar:FindFirstChild("Shirt Graphic") then
		    pchar["Shirt Graphic"].Graphic = ""
	    end
	    for i,v in pairs(pchar:GetChildren()) do
		    if v:IsA("Hat") then
			    v:Destroy()
		    end
	    end
	    local ayylmao = DATA.ayylmao:Clone()
	    ayylmao.Parent = pchar
	    local BC = pchar["Body Colors"]
	    BC.HeadColor = BrickColor.new("Fossil")
	    BC.LeftArmColor = BrickColor.new("Fossil")
	    BC.LeftLegColor = BrickColor.new("Fossil")
	    BC.RightArmColor = BrickColor.new("Fossil")
	    BC.RightLegColor = BrickColor.new("Fossil")
	    BC.TorsoColor = BrickColor.new("Fossil")
	end
end)

-- CMDs GUI --

CMDsFolder = Instance.new("Folder", game.CoreGui)

for i,v in pairs(CMDs) do
	CMDsValue = Instance.new("StringValue", CMDsFolder)
	CMDsValue.Value = v
	CMDsValue.RobloxLocked = true
end

local function commands()
	local cmds = DATA.CMDs:Clone()
	cmds.Parent = Player.PlayerGui
	local CMDsV = CMDsFolder:GetChildren()
	for i = 1, #CMDsV do
		local YSize = 25
		local Position = ((i * YSize) - YSize)
		local newcmd = cmds.MAIN.Example:Clone()
		newcmd.Parent = cmds.MAIN.CMDs
		newcmd.Visible = true
		newcmd.Position = UDim2.new(0,5,0, Position + 5)
		newcmd.Text = "" .. CMDsV[i].Value
		cmds.MAIN.CMDs.CanvasSize = UDim2.new(0,0,0, Position + 30)
	end
end

addcmd('cmds','prints cmds',{},
function(args)
	commands()
end)

--| Command Bar |--

CMDbar.CMDbar.FocusLost:connect(function(enterpressed)
	if enterpressed and CMDbar.CMDbar.Text ~= "" then
		spawn(function ()
			execCmd(CMDbar.CMDbar.Text, Player)
		end)
	end
	CMDbar.CMDbar:TweenPosition(UDim2.new(0, -200, 1, -25), "InOut", "Quad", 0.5, true, nil)
end)

Mouse.KeyDown:connect(function(Key)
	if Key:byte() == 59 then
		CMDbar.CMDbar:TweenPosition(UDim2.new(0, 0, 1, -25), "InOut", "Quad", 0.5, true, nil)
		CMDbar.CMDbar:CaptureFocus()
	end
end)

--| ESP Function |--

local ESP = false
local track = false

function Create(base, team)
    local MAIN = DATA.MAIN:Clone()
    local F = MAIN.DOT
    local ESP = MAIN.NAME

    MAIN.Parent = Player.PlayerGui
	MAIN.Adornee = base
	
	F.Visible = true
	
	ESP.Text = base.Parent.Name:upper()
	ESP.Visible = true
end

function Clear()
	for _,v in pairs(Player.PlayerGui:children()) do
		if v.Name == "MAIN" and v:IsA("BillboardGui") then
			v:Destroy()
		end
	end
end

function Find()
	Clear()
	track = true
	spawn(function()
		while wait() do
			if track then
				Clear()
				for i,v in pairs(game.Players:players()) do
					if v.Character and v.Character.Head then
						Create(v.Character.Head, true)
					end
				end
			end
			wait(1)
		end
	end)
end

--| ESP |--

Mouse.KeyDown:connect(function(Key)
	if Key:byte() == 30 then
		if ESP == false then
			Find()
		    ESP = true
		elseif ESP == true then
			Clear()
			track = false
			ESP = false
		end
	end
end)

--| More Functions |--

local NOTIFY = DATA.Notification
NOTIFY.Parent = game.CoreGui

local duck = DATA.Duck:Clone()
duck.Parent = Player.PlayerGui

local usingNOTE = false

function Notify(msg)
	if usingNOTE == false then
		if NOTIFY.NOTIFY and NOTIFY.NOTIFY.NOTE then
			spawn(function()
				NOTIFY.NOTIFY:TweenPosition(UDim2.new(0, 0, 0.7, 0), "InOut", "Quad", 0.5, true, nil)
				NOTIFY.NOTIFY.NOTE.Text = msg
				usingNOTE = true
				wait(2.5)
				NOTIFY.NOTIFY:TweenPosition(UDim2.new(0, -200, 0.7, 0), "InOut", "Quad", 0.5, true, nil)
				usingNOTE = false
		    end)
		end
	end
end

--| Notifications |--

wait(1)

if game.Workspace.FilteringEnabled == true then
	NOTIFY.NOTIFY.BorderColor = BrickColor.new(255,0,0)
	Notify('Filtering is ENABLED.') 
elseif game.Workspace.FilteringEnabled == false then
	NOTIFY.NOTIFY.BorderColor = BrickColor.new(0,255,0)
	Notify('Filtering is Disabled.') 
end

wait(3.5)

NOTIFY.NOTIFY.BorderColor = BrickColor.new(255,255,255)

Notify('Loaded ' .. #cmds .. ' commands!')

wait(3.5)

Notify('Welcome ' .. Player.Name .. '!')

Player.PlayerGui.Duck:Destroy()

--[[
addcmd('name','desc',{''},
function(args)
	local players = getPlayer(args[1])
	for i,v in pairs(players)do
	    local pchar = gPlayers[v].Character
	end
end)
--]]
	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Nex Pluvia Admin"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Nex Pluvia Admin"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		version="Pluvia"
Selection=1
TextBoxInUse=false
Player=nil
ColorSelection=BrickColor.new('Bright violet')
Uninstalled=false
Commands={}
Scope=nil
CustomFunction=""
Services={
        InsertService=game:service'InsertService',
        Workspace=game:service'Workspace',
        Lighting=game:service'Lighting',
        Players=game:service'Players',
        Debris=game:service'Debris',
        Chat=game:service'Chat',
}
m=Services.Players.LocalPlayer:GetMouse()
SGUI=Instance.new('ScreenGui',Services.Players.LocalPlayer.PlayerGui)
BAR=Instance.new('Frame',SGUI)
BAR.Size=UDim2.new(1,0,0,20)
BAR.Position=UDim2.new(0,0,0,20)
BAR.BorderSizePixel=0
BAR.BackgroundColor3=Color3.new(0,0,0)
TEXTBOX=Instance.new('TextLabel',BAR)
TEXTBOX.Size=UDim2.new(1,0,1,0)
TEXTBOX.BackgroundTransparency=1
TEXTBOX.TextColor3=Color3.new(453,0,435)
TEXTBOX.FontSize="Size12"
PlayerCheck=function()
        if m.Target ~= nil then
                for i,v in ipairs(Services.Players:GetPlayers())do
                        if(v.Character and m.Target:IsDescendantOf(v.Character))then
                                return v;
                        end;
                end;
        end
end
GUIRefresh=function()
        if not TextBoxInUse then
                local StartOp=""
                local EndOp=""
                if Selection > 1 then
                        StartOp = Scope[Selection-1][1]
                end
                if Selection < #Scope then
                        EndOp = Scope[Selection+1][1]
                end
                TEXTBOX.Text = "<-- "..StartOp.." | ["..Selection.."]: ["..Scope[Selection][1].."] | "..EndOp.." -->"
        end
end
GUIDisplay=function(string)
        TextBoxInUse=true
        for i = 1,string.len(string) do
                TEXTBOX.Text = string.sub(string,1,i).."_"
                wait(.05)
        end
        wait(string.len(string)/15)
        TextBoxInUse=false
        GUIRefresh()
end
Commands={
        {"Nex Pluvia",
                   function()
                        local ids = {63043890,19398258,1272714,20642008,1235488,11748356,10468797}
                        if Commands[2][3] == true then
                                for _,v in pairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                                        for _,x in pairs(ids) do
                                                if v.Name == "ExtraAsset" then
                                                        v.Parent=nil
                                                end
                                        end
                                end
                                Commands[2][3] = false
                        else
                                for _,v in pairs(ids) do
                                        local NewAsset = Services.InsertService:LoadAsset(v):GetChildren()[1]
                                        NewAsset.Parent=Services.Players.LocalPlayer.Character
                                        NewAsset.Name = "ExtraAsset"
                                end
                                Commands[2][3] = true
                        end
                end,
                false
        },
        {"Nex Pluvia",
                function()
                        local ids = {21070012,1031429,108149175,14815761}
                        if Commands[2][3] == true then
                                for _,v in pairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                                        for _,x in pairs(ids) do
                                                if v.Name == "ExtraAsset" then
                                                        v.Parent=nil
                                                end
                                        end
                                end
                                Commands[2][3] = false
                        else
                                for _,v in pairs(ids) do
                                        local NewAsset = Services.InsertService:LoadAsset(v):GetChildren()[1]
                                        NewAsset.Parent=Services.Players.LocalPlayer.Character
                                        NewAsset.Name = "ExtraAsset"
                                end
                                Commands[2][3] = true
                        end
                end,
                false
        },
        {"Nex Pluvia",
                function()
                        local ids = {1125510,14815761,1235488,11748356,1029025,108149175}
                        if Commands[2][3] == true then
                                for _,v in pairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                                        for _,x in pairs(ids) do
                                                if v.Name == "ExtraAsset" then
                                                        v.Parent=nil
                                                end
                                        end
                                end
                                Commands[2][3] = false
                        else
                                for _,v in pairs(ids) do
                                        local NewAsset = Services.InsertService:LoadAsset(v):GetChildren()[1]
                                        NewAsset.Parent=Services.Players.LocalPlayer.Character
                                        NewAsset.Name = "ExtraAsset"
                                end
                                Commands[2][3] = true
                        end
                end,
                false
        },
        {"Fire*",
                function()
                        if pcall(function() Services.Players.LocalPlayer.Character.Head.Fire.Parent=nil end) then
                        else
                                pcall(function()
                                        fire=Instance.new('Fire',Services.Players.LocalPlayer.Character.Head)
                                        fire.Size=3
                                        fire.Color=Color3.new(453,0,435)
                                        fire.SecondaryColor=Color3.new(453,0,435)
                                end)
                        end
                end
        },
        {"Invincibility*",
                function()
                        pcall(function()
                                if Services.Players.LocalPlayer.Character.Humanoid.MaxHealth==100 then
                                        Services.Players.LocalPlayer.Character.Humanoid.MaxHealth=math.huge
                                else
                                        Services.Players.LocalPlayer.Character.Humanoid.MaxHealth=100
                                end
                        end)
                end
        },
        {"Teleport*",
                function()
                        if m.Target ~= nil then
                                pcall(function() Services.Players.LocalPlayer.Character:MoveTo(m.Hit.p) end)
                        end
                end
        },
        {"Teleport",
                function()
                        if Player == nil and m.Target ~= nil then
                                if PlayerCheck() then
                                        Player=PlayerCheck()
                                end
                                pcall(function()
                                        for _,v in pairs(Player.Character:GetChildren()) do
                                                if v:IsA('Part') then
                                                        local sb = Instance.new('SelectionBox',Services.Workspace.CurrentCamera)
                                                        sb.Adornee = v
                                                        sb.Name = "sb"
                                                        sb.Color = BrickColor.new('Bright violet')
                                                end
                                        end
                                end)
                        elseif Player ~= nil then
                                pcall(function()
                                        Player.Character:MoveTo(m.Hit.p)
                                end)
                                Player = nil
                                for _,v in pairs(Services.Workspace.CurrentCamera:GetChildren()) do
                                        if v:IsA('SelectionBox') and v.Name == "sb" then
                                                v.Parent=nil
                                        end
                                end
                        end
                end
        },
        {"Kill",
                function()
                        pcall(function() PlayerCheck().Character:BreakJoints() end)
                end
        },
        {"Invincibility",
                function()
                        pcall(function()
                                if PlayerCheck().Character.Humanoid.MaxHealth==100 then
                                        PlayerCheck().Character.Humanoid.MaxHealth=math.huge
                                else
                                        PlayerCheck().Character.Humanoid.MaxHealth=100
                                end
                        end)
                end
        },
        {":BreakJoints()",
                function()
                        pcall(function() m.Target:BreakJoints() end)
                end
        },
        {"Kick",
                function()
                        pcall(function() PlayerCheck().Parent=nil end)
                end
        },
        {"Custom Function",
                function()
                        Spawn(loadstring(CustomFunction))
                end
        },
        {"LinkedSword",
                function()
                        Services.InsertService:LoadAsset(47433):GetChildren()[1].Parent=Services.Players.LocalPlayer.Backpack
                end
        },
        {":GetFullName()",
                function()
                        if m.Target then
                                local string = m.Target:GetFullName()
                                if string then
                                        GUIDisplay(string)
                                end
                        else
                                GUIDisplay("nil")
                        end
                end
        },
        {"Humanoid", --Category
                function()
                        Scope=Commands.Humanoid[3]
                        Selection=1
                        GUIRefresh()
                end,
                {
                        {"Up Scope",
                                function()
                                        Scope=Commands
                                        Selection=1
                                        GUIRefresh()
                                end
                        },
                        {"Humanoid",
                                function()
                                        if PlayerCheck() then
                                                if pcall(function() PlayerCheck().Character.Humanoid.Parent=nil end) then
                                                else
                                                        pcall(function() Instance.new('Humanoid',PlayerCheck().Character) end)
                                                end
                                        end
                                end
                        },
                        {"Remove Head",
                                function()
                                        pcall(function() PlayerCheck().Character.Head.Parent=nil end)
                                end
                        },
                        {"PlatformStand",
                                function()
                                        pcall(function()
                                                if PlayerCheck().Character.Humanoid.PlatformStand==true then
                                                        PlayerCheck().Character.Humanoid.PlatformStand=false
                                                else
                                                        PlayerCheck().Character.Humanoid.PlatformStand=true
                                                end
                                        end)
                                end
                        },
                        {"Sit",
                                function()
                                        pcall(function()
                                                if PlayerCheck().Character.Humanoid.Sit==true then
                                                        PlayerCheck().Character.Humanoid.Sit=false
                                                else
                                                        PlayerCheck().Character.Humanoid.Sit=true
                                                end
                                        end)
                                end
                        },
                        {"WalkSpeed",
                                function()
                                        pcall(function()
                                                if PlayerCheck().Character.Humanoid.WalkSpeed==16 then
                                                        PlayerCheck().Character.Humanoid.WalkSpeed=0
                                                else
                                                        PlayerCheck().Character.Humanoid.WalkSpeed=16
                                                end
                                        end)
                                end
                        },
                }
        },
        {"Building", --Category
                function()
                        Scope=Commands.Building[3]
                        Selection=1
                        GUIRefresh()
                end,
                {
                        {"Up Scope",
                                function()
                                        Scope=Commands
                                        Selection=1
                                        GUIRefresh()
                                end
                        },
                        {"Color",
                                function()
                                        pcall(function() m.Target.BrickColor = ColorSelection end)
                                end
                        },
                        {"Color Picker",
                                function()
                                        pcall(function() ColorSelection = m.Target.BrickColor end)
                                end
                        },
                        {"Anchor",
                                function()
                                        pcall(function() m.Target.Anchored=true end)
                                end
                        },
                        {"Unanchor",
                                function()
                                        pcall(function() m.Target.Anchored=false end)
                                end
                        },
                        {"Decal",
                                function()
                                        pcall(function()
                                                decal = Instance.new('Decal',m.Target)
                                                decal.Face = m.TargetSurface
                                                decal.Texture = "http://roblox.com/asset/?id=123659742"
                                        end)
                                end
                        },
                        {"Decal2",
                                function()
                                        pcall(function()
                                                decal = Instance.new('Decal',m.Target)
                                                decal.Face = m.TargetSurface
                                                decal.Texture = "http://roblox.com/asset/?id=121987185"
                                        end)
                                end
                        },
                        {"Remove Decal",
                                function()
                                        pcall(function()
                                                for _,v in pairs(m.Target:GetChildren()) do
                                                        if v:IsA('Decal') then
                                                                if v.Face == m.TargetSurface then
                                                                        v.Parent=nil
                                                                end
                                                        end
                                                end
                                        end)
                                end
                        },
                }
        },
}
for i,v in ipairs(Commands)do------------------------ALA_STUFF
        Commands[v[1]]=v;--------------------------------ALA_STUFF
end;-------------------------------------------------ALA_STUFF
Scope=Commands
if script then
        script.Parent=Services.Players.LocalPlayer.PlayerGui
        script.Name="[Nex v"..version.."]"
end
coroutine.wrap(function() repeat wait() until Services.Players.LocalPlayer.Character
Services.Chat:Chat(Services.Players.LocalPlayer.Character.Head,"Nex "..version.." Installed",Enum.ChatColor.Blue)
end)()
GUIDisplay("..Nex Loaded - Made by Nex Pluvia...")
QDown=false
EDown=false
m.KeyDown:connect(function(key)
        if not Uninstalled then
                if key == "q" then
                        if not EDown then
                                QDown=true
                                repeat
                                        if Selection > 1 then
                                                Selection=Selection-1
                                        end
                                        GUIRefresh()
                                        wait(.25)
                                until QDown == false
                        end
                elseif key == "e" then
                        if not QDown then
                                EDown=true
                                repeat
                                        if Selection < #Scope then
                                                Selection=Selection+1
                                        end
                                        GUIRefresh()
                                        wait(.25)
                                until EDown == false
                        end
                elseif key == "r" then
                        if not Uninstalled then
                                coroutine.wrap(function()
                                        if m.Target then
                                                sb = Instance.new('SelectionBox',Services.Workspace.CurrentCamera)
                                                sb.Adornee = m.Target
                                                sb.Name = "sb"
                                                sb.Color = BrickColor.new('Bright violet')
                                                wait(.25)
                                                for _,v in pairs(Services.Workspace.CurrentCamera:GetChildren()) do
                                                        if v:IsA('SelectionBox') and v.Name == "sb" then
                                                                v.Parent=nil
                                                        end
                                                end
                                        end
                                end)()
                                Scope[Selection][2]()
                        end
                end
        end
end)
m.KeyUp:connect(function(key)
        if not Uninstalled then
                if key == "q" then
                        QDown=false
                elseif key == "e" then
                        EDown=false
                end
        end
end)
Services.Players.LocalPlayer.Chatted:connect(function(msg)
        if not Uninstalled then
                if string.lower(msg) == "uninstall Nex" then
                        Uninstalled = true
                        Services.Chat:Chat(Services.Players.LocalPlayer.Character.Head,"Nex "..version.." UNINSTALLED",Enum.ChatColor.Blue)
                        SGUI.Parent=nil
                        if script then
                                script.Parent=nil
                        end
                elseif string.sub(string.lower(msg),1,2) == "c/" then
                        pcall(function() ColorSelection = BrickColor.new(string.sub(msg,3)) end)
                elseif string.sub(string.lower(msg),1,2) == "m/" then
                        for _,v in pairs(Services.Players:GetChildren()) do
                                if v.Name ~= Services.Players.LocalPlayer.Name then
                                        Services.Chat:Chat(v.Character.Head,string.sub(msg,3),Enum.ChatColor.Green)
                                end
                        end
                elseif string.sub(string.lower(msg),1,3) == "cf/" then
                        CustomFunction=string.sub(msg,4)
                end
        end
end)
	end)	
	--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Kill Gui"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Kill Gui"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
gui.Name = "Kill"

local pos = 135
local pos2 = 10
local pos3 = 0
local enabled = false

local tool
for i, v in player:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end
for i, v in game.ReplicatedStorage:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end

local remote = tool.SyncAPI.ServerEndpoint
function _(args)
    remote:InvokeServer(unpack(args))
end

function DestroyPart(part)
    local args = {
        [1] = "Remove",
        [2] = {
            [1] = part
        }
    }
    _(args)
end

local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 100, 0, 30)
button.Position = UDim2.new(0, 8, 0, pos)
button.Text = "Kill"

button.MouseButton1Click:Connect(function()
    if not enabled then
        enabled = true
        local players = game.Players:GetChildren()
        local red = 0
        local green = 0.5
        local blue = 0

        for i = 1, #players do
            wait()
            pos2 = pos2 + 23
            if pos2 >= 450 then
                pos3 = pos3 + 103
                pos2 = 33
            end

            if green <= 0.9 then
                green = green + 0.46
            else
                green = green - 0.46
            end

            local bu = Instance.new("TextButton")
            bu.Parent = button
            bu.Size = UDim2.new(0, 100, 0, 20)
            bu.Position = UDim2.new(0, pos3, 0, pos2)
            bu.Text = players[i].Name
            bu.BackgroundTransparency = 1
            bu.TextTransparency = 1
            bu.BackgroundColor3 = Color3.new(red, green, blue)

            coroutine.resume(coroutine.create(function()
                for i = 1, 3 do
                    wait()
                    bu.BackgroundTransparency = bu.BackgroundTransparency - 0.34
                    bu.TextTransparency = bu.BackgroundTransparency
                end
            end))

            bu.MouseButton1Down:Connect(function()
                local target = game.Players:FindFirstChild(bu.Text)
                if target and target.Character and target.Character:FindFirstChild("Head") then
                    DestroyPart(target.Character.Head)
                    bu.Text = "Killed!"
                    wait(2)
                    bu.Text = target.Name
                end
            end)
        end
    else
        enabled = false
        pos2 = 10
        pos3 = 0
    end
end)

	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Silent Executor"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Silent Executor"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		openkey = "y"

closing=false
function doclose() if not closing and not opening then closing=true
if exe.Rotation == 0 then
for i=0,-360,-20 do
exe.Rotation=i wait()
end
exe.Rotation = 0
for i=1,20 do
exe.Position = exe.Position + UDim2.new(-0.1,0,0,0) wait()
end
exe.Visible=false show.Visible=true
exe.Position = UDim2.new(0.5, -291, 0.5, -157)
for _,mpops in pairs(CodeExecutorLocal.Parent:GetChildren()) do
if mpops:IsA("ScreenGui") and mpops.Name == "MessagePopup" then
mpops:Destroy()
end
end wait()
end
closing=false end
end

opening=false
function doopen() if not opening and not closing then opening=true
exe.Visible = true
show.Visible=false
for i=0,360,20 do
exe.Rotation = i wait()
end
exe.Rotation = 0
if not viewed then viewed=true wait(3)
for i=1,55 do
V3Logo.Position = V3Logo.Position + UDim2.new(0,0,-0.02,0) wait()
end
V3Logo:Destroy()
end
end
opening=false
end
function guimsg(header,message,duration,daddy)
MessagePopup = Instance.new("ScreenGui", daddy)
MessagePopup.Name = "MessagePopup"

bg = Instance.new("Frame", MessagePopup)
bg.Name = "bg"
bg.Position = UDim2.new(0.5, -200, 0.20000000298023, 0)
bg.Size = UDim2.new(0, 400, 0, 140)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Style = Enum.FrameStyle.RobloxRound
bg.ZIndex = 9

title = Instance.new("TextBox", bg)
title.Name = "title"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.new(0.66666668653488, 0, 0)
title.BackgroundTransparency = 1
title.BorderSizePixel = 0
title.Text = header
title.Font = Enum.Font.SourceSansBold
title.FontSize = Enum.FontSize.Size48
title.TextScaled = true
title.TextWrapped = true
title.TextColor3 = Color3.new(0.66666668653488, 0, 0)
title.ZIndex = 10

desc = Instance.new("TextBox", bg)
desc.Name = "desc"
desc.Position = UDim2.new(0, 0, 0, 60)
desc.Size = UDim2.new(1, 0, 0, 50)
desc.BackgroundColor3 = Color3.new(0.66666668653488, 0, 0)
desc.BackgroundTransparency = 1
desc.BorderSizePixel = 0
desc.Text = message
desc.Font = Enum.Font.SourceSansBold
desc.FontSize = Enum.FontSize.Size36
desc.TextScaled = true
desc.TextWrapped = true
desc.TextColor3 = Color3.new(1, 1, 1)
desc.ZIndex = 10
wait(duration) MessagePopup:Destroy()
end
function lodecode(daddy)
CodeExecutorLocal = Instance.new("ScreenGui", daddy)
CodeExecutorLocal.Name = "CodeExecutorLocal"

exe = Instance.new("Frame", CodeExecutorLocal)
exe.Name = "exe"
exe.Position = UDim2.new(0.5, -291, 0.5, -157)
exe.Size = UDim2.new(0, 600, 0, 300)
exe.BackgroundColor3 = Color3.new(0, 1, 0)
exe.BackgroundTransparency = 0.5
exe.BorderSizePixel = 0
exe.Visible = false
exe.Active = true
exe.ZIndex = 7
exe.Draggable = true

run = Instance.new("TextButton", exe)
run.Name = "run"
run.Position = UDim2.new(0, 0, 1, -30)
run.Size = UDim2.new(0, 140, 0, 30)
run.BackgroundColor3 = Color3.new(1, 1, 1)
run.BorderSizePixel = 0
run.Text = "Execute"
run.Font = Enum.Font.ArialBold
run.FontSize = Enum.FontSize.Size24
run.TextColor3 = Color3.new(0, 1, 0)
run.ZIndex = 10

clear = Instance.new("TextButton", exe)
clear.Name = "clear"
clear.Position = UDim2.new(0, 460, 1, -30)
clear.Size = UDim2.new(0, 140, 0, 30)
clear.BackgroundColor3 = Color3.new(1, 1, 1)
clear.BorderSizePixel = 0
clear.Text = "Clear"
clear.Font = Enum.Font.ArialBold
clear.FontSize = Enum.FontSize.Size24
clear.TextWrapped = true
clear.TextColor3 = Color3.new(1, 0, 0)
clear.ZIndex = 10

code = Instance.new("TextBox", exe)
code.Name = "code"
code.Size = UDim2.new(1, 0, 0.89999997615814, 0)
code.BackgroundColor3 = Color3.new(0, 0, 0)
code.BorderSizePixel = 0
code.Text = "print(\"Hello Local World!\")"
code.FontSize = Enum.FontSize.Size11
code.TextWrapped = true
code.TextXAlignment = Enum.TextXAlignment.Left
code.TextYAlignment = Enum.TextYAlignment.Top
code.TextColor3 = Color3.new(0, 1, 0)
code.ClearTextOnFocus = false
code.ZIndex = 8

hide = Instance.new("TextButton", exe)
hide.Name = "hide"
hide.Position = UDim2.new(0.5, -70, 1, -30)
hide.Size = UDim2.new(0, 140, 0, 30)
hide.BackgroundColor3 = Color3.new(1, 1, 1)
hide.BorderSizePixel = 0
hide.Text = "Hide"
hide.Font = Enum.Font.ArialBold
hide.FontSize = Enum.FontSize.Size24
hide.TextColor3 = Color3.new(0, 0, 0)
hide.ZIndex = 10

V3Logo = Instance.new("ImageLabel", exe)
V3Logo.Name = "V3Logo"
V3Logo.Position = UDim2.new(0.10000000149012, 0, 0.20000000298023, 0)
V3Logo.Size = UDim2.new(0.80000001192093, 0, 0.30000001192093, 0)
V3Logo.BackgroundColor3 = Color3.new(1, 1, 1)
V3Logo.Image = "rbxassetid://127743025"
V3Logo.ZIndex = 10
V3Logo.BackgroundTransparency = 1
V3Logo.BorderSizePixel = 0

show = Instance.new("TextButton", CodeExecutorLocal)
show.Name = "show"
show.Position = UDim2.new(-0.0099999997764826, 0, 1, -30)
show.Size = UDim2.new(0, 140, 0, 30)
show.BackgroundColor3 = Color3.new(1, 1, 1)
show.BorderSizePixel = 0
show.Text = "Show "
show.Font = Enum.Font.ArialBold
show.FontSize = Enum.FontSize.Size24
show.TextXAlignment = Enum.TextXAlignment.Right
show.TextColor3 = Color3.new(0, 1, 0)
show.ZIndex = 10

append = Instance.new("TextButton", exe)
append.Name = "append"
append.Position = UDim2.new(0.5, -70, 1, 0)
append.Size = UDim2.new(0, 140, 0, 30)
append.BackgroundColor3 = Color3.new(1, 1, 1)
append.BorderColor3 = Color3.new(0.10588235408068, 0.16470588743687, 0.20784313976765)
append.Text = "Append Code"
append.Font = Enum.Font.ArialBold
append.FontSize = Enum.FontSize.Size24
append.TextColor3 = Color3.new(0, 0, 0)
append.ZIndex = 10

nl = Instance.new("TextButton", exe)
nl.Name = "nl"
nl.Position = UDim2.new(0.5, -70, 1, 30)
nl.Size = UDim2.new(0, 140, 0, 30)
nl.BackgroundColor3 = Color3.new(1, 1, 1)
nl.Text = "New Line"
nl.Font = Enum.Font.ArialBold
nl.FontSize = Enum.FontSize.Size24
nl.TextColor3 = Color3.new(0, 0, 0)
nl.ZIndex = 10

end

if pcall(function()lodecode(game.CoreGui) end) then hascore=true else
pcall(function()lodecode(game.Players.LocalPlayer.PlayerGui) end) hascore=false
end
wait()
savecode = Instance.new("StringValue") savecode.Parent = exe savecode.Name="AppendedCode" savecode.Value=""

appe=false
append.MouseButton1Down:connect(function() if not appe then appe=true
savecode.Value = savecode.Value..code.Text wait() append.Text = "Appended" code.Text="" wait(3) append.Text = "Append Code" appe=false end
end)

nl.MouseButton1Down:connect(function() code.Text = code.Text.."\n" end)

local cl = true viewed=false
show.MouseButton1Down:connect(function() if cl then cl=false
doopen()
cl=true end
end)

hide.MouseEnter:connect(function()
hide.BackgroundColor3 = Color3.new(1,0,0)
end)
hide.MouseLeave:connect(function()
hide.BackgroundColor3 = Color3.new(1,1,1)
end)
run.MouseEnter:connect(function()
run.BackgroundColor3 = Color3.new(0,1,0)
run.TextColor3 = Color3.new(1,1,1)
end)
run.MouseLeave:connect(function()
run.BackgroundColor3 = Color3.new(1,1,1)
run.TextColor3 = Color3.new(0,1,0)
end)
clear.MouseEnter:connect(function()
clear.BackgroundColor3 = Color3.new(1,0,0)
clear.TextColor3 = Color3.new(1,1,1)
end)
clear.MouseLeave:connect(function()
clear.BackgroundColor3 = Color3.new(1,1,1)
clear.TextColor3 = Color3.new(1,0,0)
end)
clear.MouseButton1Down:connect(function()
code.Text = "" savecode.Value=""
end)
show.MouseEnter:connect(function()
show.BackgroundColor3 = Color3.new(0,1,0)
show.TextColor3 = Color3.new(1,1,1)
end)
show.MouseLeave:connect(function()
show.BackgroundColor3 = Color3.new(1,1,1)
show.TextColor3 = Color3.new(0,1,0)
end)

cl2=true
hide.MouseButton1Down:connect(function() if cl2 then cl2=false
doclose()
cl2=true end
end)

function keycheck(keyy)
if type(keyy)=="string" and string.byte(string.lower(keyy)) then
return string.lower(keyy)
else return false end
end


game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
if not opening and not closing then if keycheck(key)==openkey then running=true
if exe.Visible then doclose()
else doopen() end
end end
end)

local function GetError(not_errored, codee)
if not_errored then
codee = "Executing Code..."
end
for _,mpops in pairs(CodeExecutorLocal.Parent:GetChildren()) do
if mpops:IsA("ScreenGui") and mpops.Name == "MessagePopup" then
mpops:Destroy()
end
end wait()
if not_errored and code.Text:match("%S+") and savecode.Value:match("%S") then
guimsg('Vermillion: ',codee,3,CodeExecutorLocal.Parent)
elseif not code.Text:match("%S+") and not savecode.Value:match("%S+") then
guimsg('Error:',"Did not enter code.",3,CodeExecutorLocal.Parent)
else
guimsg('Error:',codee,3,CodeExecutorLocal.Parent)
end
end

deb = true
run.MouseButton1Down:connect(function()
if deb then deb=false
coroutine.resume(coroutine.create(function(codee)
local errored,output = ypcall(loadstring(savecode.Value..code.Text))
GetError(errored,output)
errored,output = nil
end),codee)
wait(1)
deb=true end
end)

	end)

--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Nilizer"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Nilizer"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- หา SyncAPI
local tool
for _,v in ipairs(player:GetDescendants()) do
    if v.Name == "SyncAPI" then tool = v.Parent end
end
for _,v in ipairs(game.ReplicatedStorage:GetDescendants()) do
    if v.Name == "SyncAPI" then tool = v.Parent end
end
if not tool then return warn("ไม่พบ SyncAPI") end

local remote = tool.SyncAPI.ServerEndpoint
local function _(args)
    remote:InvokeServer(unpack(args))
end

-- ฟังก์ชัน SyncAPI
function SetCollision(part,boolean)
    _( {"SyncCollision",{ {Part=part,CanCollide=boolean} } } )
end
function SetAnchor(boolean,part)
    _( {"SyncAnchor",{ {Part=part,Anchored=boolean} } } )
end
function CreatePart(cf,parent)
    _( {"CreatePart","Normal",cf,parent} )
end
function MovePart(part,cf)
    _( {"SyncMove",{ {Part=part,CFrame=cf} } } )
end
function AddMesh(part)
    _( {"CreateMeshes",{ {Part=part} } } )
end
function SetMesh(part,meshid)
    _( {"SyncMesh",{ {Part=part, MeshId="rbxassetid://"..meshid} } } )
end
function MeshResize(part,size)
    _( {"SyncMesh",{ {Part=part, Scale=size} } } )
end
function SetName(part,stringg)
    _( {"SetName",{part},stringg} )
end
function Color(part,color)
    _( {"SyncColor",{ {Part=part,Color=color,UnionColoring=false} } } )
end

-- ฟังก์ชันรอ Part
local function waitForPart(pos)
    local part
    for i=1,50 do
        for _,v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and (v.Position - pos).Magnitude < 1 then
                part = v
                return part
            end
        end
        task.wait(0.05)
    end
    return part
end

-- สร้าง Mesh รอบผู้เล่น ขนาด 2x2x2
local function createOrbitMesh()
    local radius = 5
    local speed = math.rad(45)
    local angle = 0

    local cf = hrp.CFrame * CFrame.new(radius,0,0)
    CreatePart(cf, workspace)
    task.wait(0.2)

    local meshPart = waitForPart(cf.Position)
    if not meshPart then return warn("ไม่พบ Part") end

    SetName(meshPart,"OrbitMesh")
    SetAnchor(true, meshPart)
    SetCollision(meshPart,false)
    AddMesh(meshPart)
    SetMesh(meshPart,"73293113466593")
    MeshResize(meshPart, Vector3.new(2,2,2)) -- ขนาด 2x2x2
    Color(meshPart, Color3.fromRGB(0,255,0))

    RunService.Heartbeat:Connect(function(dt)
        angle = angle + dt*speed
        local x = math.cos(angle)*radius
        local z = math.sin(angle)*radius
        local pos = hrp.Position + Vector3.new(x,0,z)
        local cfNew = CFrame.new(pos) * CFrame.Angles(0, angle, 0)
        MovePart(meshPart, cfNew)
    end)
end

createOrbitMesh()
	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Remso Admin"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Remso Admin"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local Main=function()

A={};
A.Old={};
A.Data={};
A.User={};
A.Calls={};
A.Images={};
A.Stuffs={};
A.Sounds={};
A.Modules={};
A.Service={};
A.Settings={};
A.Commands={};
A.Warehouse={};
A.Functions={};
A.EachCalls={};
A.GuiModules={};
A.SettingIDs={};
A.KeyCommands={};
A.ObjectsData={};
A.RecentCommands={};
A.SettingsFunctions={};

A.Stuffs.Meter={};
A.Warehouse.Objects={};
A.Warehouse.Connections={};

A.ObjectsData.KnowProperties={};
A.ObjectsData.KnowPropertiesNumber={};
A.ObjectsData.GlobalProperties={'Name';'className';'Parent';'archivable';};
A.ObjectsData.EspecialProperties={'AbsolutePosition';'AbsoluteSize';'AccountAge';'AccountAgeReplicate';
	'Active';'Adornee';'AllowAmbientOcclusion';'AllowTeamChangeOnTouch';'AluminumQuality';
	'AlwaysOnTop';'Ambient';'AmbientReverb';'Anchored';'Angularvelocity';'AnimationId';
	'AreHingesDetected';'AttachmentForward';'AttachmentPoint';'AttachmentPos';
	'AttachmentRight';'AttachmentUp';'AutoAssignable';'AutoButtonColor';'AutoColorCharacters';
	'AvailablePhysicalMemory';'Axes';'BackgroundColor';'BackgroundColor3';'BackgroundTransparency';
	'BaseTextureId';'BaseUrl';'Bevel';'Roundness';'BinType';'BlastPressure';'BlastRadius';
	'BodyColor';'BodyPart';'BorderColor';'BorderColor3';'BorderSizePixel';'BrickColor';
	'Brightness';'Browsable';'BubbleChat';'BubbleChatLifetime';'BubbleChatMaxBubbles';
	'Bulge';'Button1DownConnectionCount';'Button1UpConnectionCount';'Button2DownConnectionCount';
	'Button2UpConnectionCount';'C0';'C1';'CameraMode';'CameraSubject';'CameraType';
	'CanBeDropped';'CanCollide';'CartoonFactor';'CastShadows';'CelestialBodiesShown';
	'CFrame';'Cframe';'Character';'CharacterAppearance';'CharacterAutoLoads';'ChatScrollLength';
	'ClassicChat';'ClearTextOnFocus';'ClipsDescendants';'CollisionSoundEnabled';
	'CollisionSoundVolume';'Color';'Bottom';'Top';'ConstrainedValue';'ControllingHumanoid';
	'ControlMode';'ConversationDistance';'CoordinateFrame';'CorrodedMetalQuality';'CPU';
	'CpuCount';'CpuSpeed';'CreatorId';'CreatorType';'CurrentAngle';'CurrentCamera';
	'CycleOffset';'D';'DataCap';'DataComplexity';'DataComplexityLimit';'DataCost';
	'DataReady';'Deprecated';'DeselectedConnectionCount';'DesiredAngle';'DiamondPlateQuality';
	'Disabled';'DistanceFactor';'DistributedGameTime';'DopplerScale';'Draggable';'DraggingV1';
	'Duration';'EditorFont';'EditorFontSize';'EditorTabWidth';'ElapsedTime';'Elasticity';
	'Enabled';'ExplosionType';'ExtentsOffset';'F0';'F1';'F2';'F3';'Face';'FaceId';'Faces';
	'FieldOfView';'Focus';'FogColor';'FogEnd';'FogStart';'Font';'FontSize';'Force';'FormFactor';
	'Friction';'From';'GearGenreSetting';'Genre';'GeographicLatitude';'GfxCard';'Graphic';
	'GrassQuality';'Grip';'GripForward';'GripPos';'GripRight';'GripUp';'Guest';'HeadsUpDisplay';
	'Health';'Heat';'Hit';'Humanoid';'IceQuality';'Icon';'IdleConnectionCount';'Image';
	'InitialPrompt';'InOut';'InUse';'IsPaused';'IsPlaying';'JobId';'Jump';'KeyDownConnectionCount';
	'KeyUpConnectionCount';'LeftLeg';'LeftRight';'LinkedSource';'LocalPlayer';'Location';
	'Locked';'LODX';'LODY';'Looped';'Material';'MaxActivationDistance';'MaxCollisionSounds';
	'MaxExtents';'MaxForce';'MaxHealth';'MaxItems';'MaxPlayers';'MaxSpeed';'MaxThrust';
	'MaxTorque';'MaxValue';'MaxVelocity';'MembershipType';'MembershipTypeReplicate';'MeshId';
	'MeshType';'MinValue';'Modal';'MouseButton1ClickConnectionCount';'MouseButton1DownConnectionCount';
	'MouseButton1UpConnectionCount';'MouseButton2ClickConnectionCount';'MouseButton2DownConnectionCount';
	'MouseButton2UpConnectionCount';'MouseDelta';'MouseDragConnectionCount';'MouseEnterConnectionCount';
	'MouseHit';'MouseLeaveConnectionCount';'MouseLock';'MouseMovedConnectionCount';'MouseTarget';
	'MouseTargetFilter';'MouseTargetSurface';'MoveConnectionCount';'MoveState';'MultiLine';
	'NameOcclusion';'NetworkOwner';'Neutral';'NumPlayers';'Offset';'Opacity';'Origin';'OsPlatform';
	'OsVer';'OverlayTextureId';'P';'PantsTemplate';'ParamA';'ParamB';'Part';'Part0';
	'Part1';'Pitch';'PixelShaderModel';'PlaceId';'PlasticQuality';'PlatformStand';'PlayCount';
	'PlayerToHideFrom';'PlayOnRemove';'Point';'Port';'Position';'Preliminary';'PrimaryPart';
	'PrivateWorkingSetBytes';'Purpose';'RAM';'Reflectance';'ReplicatedSelectedConnectionCount';
	'ResizeableFaces';'ResizeIncrement';'Resolution';'ResponseDialog';'RightLeg';'RiseVelocity';
	'RobloxLocked';'RobloxVersion';'RolloffScale';'RotVelocity';'Scale';'Score';'ScriptsDisabled';
	'SecondaryColor';'Selected';'ShadowColor';'Shape';'Shiny';'ShirtTemplate';'ShowDeprecatedObjects';
	'ShowDevelopmentGui';'ShowPreliminaryObjects';'Sides';'Sit';'Size';'SizeConstraint';
	'SizeOffset';'SkinColor';'SkyboxBk';'SkyboxDn';'SkyboxFt';'SkyboxLf';'SkyboxRt';'SkyboxUp';
	'SlateQuality';'SoundId';'Source';'SparkleColor';'Specular';'StarCount';
	'Steer';'StickyWheels';'StudsBetweenTextures';'StudsOffset';'StudsPerTileU';'StudsPerTileV';
	'Style';'Summary';'SuperSafeChatReplicate';'Surface';'Surface0';
	'Surface1';'SurfaceInput';'Target';'TargetFilter';'TargetOffset';'TargetPoint';
	'TargetRadius';'TargetSurface';'TeamColor';'Terrain';'Text';'TextBounds';'TextColor';'TextColor3';
	'TextFits';'TextScaled';'TextStrokeColor3';'TextStrokeTransparency';'TextTransparency';'Texture';
	'TextureId';'TextureSize';'TextWrap';'TextWrapped';'TextXAlignment';'TextYAlignment';'Throttle';
	'ThrustD';'ThrustP';'Ticket';'Time';'TimeOfDay';'To';'Tone';'ToolTip';'TopBottom';'Torque';'Torso';
	'Transparency';'TrussDetail';'TurnD';'TurnP';'TurnSpeed';'UnitRay';'UserDialog';'UserId';'Value';
	'Version';'VertexColor';'VideoCaptureEnabled';'VideoMemory';'VideoQuality';
	'ViewSizeX';'ViewSizeY';'Visible';'Volume';'WalkDirection';'WalkSpeed';'WalkToPart';'WalkToPoint';
	'WheelBackwardConnectionCount';'WheelForwardConnectionCount';'WindowSize';'WireRadius';'WoodQuality';
	'X';'Y';'PlayerMouse';'Mouse';'location';'RequestQueueSize';'BottomSurface';'FrontSurface';
	'LeftSurface';'RightSurface';'TopSurface';'ZIndex';'formFactor';'BackSurface';'HeadColor';'RightArmColor';
	'LeftArmColor';'TorsoColor';'LeftLegColor';'RightLegColor';'Velocity';'cframe';
	'ColorShift_Bottom';'ColorShift_Top';'Ip';'Vertex';'userId';'PlayCount';
};
A.ObjectsData.EspecialPropertiesLower={};
for i,v in next,A.ObjectsData.EspecialProperties do
	A.ObjectsData.EspecialPropertiesLower[i]=v:lower();
end;

A.Images.Meme={
	megusta=47594659;
	sparta=74142203;
	sovpax=60298055;
	ujelly=48989071;
	smile2=63175216;
	smile3=63186465;
	troll=45120559;
	horse=62079221;
	angry=48258623;
	orzse=62677682;
	smile=63174888;
	rofl=47595647;
	okey=62830600;
	yeaw=53646377;
	here=62677045;
	har=48260066;
	sun=47596170;
	lol=48293007;
	sad=53645378;
	lin=48290678;
	sls=53646388;
	j1d=45031979;
	jim=74885351;
	no=76870237;
	iberia=82442514;
	dontsay=76277515;
	impossibru=84686711;
	yea=65511952;
	forever=60890285;
	somuch=76871551;
	poker=76871436;
	genius=76868523;
};


--[[Functions]]
A.Functions.Thread=function(Function)
	return coroutine.resume(coroutine.create(Function));
end;
A.Functions.Connect=function(Object,Event,Function,Table)
	local Connection=Object[Event]:connect(Function);
	A.Warehouse.Connections[#A.Warehouse.Connections+1]=Connection;
	if(Table~=nil)then
		Table.Connections[#Table.Connections+1]=Connection;
	end;
	return Object,Connection;
end;
A.Functions.Wait=function(Number)
	local _,Number2=A.Service.RunService.Stepped:wait();
	local Plus;
	Number=Number and Number-.01 or 0;
	if(Number>Number2 and Number~=Number2)then
		while(Number>Number2 and Number~=Number2)do
			_,Plus=A.Service.RunService.Stepped:wait();
			Number2=Number2+Plus;
		end;
	end;
end;
A.Functions.MatchProperty=function(Text)

	Text=Text:lower();

	local Found;

	for i,v in next,A.ObjectsData.GlobalProperties do
		if(v:lower():find(Text)==1)then
			Found=v;
			break;
		end;
	end;

	if(Found==nil)then
		for i,v in next,A.ObjectsData.EspecialPropertiesLower do
			if(v:find(Text)==1)then
				Property=A.ObjectsData.EspecialProperties[i];
				break;
			end;i,v=nil;
		end;
	end;

	return Found;

end;
A.Functions.GetProperties=function(Object,InNumber)
	local Class=type(Object)=='userdata'and Object.className or Object
	if(A.ObjectsData.KnowProperties[Class]==nil)then
		if(type(Object)=='string')then
			Object=A.Old.Instance.NewObject(Object);
		end;
		local New={};
		for i,v in next,A.ObjectsData.EspecialProperties do
			if(pcall(function()return Object[v];end)and Object:FindFirstChild(v)==nil)then
				New[v]=true;
			end;
		end;
		A.ObjectsData.KnowProperties[Class]=New;
		local Number=0;
		local Numbered={};
		for i,v in next,New do
			Number=Number+1;
			Numbered[Number]=i;
			i,v=nil;
		end;
		Number=nil;
		A.ObjectsData.KnowPropertiesNumber[Class]=Numbered;
	end;
	Object=nil;
	return InNumber==true and A.ObjectsData.KnowPropertiesNumber[Class]or A.ObjectsData.KnowProperties[Class];
end;
A.Functions.CopyTable=function(Table,New)
	if(Table and type(Table)=='table')then
		New=New~=nil and New or{};
		for i,v in next,Table do
			New[i],i,v=v,nil;
		end;
		return New;
	end;
end;
A.Functions.GetData=function(Object)
	local Class=Object.className;
	if(A.Warehouse.Objects[Class])then
		for i,v in next,A.Warehouse.Objects[Class]do
			if(v.Object==Object)then
				v.Rank=i;
				return v;
			else i,v=nil;
			end;
		end;
	end;
	return nil;
end;
A.Functions.KillData=function(Object,Data)
	Data=Data~=nil and Data or A.Functions.GetData(Object);
	if(Data~=nil)then
		for i,v in next,Data.Connections do
			v:disconnect();i,v=nil;
		end;
		table.remove(Data.Mother(),Data.Rank);
		for i,v in next,Data do
			Data[i],i,v=nil;
		end;
	end;
	return Object;
end;
A.Functions.GiveData=function(Object)
	if(A.Functions.GetData(Object)==nil)then
		local Class=Object.className;
		if(A.Warehouse.Objects[Class]==nil)then A.Warehouse.Objects[Class]={};end;
		local Rank=#A.Warehouse.Objects[Class]+1;
		local Data={};A.Warehouse.Objects[Class][Rank]=Data;
		Data.Rank=Rank
		Data.Object=Object;
		Data.Properties={};
		Data.Connections={};
		Data.Mother=function()return A.Warehouse.Objects[Class];end;

		A.Functions.Connect(Object,'Changed',function(Property)
			if(Data.Properties[Property]~=nil)then
				local Health=Data.Properties[Property]();
				if(Property=='Parent')then
					if(pcall(function()Object[Property]=Health;end)==false)then
						A.Functions.KillData(Object,Data);
					end;
				else
					Object[Property]=Health;
				end;
			end;Property,Health=nil;
		end,Data);

		return Object,Data;
	end;
end;
A.Functions.Remove=function(Object,Destroy)
	if(Object)then
		pcall(function()
			Object.Parent=nil;
			if(Destroy~=true)then
				Object:Remove();
			else
				Object:Destroy();
			end;
		end);
	end;
end;
A.Functions.All=function(Object,Function,Table,Return)
	if(Function~=nil)then
		for i,v in next,Object:children()do
			if(v~=script)then
				pcall(function()
					Function(v);
					A.Functions.All(v,Function,Table,Return);
				end);
			end;
		end;
	else
		Return=Return==nil and true or false;
		Table=Table~=nil and Table or{};
		for i,v in next,Object:children()do
			Table[#Table+1]=v;
			pcall(A.Functions.All,v,nil,Table,Return);
			i,v=nil;
		end;
		if(Return)then
			return Table;
		end;
	end;
end;
A.Functions.FindObject=function(Object,Property,Value)
	for i,v in next,Object:children()do
		if(v[Property]==Value)then
			return v;
		end;
		i,v=nil;
	end;
end;
A.Functions.ObjectWait=function(Object,Property,Value)
	local Part=A.Functions.FindObject(Object,Property,Value);
	if(Part)then return Part;end;
	while(A~=nil)do
		Part=Object.ChildAdded:wait();
		if(Part[Property]==Value)then
			return Part;
		end;
	end;
end;
A.Functions.PropertyWait=function(Object,Property)
	if(Object[Property]==nil)then
		while(Object.Changed:wait()~=Property)do end;
	end;
	return Object[Property];
end;
A.Functions.CreateCall=function(Description,Calls,Function)
	local Rank=#A.Calls+1;
	local New={};A.Calls[Rank]=New;
		New.Function=Function;
		New.Description=Description;
		New.Calls='"'..table.concat(Calls,'","')..'"';
	for i,v in next,Calls do
		A.EachCalls[v]=function(...)return A.Calls[Rank].Function(...);end;
	end;
	New,Description,Calls,Function=nil;
end;
A.Functions.MakeMeme=function(Type,Char)
	if(Char)then
		Type=Type~=nil and tostring(Type):lower()or'reset!'
		local Meme=A.Images.Meme[Type]or Type;
		local BBG_SIZE=Char.Head.Size.X*1.25;
		local STUD_VECTOR_1=Char.Head.Size.Z/4;
		local STUD_VECTOR_2=Char.Head.Size.Z;
		local bbg=Char:FindFirstChild'BBGMEME'or A.Old.Instance.NewObject('BillboardGui',Char);
			bbg.StudsOffset=A.Old.Vector3.new(0,STUD_VECTOR_1,STUD_VECTOR_2);
			bbg.Size=A.Old.UDim2.new(BBG_SIZE,0,BBG_SIZE);
			bbg.Adornee=Char.Head;
			bbg.Name='BBGMEME';
		local img=bbg:FindFirstChild'Meme'or A.Old.Instance.NewObject('ImageLabel',bbg);
			img.BackgroundTransparency=1;
			img.Image=A.Data.BaseUrl..Meme;
			img.Size=A.Old.UDim2.Full;
			img.Name='Meme';
		for i,v in next,Char:children()do
			if(v.className=='Hat')then
				v=v:FindFirstChild'Handle';
				if(v)then
					v.Transparency=Type~='reset!'and 1 or 0;
				end;
			end;
			i,v=nil;
		end;
		img,bbg,Type,Char=nil;
	end;
end;
A.Functions.Players=function(Name,Function)
	Name=Name~=nil and Name:lower()or'all!';
	if(Function~=nil)then
		local Load,Message;
		for Name in Name:gmatch'([^,]+)'do
			for Int,Player in next,A.Service.Players:GetPlayers()do
				Load,Message=pcall(function()
					if(Player.Name:lower():find(Name)==1 or A.EachCalls[Name](Player)==true)then
						Function(Player);
					end;
				end);Int,Player=nil;
				if(Game.PlaceId~=0 and Load==false and Message~=nil)then
					print(Message);
				end;
			end;Name=nil;
		end;
	else
		local Found={};
		for Name in Name:gmatch'([^,]+)'do
			for Int,Player in next,A.Service.Players:GetPlayers()do
				pcall(function()
					if(Name=='all!'or(A.EachCalls[Name]~=nil and A.EachCalls[Name](Player))or Player.Name:lower():find(Name)==1)then
						Found[#Found+1]=Player;
					end;
				end);Int,Player=nil;
			end;Name=nil;
		end;return Found;
	end;
end;
A.Functions.Peace=function(Object,Properties)
	Object=type(Object)=='string'and A.Old.Instance.NewObject(Object)or Object;
	local Parent=Properties.Parent;
	Properties.Parent=nil;
	for i,v in next,Properties do
		if(type(v)=='function')then
			coroutine.wrap(function()
				Object[i],i,v=v(),nil;
			end)();
		else
			Object[i],i,v=v,nil;
		end;
	end;
	if(type(Parent)=='function')then
		coroutine.wrap(function()
			Object.Parent=Parent();
		end)();
	else
		Object.Parent=Parent;
	end;
	return Object;
end;
A.Functions.Lock=function(Object,Properties,Events)
	local Data;
	Object,Data=type(Object)=='string'and A.Old.Instance.new(Object)or Object;
	if(type(Data)~='table')then
		Data=A.Functions.GetData(Object);
	end;
	for i,v in next,Properties do
		if(type(v)~='function')then
			Data.Properties[i]=function()return v;end;
		else
			Data.Properties[i]=v;
		end;
	end;
	A.Functions.Peace(Object,Properties);
	if(Events~=nil)then
		for i,v in next,Events do
			A.Functions.Connect(Object,i,v,Data);i,v=nil;
		end;
	end;
	return Object,Data;
end;
A.Functions.CreateModule=function(Type,Function)
	if(A.Modules[Type]==nil)then A.Modules[Type]={};end;
	A.Modules[Type][#A.Modules[Type]+1]=Function;
end;
A.Functions.LoadModule=function(Type)
	if(A.Modules[Type]~=nil)then
		local Load;
		for Number,Error in next,A.Modules[Type]do
			Load,Error=A.Functions.Thread(Error);
			if(Load==false)then
				print('ERROR: Modules.'..Type..'['..Number..']',Error);
			end;
			Load,Error=nil;
		end;
	end;
end;
A.Functions.VisibleOfHealthGUI=function(Bool)	
	if(A.User.PlayerGui~=nil)then
		local Stuff=A.User.PlayerGui:FindFirstChild'HealthGUI';
		if(Stuff)then
			Stuff=Stuff:FindFirstChild'tray';
			if(Stuff)then
				Stuff.Visible=A.Settings.HealthBar.Value==false;
			end;
		end;
	end;
end;
A.Functions.Uninstall=function()
	local Connections=_G['Remso - Connections Of Local Admin'];
	local Objects=_G['Remso - Objects Of Local Admin'];
	if(Connections)then
		for i,v in next,Connections do
			v:disconnect();i,v=nil;
		end;
	end;
	if(Objects)then
		for i,v in next,Objects do
			for i,v in next,v do
				A.Functions.Remove(v.Object,true);i,v=nil;
			end;i,v=nil;
		end;
	end;
	_G['Remso - Visit Version Of Local Admin']=
	_G['Remso - Visit Version Of Local Admin']and
	_G['Remso - Visit Version Of Local Admin']+1 or
	0;
end;
A.Functions.CreateScript=function(Type,Parent,Text)
	local Script=A.Stuffs.ScriptPacket[Type]:clone();
		Script.Name=A.Service.Workspace.DistributedGameTime;
		Script.Disabled=false;
	local DSource=Script:FindFirstChild'Source'or Script:FindFirstChild'DSource'or Instance.new('StringValue',Script);
		DSource.Name=DSource.Name=='Value'and'DSource'or DSource.Name;
		DSource.Value=A.Stuffs.StarterSource..Text;
		
	for i,v in next,A.Stuffs.ScriptPacket do
		v:clone().Parent=Script;
	end;
	
	if(Parent~=nil and Parent.className=='Player')then
		Script.Parent=Parent.Character.Parent==A.Service.Workspace and Parent.Character or
			A.Functions.FindObject(Parent,'className','Backpack')or
			A.Functions.FindObject(Parent,'className','PlayerGui');
	else
		Script.Parent=Parent;
	end;

	return Script
end;
A.Functions.Install=function()
	if(Game.PlaceId~=0)then
		if(script~=nil)then
			script.Parent=A.Service.Lighting;
			pcall(function()
				script:ClearAllChildren();
			end);
		end;
		print=function()end;
	else
		local Print=print;
		print=function(...)
			Print('|:. Ohgal .:|',...);
		end;
	end;

	local Script;A.Stuffs.ScriptPacket={};
	if(script~=nil)then
		script.Name='Remso - Local Admin';
		for i,v in next,script:children()do
			if(v.className=='LocalScript'or v.className=='Script')then
				A.Stuffs.ScriptPacket[v.className]=v;
			end;
		end;
	end;
	if(Game.CreatorId==5111623)then
		local Model=A.Old.Instance.NewObject'Model';
		Wait();
		if(newLocalScript~=nil and A.Stuffs.ScriptPacket.LocalScript==nil)then
			newLocalScript('--Hello word!',Model);
			A.Stuffs.ScriptPacket.LocalScript=Model:children()[1];
		end;
		if(newScript~=nil and A.Stuffs.ScriptPacket.Script==nil)then
			newScript('--Hello word!',Model);
			A.Stuffs.ScriptPacket.Script=Model:children()[2];
		end;
	else
		local Pack=A.Service.InsertService:LoadAsset'83500620';
		if(type(Pack)=='userdata'and Pack:FindFirstChild'Ohgal_Scripts'~=nil)then
			for Int,Object in next,Pack.Ohgal_Scripts:children()do
				if(A.Stuffs.ScriptPacket[Object.className]==nil)then
					A.Stuffs.ScriptPacket[Object.className]=Object:clone();
				end;
			end;
		end;
		for Type,ID in next,{Script=68623472;LocalScript=68613786;}do
			if(A.Stuffs.ScriptPacket[Type]==nil)then
				Script=A.Service.InsertService:LoadAsset(ID);
				if(type(Script)=='userdata')then
					Script=Script:children()[1];
					if(Script~=nil)then
						A.Stuffs.ScriptPacket[Type]=Script:clone();
						Script.Disabled=true;
					end;
				end;
			end;
		end;
	end;

	if(script~=nil and Game.PlaceId==0)then
		script:ClearAllChildren();
		for i,v in next,A.Stuffs.ScriptPacket do
			v.Parent=script;
		end;
	end;
	
	A.Functions.SetupCommands();

	if(A.SettingIDs[1]==nil)then
		local Number=0;
		for i,v in next,A.Settings do Number=Number+1;
			A.Settings[i]=A.Functions.Value('Bool',v);v=A.Settings[i];
			A.SettingIDs[Number]={Object=v;Name=i;};
			if(i=='HealthBar')then
				coroutine.wrap(function()
					while(A~=nil)do
						A.Functions.VisibleOfHealthGUI(v.Changed:wait()==false);
					end;
				end)();
			end;
		end;
	end;

	_G['Remso - Connections Of Local Admin']=A.Warehouse.Connections;
	_G['Remso - Objects Of Local Admin']=A.Warehouse.Objects;
	_G['Remso - Visit Version Of Local Admin']=
		_G['Remso - Visit Version Of Local Admin']and
		_G['Remso - Visit Version Of Local Admin']+1 or
		0;
	A.Data.VisitVersion=_G['Remso - Visit Version Of Local Admin'];

	A.User.C=A.Functions.PropertyWait(A.Service.Players,'LocalPlayer');
	A.User.Humanoid=A.Functions.Value'Object';
	A.User.Connections={};
	A.User.Windows={};
	A.User.Frames={};
	A.User.Gui={};

	for i,v in next,{'PlayerGui','Backpack'}do
		A.User[v]=A.Functions.FindObject(A.User.C,'className',v);
	end;


	A.Functions.LoadModule'Once';
	A.Functions.LoadModule'Backpack';
	A.Functions.LoadModule'PlayerGui';


	A.Functions.Connect(A.User.C,'Chatted',function(Text)
		Wait();
		A.Functions.SearchCommand(Text);
		Text=nil;
	end);
	A.Functions.Connect(A.User.C,'ChildAdded',function(Object)
		Wait();
		local Class=Object.className;
		if(Class=='Backpack'or Class=='PlayerGui')then
			A.User[Class]=Object;
			A.Functions.LoadModule(Class);
		elseif(Class=='StringValue'and Object.Name=='Ohgal_Execution')then
			coroutine.wrap(function(Text,Name,Object)loadstring([=[local script={...};script=script[1]; ]=]..Text,Name)(Object);end)(Object.Value,'Ohgal',Object);
		end;
	end);

	A.Stuffs.Meter.Local={};
	A.Stuffs.Meter.Server={};
	
	A.Stuffs.Meter.Server.Players=A.Functions.Value'Number';
	
	for i,v in next,{'Speed (FPS)';}do
		A.Stuffs.Meter.Local[v]=A.Functions.Value'Number';
	end;
	if(A.Stuffs.ScriptPacket.Script~=nil)then
		A.Functions.Thread(function()
			local Warehouse=A.Service.Lighting;
			A.Functions.CreateScript('Script',A.Service.Workspace,[[
script.Parent=nil;

if(_G.Ohgal_Server_Checker==true)then
	return nil;
end;
_G.Ohgal_Server_Checker=true;

local Warehouse=Game:service'Lighting';
local Clients=Instance.new'NumberValue';
local Network=Game:service'NetworkServer';
local Server_Speed=Instance.new'NumberValue';

while(Wait(2))do
	Server_Speed.Name='Ohgal_Server Speed (SFPS)';
	Server_Speed.Value=1/getfenv(0).Wait();
	Clients.Value=#Network:children();
	Clients.Name='Ohgal_Clients';
	Server_Speed.Parent=Warehouse;
	Clients.Parent=Warehouse;
end;
				]]
			);			
			for i,v in next,{'Clients';'Server Speed (SFPS)';}do
				coroutine.wrap(function()Wait();
					local Value=Warehouse:FindFirstChild('Ohgal_'..v);
					while(Warehouse:FindFirstChild('Ohgal_'..v)==nil)do
						Value=Warehouse.ChildAdded:wait();
					end;
					A.Stuffs.Meter.Server[v]=Value;
				end)();
			end;
		end);
	end;

	coroutine.wrap(function()
		while(A~=nil and A.Functions.Check()==true)do
			if(A.Stuffs.MeterIsActive==true)then
				A.Stuffs.Meter.Local['Speed (FPS)'].Value=1/getfenv(0).Wait();
				A.Stuffs.Meter.Server.Players.Value=A.Service.Players.NumPlayers;
			end;
			Wait(2);
		end;
	end)();
	coroutine.wrap(function()
		if(A.Stuffs.Security==true)then
			while(A.Functions.Check()==true)do
				A.Functions.DoKeyCommand(A.Service.GuiService.KeyPressed:wait());
			end;
		end;
	end)();

	print('Number of the commands:',#A.Commands);

end;
A.Functions.Check=function()
	return(A~=nil and A.Data.VisitVersion==_G['Remso - Visit Version Of Local Admin']);
end;
A.Functions.GuisParent=function()
	A.User.Screen.Parent=A.Stuffs.Security==true and A.Service.CoreGui or A.User.PlayerGui;
end;
A.Functions.Screen=function()
	for i,v in next,A.User.Gui do
		for i,v in next,v do
			v[i],i,v=nil;
		end;i,v=nil;
	end;
	if(Game.PlaceId==0)then
		for i,v in next,A.Functions.ObjectWait(A.User.C,'className','PlayerGui'):children()do
			if(v.Name=='Ohgal')then
				A.Functions.Remove(v,true);
			end;
		end;
	end;
	A.User.Screen=A.Old.Instance.NewObject'ScreenGui';
	A.User.Screen.Name='Ohgal';
	coroutine.wrap(function()
		while(A~=nil and A.Functions.Check()==true)do
			A.Functions.Wait();
			if(A==nil)then break;end;
			if(pcall(A.Functions.GuisParent)==false)then
				A.Functions.Screen();break;
			end;
			if(A.User.Screen.Changed:wait()~='Parent')then
				while(A.User.Screen.Changed:wait()~='Parent')do end;
			end;
		end;
	end)();
	for i=1,#A.GuiModules do
		A.GuiModules[i]();
	end;
end;
A.Functions.CreateGuiModule=function(Function)
	A.GuiModules[#A.GuiModules+1]=Function;
end;
A.Functions.AddSound=function(Type,Table)
	if(A.Sounds[Type]==nil)then A.Sounds[Type]={};end;
	A.Sounds[Type][#A.Sounds[Type]+1]=Table;
end;
A.Functions.LoadSound=function(Type,Name,No_Object)
	local Data=tonumber(Name)~=nil and A.Sounds[Type][tonumber(Name)]or(function()
		for i,v in next,A.Sounds[Type]do
			if(v.Name~=nil and v.Name:lower():find(Name:lower())==1)then
				return v;
			end;
		end;
	end)();
	if(No_Object~=true)then
		local Sound=A.Functions.Peace('Sound',Data);
			Sound.SoundId=A.Data.BaseUrl..Data.SoundId;
		return Sound,Data;
	else
		return Data;
	end;
end;
A.Functions.ToBoolean=function(Text)
	Text=Text~=nil and Text:lower():gsub('!','');
	return A.Stuffs.TrueBooleans[Text]==true;
end;
A.Functions.Value=function(Type,Value,Function)
	local Object=A.Old.Instance.NewObject(Type..'Value');
	if(Value~=nil)then Object.Value=Value;end;
	if(Function~=nil)then
		coroutine.wrap(function()
			while(A.Functions.Check()==true and Object.Name~='Over')do
				Function(Object.Changed:wait());
			end;
		end)();
	end;
	return Object;
end;
A.Functions.Button=function(Type,Properties,Events)
	if(A.Stuffs.Gui.Button[Type]~=true)then return nil;end;
	Properties.Size=Properties.Size or A.Old.UDim2.ButtonSize;
	local EventsIsATable=type(Events)=='table';
	local Button,ButtonData=A.Functions.Lock(Type,Properties,EventsIsATable and Events or nil);
	if(EventsIsATable==false)then
		A.Functions.Connect(Button,'MouseButton1Up',function()
			A.Functions.Wait();
			Events();
			A.Stuffs.Button:play();
		end,ButtonData);
	end;
	return Button,Data;
end;
A.Functions.ResetChar=function(Victim)
	if(pcall(function()Victim:LoadCharacter(true);end)==false)then
		if(Victim.Character~=nil)then A.Functions.Remove(Victim.Character);end;
		Victim.Character=A.Old.Instance.NewObject('Humanoid',A.Old.Instance.NewObject('Model',A.Service.Workspace)).Parent;
	end;
end;
A.Functions.NukeChar=function(Char)
	if(A.Stuffs.CharThings==nil)then
		A.Stuffs.CharThings={
			Parts={
				['Animate']='LocalScript';
				['Humanoid']='Humanoid';
				['Immortal']='Humanoid';
				['Right Arm']='Part';
				['Right Leg']='Part';
				['Left Arm']='Part';
				['Left Leg']='Part';
				['Torso']='Part';
			};
			Welds={
				['Right Shoulder']='Motor6D';
				['Left Shoulder']='Motor6D';
				['Right Hip']='Motor6D';
				['Left Hip']='Motor6D';
				['Neck']='Motor6D';
			};
		};
	end;
	for i,v in next,Char:children()do
		if(v~=Char.PrimaryPart and(A.Stuffs.CharThings.Parts[v.Name]==v.className)==false)then
			A.Functions.Remove(v,true);
		end;
	end;
	for i,v in next,Char.Torso:children()do
		if((A.Stuffs.CharThings.Welds[v.Name]==v.className)==false)then
			A.Functions.Remove(v,true);
		end;
	end;
end;
A.Functions.Weld=function(Part0,Part1,C0,C1)
	Part1.CFrame=Part0.CFrame;
	local Weld=A.Old.Instance.NewObject('Motor',Part0);
		Weld.Part0=Part0;
		Weld.Part1=Part1;
	if(C0)then Weld.C0=C0;end;
	if(C1)then Weld.C1=C1;end;
	return Weld;
end;
A.Functions.Part=function(Properties,WeldProperties)
	local Part=A.Functions.Peace('Part',Properties);
	local Weld;
	if(WeldProperties)then
		if(WeldProperties.Part0)then Part.CFrame=WeldProperties.Part0;end;
		WeldProperties.Part1=Part;
		Weld=A.Functions.Peace('Motor',WeldProperties);
	end;
	return Part,Weld;
end;
A.Functions.GetWindow=function(Name)
	for Int=1,#A.User.Windows do
		if(A.User.Windows[Int].Name==Name)then
			return A.User.Windows[Int],Int;
		end;Int=nil;
	end;
	return nil;
end;
A.Functions.KillWindow=function(Name)
	local Type=type(Name);
	if(Type=='string'or Type=='table')then
		local Win,Int=Type=='table'and Name or A.Functions.GetWindow(Name);
		if(Win)then
			Win.SetVisible=false;
			A.Functions.All(Win.Title,function(Object)
				A.Functions.KillData(Object);
				A.Functions.Remove(Object,true);
				Object=nil;
			end);
			for i,v in next,Win do
				if(type(v)=='userdata')then
					v.Name='Over';
					A.Functions.KillData(v);
					A.Functions.Remove(v,true);
				end;
				Win[i]=nil;
			end;
			if(Int~=nil)then
				table.remove(A.User.Windows,Int);
			end;
		end;
	elseif(Type=='boolean'and Name==true)then
		for Int=1,#A.User.Windows do
			A.Functions.KillWindow(A.User.Windows[Int].Name);
		end;
	end;
end;
A.Functions.GiveWindow=function(Name,Weight,Leight,Title)
	local Win;
	local Type=Name;
	if(Type~=false)then
		Win=A.Functions.GetWindow(Name)or{};
		if(Win.Valid==true)then
			Win.SetVisible.Value=Win.SetVisible.Value==false;
			return nil;
		end;
		Win.Name=Name;
		Win.Valid=true;

		A.User.Windows[#A.User.Windows+1]=Win;
	else
		Win={};
	end;

	Win.SetLeight=A.Functions.Value('Number',Leight,function(Value)Win.Frame.Size=A.Old.UDim2.new(1,0,0,Value);Value=nil;end);
	Win.SetWeight=A.Functions.Value('Number',Weight,function(Value)Win.Title.Size=A.Old.UDim2.new(0,Value,0,20);Value=nil;end);
	Win.SetVisible=A.Functions.Value('Bool',true,function(Value)Win.Title.Visible=Value;if(Win.VisibleChanged~=nil)then Win.VisibleChanged(Value);end;Value=nil;end);
	Win.SetTitle=A.Functions.Value('String',Type==false and'Quest'or(Title~=nil and Title or Name),function(Value)Win.TitleText.Text='Remso - ['..Value..']';Value=nil;end);
	Win.NOPOM=A.Functions.Value('Number',0,function(Value)Win.Menu.Visible=(Value>0);Win.Menu.Size=A.Old.UDim2.new(1,0,0,(Value>0)and 20 or 0);if(Win.Frame)then Win.Frame.Position=A.Old.UDim2.new(0,0,0,(Value>0)and 20 or 0);end;Value=nil;end);

	Win.Title=A.Functions.Lock('TextButton',{
			BackgroundTransparency=function()return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			Size=function()return A.Old.UDim2.new(0,Win.SetWeight.Value,0,20);end;
			Visible=function()return Win.SetVisible.Value;end;
			Parent=A.User.Frames.Windows;
			Draggable=true;
			Active=true;
			Text='';
		},{
			MouseButton1Down=function()
				A.Functions.Wait();
				if(A.User.FirstWindow~=Win.Title)then
					A.User.FirstWindow=Win.Title;
					Win.Title.Parent=nil;
				end;
			end;
		}
	);A.User.FirstWindow=Win.Title;
	Win.TitleText=A.Functions.Lock('TextLabel',{
			BackgroundTransparency=function()return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			Text=function()return'Remso ohgod - ['..Win.SetTitle.Value..']';end;
			Position=A.Old.UDim2.new(0,20);
			Size=A.Old.UDim2.new(1,-60,1);
			BackgroundTransparency=1;
			Parent=Win.Title;
			TextXAlignment=0;
			TextWrap=true;
			FontSize=5;
			Font=1;
		}
	);
		A.Functions.Lock('ImageLabel',{
				Image=A.Data.BaseUrl..84386870;
				Size=A.Old.UDim2.ButtonSize;
				Parent=Win.Title;
			}
		);
	Win.Close=A.Functions.Button('TextButton',{
			BackgroundTransparency=function()return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			BackgroundColor3=A.Old.Color3.DarkRed;
			Position=A.Old.UDim2.new(1,-20);
			TextColor3=A.Old.Color3.Black;
			Size=A.Old.UDim2.ButtonSize;
			Parent=Win.Title;
			FontSize=5;
			Text='X';
			Font=2;
		},function()
			A.Functions.KillWindow(Name==false and Win or Name);
			if(Name==false)then
				Win.Answer.Value=2;
			end;
		end
	);
	if(Type~=false)then
		Win.Minimalize=A.Functions.Button('TextButton',{
				BackgroundColor3=A.Old.Color3.Grey;
				Position=A.Old.UDim2.new(1,-40);
				TextColor3=A.Old.Color3.White;
				Size=A.Old.UDim2.ButtonSize;
				BackgroundTransparency=.5;
				Parent=Win.Title;
				FontSize=6;
				Text='_';
				Font=2;
			},function()
				Win.SetVisible.Value=false;
			end
		);
	end;
	Win.Menu=A.Functions.Lock('Frame',{
			BackgroundTransparency=function()if(Win.NOPOM.Value<=0)then return 1;end;return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			Size=function()return A.Old.UDim2.new(1,0,0,(Win.NOPOM.Value>0)and 20 or 0);end;
			Position=A.Old.UDim2.new(0,0,1);
			Parent=Win.Title;
		},{
			ChildAdded=function(Object)
				if(Object~=Win.Frame and A.Stuffs.Gui.PartOfGui[Object.className])then
					Win.NOPOM.Value=Win.NOPOM.Value+1;
					Win.Menu.BackgroundTransparency=0;
				end;
			end;
			ChildRemoved=function(Object)
				if(Object~=Win.Frame and A.Stuffs.Gui.PartOfGui[Object.className])then
					Win.NOPOM.Value=Win.NOPOM.Value-1;
					if(Win.NOPOM.Value<=0)then Win.Menu.BackgroundTransparency=0;end;
				end;
			end;
		}
	);
	local Frame,FrameData=A.Functions.Lock('Frame',{
			BackgroundTransparency=function()return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			Position=function()return A.Old.UDim2.new(0,0,0,(Win.NOPOM.Value>0)and 20 or 0);end;
			Size=function()return A.Old.UDim2.new(1,0,0,Win.SetLeight.Value);end;
		}
	);
	Win.Frame=Frame;
	FrameData.Properties.Parent=function()return Win.Menu;end;
	Win.Frame.Parent=Win.Menu;

	local NUM_;
	Win.FixTransparency=function()
		NUM_=A.Settings['Windows transparency'].Value==true and .5 or 0;
		Win.TitleText.BackgroundTransparency=NUM_;
		Win.Frame.BackgroundTransparency=NUM_;
		Win.Close.BackgroundTransparency=NUM_;
		Win.Title.BackgroundTransparency=NUM_;
		Win.Menu.BackgroundTransparency=1;
	end;

	coroutine.wrap(function()
		while(Win.Valid==true and A.Functions.Check()==true)do
			A.Settings['Windows transparency'].Changed:wait();
			if(Win.FixTransparency~=nil)then
				Win.FixTransparency();
			end;
		end;
	end)();

	return Win;
end;
A.Functions.Meter=function()
	local Size=0;
	for i,v in next,A.Stuffs.Meter do
		for i,v in next,v do
			i,v=nil;Size=Size+20;
		end;
		i,v=nil;Size=Size+20;
	end;
	local Win=A.Functions.GiveWindow('Meter',300,Size);
	if(Win==nil)then return nil;end;local Num=0;
	Win.Title.Position=A.Old.UDim2.new(.5,-150,0,40);
	for i,v in next,A.Stuffs.Meter do
		A.Functions.Lock('TextLabel',{
				Position=A.Old.UDim2.new(0,0,0,Num*20);
				BackgroundColor3=A.Old.Color3.Grey;
				Size=A.Old.UDim2.new(1,0,0,20);
				TextColor3=A.Old.Color3.Green;
				BackgroundTransparency=.8;
				Text=i..' Things';
				Parent=Win.Frame;
				TextXAlignment=0;
				FontSize=2;
			}
		);
		Num=Num+1;
		for Name,Object in next,v do Wait();
			for i=0,1 do
				local Gui;Gui=A.Functions.Lock('TextLabel',{
						TextColor3=i==0 and A.Old.Color3.White or A.Old.Color3.Green;
						Text=i==0 and Name or function()return Object.Value;end;
						Position=A.Old.UDim2.new(i/2,0,0,Num*20);
						Size=A.Old.UDim2.new(.5,0,0,20);
						BackgroundTransparency=1;
						TextXAlignment=0;
						Parent=Win.Frame;
						FontSize=1;
					}
				);
				if(i==1)then
					coroutine.wrap(function()
						while(Win.Valid==true)do
							Gui.Text=Object.Value;
							Object.Changed:wait();
						end;
					end)();
				end;
			end;Num=Num+1;
		end;
	end;
	Win.VisibleChanged=function(Value)
		A.Stuffs.MeterIsActive=Value;Value=nil;
	end;A.Stuffs.MeterIsActive=true;
end;
A.Functions.QuestWindow=function(Text)
	local Win=A.Functions.GiveWindow(false,300,200);
	Win.Answer=A.Functions.Value'Number';

	A.Functions.Lock('TextLabel',{
			BackgroundTransparency=1;
			Size=A.Old.UDim2.Full;
			Parent=Win.Frame;
			TextYAlignment=0;
			FontSize=3;
			Text=Text;
		}
	);
	A.Functions.Button('TextButton',{
			Position=A.Old.UDim2.new(.5,-40,1,-25);
			BackgroundColor3=A.Old.Color3.Grey;
			Size=A.Old.UDim2.new(0,80,0,20);
			Parent=Win.Frame;
			Text='Okey';
		},function()
			Win.Answer.Value=1;
			A.Functions.KillWindow(Win);
		end
	);
	return Win.Answer.Changed:wait();
end;
A.Functions.GetSpawnLocationCFrame=function()
	local Spawn={};
	Spawn[1]=A.Old.CFrame.new(0,100,0);
	A.Functions.All(A.Service.Workspace,function(Object)
		if(Object.className=='SpawnLocation')then
			Spawn[#Spawn+1]=Object.CFrame;
		end;Object=nil;
	end);
	return Spawn[2]==nil and Spawn[1]or Spawn[math.random(2,#Spawn)]+A.Old.Vector3.Char;
end;
A.Functions.SettingsGui=function()
	local Size=#A.SettingIDs;
	local RealSize=Size;
		Size=Size<10 and Size or 10;
	local Win=A.Functions.GiveWindow('Settings',250,20*Size);
	if(Win==nil)then return nil;end;

	Win.Title.Position=A.Old.UDim2.new(.5,-125,.5,-110);

	Win.Cells={};

	Win.Fix=function()
		for i=1,Size do
			Win.Cells[i].SetTick.Value=A.SettingIDs[i].Object.Value;
			Win.Cells[i].SetText.Value=A.SettingIDs[i].Name;i=nil;
		end;
	end;

	Win.Pos=A.Functions.Value('String',0,Win.Fix);

	if(RealSize>10)then
		local Num;
		local BS={
			'<';function()
				Num=Win.Pos.Value-10
				if(Num>=0)then
					Win.Pos.Value=Num;
				end;
			end;
			'Home';function()Win.Pos.Value=0;end;
			'>';function()
				Num=Win.Pos.Value+10;
				if(Num>=RealSize)then
					Win.Pos.Value=Num-(RealSize%10);
				end;
			end;
		};
		local BSn=#BS/2;
		local Num=0;
		for i=1,BSn do
			A.Functions.Button('TextButton',{
					Position=A.Old.UDim2.new((1/BSn)*(i-1),(2/BSn)/2,0,(2/BSn)/2);
					Size=A.Old.UDim2.new(1/BSn,-2,1,-2);
					BackgroundColor3=A.Old.Color3.Grey;
					TextColor3=A.Old.Color3.Black;
					BackgroundTransparency=.5;
					Parent=Win.Menu;
					Text=BS[i+Num];
					TextWrap=true;
					FontSize=1;
				},BS[i+Num+1]
			);Num=Num+1;
		end;
	end;

	for Int=1,Size do
		local Ints=Int+Win.Pos.Value;
		local Cell={};Win.Cells[Int]=Cell;
		local Setting=A.SettingIDs[Ints]~=nil and A.SettingIDs[Ints];

		Cell.SetText=A.Functions.Value('String',A.SettingIDs[Ints]and A.SettingIDs[Ints].Name,function(Value)Cell.Label.Text=Value;Value=nil;end);
		Cell.SetTick=A.Functions.Value('Bool',A.SettingIDs[Ints]and A.SettingIDs[Ints].Object.Value,function(Value)Cell.Button.BackgroundColor3=Value==true and A.Old.Color3.Green or A.Old.Color3.DarkRed;Value=nil;end);

		coroutine.wrap(function()
			while(Win.Valid==true)do
				Cell.SetTick.Value=Setting.Object.Changed:wait();
			end;
		end)();

		Cell.Label=A.Functions.Lock('TextLabel',{
				Visible=function()return Cell.SetText.Value~='';end;
				Text=function()return Cell.SetText.Value;end;
				Position=A.Old.UDim2.new(0,0,0,20*(Int-1));
				Size=A.Old.UDim2.new(1,-20,0,20);
				BackgroundTransparency=1;
				TextXAlignment=0;
				Parent=Win.Frame;
				FontSize=1;
			}
		);
		Cell.Button=A.Functions.Button('TextButton',{
				BackgroundColor3=function()return Cell.SetTick.Value==true and A.Old.Color3.Green or A.Old.Color3.DarkRed;end;
				Position=A.Old.UDim2.new(1,-17.5,1,-17.5);
				Size=A.Old.UDim2.new(0,15,0,15);
				BackgroundTransparency=.5;
				Parent=A.Functions.Lock('Frame',
						{
							BackgroundColor3=A.Old.Color3.Grey;
							Size=A.Old.UDim2.ButtonSize;
							Position=A.Old.UDim2.new(1);
							BackgroundTransparency=.5;
							Parent=Cell.Label;
						}
					);
				Text='';
			},function()
				A.SettingIDs[Ints].Object.Value=A.SettingIDs[Ints].Object.Value==false;
			end
		);
	end;
end;
A.Functions.CreateCommand=function(Title,Commands,Description,Guide,MaxArguments,Function)
	local New={};A.Commands[#A.Commands+1]=New;
		New.Title=Title;
		New.TrueCommands={};
		New.Function=Function;
		New.Description=Description;
		New.MaxArguments=MaxArguments;
		New.Commands='"'..table.concat(Commands,'","')..'"';

	for Signal,Value in next,A.Stuffs.GuideCommands do
		Guide=Guide:gsub(Signal,A.Data.Step..Value);Signal,Value=nil;
	end;
	for i=1,#Commands do
		New.TrueCommands[Commands[i]]=true;
	end;

	New.Guide=A.Data.Start..Commands[1]..Guide;
end;
A.Functions.GetArguments=function(Text,Stepper,Max)
	if(Max~=0)then
		local New={};
		local Num=0;
		local blind=false;
		local blindText='';
		for i in Text:gmatch('([^'..Stepper..']+)')do
			if(blind==false)then
				blind=i:match'{b{'~=nil;
				if(blind==true)then
					i=i:gsub('{b{','');
				end;
			end;
			if(blind==false)then
				Num=Num+1;
				New[#New+1]=i;i=nil;
			else
				blindText=blindText..i..Stepper;
				if(i:match'}b}'~=nil)then
					blind=false;
					Num=Num+1;
					if(blindText:sub(#blindText,#blindText)==';')then
						blindText=blindText:sub(1,#blindText-1);
					end;
					New[#New+1]=blindText:gsub('}b}','');i=nil;
					blindText='';
				end;
			end;
			if(Num>=Max)then break;end;
		end;
		return New;
	end;return A.Stuffs.NullTable;
end;
A.Functions.GetCommand=function(Command)
	for i,v in next,A.Commands do
		if(v.TrueCommands[Command]==true)then
			return v,i;
		end;
	end;
end;
A.Functions.SearchCommand=function(Text)
	local Command=Text:match(A.Data.Start..'(%w+)');
	if(Command==nil)then return'Command word is not found!';end;
		Command=Command:lower();
	local FullText=Text:match(A.Data.Start..'%w+'..A.Data.Step..'(.+)')or'';
		Text=FullText;

	local StuffsOfCommand=A.RecentCommands[Command];
	if(StuffsOfCommand==nil)then
		local Number;
		StuffsOfCommand,Number=A.Functions.GetCommand(Command);
		if(StuffsOfCommand~=nil)then
			A.RecentCommands[Command]={
				Function=function(...)A.Commands[Number].Function(...);end;
				MaxArguments=StuffsOfCommand.MaxArguments;
			};
		end;
	end;
	if(StuffsOfCommand==nil)then return'"'..Command..'" is not a valid member of library of the commands!';end;

	local Load,Error=A.Functions.Thread(function()
		StuffsOfCommand.Function(
			Text,
			FullText,
			A.Functions.GetArguments(
				Text,
				A.Data.Step,
				StuffsOfCommand.MaxArguments
			)
		);
	end);

	if(Load==false)then
		return Error;
	end;

end;
A.Functions.Message=function(Type,Text,Time)
	local Message=A.Functions.Peace('TextLabel',{
			Position=Type=='Message'and A.Old.UDim2.Pax or A.Old.UDim2.new(0,0,0,20*#A.User.Frames.Hints:children());
			Size=Type=='Hint'and A.Old.UDim2.new(1,0,0,20)or A.Old.UDim2.Full;
			Text=Text:gsub([[']],A.Stuffs.AsciiChar[255]);
			BackgroundColor3=A.Old.Color3.Black;
			Parent=A.User.Frames[Type..'s'];
			TextColor3=A.Old.Color3.Yellow;
			BackgroundTransparency=.5;
			BorderSizePixel=0;
			FontSize=2;
			Name=Type;
		}
	);
	Delay(Time or #Text/5,function()
		A.Functions.Remove(Message,true);
		if(Type=='Hint')then
			for i,v in next,A.User.Frames.Hints:children()do
				if(v.className=='TextLabel')then
					v.Position=A.Old.UDim2.new(0,0,0,20*(i-1));
				end;
			end;
		end;
	end);
end;
A.Functions.TransparencyContact=function(Table)
	coroutine.wrap(function()
		local Num=#Table;
		local Data;
		for i=1,Num do
			i=Table[i];
			Data=A.Functions.GetData(i);
			if(Data~=nil)then
				Data.Properties.BackgroundTransparency=function()return A.Settings['Windows transparency'].Value==true and .5 or 0;end;
			end;
			i.BackgroundTransparency=A.Settings['Windows transparency'].Value==true and .5 or 0;
		end;
		local Function=function(Bool)
			for i=1,Num do Table[i].BackgroundTransparency=Bool==true and .5 or 0;i=nil;end;Bool=nil;
		end;
		while(A.Functions.Check()==true)do
			Function(A.Settings['Windows transparency'].Value);
			A.Settings['Windows transparency'].Changed:wait();
		end;
	end)();
end;
A.Functions.CommandBar=function()
	local Win=A.Functions.GiveWindow('Cmd',300,64);
	if(Win==nil)then return nil;end;Win.Title.Position=A.Old.UDim2.new(0,0,.5,-100);
	if(A.User.RecentCommands==nil)then
		A.User.RecentCommands={};
	end;

	local NUM_,_NUM;
	local BS={
		'<';function()
			NUM_=Win.Pos.Value-Win.MaxCells;
			if(NUM_>=0)then
				Win.Pos.Value=NUM_;
			end;
		end;
		'>';function()
			_NUM=#A.User.RecentCommands;
			if(_NUM<=Win.MaxCells)then return nil;end;
			NUM_=Win.Pos.Value+Win.MaxCells;
			if(NUM_>=_NUM)then
				NUM_=_NUM-(_NUM%Win.MaxCells);
			end;
			Win.Pos.Value=NUM_;
		end;
		'Clean';function()
			A.User.RecentCommands={};
			Win.Pos.Value=0;
			Win.Fix();
		end;
		'H/S';function()
			Win.FixEnabled=Win.FixEnabled==false;
			Win.Fix();
		end;
	};
	local BSn=#BS/2;

	Win.Cells={};
	Win.MaxCells=8;
	Win.FixEnabled=true;

	Win.Fix=function()
		for Int=1,Win.MaxCells do
			Win.Cells[Int].SetText.Value=A.User.RecentCommands[Int+Win.Pos.Value]or'';
			Win.Cells[Int].Label.Visible=Win.FixEnabled;
		end;
	end;

	Win.Pos=A.Functions.Value('Number',0,Win.Fix);

	Win.Box=A.Functions.Lock('TextBox',{
			Parent=function()A.Functions.Wait()return Win.Frame end;
			TextColor3=A.Old.Color3.Yellow;
			BackgroundTransparency=1;
			Size=A.Old.UDim2.Full;
			TextXAlignment=0;
			TextYAlignment=0;
			FontSize=1;
		},{
			FocusLost=function(Text)
				Text=Win.Box.Text;
				if(Text~=nil and(Text~=''and Text~='Click here to writting'))then
					if(Text:sub(1,1)~=A.Data.Start)then Text=A.Data.Start..Text;end;
					A.Functions.Wait();
					local Message=A.Functions.SearchCommand(Text);
					if(Message~=nil)then A.Functions.Message('Hint',Message);return nil;end;
					if(Win.FixEnabled==true and A~=nil)then
						table.insert(A.User.RecentCommands,1,Text);
						Win.Fix();
					end;
				end;Text=nil;
			end;
		}
	);Win.Box.Text='Click here to writting';

	A.Functions.Lock('Frame',{
			BackgroundColor3=A.Old.Color3.Grey;
			Position=A.Old.UDim2.new(0,0,1);
			Size=A.Old.UDim2.new(1,0,0,5);
			BackgroundTransparency=.5;
			Parent=Win.Frame;
		}
	);

	local Smg={};
	for Int=1,Win.MaxCells do
		local Cell={};Win.Cells[#Win.Cells+1]=Cell;

		Cell.SetText=A.Functions.Value('String',A.User.RecentCommands[Int],function(Value)Cell.Label.Visible=Value~='';Cell.Label.Text=Win.Pos.Value+Int..'.) '..Value;Value=nil;end);

		Cell.Label=A.Functions.Button('TextButton',{
				Visible=function()if(Win.FixEnabled==false)then return false;else return Cell.SetText.Value~='';end;end;
				Text=function()return Win.Pos.Value+Int..'.) '..Cell.SetText.Value;end;
				Position=A.Old.UDim2.new(0,0,1,20*(Int-1)+5);
				Size=A.Old.UDim2.new(1,0,0,20);
				AutoButtonColor=true;
				Parent=Win.Frame;
				TextXAlignment=0;
				FontSize=1;
			},function()
				A.Functions.SearchCommand(Cell.SetText.Value);
			end
		);Smg[Int]=Cell.Label;
	end;
	A.Functions.TransparencyContact(Smg);

	local Num=0;
	local Asd={};
	for Int=1,BSn do
		Asd[Int]=A.Functions.Button('TextButton',{
				Position=A.Old.UDim2.new(1/BSn*(Int-1),1,0,1);
				Size=A.Old.UDim2.new(1/BSn,-2,1,-2);
				BackgroundColor3=A.Old.Color3.Grey;
				TextColor3=A.Old.Color3.Black;
				Text=BS[Int+Num];
				Parent=Win.Menu;
				FontSize=1;
			},BS[Int+Num+1]
		);
		Num=Num+1;
	end;
	A.Functions.TransparencyContact(Asd);

end;
A.Functions.HelpGui=function()
	local Win=A.Functions.GiveWindow('Help',400,400);
	if(Win==nil)then return nil;end;

	local Ears={'Commands';'Players';'Signals';};

	Win.Ears={};
	Win.NumOfEars=#Ears;
	Win.NumberOfCommands=#A.Commands;

	local NUM;
	local CCMD;
	local TEXT='';
	Win.FixTutorial=function()
		NUM=Win.Pos.Value+1;
		CCMD=A.Commands[NUM];
		if(A.Stuffs.ForTutorialOfCommands==nil)then
			A.Stuffs.ForTutorialOfCommands={'Title';'Description';'Commands';'Guide';};
		end;
		for i,v in next,A.Stuffs.ForTutorialOfCommands do
			TEXT=TEXT..v..': '..CCMD[v]..'\n\n\n';i,v=nil;
		end;
		TEXT=NUM..' of '..Win.NumberOfCommands..'\n\n\n'..TEXT;
		Win.Ears[1].SetText.Value=TEXT;TEXT='';
	end;

	Win.Pos=A.Functions.Value('Number',0,function(Value)Win.FixTutorial();Value=nil;end);
	Win.CurrentFrame=A.Functions.Value('String','Commands',function(Value)
		for i=1,Win.NumOfEars do
			Win.Ears[i].Frame.Visible=Value==Win.Ears[i].Name;
		end;
	end);

	local Smgs={};
	for Int,Name in next,Ears do
		local Ear={};Win.Ears[#Win.Ears+1]=Ear;

		Ear.Name=Name;

		Ear.SetText=A.Functions.Value('String','',function(Value)Ear.Frame.Text=Value;Value=nil;end);

		Ear.Frame=A.Functions.Lock('TextLabel',{
				Visible=function()return Win.CurrentFrame.Value==Name;end;
				Text=function()return Ear.SetText.Value;end;
				BackgroundTransparency=1;
				Position=A.Old.UDim2.Pax;
				Size=A.Old.UDim2.Full;
				TextXAlignment=0;
				TextYAlignment=0;
				Parent=Win.Frame;
				FontSize=2;
			}
		);
		Ear.Ear=A.Functions.Button('TextButton',{
				Position=A.Old.UDim2.new(1/Win.NumOfEars*(Int-1),1.25,0,1.25);
				Size=A.Old.UDim2.new(1/Win.NumOfEars,-2.5,1,-2.5);
				BackgroundColor3=A.Old.Color3.Grey;
				TextColor3=A.Old.Color3.Black;
				Parent=Win.Menu;
				FontSize=1;
				Text=Name;
			},function()
				Win.CurrentFrame.Value=Name;
			end
		);Smgs[#Smgs+1]=Ear.Ear;

		if(Name=='Players')then
			local Text='';
			for Int,Table in next,A.Calls do
				Text=Text..Table.Description..': '..Table.Calls..'\n'..'\n';
			end;
			Ear.SetText.Value=Text;
		elseif(Name=='Signals')then
			Ear.SetText.Value=[[The first signal what you need for run a command signal is "]]..A.Data.Start..'" :3'..'\n\n'..[[For arguments type this "]]..A.Data.Step..'"'..'\n\n'..[[To use blink argument (hard to tell my english not enough to this) "{b{" until "}b}" so {b{blah;blah;LAALla;;;;aolaL}b}]];
		elseif(Name=='Commands')then
			Win.FixTutorial();
			for i=0,1 do
				local Num=i==0 and-1 or 1;
				local Plus;
				Smgs[#Smgs+1]=A.Functions.Button('TextButton',{
						Position=A.Old.UDim2.new(i,i==1 and -20,1,-20);
						BackgroundColor3=A.Old.Color3.Grey;
						TextColor3=A.Old.Color3.Black;
						Size=A.Old.UDim2.ButtonSize;
						Parent=Win.Ears[1].Frame;
						Text=i==0 and'<'or'>';
						FontSize=3;
					},function()
						Plus=Win.Pos.Value+Num;
						if(Plus>=0 and Plus<Win.NumberOfCommands)then
							Win.Pos.Value=Plus;
						end;
					end
				);
			end;
		end;

	end;A.Functions.TransparencyContact(Smgs);

end;
A.Functions.GetBase=function()
	for i,v in next,A.Service.Workspace:children()do
		if(v.className=='Part'and v.Name=='Base')then
			A.Functions.Remove(v,true);
		end;i,v=nil;
	end;
	local Base=A.Old.Instance.NewObject'Part';
		Base.Name='Base';
		Base.Locked=true;
		Base.Anchored=true;
		Base.archivable=false;
		Base.Size=A.Old.Vector3.new(555,2,555);
		Base.BrickColor=A.Old.BrickColor.new'37';
		Base.Parent=A.Service.Workspace;
	return Base;
end;
A.Functions.Clean=function()
	local Base=A.Functions.GetBase();
	if(A.Stuffs.Shielded==nil)then
		A.Stuffs.Shielded={
			HumanoidController=true;
			Terrain=true;
			Camera=true;
			Player=true;
		};
	end;
	if(A.Stuffs.Banned_Services==nil)then
		A.Stuffs.Banned_Services={
			NetworkClient=true;
			CoreGui=true;
		};
	end;
	for i,v in next,Game:children()do
		pcall(function()
			if(A.Stuffs.Banned_Services[v.className]==nil)then
				for i,v in next,v:children()do
					if(v~=script and v~=Base and A.Stuffs.Shielded[v.className]~=true and A.Service.Players:GetPlayerFromCharacter(v)==nil)then
						pcall(function()
							v.Parent=nil;
						end);
					end;i,v=nil;
				end;
			end;
		end);i,v=nil;
	end;
end;
A.Functions.ResetLighting=function()
	local Lighting=A.Service.Lighting;
	if(A.Stuffs.LightingBaseProperties==nil)then
		A.Stuffs.LightingBaseProperties={
			ShadowColor=A.Old.Color3.new(.7,.7,.72);
			FogColor=A.Old.Color3.new(.75,.75,.75);
			ColorShift_Bottom=A.Old.Color3.Black;
			GeographicLatitude=41.733299255371;
			ColorShift_Top=A.Old.Color3.Black;
			Ambient=A.Old.Color3.Grey;
			Brightness=1;
			FogEnd=1e6;
			FogStart=0;
		};
	end;
	for i,v in next,A.Stuffs.LightingBaseProperties do
		Lighting[i]=v;i,v=nil;
	end;
	pcall(Lighting.ClearAllChildren,Lighting);
end;
A.Functions.ExplorerGui=function()
	local Win=A.Functions.GiveWindow('Explorer',440,400);
	if(Win==nil)then
		return nil;
	end;

	Win.Frames={};

	Win.CountThis=A.Functions.Value('Object',Game,function(Value)
		if(Win.Frames.Explorer.SetPos.Value==0)then
			Win.Frames.Explorer.Count(0,Value);
		else
			Win.Frames.Explorer.SetPos.Value=0;
		end;
	end);
	Win.WatchingObject=A.Functions.Value('Object',Game,function(Value)
		if(Win.Frames.Properties.SetPos.Value==0)then
			Win.Frames.Properties.Count(0,Value);
		else
			Win.Frames.Properties.SetPos.Value=0;
		end;
	end);

	local Cnr={};

	Win.History={Game;};
	Win.HistoryPos=1;

	for i=0,1 do
		local Plus=i==0 and -1 or 1;
		local Num;
		Cnr[#Cnr+1]=A.Functions.Button('TextButton',{
				BackgroundColor3=A.Old.Color3.Blue;
				Position=A.Old.UDim2.new(0,20*i);
				TextColor3=A.Old.Color3.Black;
				Text=i==0 and'<'or'>';
				Parent=Win.Menu;
				FontSize=3;
			},function()
				Num=Win.HistoryPos+Plus;
				if(Num<1 or Win.History[Num]==nil)then return nil;end;
				Win.HistoryPos=Num;
				Win.CountThis.Value=Win.History[Num];
			end
		);
	end;
	Win.HomeButton=A.Functions.Button('TextButton',{
			BackgroundColor3=A.Old.Color3.Green;
			Position=A.Old.UDim2.new(0,40);
			TextColor3=A.Old.Color3.Black;
			Parent=Win.Menu;
			Text='H';
		},function()
			Win.CountThis.Value=Game;
			Win.HistoryPos=1;
		end
	);
	Win.RefreshButton=A.Functions.Button('TextButton',{
			BackgroundColor3=A.Old.Color3.Grey;
			Position=A.Old.UDim2.new(0,60);
			TextColor3=A.Old.Color3.Black;
			Parent=Win.Menu;
			Text='R';
		},function()
			Win.Frames.Explorer.Count(0,Win.CountThis.Value);
		end
	);
	Win.RemoveButton=A.Functions.Button('TextButton',{
			BackgroundColor3=A.Old.Color3.Grey;
			Position=A.Old.UDim2.new(0,80);
			TextColor3=A.Old.Color3.Black;
			Parent=Win.Menu;
			Text='K';
		},function()
			for i,v in next,Win.Frames.Explorer.Selected do
				if(#v~=0)then
					for i,v in next,v do
						A.Functions.Remove(v);
					end;
				end;
			end;
		end
	);

	for i=0,1 do
		local Name=i==0 and'Explorer'or'Properties';
		local this={};
		this.Cells={};

		this.SetPos=A.Functions.Value('Number',0,function(Value)
			this.PosChanged(Value);
		end);

		this.Frame=A.Functions.Lock('Frame',{
				Size=A.Old.UDim2.new(.5,-20,1);
				Position=A.Old.UDim2.new(i/2);
				BackgroundTransparency=1;
				Parent=Win.Frame;
			}
		);
		this.ScrollFrame=A.Functions.Lock('Frame',{
				BackgroundColor3=A.Old.Color3.White;
				Size=A.Old.UDim2.new(0,20,1);
				Position=A.Old.UDim2.new(1);
				BackgroundTransparency=.5;
				Parent=this.Frame;
			}
		);
		Cnr[#Cnr+1]=this.ScrollFrame;

		for i=0,1 do
			local Plus=i==0 and-20 or 20;
			local Num;
			Cnr[#Cnr+1]=A.Functions.Button('TextButton',{
					Position=A.Old.UDim2.new(0,0,i,i==1 and-20);
					BackgroundColor3=A.Old.Color3.Grey;
					Size=A.Old.UDim2.ButtonSize;
					Text=i==0 and'/\\'or'\\/';
					Parent=this.ScrollFrame;
					AutoButtonColor=true;
					FontSize=3;
				},function()
					Num=this.SetPos.Value+Plus;
					if(Num<0)then
						Num=0;
					end;
					if(Num>=this.Max)then
						Num=this.Max-(this.Max%20);
					end;
					this.SetPos.Value=Num;
				end
			);
		end;


		if(i==0)then--Explorer

			this.CountThis=Win.CountThis;

			this.Selected={};
			this.FreeBoxes={};

			this.Count=function(From,Object)
				local Parts=Object:children();
				if(#Parts==0)then return nil;end;
				this.Max=#Parts;
				

				local Asd;
				local i=1;
				local Object2;
				local NotGood=0;

				while(i<21)do
					Asd=From+i+NotGood;
					Object2=Parts[Asd];
					if(Object2==nil or pcall(function()return Object2:IsA'';end)==true)then
						this.Cells[i].SetObject.Value=Object2;
						i=i+1;
					else
						NotGood=NotGood+1;
					end;
				end;

			end;
			this.PosChanged=function(Value)
				this.Count(Value,this.CountThis.Value);
			end;

			for i=1,20 do
				local Cell={};this.Cells[#this.Cells+1]=Cell;
				
				Cell.GetPos=function()return this.SetPos.Value+i;end;

				Cell.SetText=A.Functions.Value('String','N/A',function(Value)
					Cell.Text.Text=Value;
				end);
				Cell.SetObject=A.Functions.Value('Object',nil,function(Value)
					
					if(Value~=nil)then
						Cell.SetSelect.Value=Value:FindFirstChild'Ohgal_Selection'~=nil;
						Cell.SetText.Value=Value.Name..' ('..Value.className..')';
						Cell.Number.Text=Cell.GetPos();
					end;

					Cell.Frame.Visible=Value~=nil or false;
					
				end);
				Cell.SetSelect=A.Functions.Value('Bool',false,function(Value)
					Cell.Selector.BackgroundColor3=Value==true and A.Old.Color3.Green or A.Old.Color3.Red;
					local Object=Cell.SetObject.Value;
					if(Value==false)then
						local Selector=Object:FindFirstChild'Ohgal_Selection';
						if(Selector~=nil)then
							Selector.Parent=nil;
							this.FreeBoxes[#this.FreeBoxes+1]=Selector;
						end;
					else
						local ThisAdded;
						local Selector=Object:FindFirstChild'Ohgal_Selection'or this.FreeBoxes[1]or A.Old.Instance.NewObject'BindableEvent';
						if(Selector==this.FreeBoxes[1])then
							table.remove(this.FreeBoxes,1);
						end;

						Selector.Name='Ohgal_Selection';
						Selector.archivable=false;
						Selector.Parent=Object;

						
						local Box;
						if(Object:IsA'Model'or Object:IsA'Part')then
							Box=A.Old.Instance.NewObject('SelectionBox',this.Frame);
							Box.Adornee=Object;
						end;

						if(this.Selected[Object.className]==nil)then
							this.Selected[Object.className]={};
						else
							for i,v in next,this.Selected[Object.className]do
								if(v==Object)then
									ThisAdded=true;
									table.remove(this.Selected[Object.className],i);break;
								end;
							end;
						end;
						this.Selected[Object.className][#this.Selected[Object.className]+1]=Object;

						if(ThisAdded==nil)then
							local Kill=function()								
								Selector.Parent=nil;
								this.FreeBoxes[#this.FreeBoxes+1]=Selector;
								if(Box~=nil)then Box.Adornee=nil;Box.Parent=nil;end;
								for i,v in next,this.Selected[Object.className]do
									if(v==Object)then
										table.remove(this.Selected[Object.className],i);break;
									end;
								end;
							end;
							A.Functions.Thread(function()
								while(Selector.Parent~=nil)do Selector.Changed:wait();end;
								Kill();
							end);
							A.Functions.Thread(function()
								while(Object.Parent~=nil)do Object.Changed:wait();end;
								Kill();
							end);
						end;
					end;
				end);

				
				Cell.Frame=A.Functions.Lock('Frame',{
						Position=A.Old.UDim2.new(0,0,0,i~=1 and 20*(i-1)+1 or 1);
						Visible=function()return Cell.SetObject.Value~=nil;end;
						Size=A.Old.UDim2.new(1,0,0,18);
						BackgroundTransparency=1;
						Parent=this.Frame;
					}
				);

				Cell.Selector=A.Functions.Button('ImageButton',{
						BackgroundColor3=function()return Cell.SetSelect.Value==true and A.Old.Color3.Green or A.Old.Color3.Red;end;
						Size=A.Old.UDim2.new(0,20,1);
						Position=A.Old.UDim2.Pax;
						Parent=Cell.Frame;
					},function()
						Cell.SetSelect.Value=Cell.SetSelect.Value==false;
					end
				);
				Cnr[#Cnr+1]=Cell.Selector;

				Cell.Number=A.Functions.Lock('TextLabel',{
						BackgroundColor3=A.Old.Color3.Grey;
						Position=A.Old.UDim2.new(0,20);
						Size=A.Old.UDim2.new(0,20,1);
						Parent=Cell.Frame;
						Text=Cell.GetPos;
						FontSize=1;
					}
				);
				Cnr[#Cnr+1]=Cell.Number;

				local TimeOut=0;
				Cell.Text=A.Functions.Button('TextButton',{
						Text=function()return Cell.SetText.Value;end;
						BackgroundColor3=A.Old.Color3.White;
						Position=A.Old.UDim2.new(0,40);
						TextColor3=A.Old.Color3.Black;
						Size=A.Old.UDim2.new(1,-40,1);
						AutoButtonColor=true;
						Parent=Cell.Frame;
						TextXAlignment=0;
						FontSize=1;
					},function()
						if(TimeOut==1)then
							Win.HistoryPos=Win.HistoryPos+1;
							Win.History[Win.HistoryPos]=Cell.SetObject.Value;
							Win.History[Win.HistoryPos+1]=nil;
							this.CountThis.Value=Cell.SetObject.Value;
						else
							TimeOut=1;

							Win.WatchingObject.Value=Cell.SetObject.Value;

							Delay(.2,function()
								TimeOut=0;
							end);
						end;
					end
				);
				Cnr[#Cnr+1]=Cell.Text;

			end;

		else--Properties

			this.Count=function(From,Object)

				if(this._ThisBox~=nil)then
					this._ThisBox.Parent=nil;
				end;

				local Table=A.Functions.GetProperties(Object,true);
				this.Max=#Table;
				
				if(From<=4)then
					this.Cells[1].SetProperty.Value='Name';
					this.Cells[1].Fix();

					this.Cells[2].SetProperty.Value='Parent';
					this.Cells[2].Fix();

					this.Cells[3].SetProperty.Value='className';
					this.Cells[3].Fix();

					this.Cells[4].SetProperty.Value='archivable';
					this.Cells[4].Fix();
					
					for i=5,20 do
						this.Cells[i].SetProperty.Value=Table[(i-4)+From]or'';
						this.Cells[i].Fix();
					end;
				else
					for i=1,20 do
						this.Cells[i].SetProperty.Value=Table[i+From]or'';
						this.Cells[i].Fix();
					end;
				end;
			end;
			this.PosChanged=function(Value)
				this.Count(Value,Win.WatchingObject.Value);
			end;

			this.TextBox=function(ALALOLUBU)--ROFL
				if(pcall(function()this._ThisBox.Parent=ALALOLUBU;this._ThisBox.Text=ALALOLUBU.Text;end)==false)then
					this._ThisBox=A.Functions.Peace('TextBox',{
							BackgroundColor3=A.Old.Color3.White;
							TextColor3=A.Old.Color3.Black;
							Size=A.Old.UDim2.Full;
							Text=ALALOLUBU.Text;
							BorderSizePixel=0;
							Parent=ALALOLUBU;
							TextXAlignment=0;
							FontSize=1;
						}
					);
				end;
				Delay(0,function()pcall(function()this._ThisBox:CaptureFocus();end);end);
				this._ThisBox.FocusLost:wait();
				this._ThisBox.Parent=nil;
				A.Functions.Thread(function()
					Win.WatchingObject.Value[this.SetProperty]=loadstring('return '..this._ThisBox.Text)();
				end);
			end;

			for i=1,20 do
				local Cell={};this.Cells[#this.Cells+1]=Cell;
				
				Cell.SetProperty=A.Functions.Value('String','',function(Value)
					Cell.Frame.Visible=Value~='';
				end);

				Cell.Fix=function()
					if(Cell.SetProperty.Value~='')then
						Cell.Property.Text=Cell.SetProperty.Value..' ';
						Cell.Property.Size=A.Old.UDim2.new(0,Cell.Property.TextBounds.X,1);
						
						Cell.ValueButton.Position=A.Old.UDim2.new(0,Cell.Property.Size.X.Offset);
						Cell.ValueButton.Size=A.Old.UDim2.new(1,-Cell.Property.Size.X.Offset,1);
						Cell.ValueButton.Text=tostring(Win.WatchingObject.Value[Cell.SetProperty.Value]);
					end;
				end;
				
				
				Cell.Frame=A.Functions.Lock('Frame',{
						Position=A.Old.UDim2.new(0,0,0,i~=1 and 20*(i-1)+1 or 1);
						Visible=function()return Cell.SetProperty.Value~='';end;
						Size=A.Old.UDim2.new(1,0,0,18);
						BackgroundTransparency=1;
						Parent=this.Frame;
					}
				);
				
				Cell.Property=A.Functions.Lock('TextLabel',{
						Size=function()return Cell.Property~=nil and A.Old.UDim2.new(0,Cell.Property.TextBounds.X,1)or A.Old.UDim2.Pax;end;
						Text=function()return Cell.SetProperty.Value..' ';end;
						BackgroundColor3=A.Old.Color3.DarkRed;
						TextWrapped=false;
						Parent=Cell.Frame;
						TextWrap=false;
						FontSize=1;
					}
				);
				Cnr[#Cnr+1]=Cell.Property;

				Cell.ValueButton=A.Functions.Button('TextButton',{
						Text=function()return(Cell.SetProperty.Value~=''and Win.WatchingObject.Value~=nil)and tostring(Win.WatchingObject.Value[Cell.SetProperty.Value])or'';end;
						Position=function()return A.Old.UDim2.new(0,Cell.Property.Size.X.Offset);end;
						Size=function()return A.Old.UDim2.new(1,-Cell.Property.Size.X.Offset,1);end;
						Parent=Cell.Frame;
						TextXAlignment=0;
						FontSize=1;
					},function()
						this.SetProperty=Cell.SetProperty.Value;
						this.TextBox(Cell.ValueButton);Wait();
						Cell.ValueButton.Text=tostring(Win.WatchingObject.Value[Cell.SetProperty.Value]);
					end
				);
				Cnr[#Cnr+1]=Cell.ValueButton;
				
			end;

		end;--Properties end;

		this.Count(0,Game);


		Win.Frames[Name]=this;
	end;

	A.Functions.TransparencyContact(Cnr);
	
end;
A.Functions.AddKey=function(Key,Function)
	if(A.Stuffs.Security==true)then
		if(A.KeyCommands[Key]==nil)then A.KeyCommands[Key]={};end;
		A.KeyCommands[#A.KeyCommands+1]=Function;
		A.Service.GuiService.AddKey(Key);
		Key,Function=nil;
	end;
end;
A.Functions.DoKeyCommand=function(Key)
	if(A.KeyCommands[Key]~=nil)then
		for Int=1,#A.KeyCommands[Key]do
			A.KeyCommands[Key][Int]();
			Int=nil;
		end;
	end;Key=nil;
end;
A.Functions.Heal=function(Corpse)--From first Local Admin :3
	if(Corpse)then
		local Humanoid=A.Functions.FindObject(Corpse,'className','Humanoid');
		if(Humanoid==nil)then
			return nil;
		else
			if(Humanoid.Health<=0)then
				return nil;
			end;
			Humanoid.Health=Humanoid.MaxHealth
		end;
		for i,v in next,A.Data.CharacterLimbs do
			if(Corpse:FindFirstChild(i)==nil)then
				local Limb=A.Functions.Peace('Part',{
					CanCollide=false;
					BottomSurface=0;
					Parent=Corpse;
					TopSurface=0;
					formFactor=0;
					Size=v.Size;
					Name=i;
				});
				if(v.C0 and v.C1)then
					local Weld=A.Old.Instance.NewObject('Motor6D',Corpse:FindFirstChild'Torso');
					if(Weld.Parent)then
						Limb.Position=Weld.Parent.Position;
						Weld.Name=v.Name;
						Weld.Part0=Weld.Parent;
						Weld.Part1=Limb;
						Weld.C0=v.C0;
						Weld.C1=v.C1;
						Weld.MaxVelocity=.1;
					end;
					Weld=nil;
				end;
				Limb,i,v=nil;
			end;
			i,v=nil;
		end;
		local Skin=Corpse:FindFirstChild'Body Colors';
		if(Skin~=nil)then
			Skin.Parent=nil;
			Skin.Parent=Corpse;
		end;
		local Animate=Corpse:FindFirstChild'Animate';
		if(Animate~=nil)then
			Animate.Parent=nil;
			Animate.Parent=Corpse;
		end;
	end;
end;
A.Functions.CreateWeld=function(Part0,Part1,C0,C1)
	local Weld=A.Old.Instance.NewObject('Motor',Part0);
		Weld.Part0=Part0;
		Weld.Part1=Part1;
		if(C0~=nil)then
			Weld.C0=C0;
		end;
		if(C1~=nil)then
			Weld.C1=C1;
		end;
	return Weld;
end;
A.Functions.MemeGui=function()
	local Win=A.Functions.GiveWindow('Memes',300,300);
	if(Win==nil)then
		return nil;
	end;

	Win.Title.Position=A.Old.UDim2.new(.5,-150);

	Win.SetPos=A.Functions.Value('Number',0,function(Value)
		Win.Status.Text=Value;
		Win.Image.Image=Value;
	end);


	Win.Memes={};local Num=0;
	for i,v in next,A.Images.Meme do Num=Num+1;--[[Num+=1; don't work :'( ]]
		Win.Memes[Num]={Name=i;ID=v;};
	end;Win.NumMemes=#Win.Memes;

	Win.Status=A.Functions.Lock('TextLabel',{
			Text=function()return 1+Win.SetPos.Value..' of '..Win.NumMemes..': '..Win.Memes[Win.SetPos.Value+1].Name..' ('..Win.Memes[Win.SetPos.Value+1].ID..')';end;
			Position=A.Old.UDim2.new(0,20);
			Size=A.Old.UDim2.new(1,-40,1);
			TextColor3=A.Old.Color3.White;
			BackgroundTransparency=1;
			Parent=Win.Menu;
			FontSize=2;
		}
	);
	Win.Image=A.Functions.Lock('ImageLabel',{
			Image=function()return A.Data.BaseUrl..Win.Memes[Win.SetPos.Value+1].ID;end;
			Position=A.Old.UDim2.Pax;
			Size=A.Old.UDim2.Full;
			Parent=Win.Frame;
		}
	);

	local Cnr={};
	local Num;
	for i=0,1 do
		local Plus=i==0 and -1 or 1;
		Cnr[#Cnr+1]=A.Functions.Button('TextButton',{
				Position=A.Old.UDim2.new(i,i==1 and -20);
				BackgroundColor3=A.Old.Color3.Grey;
				TextColor3=A.Old.Color3.Black;
				Size=A.Old.UDim2.new(0,20,1);
				Text=i==0 and'<'or'>';
				Parent=Win.Menu;
				FontSize=2;
			},function()
				Num=Win.SetPos.Value+Plus;
				if(Num>=Win.NumMemes)then
					Num=0;
				end;
				if(Num<0)then
					Num=Win.NumMemes-1;
				end;
				Win.SetPos.Value=Num;
			end
		);
		A.Functions.Button('TextButton',{
				TextColor3=i==0 and A.Old.Color3.White or A.Old.Color3.DarkRed;
				Position=A.Old.UDim2.new(i/2,0,1,-20);
				Size=A.Old.UDim2.new(.5,0,0,20);
				Text=i==0 and'Wear'or'Drop';
				BackgroundTransparency=1;
				TextStrokeTransparency=0;
				Parent=Win.Frame;
				FontSize=3;
			},i==0 and function()
				A.Functions.MakeMeme(Win.Memes[Win.SetPos.Value+1].ID,A.User.C.Character);
			end or function()
				A.Functions.MakeMeme('reset!',A.User.C.Character);
			end
		);
	end;

	A.Functions.TransparencyContact(Cnr);
	
end;
A.Functions.SettingWait=function(Name,Bool)
	if(A.Settings[Name].Value~=Bool)then
		A.Settings[Name].Changed:wait();
	end;
	return A.Settings[Name];
end;
A.Functions.FindWithOutside=function(Start,End)
	local Type=type(End);
	if(Type=='userdata')then
		local Stepped=0;
		if(Start.Parent~=End)then
			while(Start.Parent~=End and Stepped<50)do
				Start=Start.Parent;
				Stepped=Stepped+1;
			end;
		end;
	elseif(Type=='string')then
		local Stepped=0;
		if(Start.Parent.className~=End)then
			while(Start.Parent.className~=End and Stepped<50)do
				Start=Start.Parent;
				Stepped=Stepped+1;
			end;
		end;
	end;
	
	return Start;
end;
A.Functions.ResizeChar=function(Char,Plus_Size)
	local Torso=Char.Torso;

	Torso.Anchored=true;
	Torso.BottomSurface=0;
	Torso.TopSurface=0;
	
	A.Functions.Remove(Char:FindFirstChild'Shirt',true);
	A.Functions.Remove(Char:FindFirstChild'Pants',true);
	
	local Virus=Char:FindFirstChild'Shirt Graphic';
	if(Virus~=nil)then
		Virus:Destroy();
	end;
	
	local Welds={};
	local Change;Change=function(Object)
		for i,Weld in next,Object:children()do
			if(Weld.className=='Weld'or Weld.className=='Motor'or Weld.className=='Motor6D')then
				local Part=Weld.Part1;

				Part.Anchored=true;

				Weld.Part1=nil;

				local r01,r02,r03,r04,r05,r06,r07,r08,r09,r10,r11,r12=Weld.C0:components();
				Weld.C0=A.Old.CFrame.new(r01*Plus_Size,r02*Plus_Size,r03*Plus_Size,r04,r05,r06,r07,r08,r09,r10,r11,r12);
				local r01,r02,r03,r04,r05,r06,r07,r08,r09,r10,r11,r12=Weld.C1:components();
				Weld.C1=A.Old.CFrame.new(r01*Plus_Size,r02*Plus_Size,r03*Plus_Size,r04,r05,r06,r07,r08,r09,r10,r11,r12);

				if(Part.Name~='Head')then
					Part.formFactor=3;
					Part.Size=Part.Size*Plus_Size;
				else
					for i,v in next,Part:children()do
						if(v.className=='Weld')then
							v.Part0=nil;
							v.Part1.Anchored=true;
						end;
					end;
					Part.formFactor=3;
					Part.Size=Part.Size*Plus_Size;
					for i,v in next,Part:children()do
						if(v.className=='Weld')then
							v.Part0=Part;
							v.Part1.Anchored=false;
						end;
					end;
				end;
					
				if(Weld.Parent==Torso)then
					Part.BottomSurface=0;
					Part.TopSurface=0;
				end;
				
				Part.Anchored=false;

				Weld.Part1=Part;

				if(Weld.Part0==Torso)then
					Welds[#Welds+1]=Weld;
					Part.Anchored=true;
					Weld.Part0=nil;
				end;
			elseif(Weld.className=='CharacterMesh')then
				local Body_Part=tostring(Weld.BodyPart):match'%w+.%w+.(%w+)';
				local Mesh=A.Old.Instance.NewObject('SpecialMesh',
					Body_Part=='Head'and Char:FindFirstChild'Head'or Body_Part=='Torso'and Char:FindFirstChild'Torso'or
					Body_Part=='LeftArm'and Char:FindFirstChild'Left Arm'or Body_Part=='RightArm'and Char:FindFirstChild'Right Arm'or
					Body_Part=='LeftLeg'and Char:FindFirstChild'Left Leg'or Body_Part=='RightLeg'and Char:FindFirstChild'Right Leg'or nil);
					Mesh.MeshId=A.Data.BaseUrl..Weld.MeshId;
					if(Weld.BaseTextureId~=0 or Weld.BaseTextureId~='0')then
						Mesh.TextureId=A.Data.BaseUrl..Weld.BaseTextureId;
					end;
					Mesh.Scale=Mesh.Scale*Plus_Size;
					Weld:Destroy();
			elseif(Weld.className=='SpecialMesh'and Weld.Parent~=Char.Head)then
				Weld.Scale=Weld.Scale*Plus_Size;
			end;
			Change(Weld);
		end;
	end;

	Change(Char);

	Torso.formFactor=3;
	Torso.Size=Torso.Size*Plus_Size;
	
	for i,v in next,Welds do
		v.Part0=Torso;
		v.Part1.Anchored=false;
	end;

	Torso.Anchored=false;
	--[[
	Wait(1);
	
	if(Shirts~=nil)then
		Shirts.Parent=Char;
	end;
	if(Pants~=nil)then
		Pants.Parent=Char;
	end;]]
end;
--[[Functions end;]]


--[[Old]]
local Table;
for i,Name in next,{
		'BrickColor';
		'Instance';
		'Vector3';
		'Vector2';
		'Color3';
		'CFrame';
		'UDim2';
		'UDim';
		'Ray';
	}do
	Table=loadstring('return '..Name)();
	if(Table~=nil)then
		A.Old[Name]=A.Functions.CopyTable(Table);
	end;i,Name=nil;
end;

A.Old.Instance.NewObject=A.Old.Instance.new;
A.Old.Instance.new=function(Object,Data)
	local Class=Object;
	Object,Data=A.Functions.GiveData(A.Old.Instance.NewObject(Object,Data));

	if(A.Stuffs.Gui.PartOfGui[Class]==true)then
		Data.Properties.BackgroundColor3=function()return A.Old.Color3.Black;end;
		Data.Properties.BorderSizePixel=function()return 0;end;
		Data.Properties.Visible=function()return true;end;
	end;
	if(A.Stuffs.Gui.Text[Class]==true)then
		Data.Properties.TextColor3=function()return A.Old.Color3.White;end;
		Data.Properties.TextWrapped=function()return true;end;
		Data.Properties.TextWrap=function()return true;end;
	end;
	if(A.Stuffs.Gui.Image[Class]==true)then
		Data.Properties.BackgroundTransparency=function()return 1;end;
	end;
	if(A.Stuffs.Gui.Button[Class]==true)then
		Data.Properties.AutoButtonColor=function()return false;end;
		Data.Properties.Active=function()return true;end;
	end;Class=nil;

	Data.Properties.archivable=function()return false;end;
	Data.Properties.Archivable=function()return false;end;
	Data.Properties.Name=function()return'';end;

	pcall(A.Functions.Peace,Object,Data.Properties);

	return Object,Data;
end;

A.Old.Color3.Red=A.Old.Color3.new(1);
A.Old.Color3.Black=A.Old.Color3.new();
A.Old.Color3.Green=A.Old.Color3.new(0,1);
A.Old.Color3.Blue=A.Old.Color3.new(0,0,1);
A.Old.Color3.DarkRed=A.Old.Color3.new(.8);
A.Old.Color3.Yellow=A.Old.Color3.new(1,1);
A.Old.Color3.White=A.Old.Color3.new(1,1,1);
A.Old.Color3.Grey=A.Old.Color3.new(.5,.5,.5);
A.Old.Color3.DarkGreen=A.Old.Color3.new(0,.8);
A.Old.Color3.DarkBlue=A.Old.Color3.new(0,0,.8);
A.Old.Color3.DarkBlue=A.Old.Color3.new(0,0,.8);
A.Old.Color3.DarkYellow=A.Old.Color3.new(.7,.7);

A.Old.CFrame.Pax=A.Old.CFrame.new();
A.Old.CFrame.Char=A.Old.CFrame.new(0,3,0);

A.Old.Vector3.Pax=A.Old.CFrame.Pax.p;
A.Old.Vector3.Char=A.Old.CFrame.Char.p;
A.Old.Vector3.Jump=A.Old.Vector3.new(0,100);


A.Old.BrickColor.White=A.Old.BrickColor.new'1001';
A.Old.BrickColor.Black=A.Old.BrickColor.new'1003';

A.Old.UDim2.Pax=A.Old.UDim2.new();
A.Old.UDim2.Full=A.Old.UDim2.new(1,0,1);
A.Old.UDim2.ButtonSize=UDim2.new(0,20,0,20);
A.Old.UDim2.ScreenPos=A.Old.UDim2.new(0,0,0,-1);
A.Old.UDim2.ScreenSize=A.Old.UDim2.new(1,0,1,1);
--[[Old end;]]


--[[Data]]
A.Data.Step=[=[;]=];
A.Data.Start=[=[']=];
A.Data.Wrap=[=[ & ]=];
A.Data.Repeat=[=[##]=];
A.Data.RbxUrl='rbxassetid://';
A.Data.BaseUrl='http://www.roblox.com/Asset/?id=';
A.Data.CharacterLimbs={
	['Torso']={
		Size=A.Old.Vector3.new(2,2,1);
	};
	['Head']={
		C1=A.Old.CFrame.new(0,-0.5,0,-1,-0,-0,0,0,1,0,1,0);
		C0=A.Old.CFrame.new(0,1,0,-1,-0,-0,0,0,1,0,1,0);
		Size=A.Old.Vector3.new(2,1,1);
		Name='Neck';
	};
	['Right Arm']={
		C1=A.Old.CFrame.new(-0.5,0.5,0,0,0,1,0,1,0,-1,-0,-0);
		C0=A.Old.CFrame.new(1,0.5,0,0,0,1,0,1,0,-1,-0,-0);
		Size=A.Old.Vector3.new(1,2,1);
		Name='Right Shoulder'
	};
	['Right Leg']={
		C1=A.Old.CFrame.new(0.5,1,0,0,0,1,0,1,0,-1,-0,-0);
		C0=A.Old.CFrame.new(1,-1,0,0,0,1,0,1,0,-1,-0,-0);
		Size=A.Old.Vector3.new(1,2,1);
		Name='Right Hip'
	};
	['Left Arm']={
		C1=A.Old.CFrame.new(0.5,0.5,0,-0,-0,-1,0,1,0,1,0,0);
		C0=A.Old.CFrame.new(-1,0.5,0,-0,-0,-1,0,1,0,1,0,0);
		Size=A.Old.Vector3.new(1,2,1);
		Name='Left Shoulder'
	};
	['Left Leg']={
		C1=A.Old.CFrame.new(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0);
		C0=A.Old.CFrame.new(-1,-1,0,-0,-0,-1,0,1,0,1,0,0);
		Size=A.Old.Vector3.new(1,2,1);
		Name='Left Hip'
	};
};
--[[Data end;]]


--[[Stuffs]]
A.Stuffs.Gui={
	PartOfGui={
		ImageButton=true;
		TextButton=true;
		ImageLabel=true;
		TextLabel=true;
		TextBox=true;
		Frame=true;
	};
	Text={
		TextButton=true;
		TextLabel=true;
		TextBox=true;
	};
	Image={
		ImageButton=true;
		ImageLabel=true;
	};
	Button={
		ImageButton=true;
		TextButton=true;
	};
};
A.Stuffs.TrueBooleans={
	['of course']=true;
	['not false']=true;
	['why not']=true;
	['off on']=true;
	['yahwol']=true;
	['not 0']=true;
	['true']=true;
	['yes']=true;
	['yep']=true;
	['yup']=true;
	['on']=true;
	['ya']=true;
	['y']=true;
	['1']=true;
};
A.Stuffs.Security=pcall(function()return Game.RobloxLocked;end);
local Asd;
A.Stuffs.AsciiNum={};
A.Stuffs.AsciiChar={};
for i=0,255 do
	Asd=string.char(i);
	A.Stuffs.AsciiNum[Asd]=i;
	A.Stuffs.AsciiChar[i]=Asd;i=nil;
end;Asd=nil;
A.Stuffs.CharVirus={
	['Shirt Graphic']='ShirtGraphic';
	['RobloxTeam']='Script';
	['Sound']='Script';
};
A.Stuffs.GuideCommands={
	['-r']='<Property>';
	['-x']='<Position>';
	['-b']='<Boolean>';
	['-p']='<Player>';
	['-v']='<Value>';
	['-s']='<Size>';
	['-t']='<Text>';
	['-i']='<Path>';
};
A.Stuffs.NullTable={};
A.Stuffs.StarterSource=[==[if(Game.PlaceId~=0)then print=function()end;end;local Users=Game:service'Players';local User=Users.LocalPlayer; ]==];
--[[Stuffs end;]]


--[[Settings]]
A.Settings['Security of character']=false;
A.Settings['Windows transparency']=true;
A.Settings['Big jumps']=false;
A.Settings.HealthBar=false;
A.Settings.Immortal=false;
--[[Settings end;]]


--[[Service]]
for i,v in next,Game:children()do
	pcall(function()
		if(Game:service(v.className)~=nil)then
			A.Service[v.className]=v;
		end;i,v=nil;
	end);
end;
--[[Service end;]]



--[=[Create gui module
	Exemple:

A.Functions.CreateGuiModule(function()

end);

]=]
A.Functions.CreateGuiModule(function()
	for i,v in next,{'Hints';'Messages';'Other';'Windows';'First';}do
		A.User.Frames[v]=A.Functions.Lock('Frame',{
				Position=A.Old.UDim2.ScreenPos;
				Size=A.Old.UDim2.ScreenSize;
				BackgroundTransparency=1;
				Parent=A.User.Screen;
				Name=v;
			}
		);i,v=nil;
	end;
end);
A.Functions.CreateGuiModule(function()
	A.Stuffs.MenuButton=A.Functions.Lock('Sound',{
			SoundId='rbxasset://sounds/switch.wav';
			Parent=A.User.Screen;
			Volume=.5;
			Pitch=2;
		}
	);
	A.Stuffs.Button=A.Functions.Lock('Sound',{
			SoundId='rbxasset://sounds/SWITCH3.wav';
			Parent=A.User.Screen;
			Volume=.2;
			Pitch=2;
		}
	);
end);
A.Functions.CreateGuiModule(function()
	local Frame;
	local Pos1,Pos2=A.Old.UDim2.new(0,-110,1,-145),A.Old.UDim2.new(0,0,1,-145);

	local MouseEnter=A.Functions.Value('Bool',false,function(Value)
		A.User.MenuButton.Position=Value==true and Pos2 or Pos1;
		A.User.MenuButton.Transparency=Value==true and 0 or .5;
	end);
	local Visible=A.Functions.Value('Bool',false,function(Value)A.User.MenuButton.Visible,MouseEnter.Value=Value==false;Frame.Visible=Value;end);

	local BF={};
	local AddButtonFunction=function(Title,Function,Security)
		if(Security==true and A.Stuffs.Security==false)then
			return nil;
		end;
		BF[#BF+1]={
			Function=Function;
			Title=Title;
		};
	end;

	AddButtonFunction('Back to the game',function()Visible.Value=false;end);
	AddButtonFunction('Fix Roblox Guis',function()loadstring(Game:GetObjects'rbxassetid://85827582'[1].Value)();end,true);
	AddButtonFunction('Command Bar',function()A.Functions.CommandBar();end);
	AddButtonFunction('Show Memes',function()A.Functions.MemeGui();end);
	AddButtonFunction('Spawning',function()A.User.Char.Torso.CFrame=A.Functions.GetSpawnLocationCFrame();A.User.Char.Torso.Velocity=A.Old.Vector3.Pax;end);
	AddButtonFunction('Explorer',function()A.Functions.ExplorerGui();end);
	AddButtonFunction('Settings',function()A.Functions.SettingsGui();end);
	AddButtonFunction('Meters',function()A.Functions.Meter();end);
	AddButtonFunction('Reset',function()A.Functions.ResetChar(A.User.C);end);
	AddButtonFunction('Nuke',function()A.Functions.NukeChar(A.User.Char);end);
	AddButtonFunction('Help',function()A.Functions.HelpGui();end);
	AddButtonFunction('Heal',function()A.Functions.Heal(A.User.C.Character);end);

	AddButtonFunction=nil;


	A.User.MenuButton=A.Functions.Lock('TextButton',{
			Transparency=function()return MouseEnter.Value==true and 0 or .5;end;
			Visible=function()return Visible.Value==false;end;
			Position=function()return MouseEnter.Value==true and Pos2 or Pos1;end;
			TextColor3=A.Old.Color3.DarkYellow;
			Size=A.Old.UDim2.new(0,125,0,20);
			Parent=A.User.Frames.First;
			Text='Menu of Ohgal';
			FontSize=2;
		},{
			MouseEnter=function()
				MouseEnter.Value=true;
				A.User.MenuButton.MouseLeave:wait();
				MouseEnter.Value=false;
			end;
			MouseButton1Up=function()
				Visible.Value=true;
				A.Stuffs.MenuButton:play();
			end;
		}
	);
	coroutine.wrap(function()
		A.User.MenuButton.MouseButton1Down:wait();
		A.User.STARTUPMSG.Parent=nil;
	end)();
	Frame=A.Functions.Lock('Frame',
		{
			Position=A.Old.UDim2.new(.5,-200,.5,-((#BF*20)+5)/2);
			Size=A.Old.UDim2.new(0,400,0,(#BF*20)+10);
			Visible=function()return Visible.Value;end;
			BackgroundColor3=A.Old.Color3.DarkRed;
			Parent=A.User.Frames.First;
			BackgroundTransparency=.5;
		}
	);
	for Int,v in next,BF do
		A.Functions.Button('TextButton',{
				Position=A.Old.UDim2.new(0,5,0,(20*(Int-1))+5);
				TextColor3=A.Old.Color3.DarkYellow;
				Size=A.Old.UDim2.new(1,-10,0,20);
				BackgroundTransparency=.5;
				AutoButtonColor=true;
				Text=v.Title;
				Parent=Frame;
				FontSize=5;
				Font=1;
			},v.Function
		);
	end;
end);
A.Functions.CreateGuiModule(function()
	Delay(0,function()
		local Color1=A.Old.Color3.Black;
		local Color2=A.Old.Color3.Red;
		local Color3=A.Old.Color3.Red;
		local Color4=A.Old.Color3.Black;
		local Msg=A.Functions.Peace('TextLabel',{
				Text='Welcome!'..string.rep('\n',2)..'Remso - Local Admin';
				Position=A.Old.UDim2.new(.5,0,.5);
				BackgroundTransparency=.5;
				BackgroundColor3=Color1;
				Parent=A.User.Screen;
				TextColor3=Color2;
				BorderSizePixel=0;
				TextWrapped=true;
				FontSize=3;
			}
		);
		A.User.STARTUPMSG=Msg;
		Msg:TweenSizeAndPosition(A.Old.UDim2.new(0,300,0,70),A.Old.UDim2.new(.5,-150,.5,-35),1,2,1,false);
		Wait(5);
		Msg.BackgroundColor3=A.Old.Color3.Red;
		Msg.TextColor3=A.Old.Color3.Black;
		if(Msg.Parent~=nil)then
			Msg:TweenSizeAndPosition(A.Old.UDim2.new(0,200,0,20),A.Old.UDim2.new(0,25,1,-145),1,1,1,false);
			Msg.Text='<-- There is the MENU';
			coroutine.wrap(function()
				for i=1,3 do
					Msg.BackgroundColor3=Color3;
					Msg.TextColor3=Color4;
					A.Functions.Wait(.3);
					Msg.BackgroundColor3=Color1;
					Msg.TextColor3=Color2;
					A.Functions.Wait(.3);
				end;
			end)();
			Wait(6);
		end;
		A.Functions.Remove(Msg,true);
	end);
end);
A.Functions.CreateGuiModule(function()
	A.Functions.SettingWait('HealthBar',true);
	A.User.Gui.HelathBar={};
	local this=A.User.Gui.HelathBar;
	
	if(A.User.Humanoid.Value==nil)then
		A.User.Humanoid.Changed:wait();
	end;

	this.Fix=function()
		this.Pos=A.Old.UDim2.new(this.SetHealth.Value/this.SetMaxHealth.Value,0,1);
		if(this.HBar~=nil)then
			this.HBar.Size=this.Pos;
		end;
		return this.Pos;
	end;
	this.FixStats=function()
		this.Idk=this.Humanoid.Health/this.Humanoid.MaxHealth;
		this.SetMaxHealth.Value=this.Humanoid.MaxHealth;
		this.SetHealth.Value=this.Humanoid.Health;
		this.SetColor.Value=(this.Idk<=.1)and A.Old.Color3.DarkRed or(this.Idk>.1 and this.Idk<=.5)and
			A.Old.Color3.DarkYellow or(this.Idk>.5 and this.Idk<=1)and A.Old.Color3.Green or A.Old.Color3.Black;
	end;

	this.SetColor=A.Functions.Value('Color3',A.Old.Color3.Green,function(Color3)this.HBar.BackgroundColor3=Color3;Color3=nil;end);
	this.SetVisible=A.Functions.Value('Bool',true,function(Value)this.Frame.Visible=Value;Value=nil;end);
	this.SetMaxHealth=A.Functions.Value('Number',A.User.Humanoid.Value.MaxHealth,this.Fix);
	this.SetHealth=A.Functions.Value('Number',A.User.Humanoid.Value.Health,this.Fix);

	this.Frame=A.Functions.Lock('Frame',{
			Visible=function()return this.SetVisible.Value;end;
			Position=A.Old.UDim2.new(.5,-55,1,-25);
			Size=A.Old.UDim2.new(0,110,0,20);
			Parent=A.User.Frames.Other;
			BackgroundTransparency=.5;
		}
	);
	this.MHBar=A.Functions.Lock('Frame',
		{
			--BackgroundColor3=A.Old.Color3.DarkRed;
			Position=A.Old.UDim2.new(0,5,0,5);
			Size=A.Old.UDim2.new(1,-10,1,-10);
			BackgroundTransparency=1;
			Parent=this.Frame;
		}
	);
	this.HBar=A.Functions.Lock('Frame',
		{
			BackgroundColor3=function()return this.SetColor.Value;end;
			Position=A.Old.UDim2.Pax;
			Parent=this.MHBar;
		}
	);
	this.HBar.Size=this.Fix();

	this.Valid=true;

	coroutine.wrap(function()
		while(A.Functions.Check()and this.Valid==true)do
			this.SetVisible.Value=A.Settings.HealthBar.Value;
			A.Settings.HealthBar.Changed:wait();
		end;
	end)();
	coroutine.wrap(function()
		while(A.Functions.Check()and this.Valid==true)do
			A.Functions.SettingWait('HealthBar',true);

			this.Humanoid=A.User.Humanoid.Value;
			this.FixStats();

			coroutine.wrap(function()
				while(A.Functions.Check()and A.User.Humanoid.Value==this.Humanoid)do
					this.Humanoid.HealthChanged:wait();
					this.FixStats();
				end;
			end)();

			A.User.Humanoid.Changed:wait();
			this.Humanoid.MaxHealth=this.Humanoid.MaxHealth+1;
		end;
	end)();

end);
--[[Create gui module end;]]


--[=[Module create
	Exemple:
A.Functions.CreateModule('Type',function()

end);
]=]
A.Functions.CreateModule('Once',A.Functions.Screen);
A.Functions.CreateModule('Once',function()

	local Value=A.Functions.SettingWait('Immortal',true);
	local Val_;

	while(A.Functions.Check())do
		Val_=Value.Value;
		if(A.User.Humanoid.Value~=nil)then
			A.User.Humanoid.Value.Name=Val_==true and'Immortal'or'Humanoid';
			A.User.Humanoid.Value.MaxHealth=Val_==true and 1e666 or 100;
			A.User.Humanoid.Value.Health=Val_==true and 1e666 or 100;
		end;
		Value.Changed:wait();
	end;

end);
A.Functions.CreateModule('Once',function()
	local Num;
	A.Stuffs.SecurityID=A.Stuffs.SecurityID and A.Stuffs.SecurityID+1 or 1;
	local Local_ID=A.Stuffs.SecurityID;
	while(A.Functions.Check()==true and A.Stuffs.SecurityID==Local_ID)do
		A.Functions.Wait();

		A.User.Char=A.User.C.Character;

		if(A.User.Char~=nil and A.User.Char.PrimaryPart~=nil)then
			A.Functions.LoadModule'Char';
		end;

		A.User.C.CharacterAdded:wait();

		Num=#A.User.Connections;
		for i=1,Num do A.User.Connections[i]:disconnect();i=nil;end;
		for i=1,Num do A.User.Connections[i]=nil;i=nil;end;
	end;
end);
A.Functions.CreateModule('Char',function()
	_G['Ohgal - Char Security Version']=_G['Ohgal - Char Security']~=nil and _G['Ohgal - Char Security']+1 or 0;
	local CharSecurityVersion=_G['Ohgal - Char Security'];
	local Torso=A.User.Char.Torso
	while(A.Functions.Check()and CharSecurityVersion==_G['Ohgal - Char Security'])do
		A.Functions.SettingWait('Security of character',true);
		if(Torso.Position.Y<=-200 and Torso.Velocity.Y~=0)then
			Torso.CFrame=A.Functions.GetSpawnLocationCFrame();
			Torso.RotVelocity=A.Old.Vector3.Pax;
			Torso.Velocity=A.Old.Vector3.Pax;
		end;
		A.Functions.Wait();
	end;
end);
A.Functions.CreateModule('Char',function()
	A.User.Humanoid.Value=A.Functions.FindObject(A.User.Char,'className','Humanoid');

	if(A.Settings.Immortal.Value==true)then
			A.User.Humanoid.Value.Name='Immortal';
			A.User.Humanoid.Value.MaxHealth=1e666;
			A.User.Humanoid.Value.Health=1e666;
	end;

	coroutine.wrap(function()
		local Humanoid=A.User.Humanoid.Value;
		while(Humanoid==A.User.Humanoid.Value and A.Functions.Check()==true)do
			A.Functions.SettingWait('Big jumps',true);
			Humanoid.Jumping:wait();
			if(A.Settings['Big jumps'].Value==true)then
				Humanoid.Torso.Velocity=A.Old.Vector3.Jump;
			end;
		end;
	end)();

	for i,v in next,A.User.Char:children()do
		if(A.Stuffs.CharVirus[v.Name]==v.className)then
			A.Functions.Remove(v,true);
		end;i,v=nil;
	end;
	A.Functions.Connect(A.User.Char,'ChildAdded',function(v)
		if(A.Stuffs.CharVirus[v.Name]==v.className)then
			A.Functions.Remove(v,true);
		end;v=nil;
	end,A.User);
	if(A.Stuffs.CharVirus.Sound==nil)then return nil;end;
	for i,v in next,A.User.Char.PrimaryPart:children()do
		if(v.Name=='Sound'and v.className=='Sound'and v.archivable==false)then
			A.Functions.Remove(v,true);
		end;i,v=nil;
	end;
	A.Functions.Connect(A.User.Char.PrimaryPart,'ChildAdded',function(v)
		if(v.Name=='Sound'and v.className=='Sound'and v.archivable==false)then
			A.Functions.Remove(v,true);
		end;v=nil;
	end,A.User);
end);
A.Functions.CreateModule('PlayerGui',A.Functions.GuisParent);
A.Functions.CreateModule('PlayerGui',function()
	local Old=A.User.PlayerGui;
	coroutine.wrap(function()
		local Virus;
		while(A~=nil and A.Functions.Check()and Old==A.User.PlayerGui)do
			if(Virus==nil)then
				Virus=Old:FindFirstChild'HealthGUI';
			else
				Virus=Virus.Name=='HealthGUI'and Virus or nil;
			end;
			if(Virus~=nil)then
				A.Functions.VisibleOfHealthGUI(A.Settings.HealthBar.Value==false);
				Virus=Virus:FindFirstChild'hurtOverlay';
				if(Virus)then
					A.Functions.Remove(Virus,true);
				end;
			end;
			Virus=Old.ChildAdded:wait();Wait();
		end;
	end)();
	while(Old.Parent~=nil)do Old.Changed:wait();end;
	A.Old.Instance.NewObject('BoolValue',Old);
end);

--[[Module create end;]]



--[=[Call create
	Exemple:

A.Functions.CreateCall([[Description]],{},function(Self)

end);

]=]
A.Functions.CreateCall([[For you]],{'me!';'myself!';'satan!';},function(Self)
	return Self==A.User.C;
end);
A.Functions.CreateCall([[For they]],{'other!';'noobs!';'idiots!';'notme!';},function(Self)
	return Self~=A.User.C;
end);
A.Functions.CreateCall([[For players]],{'players!';},function(Self)
	return Self.userId>0;
end);
A.Functions.CreateCall([[For guests]],{'guests!';},function(Self)
	return Self.userId<1;
end);
A.Functions.CreateCall([[For random player]],{'random!';'rand!';},function(Self)
	return math.random(1,4)==1;
end);
A.Functions.CreateCall([[For each]],{'all!';'each!'},function(Self)
	return true;
end);
--[[Call create end;]]



A.Functions.SetupCommands=function()
--[==[Command create
 Exemple:

A.Functions.CreateCommand([[Title]],{},[[Description]],[[]],1,function(Text,FullText,Args)

end);

]==]
A.Functions.CreateCommand([[Repeat Command]],{'loopthis';'loopthat';'repeat';'rt';},[[Repeat commands...First is name of the loop... Second value is number of loop... Third is delay (0 not wait())... The last is the command and command argument(s)... To stop loop say loop name first and last "abort!"]],[[-v-v-v]],3,function(Text,FullText,Args)
	if(A.Stuffs.Loops==nil)then
		A.Stuffs.Loops={};
	end;

	local Value=Args[2]:lower()~='abort!'and true or nil;

	if(Value==true and A.Stuffs.Loops[Args[1]]~=nil)then
		error(Args[1]..' already run...');
		return nil;
	end;
	A.Stuffs.Loops[Args[1]]=Value;
	if(A.Stuffs.Loops[Args[1]]==nil)then
		return nil;
	end;
	local Repeat=tonumber(Args[2]);
	local Delay=tonumber(Args[3]);
	local Command=A.Data.Start..FullText:match(Args[1]..A.Data.Step..Args[2]..A.Data.Step..Args[3]..A.Data.Step..'(.+)');
	if(Delay>0)then
		for i=1,Repeat do
			if(A.Stuffs.Loops[Args[1]]==true)then
				A.Functions.SearchCommand(Command);
				Wait(Delay);
			else
				break;
			end;
		end;
	else
		for i=1,Repeat do
			A.Functions.Thread(function()
				A.Functions.SearchCommand(Command);
			end);
		end;
	end;
	A.Stuffs.Loops[Args[1]]=nil;
end);
A.Functions.CreateCommand([[Dummy]],{'dummy';'doll';},[[Dummy for testing lol... Add player name for or Vector3 position and for last number of dummies... For remove all, the first argument should be "remove!"]],[[-v-v]],2,function(Text,FullText,Args)
	if(Args[1] and Args[1]:lower()=='remove!')then
		for i,v in next,A.Service.Workspace:children()do
			if(v:FindFirstChild'Remso - Dummy')then
				A.Functions.Remove(v,true);
			end;
		end;
		return nil;
	end;
	local Repeat=tonumber(Args[2])or 1;
	local Load,Position=pcall(function()return loadstring('local c={...};return c[1]('..Args[1]..')')(A.Old.CFrame.new);end);
	if(Load==false)then Position=A.Functions.Players(Args[1])[1].Character.Torso.CFrame;end;
	for i=1,Repeat do
		local Dummy=A.Functions.Peace('Model',{
				Parent=A.Service.Workspace;
				Name='Dummy';
			}
		);
		A.Old.Instance.NewObject('BoolValue',Dummy).Name='Remso - Dummy';
		A.Old.Instance.NewObject('Humanoid',Dummy);
		A.Functions.Peace('Part',{
				CFrame=Position*CFrame.Angles(0,math.rad(360/Repeat*i),0)*CFrame.new(5+.2*Repeat,0,0);
				Size=Vector3.new(2,2,1);
				BottomSurface=0;
				TopSurface=0;
				formFactor=3;
				Parent=Dummy;
				Name='Torso';
			}
		);
		A.Functions.Heal(Dummy);
		A.Old.Instance.NewObject('SpecialMesh',Dummy.Head).Scale=Vector3.new(1.25,1.25,1.25);
		A.Functions.Peace('Decal',{
				Texture='rbxasset://textures/face.png';
				Parent=Dummy.Head;
				Name='face';
				Face=5;
			}
		);
	end;
end);
A.Functions.CreateCommand([[Wall Hack]],{'wallhack';'wall_hack';'wh';},[[Wall hack... Add number for transparency value! The base value is 0.5]],[[-v]],1,function(Text,FullText,Args)
	local Transparency=tonumber(Args[1])or .5;
	A.Functions.All(A.Service.Workspace,function(Part)
		if(Part:IsA'BasePart')then
			Part.AlphaModifier=Transparency;
		end;
	end);
end);
A.Functions.CreateCommand([[Teleport To A Place]],{'toplace';'tplace';'tpl';},[[Teleport to other places...]],[[-v-p]],2,function(Text,FullText,Args)
	local Teleport_ID=tonumber(Args[1]);
	A.Functions.Players(Args[2],function(Self)
		if(Self==A.User.C)then
			A.Services.TeleportService:Teleport(Teleport_ID);
		else
			A.Functions.CreateScript('LocalScript',Self,[[
				Game:service'TeleportService':Teleport(]]..Teleport_ID..[[);
			]]);
		end;
	end);
end);
A.Functions.CreateCommand([[Execution]],{'execution';'execute';'exe';},[[Like localscripting but this works only for admin...]],[[-t]],0,function(Text,FullText,Args)
	local Exe=A.Old.Instance.NewObject'StringValue';
		Exe.Name='Ohgal_Execution';
		Exe.Parent=A.User.C;
		Exe.Value=FullText;
end);
A.Functions.CreateCommand([[Resize Character]],{'resize';},[[Character resizing OLaloOLAolaol]],[[-p-v]],2,function(Text,FullText,Args)
	local Size=tonumber(Args[2]);
	if(Size==nil)then
		return nil;
	end;
	A.Functions.Players(Args[1],function(Self)
		A.Functions.ResizeChar(Self.Character,Size);
	end);
end);
A.Functions.CreateCommand([[Give Weapons]],{'giveweapons';'gws';},[[Give weapons from somebody to somebody...]],[[-p-p]],2,function(Text,FullText,Args)
	local Backpack=A.Functions.FindObject(A.Functions.Players(Args[2])[1],'className','Backpack');
	if(Backpack~=nil)then
		A.Functions.Players(Args[1],function(Self)
			if(Self.Character~=nil)then
				for i,v in next,Self.Character:children()do
					if(v.className=='Tool')then
						v.Parent=Backpack;
					end;
				end;
			end;
			for i,v in next,Self.Backpack:children()do
				if(v.className=='Tool'or v.className=='HopperBin')then
					v.Parent=Backpack;
				end;
			end;
		end);
	end;
end);
A.Functions.CreateCommand([[Be Cute]],{'becute';'bc';},[[Be cute?]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		local Parent=Self.Character;

		if(Parent==nil)then
			return nil;
		end;

		local StarterPos=A.Old.Vector3.Pax;

		local Round=15;
		local Asd=Round/5;
		local Radius=.8*Parent.Torso.Size.X/2;

		local PSize=.5;

		local P={};
		local Num=0;

		for i,v in next,Parent:children()do
			if(v.Name=='Pentagramma')then
				A.Functions.Remove(v,true);
			elseif(v.Name=='Black Metal Set')then
				for i,v in next,v:children()do
					if(v.className=='Part')then
						A.Functions.Remove(v,true);
					end;
				end;
			end;
		end;

		local Warehouse=A.Old.Instance.NewObject('Model',Parent);
			Warehouse.Name='Pentagramma';

		for i=0,Round do
			local Rad=math.rad((360/Round*i)+180);
			local Pos=A.Old.Vector3.new(
				math.sin(Rad)*Radius,
				math.cos(Rad)*Radius,
				-Parent.Torso.Size.Z/2
			);
			if(i~=0)then Num=Num+1;
				if(Num==Asd)then
					Num=0;
					P[#P+1]=Pos;
				end;
				A.Functions.Peace('BlockMesh',{
						Scale=A.Old.Vector3.new(PSize,PSize,(StarterPos-Pos).Magnitude*5.2)+A.Old.Vector3.new(math.random()/10,0,0);
						Parent=A.Functions.CreateWeld(
							Parent.Torso,
							A.Functions.Peace('Part',{
									BrickColor=BrickColor.new(199);
									CFrame=Parent.Torso.CFrame;
									Size=A.Old.Vector3.Pax;
									CanCollide=false;
									Parent=Warehouse;
									formFactor=3;
								}
							),
							A.Old.CFrame.new(StarterPos,Pos)*A.Old.CFrame.new(0,0,-(StarterPos-Pos).Magnitude/2)
						).Part1;
					}
				);
			end;
			StarterPos=Pos;
		end;

		for i,v in next,{{1;4;};{1;3;};{2;4;};{2;5;};{3;5;};}do --Make better...
			local StarterPos=P[v[1]];
			local Pos=P[v[2]];
			
			local Weld=A.Old.Instance.NewObject('Weld',Warehouse);
			A.Functions.Peace('BlockMesh',{
					Scale=A.Old.Vector3.new(PSize-.2,PSize-.2,(StarterPos-Pos).Magnitude*5.2)+Vector3.new(math.random()/10,0,0);
					Parent=A.Functions.CreateWeld(
						Parent.Torso,
						A.Functions.Peace('Part',{
								BrickColor=BrickColor.new(194);
								CFrame=Parent.Torso.CFrame;
								Size=A.Old.Vector3.Pax;
								CanCollide=false;
								Parent=Warehouse;
								formFactor=3;
							}
						),
						CFrame.new(StarterPos,Pos)*CFrame.new(0,0,-(StarterPos-Pos).Magnitude/2)
					).Part1;
				}
			);
		end;
	end);
end);
A.Functions.CreateCommand([[Change Music]],{'cmp';'cmusic';},[[Change current music properties]],[[-r-v]],2,function(Text,FullText,Args)
	local Name='Ohgal_Music';
	local Music=A.Service.Workspace.CurrentCamera:FindFirstChild(Name)or A.Service.Lighting(Name);
	if(Music~=nil)then
		Music=Music.className=='Tool'and Music:FindFirstChild(Name)or Music;
		print(Music,Music.className);
		for i,v in next,A.Functions.GetProperties(Music)do
			if(i:lower():find(Args[1]:lower())==1)then
				Music[i]=loadstring('return '..Args[2])();
			end;
		end;
	end;
end);
A.Functions.CreateCommand([[Music]],{'play';'music';'mp';},[[asd...Arguments: 1.) name of the music or number of the music 2.) Public mode or Private mode (Base mode is Public!)]],[[-v-b]],2,function(Text,FullText,Args)
	for i,Place in next,{A.Service.Lighting;A.Service.Workspace.CurrentCamera;}do
		for i,v in next,Place:children()do
			if(v.className=='Sound'and v.Name=='Ohgal_Music')then
				v:stop();
			end;
		end;
	end;

	local Bool=A.Functions.ToBoolean(Args[2]);
	local Sound_Data=A.Functions.LoadSound('Musics',Args[1],true);

	loadstring([[
		local Parent=]]..tostring(Bool)..[[ and Workspace.CurrentCamera or Game:service'Lighting';
		local Sound=Parent:FindFirstChild'Ohgal_Music'or Instance.new'Sound';
			Sound.SoundId=']]..A.Data.BaseUrl..Sound_Data.SoundId..[['
			Sound.Pitch=]]..Sound_Data.Pitch..[[
			Sound.Name='Ohgal_Music';
			Sound.Parent=Parent;
			Sound.Looped=true;
			Sound:play();
	]])();
end);
A.Functions.CreateCommand([[Kick]],{'kick';'bye';},[[Customed player'll leave from the game...]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		if(Self~=A.User.C)then
			if(A.Stuffs.ScriptPacket.LocalScript~=nil)then
				A.Functions.CreateScript('LocalScript',Self,[[script.Parent=nil;User.Parent=nil;User.Parent=Users;]]);
			else
				A.Functions.Remove(Self);
			end;
		end;
	end);
end);
A.Functions.CreateCommand([[Create Part]],{'npart';'cpart';'part';},[[Part creating... For remove all parts you should add first argument "remove!" or nothing... Arguments: 1.) Size(n,n,n) 2.) BrickColor 3.) Collide 4.) Anchor 5.) Position(0,0,0)[ haven't to add ] 6.) Type of part]],[[-s-b-b-v-x-v]],6,function(Text,FullText,Args)

	if(Args[1]==nil or Args[1]:lower()=='remove!')then
		A.Functions.All(Workspace,function(Part)
			if(Part.Name=='Ohgal_Part')then
				A.Functions.Remove(Part,true);
			end;
		end);
		return nil;
	end;

	local Size=A.Old.Vector3.new(loadstring('return '..Args[1])());

	local Position=Args[5]~=nil and A.Old.CFrame.new(A.Old.Vector3.new(loadstring('return '..Args[5])()))or
		A.User.Char.Head.CFrame+A.User.Char.Head.CFrame.lookVector*A.Old.Vector3.new(Size.X,0,Size.Z).Magnitude;
	
	local Part=A.Functions.Peace(Args[6]~=nil and Args[6]or'Part',{
			CanCollide=Args[3]~=nil and A.Functions.ToBoolean(Args[3])or true;
			BrickColor=A.Old.BrickColor.new(Args[2]or 0);
			Anchored=A.Functions.ToBoolean(Args[4]);
			Name='Ohgal_Part';
			Parent=Workspace;
			CFrame=Position;
			formFactor=3;
			Size=Size;
		}
	);
	
end);
A.Functions.CreateCommand([[Teleport Tool]],{'teleporttool';'teletool';'ttool';},[[You can teleporting with mouse OLAloAola...]],[[]],0,function(Text,FullText,Args)
	local Tool=A.Old.Instance.NewObject'Tool';
	local Handle=A.Functions.Peace('Part',{
			Size=A.Old.Vector3.Pax;
			Name='Handle';
			formFactor=0;
			Parent=Tool;
		}
	);

	Delay(0,function()
		Tool.Parent=A.User.Char;
	end);


	local Mouse=Tool.Equipped:wait();

	Mouse.Icon=A.Data.BaseUrl..65439473;

	Tool.Parent=nil;


	local Torso=A.User.Char.Torso;

	local Cts={};

	Cts[#Cts+1]=Mouse.Button1Down:connect(function()
		if(Mouse.Target~=nil)then
			Torso.Velocity=A.Old.Vector3.Pax;
			Torso.RotVelocity=A.Old.Vector3.Pax;
			Torso.CFrame=Torso.CFrame-Torso.CFrame.p+Mouse.Hit.p+A.Old.Vector3.Char;
		end;
	end);

	local cTorso;
	local Grabbed;
	local Dragging=false;
	Cts[#Cts+1]=Mouse.KeyDown:connect(function(Key)
		if(Key=='f')then
			if(Mouse.Target~=nil and Mouse.Target~=Workspace)then
				local Humanoid=A.Functions.FindObject(Mouse.Target.Parent,'className','Humanoid');
				if(Humanoid~=nil and Humanoid.Torso~=nil)then
					cTorso=Humanoid.Torso;
					cTorso.Velocity=A.Old.Vector3.Pax;
					cTorso.RotVelocity=A.Old.Vector3.Pax;
					cTorso.CFrame=Torso.CFrame+(A.Old.Vector3.Char*2);
				end;
			end;
		elseif(Key=='e'and Dragging==false and Mouse.Target~=nil)then
			local Target=Mouse.Target;
			Grabbed=A.Functions.FindWithOutside(Target,Workspace);
			Dragging=true;
			A.Functions.Thread(function()
				Mouse.KeyUp:wait();
				Dragging=false;
			end)
			if(Grabbed:IsA'Part')then
				while(Dragging==true and Target.Anchored==false)do
					Mouse.Move:wait();
					if(Mouse.Target~=Target and Mouse.Target~=nil)then
						Grabbed.CFrame=Mouse.Hit.p;
					end;
				end;
			else
				while(Dragging==true)do
					Mouse.Move:wait();
					if(Mouse.Target~=Target and Mouse.Target~=nil and Target.Anchored==false)then
						Grabbed:MoveTo(Mouse.Hit.p);
					end;
				end;
			end;
		end;
	end);

	A.Functions.Thread(function()
		A.User.C.CharacterRemoving:wait();

		for i,v in next,Cts do
			v:disconnect();
		end;
	end);
end);
A.Functions.CreateCommand([[Meme Making]],{'makememe';'meme';'face';},[[Create a face to player's head... first is name of the meme or customed image's url]],[[-p-v]],2,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		A.Functions.MakeMeme(Args[2],Self.Character);
	end);
end);
if(A.Stuffs.ScriptPacket.Script~=nil)then
	A.Functions.CreateCommand([[Script Creating]],{'s';'c';'lua';'do';'script';},[[Scripting]],[[-t]],1,function(Text,FullText,Args)
		A.Functions.CreateScript('Script',A.Service.Workspace,FullText);
	end);
	A.Functions.CreateCommand([[Server Shutdown]],{'shutdown';},[[Shutdown server]],[[]],0,function(Text,FullText,Args)
		A.Functions.CreateScript('Script',A.Service.Workspace,[[Instance.new('StringValue',Workspace).Value=string.rep('\n',9999999);]]);
	end);
end;
if(A.Stuffs.ScriptPacket.LocalScript~=nil)then
	A.Functions.CreateCommand([[Local Script Creating]],{'local';'ls';'l';'lual';},[[Local Scripting...If you want share "(start sginal)(command)(separator signal)share!(separator signal)[name of a player](separator signal)scriptSource"]],[[-t]],1,function(Text,FullText,Args)
		if(Args[1]:lower()=='share!')then
			FullText=FullText:match(Args[1]..A.Data.Step..'(.+)');
			local List=FullText:match('([^'..A.Data.Step..']+)');
			A.Functions.Players(List,function(Self)
				A.Functions.CreateScript('LocalScript',Self,FullText:match(List..A.Data.Step..'(.+)'));
			end);
		else
			A.Functions.CreateScript('LocalScript',A.User.C,FullText);
		end;
	end);
	A.Functions.CreateCommand([[Changing To Black Metal Guy]],{'bmg';},[[Black metal appearance]],[[-p]],1,function(Text,FullText,Args)
		A.Functions.Players(Args[1],function(Self)
			local Char=Self.Character;
			local Head=Char.Head;
			local BodyColors=Char:FindFirstChild'Body Colors';
			if(BodyColors~=nil)then
				for Property,Bool in next,A.Functions.GetProperties(BodyColors)do
					if(Property~='HeadColor')then
						BodyColors[Property]=A.Old.BrickColor.Black;
					else
						BodyColors[Property]=A.Old.BrickColor.White;
					end;
				end;
			end;
			Delay(0,function()
				A.Functions.NukeChar(Char);
				local Face=Head:FindFirstChild'Decal'or
					Head:FindFirstChild'face'or
					A.Old.Instance.NewCreate('Decal',Head);
				if(Face)then
					Face.Texture=A.Data.BaseUrl..74447711;
					Face.Name='face';
				end;
				local Model=A.Functions.Peace('Model',{
						Name='Black Metal Set';
						Parent=Char;
					}
				);
				for i=0,1 do
					A.Old.Instance.NewObject('BlockMesh',
						A.Functions.CreateWeld(Char.Torso,
							A.Functions.Peace('Part',{
								Size=A.Old.Vector3.new(.25,i==0 and 1.5 or .75,.25);
								Name='Part Of Cross ('..tostring(i+1)..')';
								BrickColor=A.Old.BrickColor.White;
								BottomSurface=0;
								formFactor=3;
								TopSurface=0;
								Parent=Model;
							}),
							A.Old.CFrame.new(0,i==1 and -.25 or 0,-.5),
							i==1 and A.Old.CFrame.Angles(0,0,math.rad(90))or
							A.Old.CFrame.Pax
						).Part1
					).Scale=A.Old.Vector3.new(1,1,i==0 and 1 or .99);
				end;
				Wait(.3);
				for i,v in next,Char:children()do
					if(v.className=='Part')then
						v.BrickColor=v.Name=='Head'and A.Old.BrickColor.White or A.Old.BrickColor.Black;
					end;
				end;
				A.Functions.CreateScript('LocalScript',Model,[=[
					local face=Game.Players.LocalPlayer.Character.Head.face;
					local open=face.Texture;
					local close=open:gsub('%d+','74468845');
					while(Wait(math.random(10,200)/10))do
						face.Texture=close;
						Wait(math.random(1,3)/10);
						face.Texture=open;
					end;
				]=]);
			end);
		end);
	end);
end;
A.Functions.CreateCommand([[Settings Change]],{'settings';'setting';'set';},[[Change settings...1.)name of the setting (Don't need write the full name!) 2.) on/off... TO CHANGE ALL SAY "all!"]],[[-v-b]],2,function(Text,FullText,Args)
	local Name=Args[1]:lower();
	local Bool=A.Functions.ToBoolean(Args[2]);
	local Message=A.Service.Workspace:FindFirstChild'SettingChangedMsg'or A.Old.Instance.NewObject('Hint',A.Service.Workspace);
	local OldText;Delay(7,function()if(OldText==nil or Message.Text==OldText)then A.Functions.Remove(Message,true);end;end);
		Message.Name='SettingChangedMsg';
		Message.Text='Setting Changed:';
	for Name in Name:gmatch'([^,]+)'do
		for i,v in next,A.Settings do
			if(i:lower():find(Name)==1 or Name=='all!')then
				v.Value=Bool;
				Message.Text=Message.Text..' ('..i..' to '..tostring(Bool)..')';
			end;
		end;
	end;
	OldText=Message.Text;
end);
A.Functions.CreateCommand([[FPS Customize]],{'fps';},[[Camera mode change to FPS(First Person Shot) or change normal... only local]],[[-b]],1,function(Text,FullText,Args)
	A.User.C.CameraMode=A.Functions.ToBoolean(Args[1])==true and 1 or 0;
end);
A.Functions.CreateCommand([[Heal]],{'heal';'hpup';},[[Healing...]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		A.Functions.Heal(Self.Character);
	end);
end);
A.Functions.CreateCommand([[Work]],{'work'},[[Do something to objects... arguments: 1.) Property 2.) Property Value 3.)New Property 4.) New Value 5.) Path... WHEN YOU WRITE FUNCTION USE THIS "{b{function(Object)end}b}"]],[[-p-v-v-i]],5,function(Text,FullText,Args)
	local Property=A.Functions.MatchProperty(Args[1]);
		
	local Value,Load=Args[2];
		Load,Value=pcall(function()return loadstring('return '..Value)();end);
		if(Load==false or Value==nil)then
			Value=Args[2];
		end;

	local NewProperty=(#Args[3]<30)and A.Functions.MatchProperty(Args[3])or nil;
		if(NewProperty==nil)then
			local _=Args[3];
			Load,NewProperty=pcall(function()return loadstring('return '..Args[3])();end);
			if(Load==false or NewProperty==nil)then
				NewProperty=_;
			end;
		end;

	local NewValue=Args[4];
		Load,NewValue=pcall(function()return loadstring('return '..NewValue)();end);
		if(Load==false)then
			NewValue=Args[4];
		end;

	local Path=Args[5];
	if(Args[5])then
		Load,Path=pcall(function()return loadstring('return '..Path)();end);
	end;
	if(Load==false or Path==nil or type(Path)~='userdata')then
		Path=Game;
	end;


	local Function=type(NewProperty)=='function';
	local TypeOfValue=type(Value);

	if(TypeOfValue=='string')then
		A.Functions.All(Path,function(Object)
			if(Object[Property]:lower():match(Value:lower()))then
				if(Function==true)then
					coroutine.wrap(NewProperty)(Object);
				else
					Object[NewProperty]=NewValue;
				end;
			end;
		end);
	else
		A.Functions.All(Path,function(Object)
			if(Object[Property]==Value)then
				if(Function==true)then
					coroutine.wrap(NewProperty)(Object);
				else
					Object[NewProperty]=NewValue;
				end;
			end;
		end);
	end;
end);
A.Functions.CreateCommand([[Lighting Property Change]],{'lc';'lightingchange';},[[...]],[[-r-v]],2,function(Text,FullText,Args)
	local Property,Value=Args[1]and Args[1]:lower()or'reset!';
	local Lighting=A.Service.Lighting;
	if(A.Stuffs.LightingColorProperties==nil)then
		A.Stuffs.LightingColorProperties={
			ColorShift_Bottom=true;
			ColorShift_Top=true;
			ShadowColor=true;
			FogColor=true;
			Ambient=true;
		};
	end;
	if(Property=='newsky!')then
		if(A.Stuffs.SkyIDs==nil)then
			A.Stuffs.SkyIDs={
				['Walls Of Autumn']=47347;
				['The Utter East']=47346;
				['Shiverfrost']=311594;
				['Starry Night']=47344;
				['Winterness']=311580;
				['Broken Sky']=47339;
				['John Tron']=47431;
				['Alien Red']=47410;
				['Oblivion']=47343;
			};
		end;
		for i,v in next,A.Service.Lighting:children()do
			if(v.className=='Sky')then
				A.Functions.Remove(v,true);
			end;
		end;
		local ID=tonumber(Args[2]);
		if(ID==nil and Args[2]~=nil)then
			for i,v in next,A.Stuffs.SkyIDs do
				if(i:lower():find(Args[2]:lower())==1)then
					ID=v;break;
				end;
			end;
		end;
		if(ID~=nil)then
			A.Service.InsertService:LoadAsset(ID):children()[1].Parent=A.Service.Lighting;
		else
			A.Old.Instance.NewObject('Sky',A.Service.Lighting);
		end;
	end;
	if(Property=='reset!')then A.Functions.ResetLighting();end;
	for i,v in next,A.Functions.GetProperties(Lighting)do
		if(i:lower():find(Property)==1)then
			Value=A.Stuffs.LightingColorProperties[i]and loadstring('return Color3.new('..Args[2]..');')''or Args[2];
			Lighting[i]=Value;
		end;
	end;
end);
A.Functions.CreateCommand([[Change Humanoid Property]],{'hc';'humchange';'hcange';},[[...]],[[-p-r-v]],3,function(Text,FullText,Args)
	local Property;
	for i,v in next,A.Functions.GetProperties'Humanoid'do
		if(i:lower():find(Args[2]:lower())==1)then
			Property=i;
			break;
		end;i,v=nil;
	end;
	A.Functions.Players(Args[1],function(Self)
		A.Functions.FindObject(Self.Character,'className','Humanoid')[Property]=Args[3];
	end);
end);
A.Functions.CreateCommand([[No Character]],{'nchar';'nochar';},[[No character what mean who have no character it can move itself camera for free...]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		if(Self.Character)then
			A.Functions.Remove(Self.Character);
		end;
		Self.Character=nil;
	end);
end);
A.Functions.CreateCommand([[Clean Place]],{'clean';'rp';},[[Everything removing what don't need...]],[[]],0,function(Text,FullText,Args)
	A.Functions.Clean();
end);
A.Functions.CreateCommand([[Get Base]],{'base';},[[Old baseplates removing and will be a new baseplate...]],[[]],0,function(Text,FullText,Args)
	A.Functions.GetBase();
end);
A.Functions.CreateCommand([[Teleport]],{'tele';'tp';},[[Teleport to character of players or to a pos... (Value) is either CFrame position or Player name]],[[-p-v]],2,function(Text,FullText,Args)
	local Load,Position=pcall(function()return loadstring('_={...};return _[1]('..Args[2]..');')(A.Old.CFrame.new);end);
	if(Load==false or Position==nil)then
		Position=A.Functions.Players(Args[2])[1].Character.Torso.CFrame;
	end;
	A.Functions.Players(Args[1],function(Self)
		Self.Character.Torso.Velocity=A.Old.Vector3.Pax;
		Self.Character.Torso.RotVelocity=A.Old.Vector3.Pax;
		Self.Character.Torso.CFrame=Position+A.Old.Vector3.Char;
	end);
end);
A.Functions.CreateCommand([[Explosion]],{'exp';'explosion';},[[Explosion creating...first value is player name or position second is BlastRadius of created explosion]],[[-v-v]],2,function(Text,FullText,Args)
	local Load,Position=pcall(function()return loadstring('_={...};return _[1]('..Args[1]..');')(A.Old.CFrame.new).p;end);
	local Explosion=A.Old.Instance.NewObject'Explosion';
	if(Args[2])then Explosion.BlastRadius=Args[2];end;
	if(Load==true)then
		Explosion.Position=Position;
		Explosion.Parent=A.Service.Workspace;
	else
		A.Functions.Players(Args[1],function(Self)
			Explosion.Parent=nil;
			Explosion.Position=Self.Character.Torso.Position;
			Explosion.Parent=A.Service.Workspace;
		end);
	end;
end);
A.Functions.CreateCommand([[Nuke]],{'nuke';'nake';},[[Characters to be nake]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		A.Functions.NukeChar(Self.Character);
	end);
end);
A.Functions.CreateCommand([[Stop]],{'stop';},[[Stop game...]],[[]],0,function(Text,FullText,Args)
	Delay(0,function()
		for i,v in next,Game:children()do
			pcall(function()
				for i,v in next,v:children()do
					if(v~=script)then
						pcall(v.Destroy,v);
					end;i,v=nil;
				end;
				v:Destroy();
			end);i,v=nil;
		end;
	end);
	local User=A.User.C;
	A.Functions.Uninstall();A=nil;
	User.Parent=nil;User.Parent=Game:service'Players';
end);
A.Functions.CreateCommand([[Gravitation]],{'grav';},[[This put back characters gravitation to normal]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		if(Self.Character)then
			A.Functions.All(Self.Character,function(Object)
				if(Object.Name=='LolBodyForce')then
					A.Functions.Remove(Object,true);
				end;
			end);
		end;
	end);
end);
A.Functions.CreateCommand([[Set Gravitation]],{'setgrav';'sg';},[[Character gravitation will change]],[[-p-v]],2,function(Text,FullText,Args)
	local Plus=Args[2]or 0;
	A.Functions.Players(Args[1],function(Self)
		if(Self.Character)then
			local bf;
			A.Functions.All(Self.Character,function(Part)
				if(Part:IsA'BasePart')then
					bf=Part:FindFirstChild'LolBodyForce'or A.Old.Instance.NewObject'BodyForce';
					bf.force=A.Old.Vector3.new(0,Part:GetMass()*-Plus*2,0);
					bf.Name='LolBodyForce';
					bf.Parent=Part;
				end;
			end);
		end;
	end);
end);
A.Functions.CreateCommand([[Rotate]],{'rotate';'rot';},[[Trip character...(Value) is radian value]],[[-p-v]],2,function(Text,FullText,Args)
	local Rad=A.Old.CFrame.Angles(math.rad(Args[2]or 180),0,0);
	A.Functions.Players(Args[1],function(Self)
		Self.Character.Torso.CFrame=Rad+Self.Character.Torso.Position;
		Self.Character.Torso.RotVelocity=A.Old.Vector3.Pax;
		Self.Character.Torso.Velocity=A.Old.Vector3.Pax;
	end);
end);
A.Functions.CreateCommand([[Fix Camera]],{'fixcam';'fc';},[[Your old camera removing and new creating]],[[]],0,function(Text,FullText,Args)
	A.Functions.Remove(A.Service.Workspace.CurrentCamera,true);
	local Camera=A.Service.Workspace.Changed:wait()and A.Service.Workspace.CurrentCamera;
	Camera.CameraSubject=A.User.Char;
	Camera.CameraType='Custom';
end);
A.Functions.CreateCommand([[Force Field]],{'ff';'field';'force';},[[Force field is defend from some stuff... exemple: explosions]],[[-p-b]],2,function(Text,FullText,Args)
	local Bool=A.Functions.ToBoolean(Args[2]);
	A.Functions.Players(Args[1],function(Self)
		for i,v in next,Self.Character:children()do
			if(v.className=='ForceField')then
				A.Functions.Remove(v,true);
			end;i,v=nil;
		end;
		if(Bool==true)then
			A.Old.Instance.NewObject('ForceField',Self.Character).Name='';
		end;
	end);
end);
A.Functions.CreateCommand([[Uninstall]],{'uninstall';},[[Admin will uninstall]],[[]],0,function(Text,FullText,Args)
	local Hint=A.Old.Instance.NewObject('Hint',A.Service.Workspace);
		Hint.Text='"Remso -  Local Admin" uninstalled!';
		Delay(10,function()
			Hint.Parent=nil;
		end);
	A.Functions.Uninstall();
	A=nil;
end);
A.Functions.CreateCommand([[Kill]],{'kill';'die';'d';},[[Kill customed player]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		local c=A.Old.Instance.NewObject('ObjectValue',A.Functions.FindObject(Self.Character,'className','Humanoid'));
			c.Name='creator';
			c.Value=A.User.C;
		Self.Character.Torso.RotVelocity=A.Old.Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100));
		Self.Character:BreakJoints();
	end);
end);
A.Functions.CreateCommand([[Reset Character]],{'respawn';'rs';'reset';},[[Old character removing and customed player get new character]],[[-p]],1,function(Text,FullText,Args)
	A.Functions.Players(Args[1],function(Self)
		A.Functions.ResetChar(Self);
	end);
end);
A.Functions.CreateCommand([[Loadstring]],{'load';'loadstring';},[[load your chatted text...]],[[-t]],0,function(Text,FullText,Args)
	loadstring([[func=...;]]..FullText,'Ohgod')(A.Functions);
end);
--[[Command create end;]]
end;


--[[Create Sounds]]


	A.Functions.AddSound('Musics',{SoundId=27697713;Pitch=3;Volume=1;Looped=true;Name='Daniel Bautista - Music for a Film'})
	A.Functions.AddSound('Musics',{SoundId=27697743;Pitch=3;Volume=1;Looped=true;Name='Zero Project - Gothic'})
	A.Functions.AddSound('Musics',{SoundId=27697277;Pitch=1.37;Volume=1;Looped=true;Name='Positively Dark - Awakening'})
	A.Functions.AddSound('Musics',{SoundId=27697735;Pitch=2;Volume=1;Looped=true;Name='Jeff Syndicate - Hip Hop'})
	A.Functions.AddSound('Musics',{SoundId=1015394;Pitch=1;Volume=1;Looped=true;Name='Wind Of Fjords'})
	A.Functions.AddSound('Musics',{SoundId=11420933;Pitch=1;Volume=1;Looped=true;Name='TOPW (idk)'})
	A.Functions.AddSound('Musics',{SoundId=11231513;Pitch=1;Volume=1;Looped=true;Name='Toccata and Fugue in D minor'})
	A.Functions.AddSound('Musics',{SoundId=27697719;Pitch=2.4;Volume=1;Looped=true;Name='Daniel Bautista - Flight of the Bumblebee'})
	A.Functions.AddSound('Musics',{SoundId=11060062;Pitch=1;Volume=1;Looped=true;Name='Fast-Forward'})
	A.Functions.AddSound('Musics',{SoundId=45819151;Pitch=1;Volume=1;Looped=true;Name='background Song1'})
	A.Functions.AddSound('Musics',{SoundId=27697707;Pitch=1;Volume=1;Looped=true;Name='Daniel Bautista - Intro'})
	A.Functions.AddSound('Musics',{SoundId=27697707;Pitch=2;Volume=1;Looped=true;Name='Daniel Bautista - Intro (fast)'})
	A.Functions.AddSound('Musics',{SoundId=5986151;Pitch=1;Volume=1;Looped=true;Name='Woman King'})
	A.Functions.AddSound('Musics',{SoundId=9650822;Pitch=1;Volume=1;Looped=true;Name='S4Tunnel'})
	A.Functions.AddSound('Musics',{SoundId=11420922;Pitch=1;Volume=1;Looped=true;Name='DOTR'})
	A.Functions.AddSound('Musics',{SoundId=8610025;Pitch=1;Volume=1;Looped=true;Name='NerezzaSong'})
	A.Functions.AddSound('Musics',{SoundId=35930009;Pitch=.9;Volume=1;Looped=true;Name='Troll'})
	A.Functions.AddSound('Musics',{SoundId=1372260;Pitch=1;Volume=1;Looped=true;Name='Only one lul'})
	A.Functions.AddSound('Musics',{SoundId=8663653;Pitch=1;Volume=1;Looped=true;Name='Zen'})

--[[Sounds end;]]




























A.Functions.Uninstall();
A.Functions.Thread(A.Functions.Install);



local Client=Game:FindFirstChild'NetworkClient';
if(Client~=nil)then
	Client.ChildRemoved:wait();
	local Message=A.Old.Instance.new('Hint',Workspace);
		Message.Text='Admin script removed!';
	A.Functions.Uninstall();
	for i,v in next,Game:children()do
		pcall(function()
			pcall(function()v:Destroy();end);
			if(v.Parent~=nil)then
				for i,v in next,v:children()do
					pcall(function()
						v.Parent=nil;
						v:Destroy();
					end);
				end;
			end;
		end);
	end;
end;

end;

if(Game.PlaceId==0)then
	Main();
else
	Delay(2,function()
		Main();
		--loadstring(string.dump(Main),'Ohgal')();
	end);
end;
	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "X Admin"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "X Admin"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
if not root then return end

-- หา SyncAPI
local tool
for _,v in ipairs(player:GetDescendants()) do
    if v.Name == "SyncAPI" then tool = v.Parent end
end
if not tool or not tool:FindFirstChild("SyncAPI") then return end

local remote = tool.SyncAPI.ServerEndpoint
local function _(args) remote:InvokeServer(unpack(args)) end

-- ฟังก์ชัน SyncAPI
local function CreatePart(cf, parent) return remote:InvokeServer("CreatePart", "Normal", cf, parent) end
local function Resize(part, size, cf) _( {"SyncResize",{ {Part=part, Size=size, CFrame=cf} } } ) end
local function SetAnchor(bool, part) _( {"SyncAnchor",{ {Part=part, Anchored=bool} } } ) end
local function SetCollision(part, bool) _( {"SyncCollision",{ {Part=part, CanCollide=bool} } } ) end
local function SetName(part, name) _( {"SetName",{part},name} ) end
local function Color(part, color3) _( {"SyncColor",{ {Part=part, Color=color3, UnionColoring=false} } } ) end
local function SetTrans(part, trans) _( {"SyncMaterial",{ {Part=part, Transparency=trans} } } ) end
local function AddTexture(part, id, face) _( {"AddDecal",{Part=part, Texture=id, Face=face}} ) end

-- ข้อมูล Part
local size = Vector3.new(1,8,5)
local transparency = 0.5
local color = Color3.fromRGB(255,0,0) -- แดง
local textureId = "rbxassetid://489378405"

local frontRotation = CFrame.Angles(math.rad(2), math.rad(99), math.rad(-25))
local backRotation  = CFrame.Angles(math.rad(2), math.rad(99), math.rad(25))

-- สร้าง Part
local frontPart = CreatePart(root.CFrame, workspace)
Resize(frontPart, size, root.CFrame)
Color(frontPart, color)
SetTrans(frontPart, transparency)
SetName(frontPart, "xxx pornhub.com")
SetCollision(frontPart,false)
SetAnchor(true, frontPart)
AddTexture(frontPart, textureId, Enum.NormalId.Left)
AddTexture(frontPart, textureId, Enum.NormalId.Right)

local backPart = CreatePart(root.CFrame, workspace)
Resize(backPart, size, root.CFrame)
Color(backPart, color)
SetTrans(backPart, transparency)
SetName(backPart, "assmonster.com")
SetCollision(backPart,false)
SetAnchor(true, backPart)
AddTexture(backPart, textureId, Enum.NormalId.Left)
AddTexture(backPart, textureId, Enum.NormalId.Right)

-- ขยับตามตัวผู้เล่น + หมุนเล็กน้อย
RunService.RenderStepped:Connect(function()
    local rootCFrame = root.CFrame

    local frontCF = rootCFrame * CFrame.new(0,2,-9) * frontRotation
    local backCF  = rootCFrame * CFrame.new(0,2,9)  * backRotation

    -- ปรับขนาดและตำแหน่ง
    Resize(frontPart, size, frontCF)
    Resize(backPart, size, backCF)

    -- เปลี่ยนสีไดนามิก (ตัวอย่าง: สีแดงสลับฟ้า)
    local t = tick()%2
    if t < 1 then
        Color(frontPart, Color3.fromRGB(255,0,0))
        Color(backPart, Color3.fromRGB(0,0,255))
    else
        Color(frontPart, Color3.fromRGB(0,255,0))
        Color(backPart, Color3.fromRGB(255,255,0))
    end
end)

	end)
--
local button = Instance.new("TextButton")
button.Parent = acg
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Lag Gui"
button.Position = UDim2.new(0.5,3,0,165)
button.Size = UDim2.new(0.5,-3,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = Enum.FontSize.Size14
button.Text = "Lag Gui"
button.TextColor3 = whit

button.MouseButton1Down:Connect(function()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	-- GUI หลัก
	local gui = Instance.new("ScreenGui")
	gui.Name = "Lag"
	gui.ResetOnSpawn = false
	gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

	local mainButton = Instance.new("TextButton")
	mainButton.Parent = gui
	mainButton.Size = UDim2.new(0, 100, 0, 30)
	mainButton.Position = UDim2.new(0, 8, 0, 135)
	mainButton.Text = "Lag"
	mainButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
	mainButton.TextColor3 = Color3.new(1,1,1)

	local frame = Instance.new("Frame")
	frame.Parent = gui
	frame.BackgroundTransparency = 0.3
	frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
	frame.Position = UDim2.new(0, 8, 0, 170)
	frame.Size = UDim2.new(0, 250, 0, 300)
	frame.Visible = false

	local posY = 10
	local posX = 0
	local enabled = false

	-- หา SyncAPI
	local syncTool
	for _, v in ipairs(LocalPlayer:GetDescendants()) do
		if v.Name == "SyncAPI" then
			syncTool = v.Parent
			break
		end
	end
	if not syncTool then
		warn("ไม่พบ SyncAPI")
		return
	end

	-- ฟังก์ชันวาป
	local function glitchWarp(targetPlayer)
		if not targetPlayer.Character then return end

		local originalPositions = {}
		for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				originalPositions[part] = part.CFrame
			end
		end

		local function warpAll(cframeOffset)
			local args = {
				[1] = "SyncMove",
				[2] = {}
			}
			for part, origCFrame in pairs(originalPositions) do
				table.insert(args[2], {
					["Part"] = part,
					["CFrame"] = origCFrame * cframeOffset
				})
			end
			syncTool.SyncAPI.ServerEndpoint:InvokeServer(args[1], args[2])
		end

		local targetOffset = CFrame.new(0, 999999, 0)

		for i = 1, 5 do
			warpAll(targetOffset)
			task.wait(0.05)
			warpAll(CFrame.new())
			task.wait(0.05)
		end
	end

	mainButton.MouseButton1Click:Connect(function()
		if not enabled then
			enabled = true
			frame.Visible = true

			for _, child in ipairs(frame:GetChildren()) do
				if child:IsA("TextButton") then
					child:Destroy()
				end
			end

			for i, p in ipairs(Players:GetPlayers()) do
				if p ~= LocalPlayer then
					posY = posY + 25
					if posY >= 270 then
						posX = posX + 105
						posY = 30
					end

					local bu = Instance.new("TextButton")
					bu.Parent = frame
					bu.Size = UDim2.new(0, 100, 0, 20)
					bu.Position = UDim2.new(0, posX + 10, 0, posY)
					bu.Text = p.Name
					bu.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
					bu.TextColor3 = Color3.new(1, 1, 1)

					bu.MouseButton1Click:Connect(function()
						glitchWarp(p)
						bu.Text = "Warped!"
						task.wait(1)
						bu.Text = p.Name
					end)
				end
			end
		else
			enabled = false
			frame.Visible = false
		end
	end)
end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Global Message Gui"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 3
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Global Message Gui"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		gui = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
box = Instance.new("TextBox",gui)
box.Size = UDim2.new(0,100,0,100)
msg = Instance.new("TextButton",gui)
msg.Size = UDim2.new(0,100,0,50)
msg.Position = UDim2.new(.5,0,0,0)
msg.MouseButton1Click:connect(function()
for _,v in pairs(game.Players:GetChildren()) do
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";talk all " .. box.text)
    RequestCommandSilent:InvokeServer(";talk all " .. box.text)
    RequestCommandSilent:InvokeServer(";talk all " .. box.text)
    end
end)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = acg
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
-- Server Destruction --
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Flood"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Flood"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";insert 12581653338")

	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Clear Terrain"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Clear Terrain"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
				print("impossible script damn shit")
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Apoc Troll"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Apoc Troll"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
local tool


for _,v in ipairs(player:GetDescendants()) do
    if v.Name == "SyncAPI" then
        tool = v.Parent
        break
    end
end
if not tool then
    for _,v in ipairs(game.ReplicatedStorage:GetDescendants()) do
        if v.Name == "SyncAPI" then
            tool = v.Parent
            break
        end
    end
end

local remote = tool.SyncAPI.ServerEndpoint

local function invokeSync(args)
    return remote:InvokeServer(unpack(args))
end

local function MovePart(part, cf)
    local args = {
        [1] = "SyncMove",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["CFrame"] = cf,
            }
        }
    }
    invokeSync(args)
end

local function BreakJoints(part)
    local args = {
        [1] = "BreakJoints",
        [2] = {
            [1] = {
                ["Part"] = part
            }
        }
    }
    invokeSync(args)
end

spawn(function()
    local headCF = CFrame.new(player.Character.Head.Position)
    wait()

    for _, other in ipairs(game.Players:GetPlayers()) do
        if other ~= player and other.Character and other.Character:FindFirstChild("Torso") then
            local offset = CFrame.new(
                math.random(0,50),
                0,
                math.random(0,50)
            )
            MovePart(other.Character.Torso, headCF * offset)
            
            if other.Character:FindFirstChild("HumanoidRootPart") then
                BreakJoints(other.Character.HumanoidRootPart)
            end
        end
    end
end)

	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Set Skybox"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Set Skybox"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommandSilent:InvokeServer(";time ;fogcolor black")

local function findBuildingTools()
local player = game:GetService("Players").LocalPlayer

for _, item in ipairs(player.Character:GetChildren()) do    
    if item:IsA("Tool") and item:FindFirstChild("SyncAPI") then    
        return item    
    end    
end    

for _, item in ipairs(player.Backpack:GetChildren()) do    
    if item:IsA("Tool") and item:FindFirstChild("SyncAPI") then    
        return item    
    end    
end    

return nil

end

local buildingTools = findBuildingTools()
if not buildingTools then
warn("btools not found")
return
end

local syncAPI        = buildingTools:FindFirstChild("SyncAPI")
local serverEndpoint = syncAPI and syncAPI:FindFirstChild("ServerEndpoint")

if not serverEndpoint then
warn("btools not found")
return
end

local skyInstance = workspace:FindFirstChild("Sky")
if not skyInstance then
print"ok"
end

local args = {
"Remove",
{ skyInstance }
}

local success, result
if serverEndpoint:IsA("RemoteFunction") then
success, result = pcall(function()
return serverEndpoint:InvokeServer(unpack(args))
end)
else

serverEndpoint:FireServer(unpack(args))    
success = true

end

if success then

print"yay"

end

local ID = game.CoreGui.CoolGui.Frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text
local player = game.Players.LocalPlayer
local char = player.Character
local tool
for i,v in player:GetDescendants() do
if v.Name == "SyncAPI" then
tool = v.Parent
end
end
for i,v in game.ReplicatedStorage:GetDescendants() do
if v.Name == "SyncAPI" then
tool = v.Parent
end
end
--craaa
remote = tool.SyncAPI.ServerEndpoint
function _(args)
remote:InvokeServer(unpack(args))
end
function SetCollision(part,boolean)
local args = {
[1] = "SyncCollision",
[2] = {
[1] = {
["Part"] = part,
["CanCollide"] = boolean
}
}
}
_(args)
end
function SetAnchor(boolean,part)
local args = {
[1] = "SyncAnchor",
[2] = {
[1] = {
["Part"] = part,
["Anchored"] = boolean
}
}
}
_(args)
end
function CreatePart(cf,parent)
local args = {
[1] = "CreatePart",
[2] = "Normal",
[3] = cf,
[4] = parent
}
_(args)
end
function DestroyPart(part)
local args = {
[1] = "Remove",
[2] = {
[1] = part
}
}
_(args)
end
function MovePart(part,cf)
local args = {
[1] = "SyncMove",
[2] = {
[1] = {
["Part"] = part,
["CFrame"] = cf
}
}
}
_(args)
end
function Resize(part,size,cf)
local args = {
[1] = "SyncResize",
[2] = {
[1] = {
["Part"] = part,
["CFrame"] = cf,
["Size"] = size
}
}
}
_(args)
end
function AddMesh(part)
local args = {
[1] = "CreateMeshes",
[2] = {
[1] = {
["Part"] = part
}
}
}
_(args)
end

function SetMesh(part,meshid)    
    local args = {    
        [1] = "SyncMesh",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["MeshId"] = "rbxassetid://"..meshid    
            }    
        }    
    }    
    _(args)    
end    
function SetTexture(part, texid)    
    local args = {    
        [1] = "SyncMesh",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["TextureId"] = "rbxassetid://"..texid    
            }    
        }    
    }    
    _(args)    
end    
function SetName(part, stringg)    
    local args = {    
        [1] = "SetName",    
        [2] = {    
            [1] = part    
        },    
        [3] = stringg    
    }    

    _(args)    
end    
function MeshResize(part,size)    
    local args = {    
        [1] = "SyncMesh",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["Scale"] = size    
            }    
        }    
    }    
    _(args)    
end    
function Weld(part1, part2,lead)    
    local args = {    
        [1] = "CreateWelds",    
        [2] = {    
            [1] = part1,    
            [2] = part2    
        },    
        [3] = lead    
    }    
    _(args)    

end    
function SetLocked(part,boolean)    
    local args = {    
        [1] = "SetLocked",    
        [2] = {    
            [1] = part    
        },    
        [3] = boolean    
    }    
    _(args)    
end    
function SetTrans(part,int)    
    local args = {    
        [1] = "SyncMaterial",  
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["Transparency"] = int    
            }    
        }    
    }    
    _(args)    
end    
function CreateSpotlight(part)    
    local args = {    
        [1] = "CreateLights",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["LightType"] = "SpotLight"    
            }    
        }    
    }    
    _(args)    
end    
function SyncLighting(part,brightness)    
    local args = {    
        [1] = "SyncLighting",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["LightType"] = "SpotLight",    
                ["Brightness"] = brightness    
            }    
        }    
    }    
    _(args)    
end    
function Color(part,color)    
    local args = {    
        [1] = "SyncColor",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["Color"] = color --[[Color3]],    
                ["UnionColoring"] = false    
            }    
        }    
    }    
    _(args)    
end    
function SpawnDecal(part,side)    
    local args = {    
        [1] = "CreateTextures",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["Face"] = side,    
                ["TextureType"] = "Decal"    
            }    
        }    
    }    

    _(args)    
end    
function SetMaterial(part, materialName)
    local args = {
        [1] = "SyncMaterial",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Material"] = Enum.Material[materialName] -- เช่น "ForceField"
            }
        }
    }
    _(args)
end
function AddDecal(part,asset,side)    
    local args = {    
        [1] = "SyncTexture",    
        [2] = {    
            [1] = {    
                ["Part"] = part,    
                ["Face"] = side,    
                ["TextureType"] = "Decal",    
                ["Texture"] = "rbxassetid://".. asset    
            }    
        }    
    }    
    _(args)    
end    

function Sky(id)    
    e = char.HumanoidRootPart.CFrame.x    
    f = char.HumanoidRootPart.CFrame.y    
    g = char.HumanoidRootPart.CFrame.z    
    CreatePart(CFrame.new(math.floor(e),math.floor(f),math.floor(g)) + Vector3.new(0,6,0),workspace)    
    for i,v in game.Workspace:GetDescendants() do    
        if v:IsA("BasePart") and v.CFrame.x == math.floor(e) and v.CFrame.z == math.floor(g) then    
            --spawn(function()    
            SetName(v,"Nigger fart")    
            AddMesh(v)    
            --end)    
            --spawn(function()    
            SetMesh(v,"111891702759441")    
            SetTexture(v,id)   
            --end)    
            MeshResize(v,Vector3.new(60000,60000,60000))    
            SetMaterial(v, "Neon")
            SetTrans(v,0.09)    
        end    
    end    
end    
Sky(ID)


	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Unanchor All"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Unanchor All"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local backpack = player.Backpack
	
		local function getf3x()
			for _, v in ipairs(backpack:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
			for _, v in ipairs(char:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
	
			return nil
		end
	
		-- get all info
	
		local f3x = getf3x()
		if not f3x then
			warn("you dont have f3x skid")
		end
		local syncapi = f3x.SyncAPI
		local serverendpoint = syncapi.ServerEndpoint
	
		local function setanchor(part, boolean)
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = part,
						["Anchored"] = boolean
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end
	
		local function unanchorall()
			for _, v in ipairs(workspace:GetDescendants()) do
					if (v:IsA("BasePart") or v:IsA("UnionOperation")) and v.Name ~= "Sky" then
					spawn(function()
						setanchor(v, false)
					end)
					end
			end
		end
	
		unanchorall()
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Decal Spam"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Decal Spam"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		decalID = frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text
 -- made by 1sw0rd1 aka deletecar, DO NOT LEAK OR GIVE WITHOUT MY PERMISSION.

id = decalID
		
		local player = game.Players.LocalPlayer
		local char = player.Character
		local tool
		for i,v in player:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		for i,v in game.ReplicatedStorage:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		--craaa
		remote = tool.SyncAPI.ServerEndpoint
		
		function GetPartsFromSelection(Selection)
	
			local Parts = {}
	
	
			for _, Descendant in pairs(Selection:GetDescendants()) do
	
				if Descendant:IsA 'BasePart' and Descendant.Name ~= "Terrain" and Descendant.Name ~= "Sky" then
	
					Parts[#Parts + 1] = Descendant
	
				end
	
			end
	
	
			-- Return parts
	
			return Parts
	
		end
	
	local getfuckedlol = GetPartsFromSelection(game:GetService("Workspace"))
		
	function SpawnDecal(side)
		local shitass = {}
	
		for _, Part in pairs(getfuckedlol) do
			-- Create the change request for this part
	
			table.insert(shitass, { Part = Part, Face = side, TextureType = "Decal" });
		end;
	
	
		-- Send the change to the server
	
		remote:InvokeServer('CreateTextures', shitass);
		end
		
		function AddDecal(texture,side)
			local shitass = {}
	
			for _, Part in pairs(getfuckedlol) do
				-- Create the change request for this part
	
				table.insert(shitass, { Part = Part, Face = side, TextureType = "Decal", Texture = "rbxassetid://"..texture });
			end;
	
	
			-- Send the change to the server
	
			remote:InvokeServer('SyncTexture', shitass);
		end
		
		SpawnDecal(Enum.NormalId.Front)
		AddDecal(id,Enum.NormalId.Front)
	
		SpawnDecal(Enum.NormalId.Back)
		AddDecal(id,Enum.NormalId.Back)
	
		SpawnDecal(Enum.NormalId.Right)
		AddDecal(id,Enum.NormalId.Right)
	
		SpawnDecal(Enum.NormalId.Left)
		AddDecal(id,Enum.NormalId.Left)
	
		SpawnDecal(Enum.NormalId.Bottom)
		AddDecal(id,Enum.NormalId.Bottom)
	
		SpawnDecal(Enum.NormalId.Top)
		AddDecal(id,Enum.NormalId.Top)

    local player = game.Players.LocalPlayer
    local char = player.Character
    local tool
    for i,v in player:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    for i,v in game.ReplicatedStorage:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    --craaa
    remote = tool.SyncAPI.ServerEndpoint
    function _(args)
        remote:InvokeServer(unpack(args))
    end
    function SetCollision(part,boolean)
        local args = {
            [1] = "SyncCollision",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CanCollide"] = boolean
                }
            }
        }
        _(args)
    end
    function SetAnchor(boolean,part)
        local args = {
            [1] = "SyncAnchor",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Anchored"] = boolean
                }
            }
        }
        _(args)
    end
    function CreatePart(cf,parent)
        local args = {
            [1] = "CreatePart",
            [2] = "Normal",
            [3] = cf,
            [4] = parent
        }
        _(args)
    end
    function DestroyPart(part)
        local args = {
            [1] = "Remove",
            [2] = {
                [1] = part
            }
        }
        _(args)
    end
    function MovePart(part,cf)
        local args = {
            [1] = "SyncMove",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CFrame"] = cf
                }
            }
        }
        _(args)
    end
    function Resize(part,size,cf)
        local args = {
            [1] = "SyncResize",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["CFrame"] = cf,
                    ["Size"] = size
                }
            }
        }
        _(args)
    end
    function AddMesh(part)
        local args = {
            [1] = "CreateMeshes",
            [2] = {
                [1] = {
                    ["Part"] = part
                }
            }
        }
        _(args)
    end
 
    function SetMesh(part,meshid)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["MeshId"] = "rbxassetid://"..meshid
                }
            }
        }
        _(args)
    end
    function SetTexture(part, texid)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["TextureId"] = "rbxassetid://"..texid
                }
            }
        }
        _(args)
    end
    function SetName(part, stringg)
        local args = {
            [1] = "SetName",
            [2] = {
                [1] = part
            },
            [3] = stringg
        }
 
        _(args)
    end
    function MeshResize(part,size)
        local args = {
            [1] = "SyncMesh",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Scale"] = size
                }
            }
        }
        _(args)
    end
    function Weld(part1, part2,lead)
        local args = {
            [1] = "CreateWelds",
            [2] = {
                [1] = part1,
                [2] = part2
            },
            [3] = lead
        }
        _(args)
 
    end
    function SetLocked(part,boolean)
        local args = {
            [1] = "SetLocked",
            [2] = {
                [1] = part
            },
            [3] = boolean
        }
        _(args)
    end
    function SetTrans(part,int)
        local args = {
            [1] = "SyncMaterial",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Transparency"] = int
                }
            }
        }
        _(args)
    end
    function CreateSpotlight(part)
        local args = {
            [1] = "CreateLights",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["LightType"] = "SpotLight"
                }
            }
        }
        _(args)
    end
    function SyncLighting(part,brightness)
        local args = {
            [1] = "SyncLighting",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["LightType"] = "SpotLight",
                    ["Brightness"] = brightness
                }
            }
        }
        _(args)
    end
    function Color(part,color)
        local args = {
            [1] = "SyncColor",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Color"] = color --[[Color3]],
                    ["UnionColoring"] = false
                }
            }
        }
        _(args)
    end
    function SpawnDecal(part,side)
        local args = {
            [1] = "CreateTextures",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal"
                }
            }
        }
 
        _(args)
    end
    function AddDecal(part,asset,side)
        local args = {
            [1] = "SyncTexture",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal",
                    ["Texture"] = "rbxassetid://".. asset
                }
            }
        }
        _(args)
    end
 
    function spam()
        for i,v in game.workspace:GetDescendants() do
            if v:IsA("BasePart") then
                spawn(function()
SetTrans(v,math.random(0,0))
                end)
            end
        end 
    end
    spam()
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Force Teleport"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Force Teleport"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

	local placeID = frame.Settings.Page1["Place ID"].TextBox.Text
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";place all " .. placeID)
    RequestCommandSilent:InvokeServer(";forceplace all " .. placeID)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Clear Workspace"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Clear Workspace"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character = player.Character 

		local player = game.Players.LocalPlayer
		local char = player.Character
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";kick all player has been removed by DataModel")

		local backpack = player.Backpack
	
		local function getf3x()
			for _, v in ipairs(backpack:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
			for _, v in ipairs(char:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
	
			return nil
		end
	
		-- get all info
	
		local f3x = getf3x()
		if not f3x then
			warn("you dont have f3x skid")
		end
		local syncapi = f3x.SyncAPI
		local serverendpoint = syncapi.ServerEndpoint
	
		local function delete(part)
			local args = {
				[1] = "Remove",
				[2] = {
					[1] = part
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end
	
		local function deleteall()
			for _, v in ipairs(workspace:GetDescendants()) do
				if (v:IsA("BasePart") or v:IsA("UnionOperation")) and v.Name ~= "Sky" then
					spawn(function()
						delete(v)
					end)
				end
			end
		end
	
		deleteall()
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Kill All"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Kill All"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local tool
		for i,v in player:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		for i,v in game.ReplicatedStorage:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		--craaa
		remote = tool.SyncAPI.ServerEndpoint
		function _(args)
			remote:InvokeServer(unpack(args))
		end
		function SetCollision(part,boolean)
			local args = {
				[1] = "SyncCollision",
				[2] = {
					[1] = {
						["Part"] = part,
						["CanCollide"] = boolean
					}
				}
			}
			_(args)
		end
		function SetAnchor(boolean,part)
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = part,
						["Anchored"] = boolean
					}
				}
			}
			_(args)
		end
		function CreatePart(cf,parent)
			local args = {
				[1] = "CreatePart",
				[2] = "Normal",
				[3] = cf,
				[4] = parent
			}
			_(args)
		end
		function DestroyPart(part)
			local args = {
				[1] = "Remove",
				[2] = {
					[1] = part
				}
			}
			_(args)
		end
		function MovePart(part,cf)
			local args = {
				[1] = "SyncMove",
				[2] = {
					[1] = {
						["Part"] = part,
						["CFrame"] = cf
					}
				}
			}
			_(args)
		end
		function Resize(part,size,cf)
			local args = {
				[1] = "SyncResize",
				[2] = {
					[1] = {
						["Part"] = part,
						["CFrame"] = cf,
						["Size"] = size
					}
				}
			}
			_(args)
		end
		function AddMesh(part)
			local args = {
				[1] = "CreateMeshes",
				[2] = {
					[1] = {
						["Part"] = part
					}
				}
			}
			_(args)
		end

		function SetMesh(part,meshid)
			local args = {
				[1] = "SyncMesh",
				[2] = {
					[1] = {
						["Part"] = part,
						["MeshId"] = "rbxassetid://"..meshid
					}
				}
			}
			_(args)
		end
		function SetTexture(part, texid)
			local args = {
				[1] = "SyncMesh",
				[2] = {
					[1] = {
						["Part"] = part,
						["TextureId"] = "rbxassetid://"..texid
					}
				}
			}
			_(args)
		end
		function SetName(part, stringg)
			local args = {
				[1] = "SetName",
				[2] = {
					[1] = workspace.Part
				},
				[3] = stringg
			}

			_(args)
		end
		function MeshResize(part,size)
			local args = {
				[1] = "SyncMesh",
				[2] = {
					[1] = {
						["Part"] = part,
						["Scale"] = size
					}
				}
			}
			_(args)
		end
		function Weld(part1, part2,lead)
			local args = {
				[1] = "CreateWelds",
				[2] = {
					[1] = part1,
					[2] = part2
				},
				[3] = lead
			}
			_(args)

		end
		function SetLocked(part,boolean)
			local args = {
				[1] = "SetLocked",
				[2] = {
					[1] = part
				},
				[3] = boolean
			}
			_(args)
		end
		function SetTrans(part,int)
			local args = {
				[1] = "SyncMaterial",
				[2] = {
					[1] = {
						["Part"] = part,
						["Transparency"] = int
					}
				}
			}
			_(args)
		end
		function CreateSpotlight(part)
			local args = {
				[1] = "CreateLights",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "SpotLight"
					}
				}
			}
			_(args)
		end
		function SyncLighting(part,brightness)
			local args = {
				[1] = "SyncLighting",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "SpotLight",
						["Brightness"] = brightness
					}
				}
			}
			_(args)
		end

		function KillAll()
			for i,v in game.Players:GetPlayers() do
				spawn(function()
					SetLocked(v.Character.Head,false)
					DestroyPart(v.Character.Head)
				end)
			end
		end
		KillAll()
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Kick All"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Kick All"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";kick all")
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Create Baseplate"	
   button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Create Baseplate"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

		local player = game.Players.LocalPlayer
		local char = player.Character
		local backpack = player.Backpack
local function getf3x()
	for _, v in ipairs(backpack:GetChildren()) do
		if v:FindFirstChild("SyncAPI") then
			return v
		end
	end
	for _, v in ipairs(char:GetChildren()) do
		if v:FindFirstChild("SyncAPI") then
			return v
		end
	end
	return nil
end

local f3x = getf3x()
if not f3x then
	warn("you dont have f3x skid")
end
local syncapi = f3x.SyncAPI
local serverendpoint = syncapi.ServerEndpoint

function _(args)
        serverendpoint:InvokeServer(unpack(args))
    end

		local function addlight(part, brightness)
			local args = {
				[1] = "CreateLights",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "PointLight"
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end
		
		local function synclight(part, brightness)
			local args = {
				[1] = "SyncLighting",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "PointLight",
						["Range"] = 60,
						["Color"] = Color3.new(1, 0, 0)
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

local function fire(part) 
    
    local argsCreate = {
        [1] = "CreateDecorations",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire"
            }
        }
    }

   
    local argsSync = {
        [1] = "SyncDecorate",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire",
                ["Size"] = 30,
                ["Heat"] = 9,
                ["Color"] = Color3.fromRGB(255, 0, 0), 
                ["SecondaryColor"] = Color3.fromRGB(255, 0, 0) 
            } 
        } 
    }

    
    _(argsCreate)
    _(argsSync)
end
function MovePart(part, cf)
    local args = {
        "SyncMove",
        {
            {
                Part = part,
                CFrame = cf
            }
        }
    }
    _(args)
end

local function resize(part, size, cf)
	local args = {
		"SyncResize",
		{
			{
				Part = part,
				CFrame = cf,
				Size = size
			}
		}
	}
	_(args)
end

    function SetTrans(part,int)
        local args = {
            [1] = "SyncMaterial",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Transparency"] = int
                }
            }
        }
        _(args)
    end

local function mat(part, mate)
	local args = {
		"SyncMaterial",
		{
			{
				Part = part,
				Material = mate
			}
		}
	}
	_(args)
end

local function transparency(part, trans)
	local args = {
		"SyncMaterial",
		{
			{
				Part = part,
				Transparency = trans
			}
		}
	}
	_(args)
end

local function color(part, color)
	local args = {
		"SyncColor",
		{
			{
				Part = part,
				Color = color,
				UnionColoring = false
			}
		}
	}
	_(args)
end

local function syncmeshid(part, id)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				MeshId = "rbxassetid://" .. id
			}
		}
	}
	_(args)
end

local function makemesh(part)
	local args = {
		"CreateMeshes",
		{
			{
				Part = part
			}
		}
	}
	_(args)
end

local function syncmeshsize(part, vectora)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				Scale = vectora
			}
		}
	}
	_(args)
end

local function syncmeshtexture(part, id)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				TextureId = "rbxassetid://" .. id
			}
		}
	}
	_(args)
end

local function name(part, stringa)
	local args = {
		"SetName",
		{ part },
		stringa
	}
	_(args)
end

local function lock(part, boolean)
	local args = {
		"SetLocked",
		{ part },
		boolean
	}
	_(args)
end



local function setcollision(part, booleana)
	local args = {
		"SyncCollision",
		{
			{
				Part = part,
				CanCollide = booleana
			}
		}
	}
	_(args)
end

local function setanchor(part, boolean)
	local args = {
		"SyncAnchor",
		{
			{
				Part = part,
				Anchored = boolean
			}
		}
	}
	_(args)
end

local function createdecal(part, side)
	local args = {
		"CreateTextures",
		{
			{
				Part = part,
				Face = side,
				TextureType = "Decal"
			}
		}
	}
	_(args)
end

local function setdecal(part, asset, side)
	local args = {
		"SyncTexture",
		{
			{
				Part = part,
				Face = side,
				TextureType = "Decal",
				Texture = "rbxassetid://" .. asset
			}
		}
	}
	_(args)
end

		function toptexturecreate(part)
		local args = {
    [1] = "CreateTextures",
    [2] = {
        [1] = {
            ["Part"] = part,
            ["Face"] = Enum.NormalId.Top,
            ["TextureType"] = "Texture"
        }
    }
}

_(args)
		end
		function toptextureadd(part)
			local args = {
				[1] = "SyncTexture",
				[2] = {
					[1] = {
						["Part"] = part,
						["Face"] = Enum.NormalId.Top,
						["TextureType"] = "Texture",
						["Texture"] = "rbxassetid://18878365966",
						["StudsPerTileV"] = 4,
						["StudsPerTileU"] = 4
					}
				}
			}
			_(args)
		end

	local position = CFrame.new(0, -10, 0)
	local base = serverendpoint:InvokeServer("CreatePart", "Normal", position, workspace)
	resize(base, Vector3.new(1000, 1, 1000), position)
     toptexturecreate(base)
    toptextureadd(base)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = sd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Intimidation"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.48,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Intimidation"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";music 134262192520482 ;volume inf ;pitch 0.8 ;fog 0 ;fogcolor black ;sm GHOST OWN UR SOUL ;time 0 ;titler all 666 666 # # # c00l kidd back")

	end)
local title = Instance.new("TextLabel")
	title.Parent = acg
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Admin Command/Guis"
	title.TextColor3 = whit
local title = Instance.new("TextLabel")
	title.Parent = sd
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Server Destruction"
	title.TextColor3 = whit
--Page 1 End --




-- Gear/Tools --
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Custom Gear"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Custom Gear"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
    local gear = frame.Settings.Page1["Custom Gear ID"].TextBox.Text
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";gear me " .. gear)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Stamper Tools"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Stamper Tools"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")

local tool
for _,v in LocalPlayer:GetDescendants() do
if v.Name == "SyncAPI" then tool = v.Parent end
end
for _,v in game.ReplicatedStorage:GetDescendants() do
if v.Name == "SyncAPI" then tool = v.Parent end
end
if not tool then return end

local r = tool.SyncAPI.ServerEndpoint
local function _(a) r:InvokeServer(unpack(a)) end

local deleteTool = Instance.new("Tool")
deleteTool.Name = ""
deleteTool.RequiresHandle = false
deleteTool.TextureId = "rbxassetid://5432160999"
deleteTool.Parent = LocalPlayer.Backpack

local s1 = Instance.new("SelectionBox")
s1.Color3 = Color3.new(1, 0, 0)
s1.LineThickness = 0.05
s1.Visible = false
s1.Parent = game.CoreGui

local c1
deleteTool.Equipped:Connect(function()
if c1 then c1:Disconnect() end
c1 = Mouse.Button1Down:Connect(function()
local t = Mouse.Target
if t and t:IsA("BasePart") then
s1.Adornee = t
s1.Visible = true
task.wait(0.1)
_({"Remove",{t}})
s1.Visible = false
s1.Adornee = nil
end
end)
end)
deleteTool.Unequipped:Connect(function()
if c1 then c1:Disconnect() c1 = nil end
s1.Visible = false
s1.Adornee = nil
end)

local cloneTool = Instance.new("Tool")
cloneTool.Name = ""
cloneTool.RequiresHandle = false
cloneTool.TextureId = "rbxassetid://138745565107313"
cloneTool.Parent = LocalPlayer.Backpack

local s2 = Instance.new("SelectionBox")
s2.Color3 = Color3.new(0, 1, 0)
s2.LineThickness = 0.05
s2.Visible = false
s2.Parent = game.CoreGui

local c2
cloneTool.Equipped:Connect(function()
if c2 then c2:Disconnect() end
c2 = Mouse.Button1Down:Connect(function()
local t = Mouse.Target
if t and t:IsA("BasePart") then
s2.Adornee = t
s2.Visible = true
_({"Clone",{t},workspace})
task.wait(0.15)
local cf = t.CFrame * CFrame.new(0,4,0)
_({"SyncMove",{{Part=t,CFrame=cf}}})
task.wait(0.15)
s2.Visible = false
s2.Adornee = nil
end
end)
end)
cloneTool.Unequipped:Connect(function()
if c2 then c2:Disconnect() c2 = nil end
s2.Visible = false
s2.Adornee = nil
end)

local moveTool = Instance.new("Tool")
moveTool.Name = ""
moveTool.RequiresHandle = false
moveTool.TextureId = "rbxassetid://84615697070708"
moveTool.Parent = LocalPlayer.Backpack

local s3 = Instance.new("SelectionBox")
s3.Color3 = Color3.new(0, 0.7, 1)
s3.LineThickness = 0.05
s3.Visible = false
s3.Parent = game.CoreGui

local selectedPart
local moving = false
local moveConnDown, moveConnUp, moveConnMove

moveTool.Equipped:Connect(function()
if moveConnDown then moveConnDown:Disconnect() end
moveConnDown = Mouse.Button1Down:Connect(function()
if not selectedPart then
local t = Mouse.Target
if t and t:IsA("BasePart") then
selectedPart = t
s3.Adornee = t
s3.Visible = true
end
else
moving = true
end
end)

if moveConnUp then moveConnUp:Disconnect() end  
moveConnUp = UIS.InputEnded:Connect(function(input)  
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
		if moving then moving = false end  
	end  
end)  

if moveConnMove then moveConnMove:Disconnect() end  
moveConnMove = UIS.InputChanged:Connect(function(input)  
	if moving and selectedPart and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then  
		local ray = workspace.CurrentCamera:ScreenPointToRay(Mouse.X, Mouse.Y)  
		local hitPos = ray.Origin + ray.Direction * 20  
		local cf = CFrame.new(hitPos)  
		_({"SyncMove",{{Part=selectedPart,CFrame=cf}}})  
	end  
end)

end)

moveTool.Unequipped:Connect(function()
if moveConnDown then moveConnDown:Disconnect() moveConnDown = nil end
if moveConnUp then moveConnUp:Disconnect() moveConnUp = nil end
if moveConnMove then moveConnMove:Disconnect() moveConnMove = nil end
s3.Visible = false
s3.Adornee = nil
selectedPart = nil
moving = false
end)

-- idfk nah 
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Tool Stealer"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Tool Stealer"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	local z = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack) 
z.Name = "Tool Stealer"
function onButton1Down(mouse)
	local hit = mouse.Target
	if (hit == nil) then return end
	for i,v in pairs(hit.Parent:GetChildren()) do
		if v:IsA("Tool") or v:IsA("HopperBin") then
			v.Parent = game.Players.LocalPlayer.Backpack
		end
	end
end
function  onSelected(mouse)
	mouse.Button1Down:connect(function() onButton1Down(mouse) end)
end

z.Selected:connect(onSelected)	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Minigun"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Dev Uzi"
	button.TextColor3 = whit
button.MouseButton1Down:Connect(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")  
  
local rq = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent  
  
local player = game.Players.LocalPlayer  
  
local mouse = player:GetMouse()  
  
local holding = false  
  
local equipped = false  
  
local char = player.Character  
  
local hum = char.Humanoid  
  
local hed = char.Head  
  
local tool  
  
for i,v in player:GetDescendants() do  
  
if v.Name == "SyncAPI" then      
  
    tool = v.Parent      
  
end  
  
end  
  
for i,v in game.ReplicatedStorage:GetDescendants() do  
  
if v.Name == "SyncAPI" then      
  
    tool = v.Parent      
  
end  
  
end  
  
--craaa  
  
remote = tool.SyncAPI.ServerEndpoint  
  
function _(args)  
  
remote:InvokeServer(unpack(args))  
  
end  
  
function SetCollision(part,boolean)  
  
local args = {      
  
    [1] = "SyncCollision",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["CanCollide"] = boolean      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function SetAnchor(boolean,part)  
  
local args = {      
  
    [1] = "SyncAnchor",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Anchored"] = boolean      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function CreatePart(cf,parent)  
  
local args = {      
  
    [1] = "CreatePart",      
  
    [2] = "Normal",      
  
    [3] = cf,      
  
    [4] = parent      
  
}      
  
_(args)  
  
end  
  
function DestroyPart(part)  
  
local args = {      
  
    [1] = "Remove",      
  
    [2] = {      
  
        [1] = part      
  
    }      
  
}      
  
_(args)  
  
end  
  
function MovePart(part,cf)  
  
local args = {      
  
    [1] = "SyncMove",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["CFrame"] = cf      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
local TweenService = game:GetService("TweenService")  
  
function smoothMove(part, cf)  
  
tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)  
  
local tween = TweenService:Create(part, tweenInfo, {CFrame = cf})  
  
tween:Play()  
  
tween.Completed:Connect(function()  
  
local args = {      
  
    [1] = "SyncMove",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["CFrame"] = cf      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end)  
  
end  
  
function Resize(part,size,cf)  
  
local args = {      
  
    [1] = "SyncResize",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["CFrame"] = cf,      
  
            ["Size"] = size      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function AddMesh(part)  
  
local args = {      
  
    [1] = "CreateMeshes",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function reflect(part,int)  
  
local args = {      
  
    [1] = "SyncMaterial",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Reflectance"] = int      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function SetMesh(part,meshid,offset)  
  
local args = {      
  
    [1] = "SyncMesh",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["MeshId"] = "rbxassetid://"..meshid,      
  
            ["Offset"] = offset      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function SetTexture(part, texid)  
  
local args = {      
  
    [1] = "SyncMesh",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["TextureId"] = "rbxassetid://"..texid      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function breakWelds(part)  
  
local welds = {}  
  
for _, weld in ipairs(part:GetDescendants()) do  
  
if weld:IsA("WeldConstraint") or weld:IsA("Weld") or weld:IsA("Motor6D") then      
  
    table.insert(welds, weld)      
  
end  
  
end  
  
if #welds == 0 then  
  
return false  
  
end  
  
local args = {  
  
"RemoveWelds",      
  
welds  
  
}  
  
_(args)  
  
return true  
  
end  
  
function SetName(part, stringg)  
  
local args = {      
  
    [1] = "SetName",      
  
    [2] = {      
  
        [1] = part      
  
    },      
  
    [3] = stringg      
  
}      
  
_(args)  
  
end  
  
function MeshResize(part,size)  
  
local args = {      
  
    [1] = "SyncMesh",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Scale"] = size      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
local function light(part,color)  
  
local createArgs = {		"CreateLights",  
  
{      
  
	{      
  
		Part = part,      
  
		LightType = "PointLight"      
  
	}      
  
}  
  
}  
  
local syncArgs = {  
  
"SyncLighting",      
  
{      
  
	{      
  
		Part = part,      
  
		LightType = "PointLight",      
  
		Color = Color3.new(1,1,0),      
  
Brightness = 10000000,      
  
		Range = 2,      
  
	}      
  
}  
  
}  
  
spawn(function()  
  
_(createArgs)  
  
end)  
  
spawn(function()  
  
_(syncArgs)  
  
end)  
  
end  
  
function Weld(part1, part2,lead)  
  
local args = {      
  
    [1] = "CreateWelds",      
  
    [2] = {      
  
        [1] = part1,      
  
        [2] = part2      
  
    },      
  
    [3] = lead      
  
}      
  
_(args)  
  
end  
  
function SetLocked(part,boolean)  
  
local args = {      
  
    [1] = "SetLocked",      
  
    [2] = {      
  
        [1] = part      
  
    },      
  
    [3] = boolean      
  
}      
  
_(args)  
  
end  
  
function SetTrans(part,int)  
  
local args = {      
  
    [1] = "SyncMaterial",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Transparency"] = int      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function CreateSpotlight(part)  
  
local args = {      
  
    [1] = "CreateLights",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["LightType"] = "SpotLight"      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function playSFX(id,parent)  
  
local SFX = Instance.new('Sound',parent)  
  
SFX.Volume = 10  
  
SFX.SoundId = "rbxassetid://" ..id  
  
SFX:Play()  
  
end  
  
function SyncLighting(part,brightness)  
  
local args = {      
  
    [1] = "SyncLighting",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["LightType"] = "SpotLight",      
  
            ["Brightness"] = brightness      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function Color(part,color)  
  
local args = {      
  
    [1] = "SyncColor",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Color"] = color --[[Color3]],      
  
            ["UnionColoring"] = false      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function SpawnDecal(part,side)  
  
local args = {      
  
    [1] = "CreateTextures",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Face"] = side,      
  
            ["TextureType"] = "Decal"      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function AddDecal(part,asset,side)  
  
local args = {      
  
    [1] = "SyncTexture",      
  
    [2] = {      
  
        [1] = {      
  
            ["Part"] = part,      
  
            ["Face"] = side,      
  
            ["TextureType"] = "Decal",      
  
            ["Texture"] = "rbxassetid://".. asset      
  
        }      
  
    }      
  
}      
  
_(args)  
  
end  
  
function KillTarget(target)  
  
if target and target.Character then  
  
local head = target.Character:FindFirstChild("Head")      
  
if head then      
  
    local args = {      
  
        [1] = "SetLocked",      
  
        [2] = { [1] = head },      
  
        [3] = false      
  
    }      
  
    _(args)      
  
    task.wait(0.1)      
  
    local args2 = {      
  
        [1] = "Remove",      
  
        [2] = { [1] = head }      
  
    }      
  
    _(args2)  
  
spawn(function()  
  
local blood = remote:InvokeServer("CreatePart","Normal",head.CFrame,head)  
  
spawn(function()  
  
Resize(blood,Vector3(.2,.2,.2),blood.CFrame)  
  
end)  
  
spawn(function()  
  
Color(blood,Color3.new(1,0,0))  
  
end)  
  
spawn(function()  
  
SetAnchor(false,blood)  
  
end)  
  
end)  
  
spawn(function()  
  
local blood = remote:InvokeServer("CreatePart","Normal",head.CFrame,head)  
  
spawn(function()  
  
Resize(blood,Vector3(.2,.2,.2),blood.CFrame)  
  
end)  
  
spawn(function()  
  
Color(blood,Color3.new(1,0,0))  
  
end)  
  
spawn(function()  
  
SetAnchor(false,blood)  
  
end)  
  
end)  
  
spawn(function()  
  
local blood = remote:InvokeServer("CreatePart","Normal",head.CFrame,head)  
  
spawn(function()  
  
Resize(blood,Vector3(.2,.2,.2),blood.CFrame)  
  
end)  
  
spawn(function()  
  
Color(blood,Color3.new(1,0,0))  
  
end)  
  
spawn(function()  
  
SetAnchor(false,blood)  
  
end)  
  
end)  
  
spawn(function()  
  
local blood = remote:InvokeServer("CreatePart","Normal",head.CFrame,head)  
  
spawn(function()  
  
Resize(blood,Vector3(.2,.2,.2),blood.CFrame)  
  
end)  
  
spawn(function()  
  
Color(blood,Color3.new(1,0,0))  
  
end)  
  
spawn(function()  
  
SetAnchor(false,blood)  
  
end)  
  
end)  
  
end  
  
end  
  
end  
  
local gun = remote:InvokeServer("CreatePart","Normal",CFrame.new(0,0,0),char)  
  
spawn(function()  
  
AddMesh(gun)  
  
end)  
  
spawn(function()  
  
SetMesh(gun,"4711605382", Vector3.new(0, 0.3, -1.3))  
  
end)  
  
spawn(function()  
  
SetTexture(gun,"4711605902")  
  
end)  
  
spawn(function()  
  
SetName(gun,"dev uzi")  
  
end)  
  
spawn(function()  
  
SetCollision(gun,false)  
  
end)  
  
spawn(function()  
  
MeshResize(gun, Vector3.new(0.05,0.05,0.05))  
  
end)  
  
spawn(function()  
  
MovePart(gun, char["Right Arm"].CFrame * CFrame.Angles(math.rad(90), math.rad(180), math.rad(-90)))  
  
end)  
  
spawn(function()  
  
Weld(gun,char["Right Arm"],gun)  
  
end)  
  
spawn(function()  
  
SetAnchor(false,gun)  
  
end)  
  
spawn(function()  
  
SetTrans(gun,1)  
  
end)  
  
local dev = Instance.new('Tool',player.Backpack)  
  
dev.Name = "Dev Uzi"  
  
dev.RequiresHandle = false  
  
hold=Instance.new('Animation')  
  
hold.AnimationId='rbxassetid://182393478'  
  
hoId=char.Humanoid:LoadAnimation(hold)  
  
hoId.Looped=true  
  
dev.Equipped:Connect(function()  
  
SetTrans(gun,0)  
  
hoId:Play()  
  
equipped = true  
  
end)  
  
dev.Unequipped:Connect(function()  
  
SetTrans(gun,1)  
  
hoId:Stop()      
  
      equipped = false      
  
  	holding = false  
  
end)  
  
mouse.Button1Down:Connect(function()  
  
if not equipped then return end  
  
holding = true  
  
while holding and equipped do  
  
local char = player.Character      
  
if char and char:FindFirstChild("HumanoidRootPart") and mouse.Hit then      
  
	local hrp = char.HumanoidRootPart      
  
	local targetPos = Vector3.new(mouse.Hit.p.X, hrp.Position.Y, mouse.Hit.p.Z)  
  
spawn(function()  
  
light(gun)  
  
wait(0.01)  
  
for i,v in gun:GetDescendants() do  
  
if v:IsA("PointLight") then  
  
DestroyPart(v)  
  
end  
  
end  
  
end)  
  
hrp.CFrame = CFrame.new(hrp.Position, targetPos)      
  
end      
  
task.wait(0.1)  
  
end  
  
end)  
  
mouse.Button1Up:Connect(function()  
  
holding = false  
  
end)  
  
while true do  
  
if hum.Health == 0 then  
  
holding = false  
  
end  
  
wait(0.005)  
  
end  
  
local Players = game:GetService("Players")  
  
local UserInputService = game:GetService("UserInputService")  
  
local player = Players.LocalPlayer  
  
local character = player.Character or player.CharacterAdded:Wait()  
  
local function onCharacterAdded(newCharacter)  
  
character = newCharacter  
  
end  
  
player.CharacterAdded:Connect(onCharacterAdded)  
  
local function onMouseClick()  
  
if equipped == false then return end  
  
if not character then return end  
  
local mouse = player:GetMouse()  
  
local target = mouse.Target  
  
if not target then return end  
  
local model = target:FindFirstAncestorOfClass("Model")  
  
if not model then return end  
  
local targetPlayer = Players:GetPlayerFromCharacter(model)  
  
if targetPlayer then  
  
KillTarget(targetPlayer)  
  
end  
  
end  
  
UserInputService.InputBegan:Connect(function(input, gameProcessed)  
  
if gameProcessed then return end  
  
onMouseClick()  
  
end)  
end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "God Laser"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "God Laser"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

		    -- =========================
-- ส่วนของคุณ (ฟังก์ชัน SyncAPI)
-- =========================
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local tool
for _,v in ipairs(player:GetDescendants()) do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end
for _,v in ipairs(game.ReplicatedStorage:GetDescendants()) do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end

if not tool then
    warn("SyncAPI Tool not found")
    return
end

local remote = tool.SyncAPI.ServerEndpoint

local function _(args)
    remote:InvokeServer(unpack(args))
end

-- =========================
-- ฟังก์ชัน SyncAPI
-- =========================
function SetCollision(part,boolean)
    _( { "SyncCollision", { {Part = part, CanCollide = boolean} } } )
end

function SetAnchor(boolean,part)
    _( { "SyncAnchor", { {Part = part, Anchored = boolean} } } )
end

function CreatePart(cf,parent)
    _( { "CreatePart", "Normal", cf, parent } )
end

function DestroyPart(part)
    _( { "Remove", {part} } )
end

function MovePart(part,cf)
    _( { "SyncMove", { {Part = part, CFrame = cf} } } )
end

function Resize(part,size,cf)
    _( { "SyncResize", { {Part = part, CFrame = cf, Size = size} } } )
end

function AddMesh(part)
    _( { "CreateMeshes", { {Part = part} } } )
end

function SetMesh(part,meshid)
    _( { "SyncMesh", { {Part = part, MeshId = "rbxassetid://"..meshid} } } )
end

function SetTexture(part, texid)
    _( { "SyncMesh", { {Part = part, TextureId = "rbxassetid://"..texid} } } )
end

function SetName(part, stringg)
    _( { "SetName", {part}, stringg } )
end

function MeshResize(part,size)
    _( { "SyncMesh", { {Part = part, Scale = size} } } )
end

function Weld(part1, part2,lead)
    _( { "CreateWelds", {part1, part2}, lead } )
end

function SetLocked(part,boolean)
    _( { "SetLocked", {part}, boolean } )
end

function SetTrans(part,int)
    _( { "SyncMaterial", { {Part = part, Transparency = int} } } )
end

function CreateSpotlight(part)
    _( { "CreateLights", { {Part = part, LightType = "SpotLight"} } } )
end

function SyncLighting(part,brightness)
    _( { "SyncLighting", { {Part = part, LightType = "SpotLight", Brightness = brightness} } } )
end

function Color(part,color)
    _( { "SyncColor", { {Part = part, Color = color, UnionColoring = false} } } )
end

function SpawnDecal(part,side)
    _( { "CreateTextures", { {Part = part, Face = side, TextureType = "Decal"} } } )
end

function SetMaterial(part, materialName)
    _( { "SyncMaterial", { {Part = part, Material = Enum.Material[materialName]} } } )
end

function AddDecal(part,asset,side)
    _( { "SyncTexture", { {Part = part, Face = side, TextureType = "Decal", Texture = "rbxassetid://"..asset} } } )
end

-- =========================
-- Client Tool “Watch” พร้อม Drag/Touch แบบเรียลไทม์
-- =========================
local UIS = game:GetService("UserInputService")

local WatchTool = Instance.new("Tool")
WatchTool.Name = "Watch"
WatchTool.RequiresHandle = false
WatchTool.Parent = player.Backpack

local currentPart = nil

-- สร้างหรือปรับ Cylinder ตามตำแหน่ง
local function UpdateCylinder(origin, target)
    local direction = target - origin
    local distance = direction.Magnitude
    if distance == 0 then distance = 0.1 end -- ป้องกันขนาดเป็น 0

    -- ใช้ lookAt ทำให้หมุนตามทุกแกน
    local cf = CFrame.lookAt(origin, target) * CFrame.new(0, 0, -distance/2)

    if not currentPart then
        currentPart = CreatePart(cf, workspace)
        SetMaterial(currentPart, "Plastic")
        Color(currentPart, Color3.fromRGB(255,255,0))
        SetAnchor(true, currentPart)
        SetCollision(currentPart,false)
    end

    Resize(currentPart, Vector3.new(10,10,distance), cf)
    MovePart(currentPart, cf)
end

local function DestroyCurrent()
    if currentPart then
        DestroyPart(currentPart)
        currentPart = nil
    end
end

local function GetInputPosition(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        return input.Position, true
    end
    return nil, false
end

local function OnEquip()
    local inputBegan, inputChanged, inputEnded

    inputBegan = UIS.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        local pos, valid = GetInputPosition(input)
        if not valid then return end

        local ray = workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y)
        local targetPos = ray.Origin + ray.Direction * 1000
        local origin = char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.Position
        if not origin then return end

        UpdateCylinder(origin, targetPos)
    end)

    inputChanged = UIS.InputChanged:Connect(function(input, gpe)
        if gpe then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local pos = input.Position
            local ray = workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y)
            local targetPos = ray.Origin + ray.Direction * 1000
            local origin = char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.Position
            if origin and currentPart then
                UpdateCylinder(origin, targetPos)
            end
        end
    end)

    inputEnded = UIS.InputEnded:Connect(function(input, gpe)
        if gpe then return end
        DestroyCurrent()
    end)

    WatchTool.Unequipped:Connect(function()
        inputBegan:Disconnect()
        inputChanged:Disconnect()
        inputEnded:Disconnect()
        DestroyCurrent()
    end)
end

WatchTool.Equipped:Connect(OnEquip)
    
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Draw Tool"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Draw Tool"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local backpack = player.Backpack
		
		local UserInputService = game:GetService("UserInputService")
		local RunService = game:GetService("RunService")
	
		local holding = false
	
		local function getf3x()
			for _, v in ipairs(backpack:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
			for _, v in ipairs(char:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end

			return nil
		end

		local f3x = getf3x()
		if not f3x then
			warn("you dont have f3x skid")
		end
		local syncapi = f3x.SyncAPI
		local serverendpoint = syncapi.ServerEndpoint

		local function resize(part,size,cf)
			local args = {
				[1] = "SyncResize",
				[2] = {
					[1] = {
						["Part"] = part,
						["CFrame"] = cf,
						["Size"] = size
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function color(part, color)
			local args = {
				[1] = "SyncColor",
				[2] = {
					[1] = {
						["Part"] = part,
						["Color"] = color --[[Color3]],
						["UnionColoring"] = false
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function setcollision(part, booleana)
			local args = {
				[1] = "SyncCollision",
				[2] = {
					[1] = {
						["Part"] = part,
						["CanCollide"] = booleana
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function name(part, stringa)
			local args = {
				[1] = "SetName",
				[2] = {
					[1] = part
				},
				[3] = stringa
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function lock(part, boolean)
			local args = {
				[1] = "SetLocked",
				[2] = {
					[1] = part
				},
				[3] = boolean
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function syncmaterial(part,mate)
			local args = {
				[1] = "SyncMaterial",
				[2] = {
					[1] = {
						["Part"] = part,
						["Material"] = mate
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local tool = Instance.new("Tool")
		tool.Parent = player.Backpack
		tool.Name = "Draw tool"
		tool.RequiresHandle = false

		tool.Equipped:Connect(function()
			local mouse = player:GetMouse()
			holding = false

			local renderConnection

			mouse.Button1Down:Connect(function()
				holding = true
			end)

			mouse.Button1Up:Connect(function()
				holding = false
			end)
			renderConnection = RunService.RenderStepped:Connect(function()
				if holding then
					local target = mouse.Target

					if target:IsA("BasePart") then
						spawn(function()
							local hitPosition = mouse.Hit.Position
							local cf = CFrame.new(hitPosition)
							local drawball = serverendpoint:InvokeServer("CreatePart", "Ball", cf, workspace)

							color(drawball, Color3.new(0, 0, 0))
							resize(drawball, Vector3.new(0.5, 0.5, 0.5), cf)
							setcollision(drawball, false)
							name(drawball, "ligmaligmaboy")
							lock(drawball, true)
						end)
					else
						warn("aim at a part")
					end
				end
			end)
			tool.Unequipped:Connect(function()
				if renderConnection then
					renderConnection:Disconnect()
					renderConnection = nil
				end
				holding = false
			end)
		end)


	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 3
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = gt
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		
	end)
	
	
-- Weapon Scripts --
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Drage"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Drage"
	button.TextColor3 = whit
	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 243778818")

	end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Dual Blades"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Dual Blades"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 158069180")


	end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Eyelaser"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Eyelaser"
	button.TextColor3 = whit
	button.TextWrapped = true
 	button.MouseButton1Down:connect(function()
	--MADE BY OneLegend (NOT THE SCRIPT) LOCAL SCRIPT: Go to line 4 and put your name where it says "YOUR NAME HERE"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local head = char:WaitForChild("Head")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rq = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

-- หา SyncAPI
local sync, syncTool
for _,v in player:GetDescendants() do
	if v.Name == "SyncAPI" then
		sync = v
		syncTool = v.Parent
	end
end
if not sync then
	warn("❌ ไม่พบ SyncAPI!")
	return
end

local endpoint = sync.ServerEndpoint
local mouse = player:GetMouse()

-- ยิงเลเซอร์ออกจากตา
local function fireLaser(targetPos)
	local leftEye = head.Position + (head.CFrame.RightVector * -0.2) + (head.CFrame.UpVector * -0.1)
	local rightEye = head.Position + (head.CFrame.RightVector * 0.2) + (head.CFrame.UpVector * -0.1)
	local origins = {leftEye, rightEye}

	for _, origin in ipairs(origins) do
		local dir = (targetPos - origin).Unit
		local distance = (targetPos - origin).Magnitude

		endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(origin), workspace)

		local laser
		for _, obj in ipairs(workspace:GetChildren()) do
			if obj:IsA("Part") and (obj.Position - origin).Magnitude < 1 then
				laser = obj
			end
		end

		if laser then
			laser.Anchored = true
			laser.Material = Enum.Material.Neon
			laser.Color = Color3.new(1, 0, 0)
			laser.Size = Vector3.new(0.05, 0.05, distance)
			laser.CFrame = CFrame.lookAt(origin, targetPos) * CFrame.new(0, 0, -distance/2)
			game.Debris:AddItem(laser, 0.4)
		end
	end

	-- ตรวจจับโดนคน
	local ray = Ray.new(head.Position, (targetPos - head.Position).Unit * 500)
	local hit, pos = workspace:FindPartOnRay(ray, char)
	if hit and hit.Parent:FindFirstChildOfClass("Humanoid") then
		local hitPlr = game.Players:GetPlayerFromCharacter(hit.Parent)
		if hitPlr then
			rq:InvokeServer(";kill "..hitPlr.Name)
		end
	end
end

-- หมุนทั้งตัวตามเมาส์แบบช้า
game:GetService("RunService").RenderStepped:Connect(function()
	local pos = hrp.Position
	local look = Vector3.new(mouse.Hit.Position.X, pos.Y, mouse.Hit.Position.Z) -- รักษาความสูง
	hrp.CFrame = CFrame.new(pos, look)
end)

-- ยิงเลเซอร์เมื่อคลิก
mouse.Button1Down:Connect(function()
	fireLaser(mouse.Hit.Position)
end)
	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Knife"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Knife"
	button.TextColor3 = whit
	button.TextWrapped = true
	 	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand	RequestCommand:InvokeServer(";r6 @") -- U can change all of it with your commands!

	RequestCommand:InvokeServer(";buildingTools ")

local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local RunService = game:GetService("RunService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandModification

local Players = game:GetService("Players")

local UserInputService = game:GetService("UserInputService")

if not character:FindFirstChild('Accessory (KNIF4ELERFTAccessory)') or character:FindFirstChild("Accessory (Knife McGrabbington III)") then

ready = false

local function notify(msg)

    local MainGUI = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI")

    if not MainGUI then

        MainGUI = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

        MainGUI.Name = "MainGUI"

    end

    coroutine.wrap(function()

        for _, v in pairs(MainGUI:GetChildren()) do

            if v:IsA("TextLabel") then v:Destroy() end

        end

        local TextLabel = Instance.new("TextLabel")

        local Frame = Instance.new("Frame")

        TextLabel.Parent = MainGUI

        TextLabel.BackgroundColor3 = Color3.fromRGB(58, 58, 58)

        TextLabel.BorderSizePixel = 0

        TextLabel.Position = UDim2.new(0.2, 0, 0.05, -10)

        TextLabel.Size = UDim2.new(0.6, 0, 0.1, 0)

        TextLabel.Font = Enum.Font.SourceSans

        TextLabel.TextColor3 = Color3.new(1, 1, 1)

        TextLabel.TextSize = 35

        TextLabel.TextScaled = true

        TextLabel.TextYAlignment = Enum.TextYAlignment.Center

        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        TextLabel.Text = ""

        TextLabel.BackgroundTransparency = 1

        Frame.Parent = TextLabel

        Frame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)

        Frame.BorderSizePixel = 0

        Frame.Transparency = 1

        Frame.Position = UDim2.new(0, 0, 1, 0)

        Frame.Size = UDim2.new(1, 0, 0, 5)

        for i = 1, 8 do

            TextLabel.BackgroundTransparency = TextLabel.BackgroundTransparency - 0.1

            TextLabel.Position = TextLabel.Position + UDim2.new(0, 0, 0, 1)

            Frame.Transparency = Frame.Transparency - 0.1

            task.wait()

        end

        msg = "  || " .. msg

        for i = 1, #msg do

            TextLabel.Text = string.sub(msg, 1, i)

            task.wait()

        end

        task.wait(1)

        for i = 1, 8 do

            TextLabel.BackgroundTransparency = TextLabel.BackgroundTransparency + 0.1

            TextLabel.Position = TextLabel.Position - UDim2.new(0, 0, 0, 2)

            Frame.Transparency = Frame.Transparency + 0.1

            task.wait()

        end

        TextLabel:Destroy()

    end)()

end

RequestCommand:InvokeServer(";hat me 18268136683")

yeah=player.Backpack:FindFirstChild('Building Tools') or player.Backpack:FindFirstChild('F3X Btools!')

if yeah then

notify("THIS WORK F3X GAME LMAO FAGGOT ")

task.wait(3)

notify("Let use! for Fun!")

elseif not yeah then

notify("LOL this game has no btools or f3x so this not gonna work here")

end

local tool

for _, v in player:GetDescendants() do

    if v.Name == "SyncAPI" then

        tool = v.Parent

    end

end

for _, v in game.ReplicatedStorage:GetDescendants() do

    if v.Name == "SyncAPI" then

        tool = v.Parent

    end

end

local remote = tool.SyncAPI.ServerEndpoint

function _(args)

    remote:InvokeServer(unpack(args))

end

function SetCollision(part, boolean)

    local args = {

        [1] = "SyncCollision",

        [2] = {

            [1] = {

                ["Part"] = part,

                ["CanCollide"] = boolean

            }

        }

    }

    _(args)

end

    function SetLocked(part,boolean)

        local args = {

            [1] = "SetLocked",

            [2] = {

                [1] = part

            },

            [3] = boolean

        }

        _(args)

    end

function yerpp(E)

local argsCreate = {

        [1] = "CreateDecorations",

        [2] = {

            [1] = {

                ["Part"] = E,

                ["DecorationType"] = "Sparkles"

            }

        }

    }

   

    local argsSync = {

        [1] = "SyncDecorate",

        [2] = {

            [1] = {

                ["Part"] = E,

                ["DecorationType"] = "Sparkles",

                ["SparkleColor"] = Color3.fromRGB(255, 255, 0)

            } 

        } 

    }

    _(argsCreate)

    _(argsSync)

end

local knfe = character["Accessory (Knife McGrabbington III)"]

if knfe then

	local args = {

		"Remove",

		{

			knfe.Handle.SpecialMesh

		}

	}

	_(args)

end

local function Resize(part, size, ha)

	local args = {

		"SyncResize",

		{

			{

				Part = part,

				CFrame = ha,

				Size = size

			}

		}

	}

	_(args)

end

local function SetAnchor(boolean, part)

	local args = {

		"SyncAnchor",

		{

			{

				Part = part,

				Anchored = boolean

			}

		}

	}

	_(args)

end

function MovePart(part, cf)

    local args = {

        [1] = "SyncMove",

        [2] = {

            [1] = {

                ["Part"] = part,

                ["CFrame"] = cf

            }

        }

    }

    _(args)

end

local function Color(part, color)

	local args = {

		"SyncColor",

		{

			{

				Part = part,

				Color = color,

				UnionColoring = false

			}

		}

	}

	_(args)

end

function AddMesh(part)

    local args = {

        [1] = "CreateMeshes",

        [2] = {

            [1] = {

                ["Part"] = part

            }

        }

    }

    _(args)

end

    function DestroyPart(part)

        local args = {

            [1] = "Remove",

            [2] = {

                [1] = part

            }

        }

        _(args)

    end

	function SetMesh(part,meshid,offseter)

			local args = {

				[1] = "SyncMesh",

				[2] = {

					[1] = {

            ["Offset"] = offseter,

						["Part"] = part,

						["MeshId"] = "rbxassetid://"..meshid

					}

				}

			}

			_(args)

		end

function SetTexture(part, texid)

    local args = {

        [1] = "SyncMesh",

        [2] = {

            [1] = {

                ["Part"] = part,

                ["TextureId"] = "rbxassetid://" .. texid

            }

        }

    }

    _(args)

end

    function SetTrans(part,int)

        local args = {

            [1] = "SyncMaterial",

            [2] = {

                [1] = {

                    ["Part"] = part,

                    ["Transparency"] = int

                }

            }

        }

        _(args)

    end

spawn(function()

yerpp(knfe.Handle)

end)

spawn(function()

AddMesh(knfe.Handle)

end)

spawn(function()

SetMesh(knfe.Handle, "18114736783",Vector3.new(0, 0, 0))

end)

spawn(function()

SetTexture(knfe.Handle, "80617091791234")

end)

function bleed(target)

    if not target or not target.Character then return end

    

    local stopBleeding = false

    local activeBloodParts = {} 

    local characterConnection

    characterConnection = target.CharacterAdded:Connect(function()

        stopBleeding = true

        for _, blood in pairs(activeBloodParts) do

            if blood and blood.Parent then

                DestroyPart(blood)

            end

        end

        if characterConnection then

            characterConnection:Disconnect()

        end

    end)

    

    coroutine.wrap(function()

        while not stopBleeding and target and target.Character do

            local humanoid = target.Character:FindFirstChildOfClass("Humanoid")

            local rootPart = target.Character:FindFirstChild("HumanoidRootPart")

            

            if rootPart then

                coroutine.wrap(function()

                yez=CFrame.new(0,-10,0)

                    local blood = remote:InvokeServer("CreatePart", "Ball", yez, target.Character)

                    if blood then

                        table.insert(activeBloodParts, blood)

                        

                        spawn(function()

                        Color(blood, Color3.fromRGB(100, 0, 0))

                        end)

                    

                        spawn(function()

    Resize(blood, Vector3.new(0.2, 0.2, 0.2), rootPart.CFrame + Vector3.new(math.random(-1,1),0,math.random(-1,1)))

end)

                        spawn(function()

                        SetAnchor(false, blood)

                        end)

                        coroutine.wrap(function()

                            wait(2)

                            Resize(blood, Vector3.new(3, 0.1, 3),blood.CFrame)

                            Resize(blood, Vector3.new(0.9, 0.1, 0.9),blood.CFrame)

                            SetTrans(blood, 0.9)

                            SetTrans(blood, 0.7)

                            SetTrans(blood, 0.5)

                            SetTrans(blood, 0.3)

                            SetTrans(blood, 0.1)

                            DestroyPart(blood)

                            

                        

                            for i, v in pairs(activeBloodParts) do

                                if v == blood then

                                    table.remove(activeBloodParts, i)

                                    break

                                end

                            end

                        end)()

                    end

                end)()

            end

            

            wait(0.005)

        end

    end)()

end

function c0lefect(E)

local argsCreate = {

        [1] = "CreateDecorations",

        [2] = {

            [1] = {

                ["Part"] = E,

                ["DecorationType"] = "Sparkles"

            }

        }

    }

   

    local argsSync = {

        [1] = "SyncDecorate",

        [2] = {

            [1] = {

                ["Part"] = E,

                ["DecorationType"] = "Sparkles",

                ["SparkleColor"] = Color3.fromRGB(255, 255, 0)

            } 

        } 

    }

local args = {

	"Remove",

	{

		E:FindFirstChild('Sparkles')

	}

}

    _(argsCreate)

    _(argsSync)

task.wait(1)

    _(args)

end

			function Weld(part1, part2,lead)

				local args = {

					[1] = "CreateWelds",

					[2] = {

						[1] = part1,

						[2] = part2

					},

					[3] = lead

				}

				_(args)

	

			end

function breakWelds(part)

    local welds = {}

    for _, weld in ipairs(part:GetDescendants()) do

        if weld:IsA("WeldConstraint") or weld:IsA("Weld") or weld:IsA("Motor6D") then

            table.insert(welds, weld)

        end

    end

    if #welds == 0 then

        return false

    end

    local args = {

        "RemoveWelds",

        welds

    }

    _(args)

    return true

end

local humanoid = character:FindFirstChildOfClass("Humanoid")

local arm = character:FindFirstChild("Right Arm") and character:FindFirstChild("Left Arm") and character:FindFirstChild("Torso") 

local holdAnimation = Instance.new("Animation")

holdAnimation.AnimationId = "rbxassetid://48146273"

local holdTrack = humanoid:LoadAnimation(holdAnimation)

local killAnimation = Instance.new("Animation")

killAnimation.AnimationId = "rbxassetid://48146273"

local killTrack = humanoid:LoadAnimation(killAnimation)

local knifeHoldAnim = Instance.new("Animation")

knifeHoldAnim.AnimationId = "rbxassetid://299225058"

local staffupAnim = Instance.new("Animation")

staffupAnim.AnimationId = "rbxassetid://27432691"

local swordhitAnim = Instance.new("Animation")

swordhitAnim.AnimationId = "rbxassetid://27432686"

local holdstaffAnim = Instance.new("Animation")

holdstaffAnim.AnimationId = "rbxassetid://57794492"

local stabAnim = Instance.new("Animation")

stabAnim.AnimationId = "rbxassetid://30174375"

				local track1 = humanoid:LoadAnimation(staffupAnim)

				local track2 = humanoid:LoadAnimation(swordhitAnim)

				holdTrack = humanoid:LoadAnimation(holdstaffAnim)

function GrabAnim()

				track1.Looped = false

				track2.Looped = false

				holdTrack.Looped = false

				track1:Play()

				track1.Stopped:Wait()

				track2:Play()

				track2.Stopped:Wait()

				holdTrack:Play()

				holdTrack:AdjustSpeed(0)

end

function Kill()

local stabTrack = humanoid:LoadAnimation(stabAnim)

	stabTrack.Looped = false

	stabTrack:Play()

	stabTrack.Stopped:Wait()

	if holdTrack then holdTrack:Stop() end

end

function failed()

				track1.Looped = false

				track2.Looped = false

				holdTrack.Looped = false

				track1:Play()

        track1:AdjustSpeed(3)

				track1.Stopped:Wait()

				

         holdTrack:Play()

         wait(0.3)

         holdTrack:Stop()

end

local isBusy = false

local alignPosition

local alignOrientation

local Players = game:GetService("Players")

local player = Players.LocalPlayer 

local function attachBehind(targetChar)

    local root = character:FindFirstChild("HumanoidRootPart")

    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")

    if root and targetRoot then

        

        local attachment0 = root:FindFirstChild("Attachment") or Instance.new("Attachment", root)

        local attachment1 = targetRoot:FindFirstChild("Attachment") or Instance.new("Attachment", targetRoot)

   

        alignPosition = Instance.new("AlignPosition")

        alignPosition.MaxForce = 1000000

        alignPosition.Responsiveness = 200

        alignPosition.Attachment0 = attachment0

        alignPosition.Attachment1 = attachment1

        alignPosition.Parent = root

        alignOrientation = Instance.new("AlignOrientation")

        alignOrientation.MaxTorque = 1000000

        alignOrientation.Responsiveness = 200

        alignOrientation.Attachment0 = attachment0

        alignOrientation.Attachment1 = attachment1

        alignOrientation.Parent = root

     

        attachment1.Position = Vector3.new(0, 0, 0.4)

    end

end

local function detach()

    if alignPosition then

        alignPosition:Destroy()

        alignPosition = nil

    end

    if alignOrientation then

        alignOrientation:Destroy()

        alignOrientation = nil

    end

end

local function attacke()

    if isBusy then return end

    isBusy = true

    local hitPlayer = nil

local touchedConnection

local function onTouch(other)

    local otherPlayer = Players:GetPlayerFromCharacter(other.Parent)

    if otherPlayer and otherPlayer ~= player then

        hitPlayer = otherPlayer

    end

end

touchedConnection = arm.Touched:Connect(onTouch)

task.wait(0.15)

if touchedConnection then

    touchedConnection:Disconnect()

end

    if hitPlayer and hitPlayer.Character then

        

RequestCommand:InvokeServer(";speed " ..hitPlayer.Name.. " 0")

 

        

				track1.Looped = false

				track2.Looped = false

				holdTrack.Looped = false

				track1:Play()

				track1.Stopped:Wait()

				track2:Play()

        track2:AdjustSpeed(3)

				track2.Stopped:Wait()

				holdTrack:Play()

        

				holdTrack:AdjustSpeed(0)

spawn(function()

attachBehind(hitPlayer.Character)

wait(0.8)

detach()

end)

spawn(function()

SetLocked(hitPlayer.Character.Torso, false)

end)

spawn(function()

SetLocked(char.Torso, false)

end)

 Weld(character.Torso,hitPlayer.Character.Torso,character.Torso)

Weld(character.Torso,hitPlayer.Character.HumanoidRootPart,character.Torso)

Weld(character.Torso,hitPlayer.Character.Head,character.Torso)

wait(3)

            spawn(function()

            Kill()

            end)

            bleed(hitPlayer)

            wait(0.45)

           RequestCommand:InvokeServer(";kill " ..hitPlayer.Name)

           wait(0.5)

breakWelds(character.Torso)

breakWelds(hitPlayer.Character.Torso)

spawn(function()

wait(0.8)

spawn(function()

SetLocked(hitPlayer.Character.Torso, false)

end)

spawn(function()

SetLocked(hitPlayer.Character["Right Arm"], false)

end)

spawn(function()

SetLocked(hitPlayer.Character["Left Arm"], false)

end)

spawn(function()

SetLocked(hitPlayer.Character["Right Leg"], false)

end)

spawn(function()

SetLocked(hitPlayer.Character["Left Leg"], false)

end)

spawn(function()

SetCollision(hitPlayer.Character.Torso, true)

end)

spawn(function()

SetCollision(hitPlayer.Character["Right Arm"], true)

end)

spawn(function()

SetCollision(hitPlayer.Character["Left Arm"], true)

end)

spawn(function()

SetCollision(hitPlayer.Character["Right Leg"], true)

end)

spawn(function()

SetCollision(hitPlayer.Character["Left Leg"], true)

end)

end)

wait(0.3)

           

            

            isBusy = false

  

    else

        

        failed()

        wait(0.4)

            isBusy = false

    end

end

local args = {

    "Remove",

    {

        knfe.Handle

    }

}

_(args)

knfe:Destroy()

RequestCommand:InvokeServer(";hat me 18420472059")

task.wait(1)

local knife = character:FindFirstChild("Accessory (KNIF4ELERFTAccessory)")

spawn(function()

    local args = {

        "Remove",

        {

            knife.Handle.SpecialMesh

        }

    }

    _(args)

end)

spawn(function()

    AddMesh(knife.Handle)

end)

spawn(function()

    SetMesh(knife.Handle, "18114736783", Vector3.new(0, 0.50,-0.25))

end)

spawn(function()

    SetTexture(knife.Handle, "80617091791234")

end)

ready = true

UserInputService.TouchTap:Connect(function(input, gameProcessed)

    if gameProcessed then return end

if ready == true then

    attacke()

end

end)

end

	end)
--
local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Plane"
button.Position = UDim2.new(0.5,3,0,132)
button.Size = UDim2.new(0.5,-3,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Plane"
button.TextColor3 = whit
button.TextWrapped = true
button.MouseButton1Down:connect(function()
 local player = game.Players.LocalPlayer
local char = player.Character
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";noclip me 30 ;invisible me ")

local tool

-- หา SyncAPI Tool
for i,v in pairs(player:GetDescendants()) do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end
for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end

local remote = tool.SyncAPI.ServerEndpoint

local function _(args)
	remote:InvokeServer(unpack(args))
end

function SetCollision(part,boolean)
	local args = {
		[1] = "SyncCollision",
		[2] = {
			[1] = {
				["Part"] = part,
				["CanCollide"] = boolean
			}
		}
	}
	_(args)
end

function SetAnchor(boolean,part)
	local args = {
		[1] = "SyncAnchor",
		[2] = {
			[1] = {
				["Part"] = part,
				["Anchored"] = boolean
			}
		}
	}
	_(args)
end

function CreatePart(cf,parent)
	local args = {
		[1] = "CreatePart",
		[2] = "Normal",
		[3] = cf,
		[4] = parent
	}
	_(args)
end

function Resize(part,size,cf)
	local args = {
		[1] = "SyncResize",
		[2] = {
			[1] = {
				["Part"] = part,
				["CFrame"] = cf,
				["Size"] = size
			}
		}
	}
	_(args)
end

function AddMesh(part)
	local args = {
		[1] = "CreateMeshes",
		[2] = {
			[1] = {
				["Part"] = part
			}
		}
	}
	_(args)
end

function MeshResize(part,size)
	local args = {
		[1] = "SyncMesh",
		[2] = {
			[1] = {
				["Part"] = part,
				["Scale"] = size
			}
		}
	}
	_(args)
end

function Weld(part1, part2,lead)
	local args = {
		[1] = "CreateWelds",
		[2] = {
			[1] = part1,
			[2] = part2
		},
		[3] = lead
	}
	_(args)
end

function SetLocked(part,boolean)
	local args = {
		[1] = "SetLocked",
		[2] = {
			[1] = part
		},
		[3] = boolean
	}
	_(args)
end

-- ฟังก์ชันหลัก ปรับตัวละคร
function Thomas(player)
	-- ลบ hats/accessories ทั้งในตัวละคร
	for _, accessory in ipairs(char:GetChildren()) do
		if accessory:IsA("Accessory") then
			accessory:Destroy()
		end
	end

	-- ลบ hats/accessories ใน Backpack
	for _, item in ipairs(player.Backpack:GetChildren()) do
		if item:IsA("Accessory") then
			item:Destroy()
		end
	end

	-- สร้าง Part ใหม่
	SetAnchor(true,char.HumanoidRootPart)
	CreatePart(char.HumanoidRootPart.CFrame,char)
	local myPart = char.Part
	SetCollision(myPart,false)
	SetLocked(myPart,false)
	Resize(myPart,Vector3.new(5,5,10),char.HumanoidRootPart.CFrame)
	SetLocked(char.HumanoidRootPart,false)
	Weld(myPart,char.HumanoidRootPart,myPart)
	SetAnchor(false,myPart)
	AddMesh(myPart)
	MeshResize(myPart,Vector3.new(0.3,0.3,0.3))

	-- ตั้ง MeshId
	local meshId = "11714421849"
	local argsMesh = {
		[1] = "SyncMesh",
		[2] = {
			[1] = {
				["Part"] = myPart,
				["MeshId"] = "rbxassetid://"..meshId
			}
		}
	}
	remote:InvokeServer(unpack(argsMesh))

	char.Humanoid.WalkSpeed = 0

	-- RenderStepped ปรับ CanCollide และ WalkSpeed
	game:GetService("RunService").RenderStepped:Connect(function()
		for i,v in char:GetDescendants() do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		char.Humanoid.WalkSpeed = 0
	end)
end

Thomas(player)
end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Lance"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Lance"
	button.TextColor3 = whit
	button.TextWrapped = true
	 	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 1363011928")

	end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Lightsaber"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Lightsaber"
	button.TextColor3 = whit
	 	button.MouseButton1Down:connect(function()
		
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommandSilent:InvokeServer(";gear me 1208300505")




	end)
--
local button = Instance.new("TextButton")
	button.Parent = ws
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Master Hand"
	button.TextColor3 = whit
	button.TextWrapped = true
	 	button.MouseButton1Down:connect(function()
 local player = game.Players.LocalPlayer
			local char = player.Character
			local tool
			for i,v in player:GetDescendants() do
				if v.Name == "SyncAPI" then
					tool = v.Parent
				end
			end
			for i,v in game.ReplicatedStorage:GetDescendants() do
				if v.Name == "SyncAPI" then
					tool = v.Parent
				end
			end
			--craaa
			remote = tool.SyncAPI.ServerEndpoint
local sc = remote
			function _(args)
				remote:InvokeServer(unpack(args))
			end
			function SetCollision(part,boolean)
				local args = {
					[1] = "SyncCollision",
					[2] = {
						[1] = {
							["Part"] = part,
							["CanCollide"] = boolean
						}
					}
				}
				_(args)
			end
			function SetAnchor(boolean,part)
				local args = {
					[1] = "SyncAnchor",
					[2] = {
						[1] = {
							["Part"] = part,
							["Anchored"] = boolean
						}
					}
				}
				_(args)
			end
function CreatePart(cf,parent)
	local args = {
		[1] = "CreatePart",
		[2] = "Normal",
		[3] = cf,
		[4] = parent
	}
	_(args)
	

	task.wait(0.1)
	for _, obj in ipairs(parent:GetChildren()) do
		if obj:IsA("BasePart") and (obj.Position - cf.Position).Magnitude < 1 then
			return obj
		end
	end
end


			function DestroyPart(part)
				local args = {
					[1] = "Remove",
					[2] = {
						[1] = part
					}
				}
				_(args)
			end
			function MovePart(part,cf)
				local args = {
					[1] = "SyncMove",
					[2] = {
						[1] = {
							["Part"] = part,
							["CFrame"] = cf
						}
					}
				}
				_(args)
			end
			function Resize(part,size,cf)
				local args = {
					[1] = "SyncResize",
					[2] = {
						[1] = {
							["Part"] = part,
							["CFrame"] = cf,
							["Size"] = size
						}
					}
				}
				_(args)
			end
			function AddMesh(part)
				local args = {
					[1] = "CreateMeshes",
					[2] = {
						[1] = {
							["Part"] = part
						}
					}
				}
				_(args)
			end
	
			function SetMesh(part,meshid)
				local args = {
					[1] = "SyncMesh",
					[2] = {
						[1] = {
							["Part"] = part,
							["MeshId"] = "rbxassetid://"..meshid
						}
					}
				}
				_(args)
			end
			function SetTexture(part, texid)
				local args = {
					[1] = "SyncMesh",
					[2] = {
						[1] = {
							["Part"] = part,
							["TextureId"] = "rbxassetid://"..texid
						}
					}
				}
				_(args)
			end
			function SetName(part, stringg)
				local args = {
					[1] = "SetName",
					[2] = {
						[1] = part
					},
					[3] = stringg
				}
	
				_(args)
			end
			function MeshResize(part,size)
				local args = {
					[1] = "SyncMesh",
					[2] = {
						[1] = {
							["Part"] = part,
							["Scale"] = size
						}
					}
				}
				_(args)
			end
			function Weld(part1, part2,lead)
				local args = {
					[1] = "CreateWelds",
					[2] = {
						[1] = part1,
						[2] = part2
					},
					[3] = lead
				}
				_(args)
	
			end
			function SetLocked(part,boolean)
				local args = {
					[1] = "SetLocked",
					[2] = {
						[1] = part
					},
					[3] = boolean
				}
				_(args)
			end
			function SetTransparency(part,int)
				local args = {
					[1] = "SyncMaterial",
					[2] = {
						[1] = {
							["Part"] = part,
							["Transparency"] = int
						}
					}
				}
				_(args)
			end
			function reflect(part,int)
				local args = {
					[1] = "SyncMaterial",
					[2] = {
						[1] = {
							["Part"] = part,
							["Reflectance"] = int
						}
					}
				}
				_(args)
			end
			function CreateSpotlight(part)
				local args = {
					[1] = "CreateLights",
					[2] = {
						[1] = {
							["Part"] = part,
							["LightType"] = "SpotLight"
						}
					}
				}
				_(args)
			end
			function SyncLighting(part,brightness)
				local args = {
					[1] = "SyncLighting",
					[2] = {
						[1] = {
							["Part"] = part,
							["LightType"] = "SpotLight",
							["Brightness"] = brightness
						}
					}
				}
				_(args)
			end
			function Color(part,color)
				local args = {
					[1] = "SyncColor",
					[2] = {
						[1] = {
							["Part"] = part,
							["Color"] = color --[[Color3]],
							["UnionColoring"] = false
						}
					}
				}
				_(args)
			end
			function SpawnDecal(part,side)
				local args = {
					[1] = "CreateTextures",
					[2] = {
						[1] = {
							["Part"] = part,
							["Face"] = side,
							["TextureType"] = "Decal"
						}
					}
				}
	
				_(args)
			end
			function AddDecal(part,asset,side)
				local args = {
					[1] = "SyncTexture",
					[2] = {
						[1] = {
							["Part"] = part,
							["Face"] = side,
							["TextureType"] = "Decal",
							["Texture"] = "rbxassetid://".. asset
						}
					}
				}
				_(args)
			end






local head = player.Character and player.Character:FindFirstChild("Head")
head.Anchored = true
	local targetCFrame = head.CFrame + Vector3.new(0, 20, 0)
local Cloud = CreatePart(targetCFrame, workspace)
	SetLocked(Cloud, true)
	SetCollision(Cloud, false)
	Color(Cloud, Color3.fromRGB(163, 162, 164))
	AddMesh(Cloud)
	SetMesh(Cloud, "465982742")
	MeshResize(Cloud, Vector3.new(0.01, 0.01, 0.01))
  reflect(Cloud, 0.5)
	Weld(Cloud, char.HumanoidRootPart, char.HumanoidRootPart)
	SetAnchor(false, Cloud)
head.Anchored = false

local function rainFromCloud()
    while true do
        wait(0.1) 
        if Cloud and Cloud.Parent then
            local basePos = Cloud.Position
            local offsetX = math.random(-3, 3) 
            local offsetZ = math.random(-3, 3)
            

            local spawnCFrame = CFrame.new(
                basePos.X + offsetX,
                basePos.Y - 2, 
                basePos.Z + offsetZ
            )

            spawn(function()
local lol = CFrame.new(0,0,0)
                local newPart = remote:InvokeServer("CreatePart","Normal",lol,Cloud)
                if not newPart then return end

                spawn(function()
                    SetName(newPart, " ")
                   end)
                  spawn(function()
                    SetCollision(newPart, false)
                     end)
                    spawn(function()
                    SetAnchor(false, newPart)
                end)

                spawn(function()
                    Resize(newPart, Vector3.new(2, 2, 0.000001), spawnCFrame) 
                end)

                spawn(function()
                    SpawnDecal(newPart, Enum.NormalId.Front)
                    end)
                spawn(function()
                    AddDecal(newPart, "0", Enum.NormalId.Front)
                    end)
                spawn(function()
                    SpawnDecal(newPart, Enum.NormalId.Back)
                    end)
                spawn(function()
                    AddDecal(newPart, "0", Enum.NormalId.Back)
                end)
spawn(function()

     local randomAngle = math.random(0, 1) == 0 and math.rad(-30) or math.rad(30)
MovePart(newPart, spawnCFrame * CFrame.Angles(0, 0, randomAngle))
end)
                spawn(function()
                    SetTransparency(newPart, 1) 
                end)
                end)
            end
            wait(0.05)
      end
    end


coroutine.wrap(rainFromCloud)()
end)


local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Empty"
button.Position = UDim2.new(0,0,0,165)
button.Size = UDim2.new(0.5,0,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Snowball"
button.TextColor3 = whit
button.MouseButton1Down:connect(function()
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 19328185")

end)

local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Staff"
button.Position = UDim2.new(0.5,3,0,165)
button.Size = UDim2.new(0.5,-3,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Staff"
button.TextColor3 = whit
button.MouseButton1Down:connect(function()
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 47262951")

end)

local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Empty"
button.Position = UDim2.new(0,0,0,198)
button.Size = UDim2.new(0.5,0,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Empty"
button.TextColor3 = whit
button.TextWrapped = true
button.MouseButton1Down:connect(function()

end)
--
local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Techno Gauntlet"
button.Position = UDim2.new(0.5,3,0,198)
button.Size = UDim2.new(0.48,0,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Techno Gauntlet"
button.TextColor3 = whit
button.TextWrapped = true
button.MouseButton1Down:connect(function()
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 1363010936")

end)

local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "xBow"
button.Position = UDim2.new(0.5,3,0,231)
button.Size = UDim2.new(0.5,-3,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "xBow"
button.TextColor3 = whit
button.TextWrapped = true
button.MouseButton1Down:connect(function()
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 2136389582")

end)

local button = Instance.new("TextButton")
button.Parent = ws
button.BackgroundColor3 = blak
button.BorderColor3 = rede
button.BorderSizePixel = 3
button.Name = "Wand"
button.Position = UDim2.new(0,0,0,231)
button.Size = UDim2.new(0.5,0,0,30)
button.ZIndex = 2
button.Font = tef
button.FontSize = "Size14"
button.Text = "Wand"
button.TextColor3 = whit
button.TextWrapped = true
button.MouseButton1Down:connect(function()
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";gear me 154727343")

end)

local title = Instance.new("TextLabel")
	title.Parent = gt
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Gear/Tools"
	title.TextColor3 = whit
local title = Instance.new("TextLabel")
	title.Parent = ws
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Weapon Scripts"
	title.TextColor3 = whit
-- Page 2 End --




-- Misc --
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Become Owner in Personal Server"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Become Owner [PS]"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";Notice me You has been PermRanked To !")

	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Disco Fog"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Disco Fog"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";fog 350")
while true do
    RequestCommandSilent:InvokeServer(";fogcolor red")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor blue")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor green")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor yellow")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor pink")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor orange")
    wait(2)
    RequestCommandSilent:InvokeServer(";fogcolor purple")
    wait(2)
    end
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Fencing Restore"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Fencing Restore"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
local player = game.Players.LocalPlayer
local char = player.Character
local backpack = player.Backpack

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local storedCharacter = character
local originalParent = storedCharacter.Parent

storedCharacter.Parent = nil

		local player = game.Players.LocalPlayer
		local char = player.Character
		local backpack = player.Backpack
	
		local function getf3x()
			for _, v in ipairs(backpack:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
			for _, v in ipairs(char:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
	
			return nil
		end
	
		local f3x = getf3x()
		if not f3x then
			warn("you dont have f3x skid")
		end
		local syncapi = f3x.SyncAPI
		local serverendpoint = syncapi.ServerEndpoint
	
		local function delete(part)
			local args = {
				[1] = "Remove",
				[2] = {
					[1] = part
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end
	
		local function deleteall()
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("UnionOperation") then
					spawn(function()
						delete(v)
					end)
				end
			end
		end
	
		deleteall()

local function getf3x()
	for _, v in ipairs(backpack:GetChildren()) do
		if v:FindFirstChild("SyncAPI") then
			return v
		end
	end
	for _, v in ipairs(char:GetChildren()) do
		if v:FindFirstChild("SyncAPI") then
			return v
		end
	end
	return nil
end

local f3x = getf3x()
if not f3x then
	warn("you dont have f3x skid")
end
local syncapi = f3x.SyncAPI
local serverendpoint = syncapi.ServerEndpoint

function _(args)
        serverendpoint:InvokeServer(unpack(args))
    end

		local function addlight(part, brightness)
			local args = {
				[1] = "CreateLights",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "PointLight"
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end
		
		local function synclight(part, brightness)
			local args = {
				[1] = "SyncLighting",
				[2] = {
					[1] = {
						["Part"] = part,
						["LightType"] = "PointLight",
						["Range"] = 60,
						["Color"] = Color3.new(1, 0, 0)
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

local function fire(part) 
    
    local argsCreate = {
        [1] = "CreateDecorations",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire"
            }
        }
    }

   
    local argsSync = {
        [1] = "SyncDecorate",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire",
                ["Size"] = 30,
                ["Heat"] = 9,
                ["Color"] = Color3.fromRGB(255, 0, 0), 
                ["SecondaryColor"] = Color3.fromRGB(255, 0, 0) 
            } 
        } 
    }

    
    _(argsCreate)
    _(argsSync)
end
function MovePart(part, cf)
    local args = {
        "SyncMove",
        {
            {
                Part = part,
                CFrame = cf
            }
        }
    }
    _(args)
end

local function resize(part, size, cf)
	local args = {
		"SyncResize",
		{
			{
				Part = part,
				CFrame = cf,
				Size = size
			}
		}
	}
	_(args)
end

    function SetTrans(part,int)
        local args = {
            [1] = "SyncMaterial",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Transparency"] = int
                }
            }
        }
        _(args)
    end

local function mat(part, mate)
	local args = {
		"SyncMaterial",
		{
			{
				Part = part,
				Material = mate
			}
		}
	}
	_(args)
end

local function transparency(part, trans)
	local args = {
		"SyncMaterial",
		{
			{
				Part = part,
				Transparency = trans
			}
		}
	}
	_(args)
end

local function color(part, color)
	local args = {
		"SyncColor",
		{
			{
				Part = part,
				Color = color,
				UnionColoring = false
			}
		}
	}
	_(args)
end

local function syncmeshid(part, id)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				MeshId = "rbxassetid://" .. id
			}
		}
	}
	_(args)
end

local function makemesh(part)
	local args = {
		"CreateMeshes",
		{
			{
				Part = part
			}
		}
	}
	_(args)
end

local function syncmeshsize(part, vectora)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				Scale = vectora
			}
		}
	}
	_(args)
end

local function syncmeshtexture(part, id)
	local args = {
		"SyncMesh",
		{
			{
				Part = part,
				TextureId = "rbxassetid://" .. id
			}
		}
	}
	_(args)
end

local function name(part, stringa)
	local args = {
		"SetName",
		{ part },
		stringa
	}
	_(args)
end

local function lock(part, boolean)
	local args = {
		"SetLocked",
		{ part },
		boolean
	}
	_(args)
end



local function setcollision(part, booleana)
	local args = {
		"SyncCollision",
		{
			{
				Part = part,
				CanCollide = booleana
			}
		}
	}
	_(args)
end

local function setanchor(part, boolean)
	local args = {
		"SyncAnchor",
		{
			{
				Part = part,
				Anchored = boolean
			}
		}
	}
	_(args)
end

local function createdecal(part, side)
	local args = {
		"CreateTextures",
		{
			{
				Part = part,
				Face = side,
				TextureType = "Decal"
			}
		}
	}
	_(args)
end

local function setdecal(part, asset, side)
	local args = {
		"SyncTexture",
		{
			{
				Part = part,
				Face = side,
				TextureType = "Decal",
				Texture = "rbxassetid://" .. asset
			}
		}
	}
	_(args)
end

		function toptexturecreate(part)
		local args = {
    [1] = "CreateTextures",
    [2] = {
        [1] = {
            ["Part"] = part,
            ["Face"] = Enum.NormalId.Top,
            ["TextureType"] = "Texture"
        }
    }
}

_(args)
		end
		function toptextureadd(part)
			local args = {
				[1] = "SyncTexture",
				[2] = {
					[1] = {
						["Part"] = part,
						["Face"] = Enum.NormalId.Top,
						["TextureType"] = "Texture",
						["Texture"] = "rbxassetid://13199422086",
						["StudsPerTileV"] = 2,
						["StudsPerTileU"] = 2
					}
				}
			}
			_(args)
		end

local function RealmV2()
	local position = CFrame.new(0, 0, 0)
	local base = serverendpoint:InvokeServer("CreatePart", "Normal", position,workspace.Terrain)
	resize(base, Vector3.new(1000, 1, 1000), position)
     toptexturecreate(base)
    toptextureadd(base)
  color(base, Color3.fromRGB(0, 150, 0))

end
local function unanchorall()
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("UnionOperation") then
			spawn(function()
        lock(v, false)
				setanchor(false, v)
			end)
		end
	end
end

local function realm()
	unanchorall()
	RealmV2()
end
realm()
wait(1)
storedCharacter.Parent = game.workspace
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Leaderstat Add"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Leaderstat Add"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		while true do
wait(.1)
game.Players.LocalPlayer.leaderstats:FindFirstChild(frame.Settings.Page2["Leaderstat Name"].TextBox.Text).Value = game.Players.LocalPlayer.leaderstats:FindFirstChild(frame.Settings.Page2["Leaderstat Name"].TextBox.Text)+game.Players.LocalPlayer.leaderstats:FindFirstChild(frame.Settings.Page2["Leaderstat Amount"].TextBox.Text)	
end
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Leaderstat Change"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Leaderstat Change"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
game.Players.LocalPlayer.leaderstats:FindFirstChild(frame.Settings.Page2["Leaderstat Name"].TextBox.Text)game.Players.LocalPlayer.leaderstats:FindFirstChild(frame.Settings.Page2["Leaderstat Amount"].TextBox.Text)	

	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Play Music"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Play Music"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

    local musicid = game:GetService("CoreGui").CoolGui.Frame.Settings.Page1["Music ID"].TextBox.text
    local pitch4music = game:GetService("CoreGui").CoolGui.Frame.Settings.Page1["Music Pitch"].TextBox.text

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";music  " .. musicid  .. "  ;volume inf ;pitch " .. pitch4music)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Restore Skybox"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Restore Skybox"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";time 10")

local function findBuildingTools()
    local player = game:GetService("Players").LocalPlayer

    for _, item in ipairs(player.Character:GetChildren()) do
        if item:IsA("Tool") and item:FindFirstChild("SyncAPI") then
            return item
        end
    end

    for _, item in ipairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item:FindFirstChild("SyncAPI") then
            return item
        end
    end

    return nil
end

local buildingTools = findBuildingTools()
if not buildingTools then
    warn("btools not found")
    return
end

local syncAPI        = buildingTools:FindFirstChild("SyncAPI")
local serverEndpoint = syncAPI and syncAPI:FindFirstChild("ServerEndpoint")

if not serverEndpoint then
    warn("btools not found")
    return
end

local skyInstance = workspace:FindFirstChild("Nigger fart")
if not skyInstance then
print"ok"
end

local args = {
    "Remove",                
    { skyInstance }           
}

local success, result
if serverEndpoint:IsA("RemoteFunction") then
    success, result = pcall(function()
        return serverEndpoint:InvokeServer(unpack(args))
    end)
else

    serverEndpoint:FireServer(unpack(args))
    success = true
end

if success then
    
print"yay"
    
end
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Steal Player Points"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Steal Player Points"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		local service = game:GetService("PointsService")
service:AwardPoints(game.Players.LocalPlayer.userId, service:GetAwardablePoints())
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 3
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = misc
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
	
-- Local Player --
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Anti-Robloxian"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Anti-Robloxian"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
local originalChar = player.Character or player.CharacterAdded:Wait()
local tool
while player.Character == originalChar do
for i, v in player:GetDescendants() do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end

for i, v in game.ReplicatedStorage:GetDescendants() do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end

local remote = tool.SyncAPI.ServerEndpoint

function _(args)
	remote:InvokeServer(unpack(args))
end

function DestroyPart(part)
	spawn(function()
		local args = {
			[1] = "Remove",
			[2] = {
				[1] = part
			}
		}
		_(args)
	end)
end

function AddDecor(part, dec)
	spawn(function()
		local args = {
			[1] = "CreateDecorations",
			[2] = {
				[1] = {
					["Part"] = part,
					["DecorationType"] = dec
				}
			}
		}
		_(args)
	end)
end

function a()
	local dist = 17
	local distance = dist
	local Player = game.Players.LocalPlayer

	if Player then
		local c = game.Players:GetChildren()
		for i = 1, #c do
			if c[i].Name ~= Player.Name then
				if c[i].Character and c[i].Character:FindFirstChild("Head") then
					local char = c[i].Character
					local torso = game.Workspace[Player.Name]:FindFirstChild("Torso")
					if torso and c[i]:DistanceFromCharacter(torso.Position) <= distance then
						DestroyPart(char:FindFirstChild("Head"))
						for _, part in ipairs(char:GetChildren()) do
							if part:IsA("BasePart") then
								AddDecor(part, "Fire")
							end
						end
					end
				end
			end
		end
	end
end


	spawn(a)
	wait()
end

	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Billboard Gui"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Billboard Gui"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local text = frame.Settings.Page1["Billboard Gui Text"].TextBox.Text

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";titler me " .. text)

f.TextStrokeColor3 = Color3.new(0,0,0)
f.TextColor3 = Color3.new(frame.Settings.Page2["Billboard Gui Color"].TextBox1.Text/255,frame.Settings.Page2["Billboard Gui Color"].TextBox2.Text/255,frame.Settings.Page2["Billboard Gui Color"].TextBox3.Text/255)
f.TextStrokeTransparency = 0
f.TextYAlignment = "Bottom"
	end)
--

--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Chicken Arms"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Chicken Arms"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local torso = char:WaitForChild("Torso")

local tool = char:FindFirstChildOfClass("Tool")
if not tool then
    for _, v in lp.Backpack:GetChildren() do
        if v:IsA("Tool") then
            tool = v
            break
        end
    end
end

if tool then
    hum:EquipTool(tool)
    task.delay(0.01, function()
        hum:UnequipTools()
    end)
end

local server = tool and tool:FindFirstChild("SyncAPI") and tool.SyncAPI:FindFirstChild("ServerEndpoint")

local larm = char:WaitForChild("Left Arm")
local rarm = char:WaitForChild("Right Arm")

local idleAngles = Vector3.new(0,0,math.rad(-90))
local flapAmplitude = Vector3.new(0, 0, math.rad(40))
local flapSpeed = 14

local targetL, targetR = larm.CFrame, rarm.CFrame

RunService.RenderStepped:Connect(function(delta)
    if not larm or not rarm then return end
    local time = tick()
    local flapX = math.sin(time * flapSpeed) * flapAmplitude.X
    local flapY = math.sin(time * flapSpeed * 0.8) * flapAmplitude.Y
    local flapZ = math.sin(time * flapSpeed * 0.6) * flapAmplitude.Z

    if hum.MoveDirection.Magnitude == 0 then  
        targetL = torso.CFrame * CFrame.new(-1.9,0.5,0) * CFrame.Angles(idleAngles.X, idleAngles.Y, idleAngles.Z)  
        targetR = torso.CFrame * CFrame.new(1.9,0.5,0) * CFrame.Angles(-idleAngles.X, -idleAngles.Y, -idleAngles.Z)  
    else  
        targetL = torso.CFrame * CFrame.new(-1.9,0.5,0) * CFrame.Angles(flapX, flapY, idleAngles.Z + flapZ)  
        targetR = torso.CFrame * CFrame.new(1.9,0.5,0) * CFrame.Angles(-flapX, -flapY, -idleAngles.Z - flapZ)  
    end  

    larm.CFrame = targetL  
    rarm.CFrame = targetR
end)

if server then
    spawn(function()
        while true do
            if larm and rarm then
                server:InvokeServer("SyncMove", {{Part = larm, CFrame = larm.CFrame}})
                server:InvokeServer("SyncMove", {{Part = rarm, CFrame = rarm.CFrame}})
            end
            task.wait()
        end
    end)
end
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Disco Character"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Disco Character"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
		local char = player.Character
		local tool
		for i,v in player:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		for i,v in game.ReplicatedStorage:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		--craaa
		remote = tool.SyncAPI.ServerEndpoint
		function _(args)
			remote:InvokeServer(unpack(args))
		end
		function a()
		presets = {"Bright red","Bright yellow","Bright orange","Bright violet","Bright blue","Bright bluish green","Bright green"}
		spawn(function()
			local args = {
    [1] = "SyncColor",
    [2] = {
        [1] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character.Head,
            ["UnionColoring"] = true
        },
        [2] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            ["UnionColoring"] = true
        },
        [3] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Left Arm"),
            ["UnionColoring"] = true
        },
        [4] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Right Leg"),
            ["UnionColoring"] = true
        },
        [5] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character.Torso,
            ["UnionColoring"] = true
        },
        [6] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Right Arm"),
            ["UnionColoring"] = true
        },
        [7] = {
            ["Color"] = BrickColor.new(presets[math.random(1,#presets)]).Color,
            ["Part"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Left Leg"),
            ["UnionColoring"] = true
        }
    }
}

_(args)
			end)
		end

	while true do
		wait()
		spawn(function()
		a()
		end)
	end
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Dominus Ghost"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Dominus Ghost"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		function nob(who,tra,hat)
c=who.Character
pcall(function()u=c["Body Colors"]
u.HeadColor=BrickColor.new("Black")
u.LeftLegColor=BrickColor.new("Black")
u.RightLegolor=BrickColor.new("Black")
u.LeftArmColor=BrickColor.new("Black")
u.TorsoColor=BrickColor.new("Black")
u.RightArmColor=BrickColor.new("Black")
end)
pcall(function()c.Shirt:Destroy() c.Pants:Destroy() end)
for i,v in pairs(c:GetChildren()) do
if v:IsA("BasePart") then
v.Transparency=tra
if v.Name=="HumanoidRootPart" or v.Name=="Head" then
v.Transparency=1
end
wait()
v.BrickColor=BrickColor.new("Black")
elseif v:IsA("Hat") then
v:Destroy()
end
end
xx=game:service("InsertService"):LoadAsset(hat)
xy=game:service("InsertService"):LoadAsset(47433)["LinkedSword"]
xy.Parent=who.Backpack
for a,hat in pairs(xx:children()) do
hat.Parent=c
end
xx:Destroy()
h=who.Character.Humanoid
h.MaxHealth=50000
wait(1.5)
h.Health=50000
h.WalkSpeed=32
end
nob(game.Players.LocalPlayer,0.6,21070012)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Floating Pad"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Floating Pad"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()

    local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanrFr = char:WaitForChild("HumanoidRootPart")
local tool
for i,v in player:GetDescendants() do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end
for i,v in game.ReplicatedStorage:GetDescendants() do
	if v.Name == "SyncAPI" then
		tool = v.Parent
	end
end
remote = tool.SyncAPI.ServerEndpoint
function _(args)
	remote:InvokeServer(unpack(args))
end
function SetCollision(part,boolean)
	local args = {
		[1] = "SyncCollision",
		[2] = {
			[1] = {
				["Part"] = part,
				["CanCollide"] = boolean
			}
		}
	}
	_(args)
end
function SetAnchor(boolean,part)
	local args = {
		[1] = "SyncAnchor",
		[2] = {
			[1] = {
				["Part"] = part,
				["Anchored"] = boolean
			}
		}
	}
	_(args)
end
function CreatePart(cf,parent)
	local args = {
		[1] = "CreatePart",
		[2] = "Normal",
		[3] = cf,
		[4] = parent
	}
	_(args)
end
function DestroyPart(part)
	local args = {
		[1] = "Remove",
		[2] = {
			[1] = part
		}
	}
	_(args)
end
function MovePart(part,cf)
	local args = {
		[1] = "SyncMove",
		[2] = {
			[1] = {
				["Part"] = part,
				["CFrame"] = cf
			}
		}
	}
	_(args)
end
function Resize(part,size,cf)
	local args = {
		[1] = "SyncResize",
		[2] = {
			[1] = {
				["Part"] = part,
				["CFrame"] = cf,
				["Size"] = size
			}
		}
	}
	_(args)
end
function AddMesh(part)
	local args = {
		[1] = "CreateMeshes",
		[2] = {
			[1] = {
				["Part"] = part
			}
		}
	}
	_(args)
end
function SetMesh(part,meshid)
	local args = {
		[1] = "SyncMesh",
		[2] = {
			[1] = {
				["Part"] = part,
				["MeshId"] = "rbxassetid://"..meshid
			}
		}
	}
	_(args)
end
function SetTexture(part, texid)
	local args = {
		[1] = "SyncMesh",
		[2] = {
			[1] = {
				["Part"] = part,
				["TextureId"] = "rbxassetid://"..texid
			}
		}
	}
	_(args)
end
function SetName(part, stringg)
	local args = {
		[1] = "SetName",
		[2] = {
			[1] = part
		},
		[3] = stringg
	}
	_(args)
end
function MeshResize(part,size)
	local args = {
		[1] = "SyncMesh",
		[2] = {
			[1] = {
				["Part"] = part,
				["Scale"] = size
			}
		}
	}
	_(args)
end
function Weld(part1, part2,lead)
	local args = {
		[1] = "CreateWelds",
		[2] = {
			[1] = part1,
			[2] = part2
		},
		[3] = lead
	}
	_(args)
end
function SetLocked(part,boolean)
	local args = {
		[1] = "SetLocked",
		[2] = {
			[1] = part
		},
		[3] = boolean
	}
	_(args)
end
function SetTrans(part,int)
	local args = {
		[1] = "SyncMaterial",
		[2] = {
			[1] = {
				["Part"] = part,
				["Transparency"] = int
			}
		}
	}
	_(args)
end
function CreateSpotlight(part)
	local args = {
		[1] = "CreateLights",
		[2] = {
			[1] = {
				["Part"] = part,
				["LightType"] = "SpotLight"
			}
		}
	}
	_(args)
end
function SyncLighting(part,brightness)
	local args = {
		[1] = "SyncLighting",
		[2] = {
			[1] = {
				["Part"] = part,
				["LightType"] = "SpotLight",
				["Brightness"] = brightness
			}
		}
	}
	_(args)
end
function Color(part,color)
	local args = {
		[1] = "SyncColor",
		[2] = {
			[1] = {
				["Part"] = part,
				["Color"] = color,
				["UnionColoring"] = false
			}
		}
	}
	_(args)
end
function SpawnDecal(part,side)
	local args = {
		[1] = "CreateTextures",
		[2] = {
			[1] = {
				["Part"] = part,
				["Face"] = side,
				["TextureType"] = "Decal"
			}
		}
	}
	_(args)
end
function AddDecal(part,asset,side)
	local args = {
		[1] = "SyncTexture",
		[2] = {
			[1] = {
				["Part"] = part,
				["Face"] = side,
				["TextureType"] = "Decal",
				["Texture"] = "rbxassetid://".. asset
			}
		}
	}
	_(args)
end
local cf = humanrFr.CFrame * CFrame.new(0, -4, 0)
local pad = remote:InvokeServer("CreatePart", "Normal", cf, workspace)
Resize(pad, Vector3.new(40, 1, 40), cf)
SetAnchor(true, pad)
SetCollision(pad, true)
SetName(pad, "padF")
AddMesh(pad)
SetMesh(pad, 9095618661)
MeshResize(pad, Vector3.new(4.5, 0.5, 4.5))
Color(pad, BrickColor.new(104).Color)
game:GetService("RunService").RenderStepped:Connect(function()
	if pad and humanrFr then
		local newCF = humanrFr.CFrame * CFrame.new(0, -4, 0)
		MovePart(pad, newCF)
	end
end)
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Head Shake"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Head Shake"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
    
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- find shit
local tool
for _, v in player:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
        break
    end
end
for _, v in game.ReplicatedStorage:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
        break
    end
end
if not tool then
    warn("ไม่พบ SyncAPI Tool!")
    return
end

local remote = tool.SyncAPI.ServerEndpoint


local head = char:FindFirstChild("Head")
if not head then
    warn("fuck fagz")
    return
end
local headMesh = head:FindFirstChildWhichIsA("SpecialMesh")
if not headMesh then
    warn("nigga")
    return
end


local hats = {}
for _, hat in pairs(char:GetChildren()) do
    if hat:IsA("Accessory") and hat:FindFirstChild("Handle") then
        local handleMesh = hat.Handle:FindFirstChildWhichIsA("SpecialMesh")
        if handleMesh then
            table.insert(hats, {Part = hat.Handle, MeshId = handleMesh.MeshId})
        end
    end
end


local amplitude = 0.7
local frequency = 6 
local t = 0

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function(dt)
    t = t + dt * frequency
    local offsetValue = math.sin(t) * amplitude

    
    local partsToSync = {
        {Part = head, MeshId = headMesh.MeshId, Offset = Vector3.new(offsetValue, 0, 0)}
    }
    for _, h in pairs(hats) do
        table.insert(partsToSync, {Part = h.Part, MeshId = h.MeshId, Offset = Vector3.new(offsetValue, 0, 0)})
    end

    remote:InvokeServer("SyncMesh", partsToSync)
end)

	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Heal"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Heal"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";heal")
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Mesh Disco"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Mesh Disco"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
local player = game.Players.LocalPlayer
local warned = false

-- Mesh Types
local meshTypes = {
    Enum.MeshType.Brick,
    Enum.MeshType.Cylinder,
    Enum.MeshType.Head,
    Enum.MeshType.Sphere,
    Enum.MeshType.Wedge
}

-- หาเครื่องมือ SyncAPI
local function getBuildingTool(player)
    for _, container in ipairs({player.Character, player.Backpack}) do
        if container then
            for _, item in ipairs(container:GetChildren()) do
                if item:IsA("Tool") and item:FindFirstChild("SyncAPI") then
                    return item
                end
            end
        end
    end
    return nil
end

-- ลบ Mesh เดิม
local function removemesh(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("MeshPart") or child:IsA("SpecialMesh") then
            local args = {"Remove", { child }}
            local tool = getBuildingTool(player)
            if tool then
                tool.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
            elseif not warned then
                warn("Building tool not found")
                warned = true
            end
        end
    end
end

-- ตรวจสอบว่าเป็น Accessory หรือ Handle ของ Accessory
local function isAccessoryPart(part)
    if part:IsA("Accessory") then
        return true
    end
    if part.Parent and part.Parent:IsA("Accessory") then
        return true
    end
    return false
end

-- สร้าง Mesh ใหม่
local function applymesh(part)
    if isAccessoryPart(part) then
        return -- ข้ามหมวก/Accessory
    end

    removemesh(part)

    local currentMeshType
    local mesh = part:FindFirstChildWhichIsA("SpecialMesh")
    if mesh then
        currentMeshType = mesh.MeshType
    end

    local availableTypes = {}
    for _, mt in ipairs(meshTypes) do
        if mt ~= currentMeshType then
            table.insert(availableTypes, mt)
        end
    end
    local randomMeshType = availableTypes[math.random(1, #availableTypes)]

    local tool = getBuildingTool(player)
    if tool then
        local argsCreate = {"CreateMeshes", {{ Part = part }}}
        local argsSync   = {"SyncMesh",     {{ MeshType = randomMeshType, Part = part }}}
        tool.SyncAPI.ServerEndpoint:InvokeServer(unpack(argsCreate))
        tool.SyncAPI.ServerEndpoint:InvokeServer(unpack(argsSync))
    elseif not warned then
        warn("Building tool not found")
        warned = true
    end
end

-- เปลี่ยน Mesh ของตัวละคร
local function randomizeCharacterMeshes(character)
    for _, obj in ipairs(character:GetDescendants()) do
        if (obj:IsA("Part") or obj:IsA("MeshPart")) and not isAccessoryPart(obj) then
            applymesh(obj)
        end
    end
end

-- หา SyncAPI Tool และฟังก์ชันเปลี่ยนสี
local tool
for _, v in ipairs(player:GetDescendants()) do
    if v.Name == "SyncAPI" then tool = v.Parent end
end
for _, v in ipairs(game.ReplicatedStorage:GetDescendants()) do
    if v.Name == "SyncAPI" then tool = v.Parent end
end
local remote = tool.SyncAPI.ServerEndpoint
function _(args) remote:InvokeServer(unpack(args)) end

-- ฟังก์ชันเปลี่ยนสีตัวละคร
function a()
    local presets = {"Bright red","Bright yellow","Bright orange","Bright violet","Bright blue","Bright bluish green","Bright green"}
    spawn(function()
        local args = {
            [1] = "SyncColor",
            [2] = {
                [1] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character.Head,["UnionColoring"]=true},
                [2] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character.HumanoidRootPart,["UnionColoring"]=true},
                [3] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character:FindFirstChild("Left Arm"),["UnionColoring"]=true},
                [4] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character:FindFirstChild("Right Leg"),["UnionColoring"]=true},
                [5] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character.Torso,["UnionColoring"]=true},
                [6] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character:FindFirstChild("Right Arm"),["UnionColoring"]=true},
                [7] = {["Color"]=BrickColor.new(presets[math.random(#presets)]).Color,["Part"]=player.Character:FindFirstChild("Left Leg"),["UnionColoring"]=true}
            }
        }
        _(args)
    end)
end

-- ลูปหลัก
while true do
    if player.Character then
        randomizeCharacterMeshes(player.Character)
    end
    wait()
    spawn(a)
end


	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Set Walkspeed"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Set Walkspeed"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = frame.Settings.Page2["Walkspeed Amount"].TextBox.Text	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.48,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,231)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,231)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		
	end)
local title = Instance.new("TextLabel")
	title.Parent = misc
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Misc."
	title.TextColor3 = whit
local title = Instance.new("TextLabel")
	title.Parent = localp
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "LocalPlayer"
	title.TextColor3 = whit
-- Page 3 End --
-- Page 4 --
button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Chop Suey"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Chop Suey"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Music ID"].TextBox.Text = 147407900
	end)
--
button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Electro Sp00k"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Electro Sp00k"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Music ID"].TextBox.Text = 71956674693421	
    frame.Settings.Page1["Music Pitch"].TextBox.Text = 1	
	end)
--
button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Scream"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Scream"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Music ID"].TextBox.Text = 138097458	
	end)
--
button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Wonga"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Wonga"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Music ID"].TextBox.Text = 100792696468630	
    frame.Settings.Page1["Music Pitch"].TextBox.Text = 0.141	
	end)
--
button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 3
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pmi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	
-- Preset Images --
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Team c00lkidd Logo 1"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Team c00lkidd Logo 1"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text = 158118263	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Team c00lkidd Logo 2"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Team c00lkidd Logo 2"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text = 164661730	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Thomas"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Thomas"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text = 160456772	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "c00lkidd"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "c00lkidd"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text = 157755295	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "team skrubl0rd"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "old team skrubl0rd"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Skybox/Decal ID"].TextBox.Text = 358313209
	end)
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.48,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,231)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = psd
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,231)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
	
local title = Instance.new("TextLabel")
	title.Parent = pmi
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Preset Music IDs"
	title.TextColor3 = whit
	title.TextWrapped = true
local title = Instance.new("TextLabel")
	title.Parent = psd
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0,30)
	title.ZIndex = 2
	title.Font = "SourceSansBold"
	title.FontSize = "Size14"
	title.Text = "Preset Skybox/Decal IDs"
	title.TextColor3 = whit
	--page 5--
local t3xt = Instance.new("TextLabel")
	t3xt.Parent = edn
	t3xt.BackgroundColor3 = blak
	t3xt.BorderColor3 = rede
	t3xt.BorderSizePixel = 3
	t3xt.Name = "Empty"
	t3xt.Position = UDim2.new(0,0,0,0)
	t3xt.Size = UDim2.new(1,0,1,0)
	t3xt.ZIndex = 2
	t3xt.Font = tef
	t3xt.FontSize = "Size14"
	t3xt.Text = "Thank you for using c00lgui scripted! Addons coming soon! Post Ideas in the Thread!!!"
	t3xt.TextColor3 = whit
	t3xt.TextWrapped = true
	t3xt.TextYAlignment = "Top"
	
-- Preset Gear IDs --
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Airstrike"
	button.Position = UDim2.new(0,0,0,33)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Airstrike"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 88885539
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Dual Darkhearts"
	button.Position = UDim2.new(0.5,3,0,33)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Dual Darkhearts"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 108149175
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Dual Venomshanks"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Dual Venomshanks"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 158069180
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Ghostfire Sword"
	button.Position = UDim2.new(0.5,3,0,66)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Ghostfire Sword"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 64220933	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Gravity Coil"
	button.Position = UDim2.new(0,0,0,99)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Gravity Coil"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 16688968
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Hyperbike"
	button.Position = UDim2.new(0.5,3,0,99)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Hyperbike"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
	frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 130113061	
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Icedagger"
	button.Position = UDim2.new(0,0,0,132)
	button.Size = UDim2.new(0.499,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Icedagger"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
		frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 83704165
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Linked Sword"
	button.Position = UDim2.new(0.5,3,0,132)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Linked Sword"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
frame.Settings.Page1["Custom Gear ID"].TextBox.Text = 125013769		
	end)
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,165)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,165)
	button.Size = UDim2.new(0.5,-3,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,198)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0.5,3,0,198)
	button.Size = UDim2.new(0.48,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--
local button = Instance.new("TextButton")
	button.Parent = pgi
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Empty"
	button.Position = UDim2.new(0,0,0,231)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Empty"
	button.TextColor3 = whit
	button.TextWrapped = true
--


			
--Settings--
local pge1 = Instance.new("Frame")
pge1.Parent = page
pge1.BorderColor3 = rede
pge1.BackgroundColor3 = blak
pge1.BorderSizePixel = 3
pge1.Name = "Page1"
pge1.Position = UDim2.new(0,0,0,83)
pge1.Size = UDim2.new(1,0,1,-83)
pge1.ZIndex = 1

local pge2 = Instance.new("Frame")
pge2.Parent = page
pge2.BorderColor3 = rede
pge2.BackgroundColor3 = blak
pge2.BorderSizePixel = 3
pge2.Name = "Page2"
pge2.Position = UDim2.new(0,0,0,83)
pge2.Size = UDim2.new(1,0,1,-83)
pge2.ZIndex = 1
pge2.Visible = false
local lft = Instance.new("TextButton")
	lft.Parent = page
	lft.BorderColor3 = rede
	lft.BackgroundColor3 = blak
	lft.BorderSizePixel = 3
	lft.Name = ">"
	lft.Position = UDim2.new(0.5,3,0,40)
	lft.Size = UDim2.new(0.5,-3,0,40)
	lft.ZIndex = 1
	lft.Font = tef
	lft.FontSize = "Size48"
	lft.Text = ">"
	lft.TextColor3 = whit
	lft.MouseButton1Down:connect(function()
		if pge1.Visible == true then
			pge1.Visible = false
			pge2.Visible = true
		elseif pge2.Visible == true then
			pge2.Visible = false
			pge1.Visible = true
		end	
	end)
local rgt = Instance.new("TextButton")
	rgt.Parent = page
	rgt.BorderColor3 = rede
	rgt.BackgroundColor3 = blak
	rgt.BorderSizePixel = 3
	rgt.Name = "<"
	rgt.Position = UDim2.new(0,0,0,40)
	rgt.Size = UDim2.new(0.5,0,0,40)
	rgt.ZIndex = 1
	rgt.Font = tef
	rgt.FontSize = "Size48"
	rgt.Text = "<"
	rgt.TextColor3 = whit
	rgt.MouseButton1Down:connect(function()
		if pge1.Visible == true then
			pge1.Visible = false
			pge2.Visible = true
		elseif pge2.Visible == true then
			pge2.Visible = false
			pge1.Visible = true
		end	
	end)

local sbutton = Instance.new("TextButton")
	sbutton.Parent = page
	sbutton.BackgroundColor3 = blak
	sbutton.BorderColor3 = rede
	sbutton.BorderSizePixel = 3
	sbutton.Name = "SettingsButton"
	sbutton.Position = UDim2.new(1,3,0,0)
	sbutton.Size = UDim2.new(0,27,1,0)
	sbutton.Font = tef
	sbutton.FontSize = "Size48"
	sbutton.TextColor3 = whit
	sbutton.Text = "<"
	cango = true
	sbutton.MouseButton1Down:connect(function()
		if cango == true then
			if sbutton.Text == "<" then
			sbutton.Text = ">"
			cango = false
				repeat
				wait()
				page.Position = UDim2.new(1,page.Position.X.Offset-10,0,0)
				until page.Position.X.Offset <= -293
				wait()
				page.Position = UDim2.new(1,-300,0,0)
				cango = true
			else
			sbutton.Text = "<"
			cango = false
				repeat
				wait()
				page.Position = UDim2.new(1,page.Position.X.Offset+10,0,0)
				until page.Position.X.Offset >= -10
				wait()
				page.Position = UDim2.new(1,3,0,0)
				cango = true
			end	
		end
	end)
local title = Instance.new("TextLabel")
	title.Parent = page
	title.BackgroundColor3 = blak
	title.BorderColor3 = rede
	title.BorderSizePixel = 3
	title.Name = "Title"
	title.Position = UDim2.new(0,0,0,0)
	title.Size = UDim2.new(1,0,0,40)
	title.ZIndex = 1
	title.Font = tef
	title.FontSize = "Size24"
	title.Text = "Settings"
	title.TextColor3 = whit
	
	
local bgt = Instance.new("Frame")
	bgt.Parent = pge1
	bgt.BackgroundColor3 = blak
	bgt.BorderColor3 = rede
	bgt.BorderSizePixel = 3
	bgt.Name = "Billboard Gui Text"
	bgt.Position = UDim2.new(0.5,3,0,198)
	bgt.Size = UDim2.new(0.5,-3,0,63)
local cgid = Instance.new("Frame")
	cgid.Parent = pge1
	cgid.BackgroundColor3 = blak
	cgid.BorderColor3 = rede
	cgid.BorderSizePixel = 3
	cgid.Name = "Custom Gear ID"
	cgid.Position = UDim2.new(0,0,0,198)
	cgid.Size = UDim2.new(0.5,0,0,63)
local god = Instance.new("Frame")
	god.Parent = pge1
	god.BackgroundColor3 = blak
	god.BorderColor3 = rede
	god.BorderSizePixel = 3
	god.Name = "God"
	god.Position = UDim2.new(0,0,0,132)
	god.Size = UDim2.new(0.5,0,0,63)
local Inv = Instance.new("Frame")
	Inv.Parent = pge1
	Inv.BackgroundColor3 = blak
	Inv.BorderColor3 = rede
	Inv.BorderSizePixel = 3
	Inv.Name = "Invisibility"
	Inv.Position = UDim2.new(0.5,3,0,132)
	Inv.Size = UDim2.new(0.5,-3,0,63)
local mid = Instance.new("Frame")
	mid.Parent = pge1
	mid.BackgroundColor3 = blak
	mid.BorderColor3 = rede
	mid.BorderSizePixel = 3
	mid.Name = "Music ID"
	mid.Position = UDim2.new(0,0,0,66)
	mid.Size = UDim2.new(0.5,0,0,63)
local mp = Instance.new("Frame")
	mp.Parent = pge1
	mp.BackgroundColor3 = blak
	mp.BorderColor3 = rede
	mp.BorderSizePixel = 3
	mp.Name = "Music Pitch"
	mp.Position = UDim2.new(0.5,3,0,66)
	mp.Size = UDim2.new(0.5,-3,0,63)
local pi = Instance.new("Frame")
	pi.Parent = pge1
	pi.BackgroundColor3 = blak
	pi.BorderColor3 = rede
	pi.BorderSizePixel = 3
	pi.Name = "Place ID"
	pi.Position = UDim2.new(0.5,3,0,0)
	pi.Size = UDim2.new(0.5,-3,0,63)
local sdi = Instance.new("Frame")
	sdi.Parent = pge1
	sdi.BackgroundColor3 = blak
	sdi.BorderColor3 = rede
	sdi.BorderSizePixel = 3
	sdi.Name = "Skybox/Decal ID"
	sdi.Position = UDim2.new(0,0,0,0)
	sdi.Size = UDim2.new(0.5,0,0,63)
	local textbx = Instance.new("TextBox")
		textbx.Parent = sdi
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "158118263"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = sdi
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Skybox/Decal ID"
		titl.TextColor3 = whit
	local textbx = Instance.new("TextBox")
		textbx.Parent = pi
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "149559312"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = pi
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Place ID"
		titl.TextColor3 = whit
	local textbx = Instance.new("TextBox")
		textbx.Parent = mp
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "1"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = mp
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Music Pitch"
		titl.TextColor3 = whit
	local textbx = Instance.new("TextBox")
		textbx.Parent = mid
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "71956674693421"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = mid
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Music ID"
		titl.TextColor3 = whit
	local textbx = Instance.new("TextBox")
		textbx.Parent = cgid
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "108149175"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = cgid
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Custom Gear ID"
		titl.TextColor3 = whit
	local textbx = Instance.new("TextBox")
		textbx.Parent = bgt
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "c00lkidd"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = bgt
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Billboard Gui Text"
		titl.TextColor3 = whit
		titl.TextWrapped = true
		
	local button = Instance.new("TextButton")
		button.Parent = Inv
		button.BackgroundColor3 = blak
		button.BorderColor3 = rede
		button.BorderSizePixel = 3 
		button.Position = UDim2.new(0,0,0.5,0)
		button.Size = UDim2.new(0.99,1,0.5,-1)
		button.Font = tef
		button.FontSize = "Size14"
		button.Text = "On"
		button.TextColor3 = whit
		button.MouseButton1Down:connect(function()
			if button.Text == "Off" then
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local tool
for _, v in player:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end
for _, v in game.ReplicatedStorage:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end

remote = tool.SyncAPI.ServerEndpoint
function _(args)
    remote:InvokeServer(unpack(args))
end

function SetTrans(part, int)
    local args = {
        [1] = "SyncMaterial",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Transparency"] = int
            }
        }
    }
    _(args)
end

for _, part in ipairs(char:GetDescendants()) do
    if part:IsA("BasePart") then
        SetTrans(part, 1) 
    end
end

button.Text = "On"
else
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local tool
for _, v in player:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end
for _, v in game.ReplicatedStorage:GetDescendants() do
    if v.Name == "SyncAPI" then
        tool = v.Parent
    end
end

remote = tool.SyncAPI.ServerEndpoint
function _(args)
    remote:InvokeServer(unpack(args))
end

function SetTrans(part, int)
    local args = {
        [1] = "SyncMaterial",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Transparency"] = int
            }
        }
    }
    _(args)
end

for _, part in ipairs(char:GetDescendants()) do
    if part:IsA("BasePart") then
        SetTrans(part, 0) 
    end
end

button.Text = "Off"
end
		end)
	local titl = Instance.new("TextLabel")
		titl.Parent = Inv
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Invisibility"
		titl.TextColor3 = whit
		titl.TextWrapped = true
	local button = Instance.new("TextButton")
		button.Parent = god
		button.BackgroundColor3 = blak
		button.BorderColor3 = rede
		button.BorderSizePixel = 3 
		button.Position = UDim2.new(0,0,0.5,0)
		button.Size = UDim2.new(0.99,1,0.5,-1)
		button.Font = tef
		button.FontSize = "Size14"
		button.Text = "On"
		button.TextColor3 = whit
		button.MouseButton1Down:connect(function()
if button.Text == "Off" then
	    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";god")
	button.Text = "On"
	else
	    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";ungod")
	button.Text = "Off"
end
		end)
	local titl = Instance.new("TextLabel")
		titl.Parent = god
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "God"
		titl.TextColor3 = whit
		titl.TextWrapped = true		
--Page 2--
local arr = Instance.new("Frame")
	arr.Parent = pge2
	arr.BackgroundColor3 = blak
	arr.BorderColor3 = rede
	arr.BorderSizePixel = 3
	arr.Name = "Anti Robloxian Range"
	arr.Position = UDim2.new(0.5,3,0,198)
	arr.Size = UDim2.new(0.5,-3,0,63)
local bgc = Instance.new("Frame")
	bgc.Parent = pge2
	bgc.BackgroundColor3 = blak
	bgc.BorderColor3 = rede
	bgc.BorderSizePixel = 3
	bgc.Name = "Billboard Gui Color"
	bgc.Position = UDim2.new(0,0,0,198)
	bgc.Size = UDim2.new(0.5,0,0,63)
local cst = Instance.new("Frame")
	cst.Parent = pge2
	cst.BackgroundColor3 = blak
	cst.BorderColor3 = rede
	cst.BorderSizePixel = 3
	cst.Name = "Chat Spam Text"
	cst.Position = UDim2.new(0,0,0,132)
	cst.Size = UDim2.new(0.5,0,0,63)
local lsa = Instance.new("Frame")
	lsa.Parent = pge2
	lsa.BackgroundColor3 = blak
	lsa.BorderColor3 = rede
	lsa.BorderSizePixel = 3
	lsa.Name = "Leaderstat Amount"
	lsa.Position = UDim2.new(0.5,3,0,132)
	lsa.Size = UDim2.new(0.5,-3,0,63)
local lsn = Instance.new("Frame")
	lsn.Parent = pge2
	lsn.BackgroundColor3 = blak
	lsn.BorderColor3 = rede
	lsn.BorderSizePixel = 3
	lsn.Name = "Leaderstat Name"
	lsn.Position = UDim2.new(0,0,0,66)
	lsn.Size = UDim2.new(0.5,0,0,63)
local nmb = Instance.new("Frame")
	nmb.Parent = pge2
	nmb.BackgroundColor3 = blak
	nmb.BorderColor3 = rede
	nmb.BorderSizePixel = 3
	nmb.Name = "Name Box"
	nmb.Position = UDim2.new(0.5,3,0,66)
	nmb.Size = UDim2.new(0.5,-3,0,63)



local wsa = Instance.new("Frame")
	wsa.Parent = pge2
	wsa.BackgroundColor3 = blak
	wsa.BorderColor3 = rede
	wsa.BorderSizePixel = 3
	wsa.Name = "Walkspeed Amount"
	wsa.Position = UDim2.new(0.5,3,0,0)
	wsa.Size = UDim2.new(0.5,-3,0,63)


local textbx = Instance.new("TextBox")
		textbx.Parent = arr
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "4"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = arr
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Anti Robloxian Rage"
		titl.TextColor3 = whit
		titl.TextWrapped = true
 textbx1 = Instance.new("TextBox")
		textbx1.Parent = bgc
		textbx1.BackgroundColor3 = blak
		textbx1.BorderColor3 = rede
		textbx1.BorderSizePixel = 3 
		textbx1.ClearTextOnFocus = true
		textbx1.Position = UDim2.new(0,0,0.5,0)
		textbx1.Size = UDim2.new(0,50,0.5,-1)
		textbx1.Font = tef
		textbx1.FontSize = "Size14"
		textbx1.Text = "200"
		textbx1.TextColor3 = whit
		textbx1.Name = "TextBox1"
 textbx2 = Instance.new("TextBox")
		textbx2.Parent = bgc
		textbx2.BackgroundColor3 = blak
		textbx2.BorderColor3 = rede
		textbx2.BorderSizePixel = 3 
		textbx2.ClearTextOnFocus = true
		textbx2.Position = UDim2.new(0,50,0.5,0)
		textbx2.Size = UDim2.new(0,50,0.5,-1)
		textbx2.Font = tef
		textbx2.FontSize = "Size14"
		textbx2.Text = "0"
		textbx2.TextColor3 = whit
		textbx2.Name = "TextBox2"
 textbx3 = Instance.new("TextBox")
		textbx3.Parent = bgc
		textbx3.BackgroundColor3 = blak
		textbx3.BorderColor3 = rede
		textbx3.BorderSizePixel = 3 
		textbx3.ClearTextOnFocus = true
		textbx3.Position = UDim2.new(0,100,0.5,0)
		textbx3.Size = UDim2.new(0,50,0.5,-1)
		textbx3.Font = tef
		textbx3.FontSize = "Size14"
		textbx3.Text = "0"
		textbx3.TextColor3 = whit
		textbx3.Name = "TextBox3"
	local titl = Instance.new("TextLabel")
		titl.Parent = bgc
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Billboard Gui Color"
		titl.TextColor3 = whit
		titl.TextWrapped = true		
local textbx = Instance.new("TextBox")
		textbx.Parent = cst
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "join team c00lkidd!"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = cst
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Chat Spam Text"
		titl.TextColor3 = whit
		titl.TextWrapped = true
local textbx = Instance.new("TextBox")
		textbx.Parent = lsa
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "50"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = lsa
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Leaderstat Amount"
		titl.TextColor3 = whit
		titl.TextWrapped = true
local textbx = Instance.new("TextBox")
		textbx.Parent = lsn
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "KOs"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = lsn
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Leaderstat Name"
		titl.TextColor3 = whit
		titl.TextWrapped = true
	local titl = Instance.new("TextLabel")
		titl.Parent = nmb
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Name"
		titl.TextColor3 = whit
		titl.TextWrapped = true
local textbxx = Instance.new("TextBox",nmb)
		textbxx.BackgroundColor3 = blak
		textbxx.BorderColor3 = rede
		textbxx.BorderSizePixel = 3 
		textbxx.ClearTextOnFocus = true
		textbxx.Position = UDim2.new(0,0,0.5,0)
		textbxx.Size = UDim2.new(0.99,1,0.5,-1)
		textbxx.Font = tef
		textbxx.FontSize = "Size14"
		textbxx.Text = "God"
		textbxx.TextColor3 = whit

local button = Instance.new("TextButton")
	button.Parent = localp
	button.BackgroundColor3 = blak
	button.BorderColor3 = rede
	button.BorderSizePixel = 3
	button.Name = "Change Name"
	button.Position = UDim2.new(0,0,0,66)
	button.Size = UDim2.new(0.5,0,0,30)
	button.ZIndex = 2
	button.Font = tef
	button.FontSize = "Size14"
	button.Text = "Change Name"
	button.TextColor3 = whit
	button.TextWrapped = true
	button.MouseButton1Down:connect(function()
    local text = game:GetService("CoreGui").CoolGui.Frame.Settings.Page2["Name Box"].TextBox.text
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    
    RequestCommandSilent:InvokeServer(";name me " .. text)
end)

local textbx = Instance.new("TextBox")
		textbx.Parent = wsa
		textbx.BackgroundColor3 = blak
		textbx.BorderColor3 = rede
		textbx.BorderSizePixel = 3 
		textbx.ClearTextOnFocus = true
		textbx.Position = UDim2.new(0,0,0.5,0)
		textbx.Size = UDim2.new(0.99,1,0.5,-1)
		textbx.Font = tef
		textbx.FontSize = "Size14"
		textbx.Text = "50"
		textbx.TextColor3 = whit
	local titl = Instance.new("TextLabel")
		titl.Parent = wsa
		titl.BackgroundColor3 = blak
		titl.BorderColor3 = rede
		titl.BorderSizePixel = 3
		titl.Name = "Title"
		titl.Size = UDim2.new(1,0,0,30)
		titl.Font = tef.."Bold"
		titl.FontSize = "Size14"
		titl.Text = "Walkspeed Amount"
		titl.TextColor3 = whit
		titl.TextWrapped = true
--Settings--

-----------------------------------------------------------------------------
--Important Script to make tabs work! DONT TOUCH--
CurrentPage = 1

function FlipPage(Way)
	local NewPage = CurrentPage+Way
	if pges:findFirstChild("Page"..NewPage)~=nil then
		CurrentPage = NewPage
		local P = pges:GetChildren()
		for i = 1, #P do
			P[i].Visible = false
		end
		pges:findFirstChild("Page"..NewPage).Visible = true
	end
end
right.MouseButton1Down:connect(function()FlipPage(1) end)
left.MouseButton1Down:connect(function()FlipPage(-1) end)
page1.addonl.MouseButton1Down:connect(function()CurrentPage=6 FlipPage(-1) end)
page5.addonr.MouseButton1Down:connect(function()CurrentPage=0 FlipPage(1) end)
-----------------------------------------------------------------------------
while true do
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient")
    :WaitForChild("Signals")
    :WaitForChild("RequestCommandSilent")

local function r()
    local hasBTools = false

    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == "Building Tools" then
            hasBTools = true
            break
        end
    end

    if not hasBTools then
        RequestCommandSilent:InvokeServer(";btools")
    end
end

r()
wait(1)
end

