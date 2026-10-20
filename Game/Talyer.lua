local Icons = {
    crosshairs = "rbxassetid://96677288280405",
    ghost      = "rbxassetid://95400397758754",
    mouse      = "rbxassetid://74350468513068",
    user       = "rbxassetid://97066657594742",
    pallet     = "rbxassetid://83365140694071",
    hammer     = "rbxassetid://118512898552101",
    code       = "rbxassetid://100793810819046",
    save       = "rbxassetid://136566823798983",
    feather    = "rbxassetid://130188814728078",
    crown      = "rbxassetid://73317911385704",
    dagger     = "rbxassetid://133081986539088",
    baby       = "rbxassetid://127135446273067",
    ad         = "rbxassetid://134916447199398",
    axe_battle = "rbxassetid://91285868461583",
    avatar     = "rbxassetid://0",
}

local FontURLs = {
    FontAwesome = "https://raw.githubusercontent.com/B5RLAS/Neverlose/main/Font/FontAwesome.ttf",
    Museo500    = "https://raw.githubusercontent.com/B5RLAS/Neverlose/main/Font/Museo500.ttf",
    Museo900    = "https://raw.githubusercontent.com/B5RLAS/Neverlose/main/Font/Museo900.ttf",
}

local function LoadFont(name)
    local ok, result = pcall(function()
        local folder = "NeverloseUI"
        if isfolder and not isfolder(folder) then makefolder(folder) end
        local ttf = folder .. "/" .. name .. ".ttf"
        if not (isfile and isfile(ttf)) then
            writefile(ttf, game:HttpGet(FontURLs[name]))
        end
        local json = folder .. "/" .. name .. ".json"
        writefile(json, game:GetService("HttpService"):JSONEncode({
            name = name,
            faces = { { name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(ttf) } },
        }))
        return Font.new(getcustomasset(json), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    end)
    if ok then return result end
    warn("[NeverloseUI] font load failed (" .. name .. "): " .. tostring(result))
    return nil
end

local Fonts = {
    Museo500    = LoadFont("Museo500"),
    Museo900    = LoadFont("Museo900"),
    FontAwesome = LoadFont("FontAwesome"),
}

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local Lighting         = game:GetService("Lighting")
local LocalPlayer      = Players.LocalPlayer

local function rgbf(r, g, b) return Color3.new(r, g, b) end
local Theme = {
    Accent        = rgbf(0.30, 0.49, 1.00),
    Text          = rgbf(1, 1, 1),
    TextDisabled  = rgbf(0.51, 0.52, 0.56),
    Border        = rgbf(1, 1, 1),  BorderTransparency = 0.97,
    FrameInactive = rgbf(0.023, 0.039, 0.070),
    FrameActive   = rgbf(0.043, 0.070, 0.137),
    Button        = rgbf(0.031, 0.035, 0.058),
    ButtonHovered = rgbf(0.050, 0.054, 0.078),
    ButtonActive  = rgbf(0.070, 0.074, 0.098),
    GroupBoxBg    = rgbf(0.019, 0.035, 0.062),
    WindowBg      = Color3.fromRGB(2, 2, 2),
    Font          = Fonts.Museo500 or Enum.Font.GothamMedium,
    FontBold      = Fonts.Museo900 or Enum.Font.GothamBlack,
    TextSize      = 13,
}

local function New(class, props, children)
    local o = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k == "Font" and typeof(v) == "Font" then
            o.FontFace = v
        elseif k ~= "Parent" then
            o[k] = v
        end
    end
    for _, c in ipairs(children or {}) do c.Parent = o end
    if props and props.Parent then o.Parent = props.Parent end
    return o
end

local function Corner(r) return New("UICorner", { CornerRadius = UDim.new(0, r) }) end
local function Stroke(color, trans)
    return New("UIStroke", {
        Color = color or Theme.Border,
        Transparency = trans or Theme.BorderTransparency,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
    })
end

local function Tween(obj, t, props, style)
    local tw = TweenService:Create(obj, TweenInfo.new(t, style or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end

local function Label(props)
    props.BackgroundTransparency = 1
    props.Font = props.Font or Theme.Font
    props.TextSize = props.TextSize or Theme.TextSize
    props.TextColor3 = props.TextColor3 or Theme.Text
    props.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left
    return New("TextLabel", props)
end

local function Icon(id, size, color, props)
    props = props or {}
    props.BackgroundTransparency = 1
    props.Image = id or ""
    props.ImageColor3 = color or Theme.Accent
    props.Size = UDim2.fromOffset(size, size)
    props.ScaleType = Enum.ScaleType.Fit
    return New("ImageLabel", props)
end

local function GetParentGui()
    local ok, hui = pcall(function() return gethui and gethui() end)
    if ok and hui then return hui end
    local ok2, core = pcall(function() return game:GetService("CoreGui") end)
    if ok2 and core then
        local test = pcall(function() local f = Instance.new("Folder"); f.Parent = core; f:Destroy() end)
        if test then return core end
    end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local Library = { Flags = {}, Icons = Icons, Theme = Theme, ToggleKey = Enum.KeyCode.Insert }
Library.__index = Library

function Library:Notify(Settings)
    duration = Settings.Duration or 3

    local gui = self._NotifyGui
    if not gui then
        gui = New("Frame", {
            Name = "Notifications",
            Size = UDim2.fromOffset(300, 0),
            Position = UDim2.new(1, -320, 0, 20),
            BackgroundTransparency = 1,
            Parent = self._NotifyParent or GetParentGui(),
        }, {
            New("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
        })
        self._NotifyGui = gui
    end

    local notification = New("Frame", {
        Size = UDim2.fromOffset(300, 0),
        BackgroundColor3 = Theme.FrameInactive,
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = gui,
    }, {
        Corner(6),
        Stroke(),
    })

    local accent = New("Frame", {
        Size = UDim2.fromOffset(3, 0),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = notification,
    }, {
        Corner(3),
    })

    local titleLabel = Label({
        Text = Settings.Title or "Notification",
        Font = Theme.FontBold,
        TextSize = 14,
        TextColor3 = Theme.Text,
        Size = UDim2.new(1, -24, 0, 20),
        Position = UDim2.fromOffset(14, 8),
        Parent = notification,
    })

    local messageLabel = Label({
        Text = Settings.Content or "",
        TextSize = 12,
        TextColor3 = Theme.TextDisabled,
        TextWrapped = true,
        Size = UDim2.new(1, -24, 0, 0),
        Position = UDim2.fromOffset(14, 30),
        Parent = notification,
    })

    local textHeight = math.max(18, messageLabel.TextBounds.Y)
    local height = textHeight + 42

    messageLabel.Size = UDim2.new(1, -24, 0, textHeight)

    notification.Size = UDim2.fromOffset(300, 0)
    Tween(notification, 0.25, {
        Size = UDim2.fromOffset(300, height),
    })

    task.delay(duration, function()
        if not notification.Parent then return end
        local tw = Tween(notification, 0.25, {
            Size = UDim2.fromOffset(300, 0),
        })
        tw.Completed:Wait()
        notification:Destroy()
    end)

    return notification
end
function Library:CreateWindow(cfg)
    cfg = cfg or {}
    local Window = { Tabs = {}, CurrentTab = nil }

    local gui = New("ScreenGui", {
        Name = "NeverloseUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        IgnoreGuiInset = true,
        Parent = GetParentGui(),
    })
    Window.Gui = gui
    
    local UIScale = New("UIScale", {
        Scale = 1,
        Parent = gui,
    })
    local function UpdateScale()
        local viewport = workspace.CurrentCamera.ViewportSize
        local scale = viewport.Y / 500 * 0.833
        UIScale.Scale = math.clamp(scale, 0.55, 1)
    end
    UpdateScale()
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
    
    local main = New("Frame", {
        Name = "Main",
        Size = UDim2.fromOffset(690, 500),
        Position = UDim2.new(0.5, -345, 0.5, -250),
        BackgroundTransparency = 1,
        Parent = gui,
    })
    Window.Main = main
    
    local function Panel(x, y, w, h, ox, oy, ew, eh, alpha)
        local clip = New("Frame", {
            Size = UDim2.fromOffset(w, h), Position = UDim2.fromOffset(x, y),
            BackgroundTransparency = 1, ClipsDescendants = true, BorderSizePixel = 0, Parent = main,
        })
        New("Frame", {
            Size = UDim2.fromOffset(w + ew, h + eh), Position = UDim2.fromOffset(ox, oy),
            BackgroundColor3 = Theme.WindowBg, BackgroundTransparency = alpha, BorderSizePixel = 0, Parent = clip,
        }, { Corner(8) })
        return clip
    end

    local sidebar = Panel(0, 0, 170, 500, 0, 0, 10, 0, 0.1)
    local topbar = Panel(170, 0, 520, 60, -10, 0, 10, 10, 0.05)
    New("Frame", { Size = UDim2.fromOffset(520, 1), Position = UDim2.fromOffset(170, 60), BackgroundColor3 = Theme.WindowBg, BackgroundTransparency = 0.1, BorderSizePixel = 0, Parent = main })
    local contentBg = Panel(170, 61, 520, 439, -10, -10, 10, 10, 0)

    local title = cfg.Title or "NEVERLOSE"
    Label({ Text = title, Font = Theme.FontBold, TextSize = 26, TextColor3 = Theme.Accent,
        TextXAlignment = Enum.TextXAlignment.Left, Size = UDim2.fromOffset(170, 30), Position = UDim2.fromOffset(15, 17), Parent = main })
    Label({ Text = title, Font = Theme.FontBold, TextSize = 26, TextColor3 = Theme.Text,
        TextXAlignment = Enum.TextXAlignment.Left, Size = UDim2.fromOffset(170, 30), Position = UDim2.fromOffset(14, 17), Parent = main })

    New("Frame", { Size = UDim2.fromOffset(170, 1), Position = UDim2.fromOffset(0, 450),
        BackgroundColor3 = Theme.WindowBg, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = main })
    local av = New("ImageLabel", {
        Size = UDim2.fromOffset(30, 30), Position = UDim2.fromOffset(15, 460),
        BackgroundColor3 = Theme.FrameActive, Image = cfg.Avatar or Icons.avatar, Parent = main,
    }, { Corner(100) })
    if (cfg.Avatar or Icons.avatar) == "rbxassetid://0" then
        pcall(function()
            av.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
        end)
    end
    Label({ Text = cfg.User or LocalPlayer.Name, Size = UDim2.fromOffset(115, 14), Position = UDim2.fromOffset(50, 460), Parent = main })
    local till = Label({ Text = "Till:", TextColor3 = Theme.TextDisabled, Size = UDim2.fromOffset(25, 14), Position = UDim2.fromOffset(50, 475), Parent = main })
    till.Size = UDim2.fromOffset(till.TextBounds.X + 4, 14)
    Label({ Text = cfg.Till or "Lifetime", TextColor3 = Theme.Accent, Size = UDim2.fromOffset(90, 14),
        Position = UDim2.fromOffset(50 + 26, 475), Parent = main })

    local tabList = New("Frame", {
        Size = UDim2.fromOffset(150, 380), Position = UDim2.fromOffset(10, 70),
        BackgroundTransparency = 1, Parent = main,
    }, { New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }) })
    local order = 0
    local function nextOrder() order = order + 1 return order end

    local saveBtn = New("TextButton", {
        Size = UDim2.fromOffset(100, 25), Position = UDim2.fromOffset(190, 20),
        BackgroundColor3 = Theme.Button, AutoButtonColor = false, Text = "", Parent = main,
    }, { Corner(4), Stroke() })
    local saveIcon = Icon(Icons.save, 12, Theme.TextDisabled, { Position = UDim2.fromOffset(24, 6), Parent = saveBtn })
    local saveTxt = Label({ Text = "Save", TextColor3 = Theme.TextDisabled, Size = UDim2.fromOffset(50, 25), Position = UDim2.fromOffset(42, 0), Parent = saveBtn })
    saveBtn.MouseEnter:Connect(function() Tween(saveBtn, .15, { BackgroundColor3 = Theme.ButtonHovered }); saveTxt.TextColor3 = Theme.Text; saveIcon.ImageColor3 = Theme.Text end)
    saveBtn.MouseLeave:Connect(function() Tween(saveBtn, .15, { BackgroundColor3 = Theme.Button }); saveTxt.TextColor3 = Theme.TextDisabled; saveIcon.ImageColor3 = Theme.TextDisabled end)
    saveBtn.MouseButton1Down:Connect(function() Tween(saveBtn, .1, { BackgroundColor3 = Theme.ButtonActive }) end)
    saveBtn.MouseButton1Up:Connect(function() Tween(saveBtn, .1, { BackgroundColor3 = Theme.ButtonHovered }) end)
    saveBtn.MouseButton1Click:Connect(function() if cfg.OnSave then cfg.OnSave(Library.Flags) end end)

    local subHolder = New("Frame", { Size = UDim2.fromOffset(240, 25), Position = UDim2.fromOffset(300, 20), BackgroundTransparency = 1, Parent = main })

    local pageHolder = New("Frame", {
        Size = UDim2.fromOffset(490, 404), Position = UDim2.fromOffset(185, 81),
        BackgroundTransparency = 1, ClipsDescendants = true, Parent = main,
    })
    local fade = New("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = pageHolder })

    local function animatePage()
        fade.GroupTransparency = 1
        pageHolder.Position = UDim2.fromOffset(185, 81)
        Tween(fade, 0.35, { GroupTransparency = 0 })
        Tween(pageHolder, 0.35, { Position = UDim2.fromOffset(185, 76) })
    end
    Window.Animate = animatePage

    do
        local dragging, dragStart, startPos
        local dragArea = New("Frame", { Size = UDim2.fromOffset(170, 60), BackgroundTransparency = 1, Parent = main })
        local function begin(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, dragStart, startPos = true, input.Position, main.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end
        dragArea.InputBegan:Connect(begin)
        topbar.InputBegan:Connect(begin)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local d = input.Position - dragStart
                main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end)
    end

    UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and input.KeyCode == Library.ToggleKey then
            main.Visible = not main.Visible
            Tween(blur, 0.3, { Size = main.Visible and (cfg.Blur or 12) or 0 })
        end
    end)

    function Window:CreateCategory(name)
        if order > 0 then
            New("Frame", { Size = UDim2.fromOffset(150, 8), BackgroundTransparency = 1, LayoutOrder = nextOrder(), Parent = tabList })
        end
        local t = Label({ Text = name, TextTransparency = 0.5, Size = UDim2.fromOffset(150, 16),
            LayoutOrder = nextOrder(), Parent = tabList })
        New("UIPadding", { PaddingLeft = UDim.new(0, 10), Parent = t })
    end

    function Window:CreateTab(name, icon)
        local Tab = { Subtabs = {}, Current = nil }

        local btn = New("TextButton", {
            Size = UDim2.fromOffset(150, 30), BackgroundColor3 = Theme.FrameActive, BackgroundTransparency = 1,
            AutoButtonColor = false, Text = "", LayoutOrder = nextOrder(), Parent = tabList,
        }, { Corner(5) })
        Icon(icon or "", 14, Theme.Accent, { Position = UDim2.fromOffset(10, 8), Parent = btn })
        Label({ Text = name, Size = UDim2.fromOffset(110, 30), Position = UDim2.fromOffset(35, 0), Parent = btn })

        local subBar = New("Frame", {
            Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.Button, Visible = false, Parent = subHolder,
        }, { Corner(4), Stroke(), New("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder }) })

        Tab.Button, Tab.SubBar = btn, subBar

        local function layoutSubs()
            local n = #Tab.Subtabs
            subBar.Visible = n > 0 and Window.CurrentTab == Tab
            for _, s in ipairs(Tab.Subtabs) do s.Button.Size = UDim2.new(1 / math.max(n, 1), 0, 1, 0) end
        end

        function Tab:Select()
            if Window.CurrentTab == Tab then return end
            for _, t in ipairs(Window.Tabs) do
                Tween(t.Button, .3, { BackgroundTransparency = 1 })
                t.SubBar.Visible = false
                for _, s in ipairs(t.Subtabs) do s.Page.Visible = false end
            end
            Window.CurrentTab = Tab
            Tween(btn, .3, { BackgroundTransparency = 0.5 })
            layoutSubs()
            if Tab.Current then Tab.Current.Page.Visible = true elseif Tab.Subtabs[1] then Tab.Subtabs[1]:Select() end
            animatePage()
        end
        btn.MouseButton1Click:Connect(function() Tab:Select() end)

        function Tab:CreateSubtab(sname)
            local Sub = {}
            local sb = New("TextButton", {
                BackgroundColor3 = Theme.FrameActive, BackgroundTransparency = 1, AutoButtonColor = false,
                Text = sname, Font = Theme.Font, TextSize = Theme.TextSize, TextColor3 = Theme.TextDisabled,
                LayoutOrder = #Tab.Subtabs + 1, Parent = subBar,
            }, { Corner(4) })

            local page = New("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false, Parent = fade })
            local function column(x)
                local ScrollingFrame = New("ScrollingFrame", {
                    Size = UDim2.fromOffset(241, 404), Position = UDim2.fromOffset(x, 0),
                    BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 0,
                    CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = page,
                }, { New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }) })
                local function Update()
                    local Y = 0
                    for Index, Value in pairs(ScrollingFrame:GetChildren()) do
                        if Value:IsA("GuiObject") then
                            Y = Y + Value.AbsoluteSize.Y
                        end
                    end
                    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, Y)
                end
                ScrollingFrame.ChildAdded:Connect(function()
                    Update()
                end)
                return ScrollingFrame
            end
            Sub.Left, Sub.Right = column(0), column(249)
            Sub.Button, Sub.Page = sb, page

            function Sub:Select()
                for _, s in ipairs(Tab.Subtabs) do
                    s.Page.Visible = false
                    Tween(s.Button, .3, { BackgroundTransparency = 1 })
                    s.Button.TextColor3 = Theme.TextDisabled
                end
                Tab.Current = Sub
                page.Visible = true
                Tween(sb, .3, { BackgroundTransparency = 0.2 })
                sb.TextColor3 = Theme.Text
                animatePage()
            end
            sb.MouseButton1Click:Connect(function() Sub:Select() end)

            function Sub:CreateGroup(gname, gicon, side)
                local col = (side == "Right") and Sub.Right or Sub.Left
                local G = {}
                local holder = New("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.fromOffset(241, 0), BackgroundTransparency = 1,
                    LayoutOrder = #col:GetChildren(), Parent = col,
                })
                local tx = 12
                if gicon then
                    Icon(gicon, 12, Theme.Text, { Position = UDim2.fromOffset(12, 2), ImageTransparency = 0.5, Parent = holder })
                    tx = 28
                end
                Label({ Text = gname, TextTransparency = 0.5, Size = UDim2.fromOffset(200, 16), Position = UDim2.fromOffset(tx, 0), Parent = holder })
                local box = New("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 1, -20), Position = UDim2.fromOffset(0, 20),
                    BackgroundColor3 = Theme.GroupBoxBg, BorderSizePixel = 0, Parent = holder,
                }, { Corner(6), Stroke() })
                local list = New("ScrollingFrame", {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, -24, 1, -1), Position = UDim2.fromOffset(12, 1),
                    BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 0,
                    CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = box,
                }, {
                    New("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }),
                    New("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10) }),
                })
                local n = 0
                local function row(h)
                    n = n + 1
                    return New("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = n, Parent = list })
                end
                local function flag(f, v) if f then Library.Flags[f] = v end end

                function G:CreateToggle(o)
                    o = type(o) == "string" and { Name = o } or o
                    local state = o.CurrentValue or false
                    local r = row(17)
                    local lbl = Label({ Text = o.Name, Size = UDim2.new(1, -40, 1, 0), TextColor3 = state and Theme.Text or Theme.TextDisabled, Parent = r })
                    if o.Icon then
                        Icon(o.Icon, 12, lbl.TextColor3, { Position = UDim2.fromOffset(lbl.TextBounds.X + 4, 2), Parent = r })
                    end
                    local sw = New("TextButton", {
                        Size = UDim2.fromOffset(30, 17), Position = UDim2.new(1, -30, 0, 0),
                        BackgroundColor3 = Theme.FrameInactive, AutoButtonColor = false, Text = "", Parent = r,
                    }, { Corner(10), Stroke() })
                    local knob = New("Frame", {
                        Size = UDim2.fromOffset(14, 14), AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.new(0, 8, 0.5, 0), BackgroundColor3 = Theme.TextDisabled, Parent = sw,
                    }, { Corner(7) })
                    local obj = {}
                    function obj:Set(v)
                        state = v
                        Tween(sw, .25, { BackgroundColor3 = v and Theme.FrameActive or Theme.FrameInactive })
                        Tween(knob, .25, { Position = UDim2.new(0, v and 22 or 8, 0.5, 0), BackgroundColor3 = v and Theme.Accent or Theme.TextDisabled })
                        lbl.TextColor3 = v and Theme.Text or Theme.TextDisabled
                        flag(o.Flag, v)
                        if o.Callback then task.spawn(o.Callback, v) end
                    end
                    function obj:Get() return state end
                    sw.MouseButton1Click:Connect(function() obj:Set(not state) end)
                    if state then sw.BackgroundColor3 = Theme.FrameActive; knob.Position = UDim2.new(0, 22, 0.5, 0); knob.BackgroundColor3 = Theme.Accent end
                    flag(o.Flag, state)
                    return obj
                end

                function G:CreateSlider(o)
                    local min, max = o.Range[1] or 0, o.Range[2] or 100
                    local increment = o.Increment or 1
                    local val = math.clamp(o.CurrentValue or min, min, max)
                    local suffix = o.Suffix or ""
                    local r = row(16)
                    Label({ Text = o.Name, TextColor3 = Theme.TextDisabled, Size = UDim2.new(1, -135, 1, 0), Parent = r })
                    local bar = New("TextButton", {
                        Size = UDim2.fromOffset(92, 4), Position = UDim2.new(1, -130, 0, 6),
                        BackgroundColor3 = Theme.FrameActive, AutoButtonColor = false, Text = "", Parent = r,
                    }, { Corner(5) })
                    local fill = New("Frame", { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = bar }, { Corner(5) })
                    local grab = New("Frame", {
                        Size = UDim2.fromOffset(12, 12), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, -2, 0.5, 0),
                        BackgroundColor3 = Theme.Accent, Parent = bar,
                    }, { Corner(6) })
                    local box = New("Frame", {
                        Size = UDim2.fromOffset(30, 17), Position = UDim2.new(1, -30, 0, 1),
                        BackgroundColor3 = Theme.FrameInactive, Parent = r,
                    }, { Corner(4), Stroke() })
                    local vt = Label({ Text = "", TextSize = 12, TextXAlignment = Enum.TextXAlignment.Center, Size = UDim2.fromScale(1, 1), Parent = box })
                    local obj = {}
                    function obj:Set(v, instant)
                        v = math.clamp(v, min, max)
                        v = min + math.floor((v - min) / increment + 0.5) * increment
                        v = math.clamp(v, min, max)
                        if o.Decimals then
                            v = math.floor(v * 10 ^ o.Decimals + 0.5) / 10 ^ o.Decimals
                        end
                        val = v
                        local p = (v - min) / (max - min)
                        local t = instant and 0 or .12
                        Tween(fill, t, { Size = UDim2.new(p, 0, 1, 0) })
                        Tween(grab, t, { Position = UDim2.new(p, -2, 0.5, 0) })
                        vt.Text = tostring(v) .. suffix
                        flag(o.Flag, v)
                        if o.Callback then task.spawn(o.Callback, v) end
                    end
                    function obj:Get() return val end
                    local sliding = false
                    local function update(x)
                        obj:Set(min + (max - min) * math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1))
                    end
                    bar.InputBegan:Connect(function(i)
                        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                            sliding = true
                            update(i.Position.X)
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(i)
                        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                            sliding = false
                        end
                    end)
                    UserInputService.InputChanged:Connect(function(i)
                        if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
                            update(i.Position.X)
                        end
                    end)
                    obj:Set(val, true)
                    return obj
                end
                
                function G:CreateDropdown(o)
                    local items = o.Options or {}
                    local multiple = o.MultipleOptions == true
                    local sel = multiple and (type(o.CurrentOption) == "table" and o.CurrentOption or {}) or (o.CurrentOption or items[1])
                    local r = row(20)
                    r.ZIndex = 5
                    Label({ Text = o.Name, TextColor3 = Theme.TextDisabled, Size = UDim2.new(1, -135, 1, 0), Parent = r })
                    local box = New("TextButton", {
                        Size = UDim2.fromOffset(130, 20), Position = UDim2.new(1, -130, 0, 0),
                        BackgroundColor3 = Theme.FrameInactive, AutoButtonColor = false, Text = "", Parent = r,
                    }, { Corner(3), Stroke() })
                    local pv = Label({ Text = "", TextColor3 = Theme.TextDisabled, ClipsDescendants = true,
                        Size = UDim2.new(1, -24, 1, 0), Position = UDim2.fromOffset(4, 0), Parent = box })
                    local arrow = Label({ Text = "▼", TextSize = 9, TextXAlignment = Enum.TextXAlignment.Center,
                        Size = UDim2.fromOffset(14, 20), Position = UDim2.new(1, -17, 0, 0), Parent = box })
                    local popup = New("ScrollingFrame", {
                        Visible = false, ZIndex = 50, Size = UDim2.fromOffset(130, 0),
                        BackgroundColor3 = Theme.FrameInactive, BackgroundTransparency = 0.1, BorderSizePixel = 0,
                        ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Accent,
                        CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = gui,
                    }, { Corner(3), Stroke(), New("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }) })
                    local obj, open = {}, false
                    local function contains(v)
                        if multiple then
                            return table.find(sel, v) ~= nil
                        end
                        return sel == v
                    end
                    local function updateText()
                        if multiple then
                            local names = {}
                            for _, v in ipairs(sel) do
                                names[#names + 1] = tostring(v)
                            end
                            pv.Text = table.concat(names, ", ")
                        else
                            pv.Text = tostring(sel or "")
                        end
                    end
                    local function build()
                        for _, c in ipairs(popup:GetChildren()) do
                            if c:IsA("TextButton") then c:Destroy() end
                        end
                        for i, it in ipairs(items) do
                            local selected = contains(it)
                            local b = New("TextButton", {
                                Size = UDim2.new(1, 0, 0, 20), BackgroundColor3 = Theme.FrameActive,
                                BackgroundTransparency = selected and 0.3 or 1, AutoButtonColor = false, ZIndex = 51,
                                Text = (multiple and (selected and "[✓] " or "[ ] ") or "  ") .. tostring(it),
                                Font = Theme.Font, TextSize = Theme.TextSize,
                                TextColor3 = selected and Theme.Text or Theme.TextDisabled,
                                TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = i, Parent = popup,
                            })
                            b.MouseEnter:Connect(function()
                                if not contains(it) then b.TextColor3 = Theme.Text end
                            end)
                            b.MouseLeave:Connect(function()
                                if not contains(it) then b.TextColor3 = Theme.TextDisabled end
                            end)
                            b.MouseButton1Click:Connect(function()
                                if multiple then
                                    local index = table.find(sel, it)
                                    if index then
                                        table.remove(sel, index)
                                    else
                                        table.insert(sel, it)
                                    end
                                    updateText()
                                    flag(o.Flag, sel)
                                    if o.Callback then task.spawn(o.Callback, table.clone(sel)) end
                                    build()
                                else
                                    obj:Set(it)
                                    obj:Close()
                                end
                            end)
                        end
                    end
                    function obj:Close()
                        open = false
                        Tween(popup, .15, { Size = UDim2.fromOffset(130, 0) }).Completed:Connect(function()
                            if not open then popup.Visible = false end
                        end)
                    end
                    function obj:Open()
                        open = true
                        build()
                        local ap = box.AbsolutePosition
                        local size = box.AbsoluteSize
                        local camera = workspace.CurrentCamera
                        local viewport = camera and camera.ViewportSize or Vector2.new(800, 600)
                        local height = math.min(#items, 8) * 20
                        local x = math.clamp(ap.X, 0, math.max(0, viewport.X - 130))
                        local y = ap.Y + size.Y + 2
                        if y + height > viewport.Y and ap.Y - height >= 0 then
                            y = ap.Y - height - 2
                        end
                        popup.Position = UDim2.fromOffset(x, y)
                        popup.Size = UDim2.fromOffset(130, 0)
                        popup.Visible = true
                        Tween(popup, .2, { Size = UDim2.fromOffset(130, height) })
                    end
                    function obj:Set(v)
                        if multiple then
                            sel = type(v) == "table" and table.clone(v) or {v}
                        else
                            sel = v
                        end
                        updateText()
                        flag(o.Flag, multiple and table.clone(sel) or sel)
                        if o.Callback then
                            task.spawn(o.Callback, multiple and table.clone(sel) or sel)
                        end
                        if open then build() end
                    end
                    function obj:Refresh(newItems)
                        items = newItems or {}
                        if open then build() end
                    end
                    function obj:Get()
                        return multiple and table.clone(sel) or sel
                    end
                    box.MouseEnter:Connect(function()
                        Tween(box, .2, { BackgroundColor3 = Theme.FrameInactive:Lerp(Theme.FrameActive, .5) })
                    end)
                    box.MouseLeave:Connect(function()
                        Tween(box, .2, { BackgroundColor3 = Theme.FrameInactive })
                    end)
                    box.MouseButton1Click:Connect(function()
                        if open then obj:Close() else obj:Open() end
                    end)
                    UserInputService.InputBegan:Connect(function(i, processed)
                        if not open then return end
                        if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
                        local m = i.Position
                        local p, s = popup.AbsolutePosition, popup.AbsoluteSize
                        local b, bs = box.AbsolutePosition, box.AbsoluteSize
                        local inPop = m.X >= p.X and m.X <= p.X + s.X and m.Y >= p.Y and m.Y <= p.Y + s.Y
                        local inBox = m.X >= b.X and m.X <= b.X + bs.X and m.Y >= b.Y and m.Y <= b.Y + bs.Y
                        if not inPop and not inBox then
                            obj:Close()
                        end
                    end)
                    updateText()
                    flag(o.Flag, multiple and table.clone(sel) or sel)
                    return obj
                end
                G.CreateCombo = G.CreateDropdown

                function G:CreateTextbox(o)
                    local r = row(20)
                    Label({ Text = o.Name, TextColor3 = Theme.TextDisabled, Size = UDim2.new(1, -135, 1, 0), Parent = r })
                    local frame = New("Frame", {
                        Size = UDim2.fromOffset(130, 20), Position = UDim2.new(1, -130, 0, 0),
                        BackgroundColor3 = Theme.FrameInactive, Parent = r,
                    }, { Corner(3), Stroke() })
                    local tb = New("TextBox", {
                        Size = UDim2.new(1, -8, 1, 0), Position = UDim2.fromOffset(4, 0), BackgroundTransparency = 1,
                        Text = o.CurrentValue or "",
                        PlaceholderText = o.PlaceholderText or "",
                        ClearTextOnFocus = o.RemoveTextAfterFocusLost or false,
                        Font = Theme.Font, TextSize = Theme.TextSize, TextColor3 = Theme.Text,
                        PlaceholderColor3 = Theme.TextDisabled, TextXAlignment = Enum.TextXAlignment.Left,
                        ClipsDescendants = true, Parent = frame,
                    })
                    local mid = Theme.FrameInactive:Lerp(Theme.FrameActive, .5)
                    frame.MouseEnter:Connect(function() if not tb:IsFocused() then Tween(frame, .2, { BackgroundColor3 = Theme.FrameInactive:Lerp(Theme.FrameActive, .25) }) end end)
                    frame.MouseLeave:Connect(function() if not tb:IsFocused() then Tween(frame, .2, { BackgroundColor3 = Theme.FrameInactive }) end end)
                    tb.Focused:Connect(function() Tween(frame, .2, { BackgroundColor3 = mid }) end)
                    tb.FocusLost:Connect(function(enter)
                        Tween(frame, .2, { BackgroundColor3 = Theme.FrameInactive })
                        flag(o.Flag, tb.Text)
                        if o.Callback then task.spawn(o.Callback, tb.Text, enter) end
                    end)
                    flag(o.Flag, tb.Text)
                    return { Set = function(_, v) tb.Text = v; flag(o.Flag, v) end, Get = function() return tb.Text end }
                end
                G.CreateInput = G.CreateTextbox

                function G:CreateColorPicker(o)
                    local h, s, v = (o.Color or Color3.new(1, 1, 1)):ToHSV()
                    local alpha = o.Alpha or 1
                    local r = row(16)
                    Label({ Text = o.Name, TextColor3 = Theme.TextDisabled, Size = UDim2.new(1, -30, 1, 0), Parent = r })
                    local prev = New("TextButton", {
                        Size = UDim2.fromOffset(16, 16), Position = UDim2.new(1, -16, 0, 0),
                        BackgroundColor3 = Color3.fromHSV(h, s, v), AutoButtonColor = false, Text = "", Parent = r,
                    }, { Corner(8) })

                    local pop = New("Frame", {
                        Visible = false, ZIndex = 60, Size = UDim2.fromOffset(180, 214),
                        BackgroundColor3 = Theme.FrameInactive, Parent = gui,
                    }, { Corner(4), Stroke() })
                    local sv = New("ImageButton", {
                        ZIndex = 61, Size = UDim2.fromOffset(164, 164), Position = UDim2.fromOffset(8, 8),
                        BackgroundColor3 = Color3.fromHSV(h, 1, 1), AutoButtonColor = false, Image = "", Parent = pop,
                    }, { Corner(4) })
                    New("Frame", { ZIndex = 62, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), Parent = sv }, {
                        Corner(4), New("UIGradient", { Transparency = NumberSequence.new(0, 1) }) })
                    New("Frame", { ZIndex = 63, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), Parent = sv }, {
                        Corner(4), New("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0) }) })
                    local svKnob = New("Frame", { ZIndex = 64, Size = UDim2.fromOffset(8, 8), AnchorPoint = Vector2.new(.5, .5),
                        BackgroundTransparency = 1, Parent = sv }, { Corner(4), Stroke(Color3.new(1, 1, 1), 0) })

                    local hue = New("ImageButton", {
                        ZIndex = 61, Size = UDim2.fromOffset(164, 8), Position = UDim2.fromOffset(8, 178),
                        BackgroundColor3 = Color3.new(1, 1, 1), AutoButtonColor = false, Image = "", Parent = pop,
                    }, { Corner(4), New("UIGradient", { Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)), ColorSequenceKeypoint.new(1 / 6, Color3.fromHSV(1 / 6, 1, 1)),
                        ColorSequenceKeypoint.new(2 / 6, Color3.fromHSV(2 / 6, 1, 1)), ColorSequenceKeypoint.new(3 / 6, Color3.fromHSV(3 / 6, 1, 1)),
                        ColorSequenceKeypoint.new(4 / 6, Color3.fromHSV(4 / 6, 1, 1)), ColorSequenceKeypoint.new(5 / 6, Color3.fromHSV(5 / 6, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)) }) }) })
                    local hueKnob = New("Frame", { ZIndex = 62, Size = UDim2.fromOffset(12, 12), AnchorPoint = Vector2.new(.5, .5),
                        Position = UDim2.new(h, 0, .5, 0), BackgroundColor3 = Color3.fromHSV(h, 1, 1), Parent = hue }, { Corner(6) })

                    local abar = New("ImageButton", {
                        ZIndex = 61, Size = UDim2.fromOffset(164, 8), Position = UDim2.fromOffset(8, 196),
                        BackgroundColor3 = Color3.fromHSV(h, s, v), AutoButtonColor = false, Image = "", Parent = pop,
                    }, { Corner(3), New("UIGradient", { Transparency = NumberSequence.new(1, 0) }) })
                    local aKnob = New("Frame", { ZIndex = 62, Size = UDim2.fromOffset(12, 12), AnchorPoint = Vector2.new(.5, .5),
                        Position = UDim2.new(alpha, 0, .5, 0), BackgroundColor3 = Color3.fromHSV(h, s, v), Parent = abar }, { Corner(6) })

                    local obj = {}
                    local function refresh()
                        local c = Color3.fromHSV(h, s, v)
                        prev.BackgroundColor3 = c
                        sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                        svKnob.Position = UDim2.fromScale(s, 1 - v)
                        hueKnob.Position = UDim2.new(h, 0, .5, 0); hueKnob.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                        abar.BackgroundColor3 = c; aKnob.Position = UDim2.new(alpha, 0, .5, 0); aKnob.BackgroundColor3 = c
                        flag(o.Flag, c)
                        if o.Callback then task.spawn(o.Callback, c, alpha) end
                    end
                    function obj:Set(c, a) h, s, v = c:ToHSV(); alpha = a or alpha; refresh() end
                    function obj:Get() return Color3.fromHSV(h, s, v), alpha end

                    local mode
                    local function drag(pos)
                        if mode == "sv" then
                            s = math.clamp((pos.X - sv.AbsolutePosition.X) / sv.AbsoluteSize.X, 0, 1)
                            v = 1 - math.clamp((pos.Y - sv.AbsolutePosition.Y) / sv.AbsoluteSize.Y, 0, 1)
                        elseif mode == "h" then
                            h = math.clamp((pos.X - hue.AbsolutePosition.X) / hue.AbsoluteSize.X, 0, 0.999)
                        elseif mode == "a" then
                            alpha = math.clamp((pos.X - abar.AbsolutePosition.X) / abar.AbsoluteSize.X, 0, 1)
                        end
                        refresh()
                    end
                    for el, m in pairs({ [sv] = "sv", [hue] = "h", [abar] = "a" }) do
                        el.InputBegan:Connect(function(i)
                            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then mode = m; drag(i.Position) end
                        end)
                    end
                    UserInputService.InputChanged:Connect(function(i)
                        if mode and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then drag(i.Position) end
                    end)
                    UserInputService.InputEnded:Connect(function(i)
                        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then mode = nil end
                    end)
                    prev.MouseButton1Click:Connect(function()
                        pop.Visible = not pop.Visible
                        local ap = prev.AbsolutePosition
                        pop.Position = UDim2.fromOffset(ap.X + 24, ap.Y)
                    end)
                    UserInputService.InputBegan:Connect(function(i)
                        UserInputService.InputBegan:Connect(function(i)
                            if not pop.Visible then return end
                            if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
                        
                            task.defer(function()
                                if not pop.Visible then return end
                                local m = i.Position
                                local p, sz = pop.AbsolutePosition, pop.AbsoluteSize
                                local b, bs = prev.AbsolutePosition, prev.AbsoluteSize
                                local inPop = m.X >= p.X and m.X <= p.X + sz.X and m.Y >= p.Y and m.Y <= p.Y + sz.Y
                                local inPrev = m.X >= b.X and m.X <= b.X + bs.X and m.Y >= b.Y and m.Y <= b.Y + bs.Y
                                if not inPop and not inPrev then
                                    pop.Visible = false
                                end
                            end)
                        end)
                    end)
                    refresh()
                    return obj
                end

                function G:CreateButton(o)
                    o = type(o) == "string" and { Name = o } or o
                    local r = row(25)
                    local b = New("TextButton", {
                        Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.Button, AutoButtonColor = false,
                        Text = o.Name, Font = Theme.Font, TextSize = Theme.TextSize, TextColor3 = Theme.TextDisabled, Parent = r,
                    }, { Corner(4), Stroke() })
                    b.MouseEnter:Connect(function() Tween(b, .15, { BackgroundColor3 = Theme.ButtonHovered }); b.TextColor3 = Theme.Text end)
                    b.MouseLeave:Connect(function() Tween(b, .15, { BackgroundColor3 = Theme.Button }); b.TextColor3 = Theme.TextDisabled end)
                    b.MouseButton1Down:Connect(function() Tween(b, .1, { BackgroundColor3 = Theme.ButtonActive }) end)
                    b.MouseButton1Up:Connect(function() Tween(b, .1, { BackgroundColor3 = Theme.ButtonHovered }) end)
                    b.MouseButton1Click:Connect(function() if o.Callback then task.spawn(o.Callback) end end)
                    return b
                end

                function G:CreateKeybind(o)
                    local key = o.Default
                    local r = row(20)
                    Label({ Text = o.Name, TextColor3 = Theme.TextDisabled, Size = UDim2.new(1, -75, 1, 0), Parent = r })
                    local b = New("TextButton", {
                        Size = UDim2.fromOffset(70, 20), Position = UDim2.new(1, -70, 0, 0), BackgroundColor3 = Theme.FrameInactive,
                        AutoButtonColor = false, Text = key and key.Name or "None", Font = Theme.Font, TextSize = 12,
                        TextColor3 = Theme.TextDisabled, Parent = r,
                    }, { Corner(3), Stroke() })
                    local listening = false
                    b.MouseButton1Click:Connect(function() listening = true; b.Text = "..." end)
                    UserInputService.InputBegan:Connect(function(i, gp)
                        if listening and i.UserInputType == Enum.UserInputType.Keyboard then
                            listening = false
                            key = (i.KeyCode ~= Enum.KeyCode.Escape) and i.KeyCode or nil
                            b.Text = key and key.Name or "None"
                            flag(o.Flag, key)
                        elseif not gp and key and i.KeyCode == key and o.Callback then
                            task.spawn(o.Callback, key)
                        end
                    end)
                    flag(o.Flag, key)
                end

                function G:CreateSeparator()
                    local r = row(1)
                    r.BackgroundColor3 = Theme.Border; r.BackgroundTransparency = 0.94; r.BorderSizePixel = 0
                end

                function G:CreateLabel(text)
                    local r = row(14)
                    return Label({ Text = text, TextColor3 = Theme.TextDisabled, Size = UDim2.fromScale(1, 1), Parent = r })
                end

                return G
            end

            table.insert(Tab.Subtabs, Sub)
            layoutSubs()
            if Window.CurrentTab == Tab and not Tab.Current then Sub:Select() end
            return Sub
        end

        function Tab:CreateGroup(...)
            Tab._default = Tab._default or Tab:CreateSubtab("General")
            return Tab._default:CreateGroup(...)
        end

        table.insert(Window.Tabs, Tab)
        if not Window.CurrentTab then Tab:Select() end
        return Tab
    end

    function Window:Destroy()
        gui:Destroy()
    end
    
    function Window:SetEnabled(Value)
        gui.Enabled = Value
    end
    
    function Window:GetEnabled()
        return gui.Enabled
    end
    
    function Window:GetParent()
        return gui.Parent
    end

    return Window
end

local MarketplaceService = game:GetService("MarketplaceService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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

local plr = Players.LocalPlayer
local AllSave = {}
local Stuff = {}

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

local Settings = {}
Settings["RejoinTimer"] = 0
Settings["FPSLimit"] = 60
Settings["WalkSpeed"] = 16
Settings["JumpPower"] = 50
Settings["EnabledWalkSpeed"] = false
Settings["EnabledWalkSpeed"] = false
Settings["EnabledFPSCap"] = false
Settings["EnabledFPS"] = false
Settings["AutoExecute"] = false
Settings["ConnectAntiAfk"] = nil
Settings["PartInAir"] = nil
Settings["ESP"] = {
    ["EspRawScript"] = {}
}

local Window = Library:CreateWindow({
    Title = "CyberX",
    User  = plr.Name,
    Till  = "Lifetime",
    OnSave = function(flags) end,
})

local ST = Instance.new("ScreenGui")
local T = Instance.new("ImageButton")
local Corner = Instance.new("UICorner")
ST.Name = "Toggle ScriptName"
ST.Parent = Window:GetParent()
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
    Window:SetEnabled(not Window:GetEnabled())
end)

Window:CreateCategory("Miscellaneous")
local Home = Window:CreateTab("Home", "rbxassetid://125058207637011")
local Player = Window:CreateTab("Player", Icons.user)

Window:CreateCategory("Game Play")
local Farm = Window:CreateTab("Farm", "rbxassetid://13060262529")
local Shop = Window:CreateTab("Shop", "rbxassetid://10893267086")

--[[ ######################## Script Logic ############################]]

local FMain = Farm:CreateSubtab("Main")
local SMain = Shop:CreateSubtab("Main")

Settings["AutoCheckIn"] = false
Settings["AutoCleanTrash"] = false
Settings["LiftList"] = {}
Settings["SelectMotorcycleLift"] = {}
Settings["AutoBuyMotorcycleLift"] = false
Settings["SelectCarLift"] = {}
Settings["AutoBuyCarLift"] = false
Settings["AutoRepair"] = false
Settings["AutoInstallLift"] = false
Settings["AutoUpgrade"] = false
Settings["AutoAspin"] = false
Settings["AutoThief"] = false
Settings["UpgradeList"] = {}
Settings["SelectUpgrade"] = {}
Settings["PaintList"] = {}
Settings["SelectPaint"] = {}
Settings["AutoBuyPaint"] = false
Settings["AutoBuild"] = false

local plr = game.Players.LocalPlayer

local Shop = workspace.Shops[plr:GetAttribute("Shop")]
local CustomersShop = workspace.Customers[plr:GetAttribute("Shop")]
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local KahaRemote = Remotes:WaitForChild("Kaha")
local KahaAction = Remotes:WaitForChild("KahaAction")

local Config = require(ReplicatedStorage.Shared.Config)

for Index, Value in ipairs(Config.Lifts) do
    if not Value.limited then
        Settings["LiftList"][#Settings["LiftList"]+1] = Value.id
    end
end

for Index, Value in ipairs(Config.Upgrades) do
    Settings["UpgradeList"][#Settings["UpgradeList"]+1] = Value.id
end

--[[

]]

local Current
KahaRemote.OnClientEvent:Connect(function(Action, Id, Data)
	if Action ~= "open" or type(Data) ~= "table" then
		if Current == Id then Current = nil end
		return
	end
	if Current == Id then return end
	Current = Id
	local function Get(Key, Default)
		local V = Data[Key] or Data[Key:lower()]
		if V == nil then return Default end
		return V
	end
    local function Call(...)
    	local Ok, Res = pcall(KahaAction.InvokeServer, KahaAction, ...)
    	if Current ~= Id or not Ok or type(Res) ~= "table" then return end
    	Res.Result = Res.Result or Res.result
    	Res.Handed = Res.Handed or Res.handed
    	Res.Sent = Res.Sent or Res.sent
    	return Res
    end
	task.defer(function()
	    task.wait(0.1)
		local Method, Price = Get("Method"), Get("Price", 0)
		if Method == "cash" then
			local Handed = Get("Handed", 0)
			while Current == Id do
				local Left = math.max(0, Get("Change", 0) - Handed)
				local Payload = {}
				for _, Peso in ipairs({ 500, 200, 100, 50, 20, 10, 5, 1 }) do
					local Count = math.floor(Left / Peso)
					if Count > 0 then
						Payload[tostring(Peso)] = Count
						Left = Left - Peso * Count
					end
				end
				local Res = Call("give", Id, Payload)
				if not Res or Res.Result ~= "short" or (Res.Handed or Handed) == Handed then break end
				Handed = Res.Handed
			end
		elseif Method == "qr" then
        	task.wait(0.7)
        	local Res = Call("scan", Id)
        	if Res and Res.Result == "scanned" then
        		task.wait(0.5)
        		Call((Res.Sent or Price) == Price and "accept" or "claim", Id)
        	end
		elseif Method == "barya" then
			local Action1 = (Get("Coins") or Price) == Price and "accept" or "claim"
			local Res = Call(Action1, Id)
			if Res and Res.Result == "notshort" then
				Call(Action1 == "accept" and "claim" or "accept", Id)
			end
		elseif Method == "alkansya" then
			local Pile, Taken, Left = {}, {}, Price
			for K, V in pairs(Get("Pile", {})) do
				Pile[tonumber(K)] = V
			end
			for _, Peso in ipairs({ 20, 10, 5, 1 }) do
				local Need = math.min(Pile[Peso] or 0, math.floor(Left / Peso))
				if Need > 0 then
					Taken[tostring(Peso)] = Need
					Left = Left - Peso * Need
				end
			end
			for _, Peso in ipairs({ 1, 5, 10, 20 }) do
				local Have = (Pile[Peso] or 0) - (Taken[tostring(Peso)] or 0)
				while Left > 0 and Have > 0 do
					Taken[tostring(Peso)] = (Taken[tostring(Peso)] or 0) + 1
					Left = Left - Peso
					Have = Have - 1
				end
			end
			Call("take", Id, Taken)
		end
		if Current == Id then Current = nil end
	end)
end)

local function GetCash()
    return plr.leaderstats.Cash.Value
end

local function GetTier(Lift)
    local Value = Config.GetLift(Lift)
    if not Value then return 0 end
    
    return Value.tier
end

local function GetBestLift(State)
    local Current
    if State then
        for Index1, Value1 in pairs(State.lifts.owned) do
            for Index2, Value2 in pairs(Value1) do
                if not Current then
                    Current = {}
                    Current[Index1] = Index2
                end
                if GetTier(Current[Index1]) < GetTier(Index2) then
                    Current[Index1] = Index2
                end
            end
        end
    end
    return Current
end

local Clock = os.clock()
task.spawn(function()
    while true do
        local State = Remotes:WaitForChild("GetState"):InvokeServer()
        if Settings["AutoAspin"] then
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for Index, Value in pairs(Shop.ShopEvents:GetDescendants()) do
                    if Value:IsA("ProximityPrompt") and Value.Enabled and Value:GetAttribute("Action") == "Aspin" then
                        local Parent = Value.Parent
                        if Parent then
                            hrp.CFrame = Parent.CFrame
                            task.wait(0.15)
                            fireproximityprompt(Value)
                        end
                    end
                end
            end
        end
        if Settings["AutoThief"] then
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for Index, Value in pairs(Shop.ShopEvents:GetDescendants()) do
                    if Value:IsA("ProximityPrompt") and Value.Enabled and Value:GetAttribute("Action") == "Thief" then
                        local Parent = Value.Parent
                        if Parent then
                            hrp.CFrame = Parent.CFrame
                            task.wait(0.15)
                            fireproximityprompt(Value)
                        end
                    end
                end
            end
        end
        if Settings["AutoInstallLift"] and (os.clock() - Clock) > 5 then
            Clock = os.clock()
            local BestLift = GetBestLift(State)
            if BestLift then
                for Index1, Value1 in pairs(BestLift) do
                    if Index1 == "Car" then
                        for Index2, Value2 in pairs(Shop.Structure.CarBays:GetChildren()) do
                            if not Value2.Slot:GetAttribute("Occupied") then
                                if GetTier(Value2.Slot:GetAttribute("LiftTier")) < GetTier(Value1) then
                                    Remotes:WaitForChild("InstallLift"):InvokeServer(
                                        "Car:"..Value2.Slot:GetAttribute("SlotId"),
                                        Value1
                                    )
                                end
                            end
                        end
                    elseif Index1 == "Motorcycle" then
                        for Index2, Value2 in pairs(Shop.Structure.MotoBays:GetChildren()) do
                            if not Value2.Slot:GetAttribute("Occupied") then
                                if GetTier(Value2.Slot:GetAttribute("LiftTier")) < GetTier(Value1) then
                                    Remotes:WaitForChild("InstallLift"):InvokeServer(
                                        "Motorcycle:"..Value2.Slot:GetAttribute("SlotId"),
                                        Value1
                                    )
                                end
                            end
                        end
                    end
                end
            end
        end
        if Settings["AutoCheckIn"] then 
            for Index1, Value1 in pairs(CustomersShop:GetChildren()) do
                if Value1 and not Value1:GetAttribute("VehicleClass") and Value1:FindFirstChild("Head") and Value1.Head:FindFirstChild("CustomerTag") and Value1.Head.CustomerTag:FindFirstChild("Bar") and Value1.Head.CustomerTag.Bar.Visible and Value1.Head.CustomerTag.Bar.Size.X.Scale > 0 then
                    for Index2, Value2 in pairs(CustomersShop:GetChildren()) do
                        if Value1 ~= Value2 and Value2:GetAttribute("VehicleClass") then
                            if Value2:GetAttribute("VehicleClass") == "Motorcycle" then
                                for Index3, Value3 in pairs(Shop.Structure:GetDescendants()) do
                                    if Value3.Name == "Slot" and Value3:IsA("Model") and Value3:GetAttribute("VehicleClass") == "Motorcycle" and not Value3:GetAttribute("Occupied") then
                                       local Value = Value3.Parent
                                        Remotes:WaitForChild("AssignSlot"):InvokeServer(
                                            Value2:GetAttribute("CustomerId"),
                                            "Motorcycle:"..Value:GetAttribute("BayIndex")
                                        )
                                    end
                                end
                            elseif Value2:GetAttribute("VehicleClass") == "Car" then
                                for Index3, Value3 in pairs(Shop.Structure:GetDescendants()) do
                                    if Value3.Name == "Slot" and Value3:IsA("Model") and Value3:GetAttribute("VehicleClass") == "Car" and not Value3:GetAttribute("Occupied") then
                                       local Value = Value3.Parent
                                        Remotes:WaitForChild("AssignSlot"):InvokeServer(
                                            Value2:GetAttribute("CustomerId"),
                                            "Car:"..Value:GetAttribute("BayIndex")
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if Settings["AutoCleanTrash"] and Shop:FindFirstChild("Kalat") then
            for Index, Value in pairs(Shop.Kalat:GetDescendants()) do
                if Value:IsA("ProximityPrompt") and Value.Enabled then
                    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local Parent = Value.Parent
                        if (Parent.Position - hrp.Position).Magnitude > 8 then
                            hrp.CFrame = Parent.CFrame
                            task.wait(0.15)
                        end
                        fireproximityprompt(Value)
                        task.wait(0.15)
                    end
                end
            end
        end
        if Settings["AutoRepair"] then
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for Index1, Value1 in pairs(Shop.Structure:GetDescendants()) do
                    for Index2, Value2 in pairs(CustomersShop:GetChildren()) do
                        if Value1:IsA("Model") and Value1.Name == "Slot" and Value1:GetAttribute("CustomerId") == Value2:GetAttribute("CustomerId") and Value2:GetAttribute("WrenchOK") then
                            local Wrench = plr.Backpack:FindFirstChild("Wrench")
                            if Wrench then
                                Wrench.Parent = plr.Character
                            end
                            local Part = Value1.LiftSpot
                            hrp.CFrame = Part.CFrame
                            task.wait(0.15)
                            Remotes:WaitForChild("SwingWrench"):FireServer("wrench")
                            task.wait(0.15)
                        end
                    end
                end
            end
        end
        if Settings["AutoCheckOut"] then
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for Index, Value in pairs(CustomersShop:GetDescendants()) do
                    if Value:GetAttribute("OwnerUserId") == plr.UserId and Value:GetAttribute("CustomerId") and Value:IsA("ProximityPrompt") and Value.Enabled and Value:GetAttribute("Action") == "Kaha" and Value.Parent.Parent.Name == "HumanoidRootPart" then
                        local Parent = Value.Parent.Parent
                        if Parent then
                            hrp.CFrame = Parent.CFrame
                            task.wait(0.25)
                            fireproximityprompt(Value)
                            task.wait(0.25)
                        end
                    end
                end
            end
        end
        if Settings["AutoBuild"] then
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for Index, Value in pairs(Shop:GetDescendants()) do
                    if Value:IsA("ProximityPrompt") and Value:GetAttribute("Action") == "Expand" and tonumber((Value.ObjectText:match("₱([%d,]+)"):gsub(",", ""))) and tonumber((Value.ObjectText:match("₱([%d,]+)"):gsub(",", ""))) <= GetCash() then
                        local BasePart = Value
                        while true do
                            if not BasePart or BasePart:IsA("BasePart") then
                                break
                            else
                                BasePart = BasePart.Parent
                            end
                        end
                        if BasePart then
                            hrp.CFrame = BasePart.CFrame
                            task.wait(0.15)
                            fireproximityprompt(Value)
                        end
                    end
                end
            end
        end
        if Settings["AutoUpgrade"] then
            task.spawn(function()
                if State then
                    for Index, Value in ipairs(State.upgrades) do
                        if Value and table.find(Settings["SelectUpgrade"], Value.id) and Value.level < Value.max and Value.cost <= GetCash() then
                            Remotes:WaitForChild("BuyUpgrade"):InvokeServer(Value.id)
                        end
                    end
                end
            end)
        end
        if Settings["AutoBuyMotorcycleLift"] then
            task.spawn(function()
                local Result = Remotes:WaitForChild("GetLiftShop"):InvokeServer()
                if Result then
                    for Index, Value in pairs(Result.stock.Motorcycle) do
                        if table.find(Settings["SelectMotorcycleLift"], Index) and Value > 0 and Config.GetLift(Index).price.Motorcycle <= GetCash() then
                            Remotes:WaitForChild("BuyLift"):InvokeServer(
                                "Motorcycle",
                                Index
                            )
                        end
                    end
                end
            end)
        end
        if Settings["AutoBuyCarLift"] then
            task.spawn(function()
                local Result = Remotes:WaitForChild("GetLiftShop"):InvokeServer()
                if Result and Result.carUnlocked then
                    for Index, Value in pairs(Result.stock.Car) do
                        if table.find(Settings["SelectCarLift"], Index) and Value > 0 and Config.GetLift(Index).price.Car <= GetCash() then
                            Remotes:WaitForChild("BuyLift"):InvokeServer(
                                "Car",
                                Index
                            )
                        end
                    end
                end
            end)
        end
        if Settings["AutoBuyPaint"] then
            task.spawn(function()
                
            end)
        end
        task.wait()
    end
end)

local FGLAutomatic = FMain:CreateGroup("Automatic", Icons.crown, "Left")
AllSave["AutoCheckIn"] = FGLAutomatic:CreateToggle({Name = "Auto Assign", CurrentValue = false, Flag = "AutoCheckIn", Callback = function(Value)
    Settings["AutoCheckIn"] = Value
end})
AllSave["AutoCheckOut"] = FGLAutomatic:CreateToggle({Name = "Auto Check Out", CurrentValue = false, Flag = "AutoCheckOut", Callback = function(Value)
    Settings["AutoCheckOut"] = Value
end})
AllSave["AutoCleanTrash"] = FGLAutomatic:CreateToggle({Name = "Auto Clean Trash", CurrentValue = false, Flag = "AutoCleanTrash", Callback = function(Value)
    Settings["AutoCleanTrash"] = Value
end})
AllSave["AutoRepair"] = FGLAutomatic:CreateToggle({Name = "Auto Repair", CurrentValue = false, Flag = "AutoRepair", Callback = function(Value)
    Settings["AutoRepair"] = Value
end})
AllSave["AutoInstallLift"] = FGLAutomatic:CreateToggle({Name = "Auto Install Lift", CurrentValue = false, Flag = "AutoInstallLift", Callback = function(Value)
    Settings["AutoInstallLift"] = Value
end})
AllSave["AutoAspin"] = FGLAutomatic:CreateToggle({Name = "Auto Catch Aspin", CurrentValue = false, Flag = "AutoAspin", Callback = function(Value)
    Settings["AutoAspin"] = Value
end})
AllSave["AutoThief"] = FGLAutomatic:CreateToggle({Name = "Auto Bonk Thief", CurrentValue = false, Flag = "AutoThief", Callback = function(Value)
    Settings["AutoThief"] = Value
end})

local FGLUpgrade = FMain:CreateGroup("Upgrade", Icons.dagger, "Right")
AllSave["UpgradeList"] = FGLUpgrade:CreateDropdown({Name = "Upgrade List", Options = Settings["UpgradeList"], CurrentOption = {"None"}, MultipleOptions = true, Flag = "UpgradeList", Callback = function(Value)
    Settings["SelectUpgrade"] = Value
end})
AllSave["AutoUpgrade"] = FGLUpgrade:CreateToggle({Name = "Auto Upgrade", CurrentValue = false, Flag = "AutoUpgrade", Callback = function(Value)
    Settings["AutoUpgrade"] = Value
end})
AllSave["AutoBuild"] = FGLUpgrade:CreateToggle({Name = "Auto Build", CurrentValue = false, Flag = "AutoBuild", Callback = function(Value)
    Settings["AutoBuild"] = Value
end})

local SGLMotorcycleShop = SMain:CreateGroup("Motorcycle Lift Shop", Icons.axe_battle, "Right")
AllSave["LiftList"] = SGLMotorcycleShop:CreateDropdown({Name = "Motorcycle Lift List", Options = Settings["LiftList"], CurrentOption = {"None"}, MultipleOptions = true, Flag = "MotorcycleLiftList", Callback = function(Value)
    Settings["SelectMotorcycleLift"] = Value
end})
AllSave["AutoBuyMotorcycleLift"] = SGLMotorcycleShop:CreateToggle({Name = "Auto Buy", CurrentValue = false, Flag = "AutoBuyMotorcycleLift", Callback = function(Value)
    Settings["AutoBuyMotorcycleLift"] = Value
end})

--[[ ##################################################################]]

local HMain = Home:CreateSubtab("Main")
local PMain = Player:CreateSubtab("Main")
local PVisual = Player:CreateSubtab("Visual")

local GLServerMain = HMain:CreateGroup("Server", "rbxassetid://11713339600", "Left")
AllSave["RejoinButton"] = GLServerMain:CreateInput({Name = "Server", CurrentValue = "", PlaceholderText = "ServerId", RemoveTextAfterFocusLost = true, Callback = function(Value)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, Value, plr)
end})
AllSave["RejoinButton"] = GLServerMain:CreateButton({Name = "Rejoin", Callback = function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end})
AllSave["ServerHopButton"] = GLServerMain:CreateButton({Name = "Server Hop", Callback = function()
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

local GLMiseMain = HMain:CreateGroup("Misc", Icons.feather, "Right")
AllSave["FPSCap"] = GLMiseMain:CreateSlider({Name = "FPS Cap", Range = {1, 240}, Increment = 1, Suffix = "FPS", CurrentValue = 60, Flag = "FPSCap", Callback = function(Value)
    Settings["FPSLimit"] = Value
end})
AllSave["EnabledFPSCap"] = GLMiseMain:CreateToggle({Name = "Enable FPS Cap", CurrentValue = false, Flag = "EnabledFPSCap", Callback = function(Value)
    Settings["EnabledFPSCap"] = Value
end})
AllSave["AntiAFKBypass"] = GLMiseMain:CreateToggle({Name = "Bypass Anti AFK", CurrentValue = false, Flag = "AntiAFKBypass", Callback = function(Value)
    if Value then
        ConnectAntiAfk = plr.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    else
        if ConnectAntiAfk then
            ConnectAntiAfk:Disconnect()
            ConnectAntiAfk = nil
        end
    end
end})
AllSave["EnabledFPS"] = GLMiseMain:CreateToggle({Name = "Enable FPS Booster", CurrentValue = false, Flag = "EnabledFPS", Callback = function(Value)
    Settings["EnabledFPS"] = Value
    if Settings["EnabledFPS"] then
        EnableFPS()
    else
        DisableFPS()
    end
end})
AllSave["AutoExecute"] = GLMiseMain:CreateToggle({Name = "Auto Execute", CurrentValue = false, Flag = "AutoExecute", Callback = function(Value)
    if Value then
        local queue =
            (getgenv and getgenv().queue_on_teleport)
            or queue_on_teleport
            or (syn and syn.queue_on_teleport)
            or (fluxus and fluxus.queue_on_teleport)
                
        queue([[
            repeat task.wait() until game:IsLoaded()
            task.wait(3)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Talyer.lua"))()
        ]])
    end
    Settings["AutoExecute"] = Value
end})
AllSave["AutoRejoinAfter15min"] = GLMiseMain:CreateToggle({Name = "Auto Rejoin After 15min", CurrentValue = false, Flag = "AutoRejoinAfter15min", Callback = function(Value)
    Settings["AutoRejoinAfter15min"] = Value
    if Value then
        Library:Notify({
            Title = "✅ Successfully",
            Content = "Timer Start Now",
            Duration = 3.5,
        })
    else
        Library:Notify({
            Title = "✅ Successfully",
            Content = "Timer Reset",
            Duration = 3.5,
        })
        Settings["RejoinTimer"] = 0
    end
end})

local GLMovementMain = PMain:CreateGroup("Movement", Icons.mouse, "Left")
AllSave["WalkSpeed"] = GLMovementMain:CreateSlider({Name = "Walk Speed", Range = {0, 1000}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "WalkSpeed", Callback = function(Value)
    Settings["WalkSpeed"] = Value
    if Settings["EnabledWalkSpeed"] then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = Settings["WalkSpeed"]
        end
    end
end})
AllSave["EnabledWalkSpeed"] = GLMovementMain:CreateToggle({Name = "Enabled Walk Speed", CurrentValue = false, Flag = "EnabledWalkSpeed", Callback = function(Value)
    Settings["EnabledWalkSpeed"] = Value
    if Value then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = Settings["WalkSpeed"]
        end
    else
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 16
        end
    end
end})
AllSave["JumpPower"] = GLMovementMain:CreateSlider({Name = "Jump Power", Range = {0, 1000}, Increment = 1, Suffix = "Power", CurrentValue = 50, Flag = "JumpPower", Callback = function(Value)
    Settings["JumpPower"] = Value
    if Settings["EnabledJumpPower"] then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = Settings["JumpPower"]
        end
    end
end})
AllSave["EnabledJumpPower"] = GLMovementMain:CreateToggle({Name = "Enabled Jump Power", CurrentValue = false, Flag = "EnabledJumpPower", Callback = function(Value)
    Settings["EnabledJumpPower"] = Value
    if Value then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = Settings["JumpPower"]
        end
    else
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = 50
        end
    end
end})

local GRMovementMain = PMain:CreateGroup("Mics", Icons.mouse, "Right")
AllSave["Sit"] = GRMovementMain:CreateToggle({Name = "Sit", CurrentValue = false, Flag = "Sit", Callback = function(Value)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.Sit = Value
    end
end})
AllSave["InfiniteJump"] = GRMovementMain:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Flag = "InfiniteJump", Callback = function(Value)
    Settings["InfiniteJump"] = Value
    if Value and not Settings["InfiniteJumpConnection"] then
        Settings["InfiniteJumpConnection"] = UserInputService.JumpRequest:Connect(function()
            if Settings["InfiniteJump"] then
                local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    elseif not Value and Settings["InfiniteJumpConnection"] then
        Settings["InfiniteJumpConnection"]:Disconnect()
        Settings["InfiniteJumpConnection"] = nil
    end
end})
AllSave["WalkOnAir"] = GRMovementMain:CreateToggle({Name = "Walk On Air", CurrentValue = false, Flag = "WalkOnAir", Callback = function(Value)
    if Value then
        local Part = Instance.new("Part")
        Part.Anchored = true
        Part.Transparency = 1
        Part.Size = Vector3.new(10, 1, 10)
        Part.Position = Vector3.new(0, -3.5, 0)
        Part.Parent = workspace
        Settings["PartInAir"] = Part
    else
        if Settings["PartInAir"] then
            Settings["PartInAir"]:Destroy()
            Settings["PartInAir"] = nil
        end
    end
end})

local ESP = {
    {Name = "ESP Account Age", Function = [[local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local EspName = "EA"  local CharacterConnections = {} local NewPlayers = {} local PlayerAddedConnection = nil  local RunEspAccountAge = {}  function CreateEspAccountAge(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	if not head then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 150, 0, 30) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Text = player.AccountAge ..(player.AccountAge > 1 and "Days" or "Day") 	Label.Parent = BillboardGui end  function RunEspAccountAge:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspAccountAge(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspAccountAge(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspAccountAge(plr, Color) 		end) 	end) end  function RunEspAccountAge:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspAccountAge ]]},
    {Name = "ESP UserId", Function = [[local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local EspName = "EU"  local CharacterConnections = {} local NewPlayers = {} local PlayerAddedConnection = nil  local RunEspUserId = {}  function CreateEspUserId(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	if not head then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 150, 0, 30) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Text = player.UserId 	Label.Parent = BillboardGui end  function RunEspUserId:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspUserId(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspUserId(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspUserId(plr, Color) 		end) 	end) end  function RunEspUserId:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspUserId ]]},
    {Name = "ESP Name", Function = [[local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer local EspName = "EN"  local CharacterConnections = {} local NewPlayers = {} local RenderConnections = {} local PlayerAddedConnection = nil  local RunEspName = {}  function CreateEspName(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	if not head then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 100, 0, 20) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Text = player.Name 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Parent = BillboardGui end  function RunEspName:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspName(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspName(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspName(plr, Color) 		end) 	end) end  function RunEspName:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end  		if RenderConnections[player] then 			RenderConnections[player]:Disconnect() 			RenderConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspName ]]},
    {Name = "ESP Health", Function = [[local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer local EspName = "EH"  local CharacterConnections = {} local NewPlayers = {} local RenderConnections = {} local PlayerAddedConnection = nil  local RunEspHealth = {}  local function calculateHealth(player) 	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid") 	if humanoid then 		return math.floor(humanoid.Health) 	end 	return 0 end  function CreateEspHealth(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	local humanoid = player.Character:FindFirstChildOfClass("Humanoid") 	if not head or not humanoid then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 150, 0, 30) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Text = calculateHealth(player) .. " HP" 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Parent = BillboardGui  	if RenderConnections[player] then 		RenderConnections[player]:Disconnect() 	end  	RenderConnections[player] = RunService.RenderStepped:Connect(function() 		if humanoid and humanoid.Parent then 			Label.Text = calculateHealth(player) .. " HP" 		else 			Label.Text = "N/A" .." HP" 		end 	end) end  function RunEspHealth:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspHealth(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspHealth(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspHealth(plr, Color) 		end) 	end) end  function RunEspHealth:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end  		if RenderConnections[player] then 			RenderConnections[player]:Disconnect() 			RenderConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspHealth ]]},
    {Name = "ESP Display Name", Function = [[local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local EspName = "ED"  local CharacterConnections = {} local NewPlayers = {} local PlayerAddedConnection = nil  local RunEspDisplayName = {}  function CreateEspDisplayName(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	if not head then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 150, 0, 30) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Text = player.DisplayName 	Label.Parent = BillboardGui end  function RunEspDisplayName:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspDisplayName(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspDisplayName(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspDisplayName(plr, Color) 		end) 	end) end  function RunEspDisplayName:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspDisplayName ]]},
    {Name = "ESP Position", Function = [[local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer local EspName = "EP"  local CharacterConnections = {} local NewPlayers = {} local RenderConnections = {} local PlayerAddedConnection = nil  local RunEspPosition = {}  function CreateEspPosition(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	local hrp = player.Character:FindFirstChild("HumanoidRootPart") 	if not head or not hrp then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 200, 0, 30) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Parent = BillboardGui  	if RenderConnections[player] then 		RenderConnections[player]:Disconnect() 	end  	RenderConnections[player] = RunService.RenderStepped:Connect(function() 		if hrp and hrp.Parent then 			local pos = hrp.Position 			Label.Text = string.format("X: %d Y: %d Z: %d", pos.X, pos.Y, pos.Z) 		else 			Label.Text = "X: 0 Y: 0 Z: 0" 		end 	end) end  function RunEspPosition:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspPosition(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspPosition(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspPosition(plr, Color) 		end) 	end) end  function RunEspPosition:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end  		if RenderConnections[player] then 			RenderConnections[player]:Disconnect() 			RenderConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspPosition ]]},
    {Name = "ESP Distance", Function = [[local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer local EspName = "EDI"  local CharacterConnections = {} local NewPlayers = {} local RenderConnections = {} local PlayerAddedConnection = nil  local RunEspHealth = {}  local function calculateDistance(pos1, pos2) 	return (pos1 - pos2).Magnitude end  function CreateEspDistance(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	local humanoid = player.Character:FindFirstChildOfClass("Humanoid") 	if not head or not humanoid then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 100, 0, 20) 	BillboardGui.Adornee = head 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head  	local Label = Instance.new("TextLabel") 	Label.Size = UDim2.new(1, 0, 1, 0) 	Label.BackgroundTransparency = 1 	Label.TextColor3 = Color 	Label.TextStrokeTransparency = 0.5 	Label.TextStrokeColor3 = Color3.new(0, 0, 0) 	Label.Text = "" 	Label.Font = Enum.Font.SourceSansBold 	Label.TextSize = 14 	Label.TextScaled = true 	Label.Parent = BillboardGui  	if RenderConnections[player] then 		RenderConnections[player]:Disconnect() 	end  	RenderConnections[player] = RunService.RenderStepped:Connect(function() 		local targetHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart") 		local localHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  		if targetHRP and localHRP then 			local distance = calculateDistance(localHRP.Position, targetHRP.Position) 			Label.Text = tostring(math.floor(distance)/10) .. " M" 		else 			Label.Text = "N/A" 		end 	end) end  function RunEspHealth:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspDistance(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspDistance(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspDistance(plr, Color) 		end) 	end) end  function RunEspHealth:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end  		if RenderConnections[player] then 			RenderConnections[player]:Disconnect() 			RenderConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  return RunEspHealth ]]},
    {Name = "ESP Highlights", Function = [[local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local EspName = "EHI"  local CharacterConnections = {} local NewPlayers = {} local PlayerAddedConnection = nil  local RunEspHighlight = {}  function CreateEspHighlight(player, Color)     if not player.Character then return end     local head = player.Character:FindFirstChild("Head")     if not head then return end      local oldGui = player.Character:FindFirstChild(EspName)     if oldGui then oldGui:Destroy() end      local highlight = Instance.new("Highlight")     highlight.Name = EspName     highlight.Adornee = player.Character     highlight.FillColor = Color     highlight.OutlineColor = Color3.new(1, 1, 1)     highlight.Parent = player.Character end  function RunEspHighlight:On(Color)     for _, player in pairs(Players:GetPlayers()) do         if player ~= LocalPlayer then             CreateEspHighlight(player, Color)              if CharacterConnections[player] then                 CharacterConnections[player]:Disconnect()             end              CharacterConnections[player] = player.CharacterAdded:Connect(function()                 task.wait(0.1)                 CreateEspHighlight(player, Color)             end)         end     end      PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr)         NewPlayers[plr] = plr.CharacterAdded:Connect(function()             task.wait(0.1)             CreateEspHighlight(plr, Color)         end)     end) end  function RunEspHighlight:Off()     for _, player in pairs(Players:GetPlayers()) do         local character = player.Character         if character then             local esp = character:FindFirstChild(EspName)             if esp then                 esp:Destroy()             end         end          if CharacterConnections[player] then             CharacterConnections[player]:Disconnect()             CharacterConnections[player] = nil         end     end      for plr, conn in pairs(NewPlayers) do         if conn then conn:Disconnect() end         NewPlayers[plr] = nil     end      if PlayerAddedConnection then         PlayerAddedConnection:Disconnect()         PlayerAddedConnection = nil     end end  return RunEspHighlight ]]},
    {Name = "ESP Health Bar", Function = [[local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer local EspName = "EHBr"  local CharacterConnections = {} local NewPlayers = {} local RenderConnections = {} local PlayerAddedConnection = nil  local RunEspHealthBar = {}  local function calculateHealth(player) 	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid") 	if humanoid then 		if humanoid and humanoid.MaxHealth > 0 then 			return humanoid.Health / humanoid.MaxHealth 		end 	end 	return 0 end  local function InvertColor(color)     return Color3.new(         1 - color.R,         1 - color.G,         1 - color.B     ) end  function CreateEspHealthBar(player, Color) 	if not player.Character then return end 	local head = player.Character:FindFirstChild("Head") 	local humanoid = player.Character:FindFirstChildOfClass("Humanoid") 	if not head or not humanoid then return end  	local oldGui = head:FindFirstChild(EspName) 	if oldGui then oldGui:Destroy() end  	local BillboardGui = Instance.new("BillboardGui") 	BillboardGui.Name = EspName 	BillboardGui.Size = UDim2.new(0, 100, 0, 15) 	BillboardGui.Adornee = head 	BillboardGui.StudsOffsetWorldSpace = Vector3.new(0, 1, 0) 	BillboardGui.AlwaysOnTop = true 	BillboardGui.Parent = head 	 	local Frame = Instance.new("Frame") 	Frame.Parent = BillboardGui 	Frame.AnchorPoint = Vector2.new(0.5, 0.5) 	Frame.Position = UDim2.new(0.5, 0, 0.5, 0) 	Frame.Size = UDim2.new(0.8, 0, 0.8, 0) 	Frame.BackgroundColor3 = (Color == Color3.new(0,0,0) and Color3.new(1,1,1) or Color3.new(0,0,0)) 	 	local ProcessBar = Instance.new("Frame") 	ProcessBar.Parent = Frame 	ProcessBar.Size = UDim2.new(calculateHealth(player), 0, 1, 0) 	ProcessBar.BackgroundColor3 = Color 	 	Instance.new("UICorner", Frame) 	Instance.new("UIStroke", Frame) 	Instance.new("UICorner", ProcessBar) 	Instance.new("UIStroke", ProcessBar)  	if RenderConnections[player] then 		RenderConnections[player]:Disconnect() 	end  	RenderConnections[player] = RunService.RenderStepped:Connect(function() 		if humanoid and humanoid.Parent then 			ProcessBar.Size = UDim2.new(calculateHealth(player), 0, 1, 0) 		else 			ProcessBar.Size = UDim2.new(0, 0, 1, 0) 		end 	end) end  function RunEspHealthBar:On(Color) 	for _, player in pairs(Players:GetPlayers()) do 		if player ~= LocalPlayer then 			CreateEspHealthBar(player, Color)  			if CharacterConnections[player] then 				CharacterConnections[player]:Disconnect() 			end  			CharacterConnections[player] = player.CharacterAdded:Connect(function() 				task.wait(1) 				CreateEspHealthBar(player, Color) 			end) 		end 	end  	PlayerAddedConnection = Players.PlayerAdded:Connect(function(plr) 		NewPlayers[plr] = plr.CharacterAdded:Connect(function() 			task.wait(1) 			CreateEspHealthBar(plr, Color) 		end) 	end) end  function RunEspHealthBar:Off() 	for _, player in pairs(Players:GetPlayers()) do 		local character = player.Character 		if character and character:FindFirstChild("Head") then 			local head = character.Head 			local esp = head:FindFirstChild(EspName) 			if esp then 				esp:Destroy() 			end 		end  		if CharacterConnections[player] then 			CharacterConnections[player]:Disconnect() 			CharacterConnections[player] = nil 		end  		if RenderConnections[player] then 			RenderConnections[player]:Disconnect() 			RenderConnections[player] = nil 		end 	end  	for plr, conn in pairs(NewPlayers) do 		if conn then conn:Disconnect() end 		NewPlayers[plr] = nil 	end  	if PlayerAddedConnection then 		PlayerAddedConnection:Disconnect() 		PlayerAddedConnection = nil 	end end  Players.PlayerRemoving:Connect(function(player) 	if RenderConnections[player] then 		RenderConnections[player]:Disconnect() 		RenderConnections[player] = nil 	end  	if CharacterConnections[player] then 		CharacterConnections[player]:Disconnect() 		CharacterConnections[player] = nil 	end end)  return RunEspHealthBar]]},
    {Name = "ESP Line", Function = [[local OF = {} local Players = game:GetService("Players") local RunService = game:GetService("RunService")  local localPlayer = Players.LocalPlayer local camera = workspace.CurrentCamera local WorldToViewportPoint = camera.WorldToViewportPoint  local tracers = {} local isEnabled = false local playerAddedConn = nil local characterConnections = {}  local function createTracer(player, color) 	if tracers[player] then return end  	local tracer = Drawing.new("Line") 	tracer.Visible = false 	tracer.Color = color 	tracer.Thickness = 1 	tracer.Transparency = 1  	local function update() 		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 			local pos, onScreen = WorldToViewportPoint(camera, player.Character.HumanoidRootPart.Position) 			if onScreen then 				tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y) 				tracer.To = Vector2.new(pos.X, pos.Y) 				tracer.Visible = true 			else 				tracer.Visible = false 			end 		else 			tracer.Visible = false 		end 	end  	local conn = RunService.RenderStepped:Connect(update)  	tracers[player] = {tracer = tracer, connection = conn} 	characterConnections[player] = player.CharacterAdded:Connect(function() 		task.wait(1) 	end) end  local function EnableTracers(enable, color) 	if enable and not isEnabled then 		isEnabled = true  		for _, player in pairs(Players:GetPlayers()) do 			if player ~= localPlayer then 				createTracer(player, color) 			end 		end  		playerAddedConn = Players.PlayerAdded:Connect(function(player) 			if player ~= localPlayer then 				createTracer(player, color) 			end 		end)  	elseif not enable and isEnabled then 		isEnabled = false  		for _, data in pairs(tracers) do 			if data.connection then data.connection:Disconnect() end 			if data.tracer then data.tracer:Remove() end 		end 		tracers = {}  		for player, conn in pairs(characterConnections) do 			if conn then conn:Disconnect() end 		end 		characterConnections = {}  		if playerAddedConn then 			playerAddedConn:Disconnect() 			playerAddedConn = nil 		end 	end end  function OF:On(color) 	EnableTracers(true, color) end  function OF:Off() 	EnableTracers(false) end  return OF ]]},
    {Name = "ESP Box", Function = [[local Library = {}  local settings = {    defaultcolor = Color3.fromRGB(255, 0, 0),    teamcheck = false,    teamcolor = false }  local runService = game:GetService("RunService") local players = game:GetService("Players") local localPlayer = players.LocalPlayer local camera = workspace.CurrentCamera  local newVector2, newDrawing = Vector2.new, Drawing.new local tan, rad = math.tan, math.rad  local function round(...)      local a = {}      for i, v in next, table.pack(...) do          a[i] = math.round(v)      end      return unpack(a)  end  local function wtvp(...)      local a, b = camera:WorldToViewportPoint(...)      return newVector2(a.X, a.Y), b, a.Z  end  local espCache = {} local characterConnections = {} local playerAddedConnection = nil local isEnabled = false  local function createEsp(player, color)     if espCache[player] then return end      local drawings = {}     drawings.box = newDrawing("Square")     drawings.box.Thickness = 1     drawings.box.Filled = false     drawings.box.Color = color     drawings.box.Visible = false     drawings.box.ZIndex = 2      drawings.boxoutline = newDrawing("Square")     drawings.boxoutline.Thickness = 3     drawings.boxoutline.Filled = false     drawings.boxoutline.Color = color     drawings.boxoutline.Visible = false     drawings.boxoutline.ZIndex = 1      espCache[player] = drawings end  local function removeEsp(player)     if espCache[player] then         for _, drawing in pairs(espCache[player]) do             drawing:Remove()         end         espCache[player] = nil     end      if characterConnections[player] then         characterConnections[player]:Disconnect()         characterConnections[player] = nil     end end  local function updateEsp(player, esp)     local character = player.Character     if character and character:FindFirstChild("HumanoidRootPart") then         local cframe = character:GetPivot()         local position, visible, depth = wtvp(cframe.Position)          esp.box.Visible = visible         esp.boxoutline.Visible = visible          if visible then             local scaleFactor = 1 / (depth * tan(rad(camera.FieldOfView / 2)) * 2) * 1000             local width, height = round(4 * scaleFactor, 5 * scaleFactor)             local x, y = round(position.X, position.Y)              esp.box.Size = newVector2(width, height)             esp.box.Position = newVector2(x - width / 2, y - height / 2)             esp.box.Color = settings.teamcolor and player.TeamColor.Color or settings.defaultcolor              esp.boxoutline.Size = esp.box.Size             esp.boxoutline.Position = esp.box.Position         end     else         esp.box.Visible = false         esp.boxoutline.Visible = false     end end  function Library:On(color)     if isEnabled then return end     isEnabled = true      if color then settings.defaultcolor = color end      for _, player in pairs(players:GetPlayers()) do         if player ~= localPlayer then             createEsp(player, settings.defaultcolor)              characterConnections[player] = player.CharacterAdded:Connect(function()                 task.wait(1)                 createEsp(player, settings.defaultcolor)             end)         end     end      playerAddedConnection = players.PlayerAdded:Connect(function(player)         if player ~= localPlayer then             createEsp(player, settings.defaultcolor)              characterConnections[player] = player.CharacterAdded:Connect(function()                 task.wait(1)                 createEsp(player, settings.defaultcolor)             end)         end     end) end  runService:BindToRenderStep("esp", Enum.RenderPriority.Camera.Value, function()     if not isEnabled then return end      for player, drawings in pairs(espCache) do         if settings.teamcheck and player.Team == localPlayer.Team then             drawings.box.Visible = false             drawings.boxoutline.Visible = false         else             updateEsp(player, drawings)         end     end end)  function Library:Off()     if not isEnabled then return end     isEnabled = false      for player, _ in pairs(espCache) do         removeEsp(player)     end      if playerAddedConnection then         playerAddedConnection:Disconnect()         playerAddedConnection = nil     end end  return Library ]]},
    {Name = "X-ray", Function = [[local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local Camera = workspace.CurrentCamera  local Run = {} local MarkerName = "XRayMarker" local DescendantConnection = nil  function ApplyXRayToPart(part) 	if part:IsA("BasePart") and not part:FindFirstChild(MarkerName) and part.Transparency < 1 then 		local marker = Instance.new("NumberValue") 		marker.Name = MarkerName 		marker.Value = part.Transparency 		marker.Parent = part  		part.Transparency = 0.5 	end end  function CreateESP() 	for _, obj in ipairs(game:GetDescendants()) do 		ApplyXRayToPart(obj) 	end  	DescendantConnection = game.DescendantAdded:Connect(function(obj) 		ApplyXRayToPart(obj) 	end) end  function Run:On() 	CreateESP() end  function Run:Off() 	for _, obj in ipairs(game:GetDescendants()) do 		if obj:IsA("BasePart") then 			local marker = obj:FindFirstChild(MarkerName) 			if marker then 				obj.Transparency = marker.Value 				marker:Destroy() 			end 		end 	end  	if DescendantConnection then 		DescendantConnection:Disconnect() 		DescendantConnection = nil 	end end  return Run ]]},
}
for Index, Value in pairs(ESP) do
    local EspRaw = loadstring(Value.Function)()
    if EspRaw then
        if Value.Name ~= "X-ray" then
            local Color = Color3.new(1,1,1)
            local Group = PVisual:CreateGroup(Value.Name, Icons.crosshairs, Index < 6 and "Left" or "Right")
            local IsEnabled = false
            
            local Toggle = Group:CreateToggle({Name = Value.Name, CurrentValue = false, Flag = Value.Name, Callback = function(Value)
                IsEnabled = Value
                if Value then 
                    EspRaw:On(Color)
                else
                    EspRaw:Off()
                end
            end})
            Group:CreateColorPicker({Name = Value.Name.." Color", Color = Color, Flag = "ColorPicker1", Callback = function(Value)
                Color = Value
                if IsEnabled then
                    Toggle:Set(false)
                    Toggle:Set(true)
                end
            end})
        else
            local Group = PVisual:CreateGroup(Value.Name, Icons.ghost, Index < 6 and "Left" or "Right")
            local Toggle = Group:CreateToggle({Name = Value.Name, CurrentValue = false, Flag = Value.Name, Callback = function(Value)
                if Value then 
                    EspRaw:On(Color)
                else
                    EspRaw:Off()
                end
            end})
        end
    end
end

local clock = os.clock()
RunService.Heartbeat:Connect(function()
    local char = plr.Character
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if Settings["EnabledFPSCap"] then
    	if os.clock() - clock < 1 / Settings["FPSLimit"] then
    		repeat
    		until os.clock() - clock >= 1 / Settings["FPSLimit"]
    	end
    	clock = os.clock()
    end
    if hum and hrp then
        if Settings["PartInAir"] then
            if hum.RigType == Enum.HumanoidRigType.R6 then
            	Settings["PartInAir"].Position = hrp.Position + Vector3.new(0, -3.5, 0)
        	else
            	Settings["PartInAir"].Position = hrp.Position + Vector3.new(0, -hum.HipHeight - hrp.Size.Y + ((hrp.Size.Y - 1) / 2), 0)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(2)
        if Settings["AutoRejoinAfter15min"] then
            Settings["RejoinTimer"] = Settings["RejoinTimer"] + 2
        end
        if Settings["RejoinTimer"] >= 900 then
            local Players = game:GetService("Players")
            local TeleportService = game:GetService("TeleportService")
                
            if Settings["AutoExecute"] then
                local queue =
                    (getgenv and getgenv().queue_on_teleport)
                    or queue_on_teleport
                    or (syn and syn.queue_on_teleport)
                    or (fluxus and fluxus.queue_on_teleport)
                
                queue([[
                    repeat task.wait() until game:IsLoaded()
                    task.wait(3)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Talyer.lua"))()
                ]])
            end
            TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
            break
        end
    end
end)
