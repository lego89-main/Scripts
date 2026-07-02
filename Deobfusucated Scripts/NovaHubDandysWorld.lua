-- este projeto esta sendo feito por nexustester

local _syn = getgenv().syn

getgenv().syn = false

local v2 = loadstring(game:HttpGet('https://pastebin.com/raw/AnN9uUxa'))()

getgenv().syn = _syn

local v3 = v2:MakeWindow({
    Name = "Nova Hub - Dandys",
    IntroText = 'Welcome!',
    IntroIcon = 'rbxassetid://72299946998070',
})
local v4 = v3:MakeTab({
    Name = 'Main',
    Icon = 'rbxassetid://101170905357603',
})
local v5 = v3:MakeTab({
    Name = 'Teleports',
    Icon = 'rbxassetid://129997161088994',
})
local v6 = v3:MakeTab({
    Name = 'Credits',
    Icon = 'rbxassetid://123383921109662',
})
local _Players = game.Players
local _LocalPlayer = game.Players.LocalPlayer
local _RunService = game:GetService('RunService')
local _VirtualInputManager = game:GetService('VirtualInputManager')
local _Lighting = game:GetService('Lighting')
local u12 = nil

getgenv().settings = {
    monsters = false,
    generators = false,
    players = false,
    items = false,
    speed = false,
    aura = false,
    skillcheck = false,
    autofarm = false,
    instant_skillcheck = false,
    autovote = false,
    autobuy = false,
    firestop = false,
    pickup = false,
    safetp = false,
}

local function u19()
    local v13 = _Players
    local v14, v15, v16 = pairs(v13:GetPlayers())
    local v17 = {}

    while true do
        local v18

        v16, v18 = v14(v15, v16)

        if v16 == nil then
            break
        end
        if v18 ~= _LocalPlayer then
            table.insert(v17, v18.Name)
        end
    end

    return v17
end
local function u22(p20)
    local v21 = _Players:FindFirstChild(p20)

    if v21 and v21.Character and v21.Character:FindFirstChild('HumanoidRootPart') then
        _LocalPlayer.Character:MoveTo(v21.Character.HumanoidRootPart.Position)
    end
end

v4:AddToggle({
    Name = 'Speedhack',
    Default = false,
    Callback = function(p23)
        getgenv().settings.speed = p23

        while getgenv().settings.speed do
            local v24 = _RunService.Heartbeat:Wait()

            if _LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                _LocalPlayer.Character:TranslateBy(_LocalPlayer.Character.Humanoid.MoveDirection * 2 * v24 * 10)
            end
        end
    end,
})

if game.PlaceId ~= 16552821455 then
    if game.PlaceId == 16116270224 then
        local v25, v26, v27 = pairs(game:GetService('ReplicatedStorage').TowerData:GetChildren())
        local u28 = _LocalPlayer
        local v29 = {}

        while true do
            local v30

            v27, v30 = v25(v26, v27)

            if v27 == nil then
                break
            end

            table.insert(v29, v30.Name)
        end

        local v31, v32, v33 = pairs(game:GetService('ReplicatedStorage').TrinketData:GetChildren())
        local v34 = {}

        while true do
            local v35

            v33, v35 = v31(v32, v33)

            if v33 == nil then
                break
            end

            table.insert(v34, v35.Name)
        end

        v4:AddDropdown({
            Name = 'Buy Towers',
            Default = '',
            Options = v29,
            Callback = function(p36)
                game:GetService('ReplicatedStorage'):WaitForChild('BuyTower'):InvokeServer(p36)
            end,
        })
        v4:AddDropdown({
            Name = 'Buy Trinkets',
            Default = '',
            Options = v34,
            Callback = function(p37)
                game:GetService('ReplicatedStorage'):WaitForChild('BuyTrinket'):InvokeServer(p37)
            end,
        })
        v5:AddDropdown({
            Name = 'Elevators',
            Default = '',
            Options = {
                'Elevator #1',
                'Elevator #2',
                'Elevator #3',
            },
            Callback = function(p38)
                if p38 == 'Elevator #1' then
                    u28.Character.HumanoidRootPart.CFrame = CFrame.new(-33, 23, -93)
                elseif p38 == 'Elevator #2' then
                    u28.Character.HumanoidRootPart.CFrame = CFrame.new(14, 23, -141)
                elseif p38 == 'Elevator #3' then
                    u28.Character.HumanoidRootPart.CFrame = CFrame.new(63, 23, -92)
                end
            end,
        })
        v5:AddButton({
            Name = 'Shop',
            Callback = function()
                u28.Character.HumanoidRootPart.CFrame = CFrame.new(-0, 20, 21)
            end,
        })

        u12 = v5:AddDropdown({
            Name = 'Players',
            Default = '',
            Options = u19(),
            Callback = function(p39)
                u22(p39)
            end,
        })
    end
else
    local function u43(p40, p41)
        local _Highlight = Instance.new('Highlight')

        _Highlight.Name = 'ESP'
        _Highlight.Parent = p40
        _Highlight.FillColor = p41
    end

    -- ===== CONSTANTS & DATA (PORTED) =====
    local C = {
        VOTE_SPAM_INTERVAL     = 0.5,
        BUY_COOLDOWN           = 0.8,
        GEN_TENDRIL_SAFE       = 18,
        TELEPORT_HEIGHT        = 4,
        ICON_LOOP_DELAY        = 0.1,
        FARM_LOOP_DELAY        = 0.1,
        TARGET_FOLDER          = "CurrentRoom",
        MODEL_NAME             = "FakeElevator",
        BASE_NAME              = "Base",
        STAMINA_STOP_THRESHOLD = 70,
        STAMINA_START_THRESHOLD= 71,
        DETECTOR_RADIUS        = 35,
        ITEM_MONSTER_RADIUS    = 15,
        PICKUP_LOOP_INTERVAL   = 1.5,
        BASE_TP_COOLDOWN       = 2.0,
        PANIC_COOLDOWN         = 1,
    }
    local MONSTER_RADIUS = {
        DandyMonster=85, DyleMonster=85, SproutMonster=85,
        ScrapsMonster=45, GoobMonster=45, RazzleDazzleMonster=85,
        RodgerMonster=85, SquirmMonster=85,
    }
    local SPECIAL_MONSTERS = {
        DandyMonster={Range=50}, DyleMonster={Range=55},
        SproutMonster={Range=40}, ScrapsMonster={Range=35},
        GoobMonster={Range=35}, RazzleDazzleMonster={Range=40},
        RodgerMonster={Range=30}, SquirmMonster={Range=55},
    }
    local FARM_IGNORE  = {"RazzleDazzleMonster","ConnieMonster","RodgerMonster","BlottMonster","SquirmMonster"}
    local GRAB_NAMES   = {"MonsterScrapsGrab","MonsterGigiGrab","MonsterGoobGrab"}
    local TENDRIL_LIKE = {"SproutTendril","BlotHand","BlotHand_L","BlotHand_R"}
    local HEAL_CARDS   = {Heal2=true, Heal=true}
    local CARD_PRIORITY = {
        DyleFloor=1, Heal2=2, Heal=2, Elevator=2, Elevator2=2,
        FrostShield=2, Glowlight=2, AbilityCooldown=2, AbilityCooldown2=2,
        DandyDiscount=2, PipingTape=2, PollenShield=2, Stamina=2,
        Stamina2=2, Machine=2, Blackout=2, RandomItem=3, RandomItem2=3,
    }
    local BUY_PRIORITY = {
        {name="Bandage",tier=1},{name="HealthKit",tier=1},
        {name="JumperCable",tier=2},{name="Valve",tier=2},
        {name="SmokeBomb",tier=2},
    }
    local BUY_BLACKLIST = {
        {name="PopBottle",bl=true},{name="Pop",bl=true},
        {name="Instructions",bl=true},{name="EjectButton",bl=true},
        {name="Stopwatch",bl=true},
    }
    local PICKUP_CFG = {
        {name="Bandage",bl=false},{name="HealthKit",bl=false},
        {name="Tape",bl=false},{name="ResearchCapsule",bl=false},
        {name="JumperCable",bl=false},{name="Bonbon",bl=false},
        {name="Chocolate",bl=false},{name="ChocolateBox",bl=false},
        {name="ExtractionSpeedCandy",bl=false},{name="Gumball",bl=false},
        {name="Jawbreaker",bl=false},{name="Pop",bl=true},
        {name="PopBottle",bl=true},{name="SkillCheckCandy",bl=false},
        {name="SpeedCandy",bl=false},{name="StaminaCandy",bl=false},
        {name="Valve",bl=false},{name="Stopwatch",bl=false},
        {name="Instructions",bl=false},{name="StealthCandy",bl=false},
        {name="ProteinBar",bl=false},{name="AirHorn",bl=false},
        {name="SmokeBomb",bl=false},
    }
    local S_INTERNAL = {
        stopFireActive     = false,
        isSprinting        = false,
        sprintLoopActive   = false,
        PICKING_UP         = false,
        activeTween        = nil,
        skillcheckOrigCB   = nil,
        lastVoteTime       = 0,
        lastBuyTime        = 0,
        lastIconTeleport   = 0,
        lastFarmTeleport   = 0,
        lastFarmBaseTP     = 0,
        lastPanicTeleport  = 0,
    }

    -- ===== HELPER FUNCTIONS (PORTED) =====
    local function GetInvStats()
        local res = {isFull=false, healingCount=0, noSlots=false}
        local igp = workspace:FindFirstChild("InGamePlayers")
        local pm  = igp and igp:FindFirstChild(_LocalPlayer.Name)
        local inv = pm and pm:FindFirstChild("Inventory")
        if not inv then res.noSlots=true; return res end
        local total, occ = 0, 0
        for i = 1, 4 do
            local slot = inv:FindFirstChild("Slot"..i)
            if slot and slot:IsA("StringValue") then
                total += 1
                local cv = (slot.Value=="" or slot.Value=="None") and "None" or slot.Value
                if cv ~= "None" then
                    occ += 1
                    if cv=="HealthKit" or cv=="Bandage" then res.healingCount += 1 end
                end
            end
        end
        if total == 0 then res.noSlots = true end
        res.isFull = total > 0 and occ == total
        return res
    end

    local function GetEnabledPickup()
        local t = {}
        for _, cfg in ipairs(PICKUP_CFG) do
            if not cfg.bl then t[#t+1] = cfg.name end
        end
        return t
    end

    local function GetCurrentStamina()
        local igp = workspace:FindFirstChild("InGamePlayers")
        local pm  = igp and igp:FindFirstChild(_LocalPlayer.Name)
        local st  = pm and pm:FindFirstChild("Stats")
        local cs  = st and st:FindFirstChild("CurrentStamina")
        if cs and cs:IsA("NumberValue") then return cs.Value end
        return math.huge
    end

    local function IsFloorActive()
        local info = workspace:FindFirstChild("Info")
        local fa = info and info:FindFirstChild("FloorActive")
        return fa and fa:IsA("BoolValue") and fa.Value
    end

    local function IsDandyStoreOpen()
        local info = workspace:FindFirstChild("Info")
        local ds = info and info:FindFirstChild("DandyStoreOpen")
        return ds and ds:IsA("BoolValue") and ds.Value
    end

    local function IsCardVoting()
        local info = workspace:FindFirstChild("Info")
        local cv = info and info:FindFirstChild("CardVoting")
        return cv and cv:IsA("BoolValue") and cv.Value
    end

    local function GetFloorActiveValue()
        local info = workspace:FindFirstChild("Info")
        if not info then return nil end
        return info:FindFirstChild("FloorActive")
    end

    local function GetDecodingValue()
        local igp = workspace:FindFirstChild("InGamePlayers")
        local cig = igp and igp:FindFirstChild(_LocalPlayer.Name)
        return cig and cig:FindFirstChild("Decoding")
    end

    local function GetActiveGen()
        local dv = GetDecodingValue()
        if not dv then return nil end
        local g = dv.Value
        if not g or not g:IsA("Model") or g.Name ~= "Generator" then return nil end
        return g
    end

    local _baseCacheObj, _baseCacheTime = nil, 0
    local function FindBase()
        local now = tick()
        if _baseCacheObj and _baseCacheObj.Parent and (now - _baseCacheTime) < 2.0 then
            return _baseCacheObj
        end
        _baseCacheObj = nil
        local folder = workspace:FindFirstChild(C.TARGET_FOLDER) or workspace
        for _, d in ipairs(folder:GetDescendants()) do
            if d:IsA("Model") and d.Name == C.MODEL_NAME then
                local base = d:FindFirstChild("Base")
                if base and base:IsA("BasePart") then
                    _baseCacheObj = base; _baseCacheTime = now; return base
                end
            end
        end
        return nil
    end

    local function FindPanicBase()
        local elevs = workspace:FindFirstChild("Elevators"); if not elevs then return nil end
        local elev  = elevs:FindFirstChild("Elevator"); if not elev then return nil end
        local b = elev:FindFirstChild("Base")
        return (b and b:IsA("BasePart")) and b or nil
    end

    local function InBaseBounds(base, pos)
        if not base then return false end
        local lp = base.CFrame:PointToObjectSpace(pos)
        return math.abs(lp.X) <= (base.Size.X/2-1.2) and
               math.abs(lp.Z) <= (base.Size.Z/2-1.2)
    end

    local function IsMonsterNearPos(pos, radius)
        for _, obj in ipairs(workspace:GetDescendants()) do
            if not obj:IsA("Model") then continue end
            if not (obj.Name:find("Monster") or SPECIAL_MONSTERS[obj.Name]) then continue end
            if table.find(FARM_IGNORE, obj.Name) then continue end
            if table.find(GRAB_NAMES, obj.Name) then continue end
            local prim = obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart")
            if prim and (pos - prim.Position).Magnitude <= radius then return true end
        end
        return false
    end

    local function IsGenSafe(gen)
        local gp = gen:GetPivot().Position
        for _, obj in ipairs(workspace:GetDescendants()) do
            if table.find(TENDRIL_LIKE, obj.Name) and obj:IsA("Model") then
                local tp = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
                if tp then
                    local diff = tp.Position - gp
                    if Vector2.new(diff.X, diff.Z).Magnitude <= C.GEN_TENDRIL_SAFE
                       and math.abs(diff.Y) <= 30 then return false end
                end
            end
        end
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Humanoid") and obj.Parent:IsA("Model")
               and not game.Players:GetPlayerFromCharacter(obj.Parent) then
                if table.find(FARM_IGNORE, obj.Parent.Name) then continue end
                local mr = obj.Parent.PrimaryPart or obj.Parent:FindFirstChild("HumanoidRootPart")
                if mr then
                    local radius = MONSTER_RADIUS[obj.Parent.Name] or C.DETECTOR_RADIUS
                    if (gp - mr.Position).Magnitude <= radius then
                        local base = FindBase()
                        if base and (base.Position - mr.Position).Magnitude <= radius then continue end
                        return false
                    end
                end
            end
        end
        return true
    end

    local function GetGenThreats(gp)
        local mc, tc, bc = 0, 0, 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if not obj:IsA("Model") then continue end
            if table.find(TENDRIL_LIKE, obj.Name) then
                local tp = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
                if tp then
                    local diff = tp.Position - gp
                    if Vector2.new(diff.X, diff.Z).Magnitude <= C.GEN_TENDRIL_SAFE
                       and math.abs(diff.Y) <= 30 then
                        if obj.Name == "SproutTendril" then tc+=1 else bc+=1 end
                    end
                end
            elseif obj.Name:find("Monster") or SPECIAL_MONSTERS[obj.Name] then
                local mr2 = obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart")
                if mr2 then
                    local radius = MONSTER_RADIUS[obj.Name] or C.DETECTOR_RADIUS
                    if (gp - mr2.Position).Magnitude <= radius then
                        local base = FindBase()
                        if base and (base.Position - mr2.Position).Magnitude <= radius then continue end
                        if not table.find(FARM_IGNORE, obj.Name) then mc+=1 end
                    end
                end
            end
        end
        return mc, tc, bc
    end

    local function FindGenPipePart(gen)
        for _, part in ipairs(gen:GetDescendants()) do
            if part:IsA("BasePart") and part.Name == "Pipe" then return part end
        end
        return nil
    end

    local function FindGenTeleportPosition(gen)
        for _, part in ipairs(gen:GetDescendants()) do
            if part:IsA("BasePart") and
               (part.Name == "TeleportPosition" or part.Name == "TeleportPos") then
                return part
            end
        end
        return nil
    end

    local function GetGenTeleportCFrame(gen)
        local tp = FindGenTeleportPosition(gen)
        if tp then return tp.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0) end
        local prim = gen.PrimaryPart or gen:FindFirstChildWhichIsA("BasePart", true)
        if prim then return CFrame.new(prim.Position + Vector3.new(0, C.TELEPORT_HEIGHT, 0)) end
        return nil
    end

    local function GetAvailableItems()
        local items, inv, ep = {}, GetInvStats(), GetEnabledPickup()
        local healTypes = {"Bandage","HealthKit"}
        for _, folder in ipairs(workspace:GetDescendants()) do
            if folder.Name == "Items" and folder:IsA("Folder") then
                for _, item in ipairs(folder:GetChildren()) do
                    if table.find(ep, item.Name) then
                        if inv.healingCount >= 2 and table.find(healTypes, item.Name) then continue end
                        if inv.isFull and item.Name ~= "Tape" and item.Name ~= "ResearchCapsule" then continue end
                        local handle = item:IsA("BasePart") and item or item:FindFirstChildWhichIsA("BasePart", true)
                        if handle and IsMonsterNearPos(handle.Position, C.ITEM_MONSTER_RADIUS) then continue end
                        items[#items+1] = item
                    end
                end
            end
        end
        return items
    end

    local function FireSprint(state)
        pcall(function() game:GetService("ReplicatedStorage").Events.SprintEvent:FireServer(state) end)
        S_INTERNAL.isSprinting = state
    end

    local function StartSprintLoop()
        if S_INTERNAL.sprintLoopActive then return end
        S_INTERNAL.sprintLoopActive = true
        task.spawn(function()
            while S_INTERNAL.sprintLoopActive do
                task.wait(0.25)
                local ag = GetActiveGen()
                local fa = IsFloorActive()
                if not ((ag ~= nil) or (not fa)) then
                    if S_INTERNAL.isSprinting then pcall(function() FireSprint(false) end) end
                    S_INTERNAL.sprintLoopActive = false; return
                end
                local stam = GetCurrentStamina()
                if stam <= C.STAMINA_STOP_THRESHOLD then
                    if S_INTERNAL.isSprinting then pcall(function() FireSprint(false) end) end
                elseif stam > C.STAMINA_START_THRESHOLD then
                    if not S_INTERNAL.isSprinting then pcall(function() FireSprint(true) end) end
                end
            end
            if S_INTERNAL.isSprinting then pcall(function() FireSprint(false) end) end
        end)
    end

    local function FireStopGen(gen)
        local s = gen:FindFirstChild("Stats"); if not s then return end
        local r = s:FindFirstChild("StopInteracting")
        if r then pcall(function() r:FireServer("Stop") end) end
    end

    local function StartStopFireLoop()
        if S_INTERNAL.stopFireActive or not getgenv().settings.firestop then return end
        S_INTERNAL.stopFireActive = true
        task.spawn(function()
            while true do
                local cg = GetActiveGen()
                if not cg then S_INTERNAL.stopFireActive = false; return end
                local _, tc, bc = GetGenThreats(cg:GetPivot().Position)
                local icon = _LocalPlayer.PlayerGui:FindFirstChild("MonsterIcon", true)
                if (tc+bc) == 0 and not (icon and icon.ImageTransparency == 0) then
                    S_INTERNAL.stopFireActive = false; return
                end
                FireStopGen(cg); task.wait(0.1)
            end
        end)
    end

    local function DoPickupItem(hrp, item)
        local handle = item:IsA("BasePart") and item or item:FindFirstChildWhichIsA("BasePart", true)
        if not handle or not handle.Parent then return false end
        local pos = handle.Position
        
        -- Collision bypass
        for _, p in ipairs(_LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
        
        hrp.CFrame = CFrame.new(pos.X, pos.Y - 2, pos.Z)
        task.wait(0.22)
        if not handle.Parent then 
            for _, p in ipairs(_LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
            return false 
        end
        for _, p in ipairs(item:GetDescendants()) do
            if p:IsA("ProximityPrompt") then
                p.HoldDuration = 0
                fireproximityprompt(p)
            end
        end
        task.wait(0.18)
        for _, p in ipairs(_LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
        return true
    end

    local function RunPickupBatch(hrp)
        local items = GetAvailableItems()
        if not items or #items == 0 then return end
        S_INTERNAL.PICKING_UP = true
        for _, item in ipairs(items) do
            if not getgenv().settings.pickup then break end
            if GetActiveGen() then break end
            local icon = _LocalPlayer.PlayerGui:FindFirstChild("MonsterIcon", true)
            local vis  = icon and math.floor((1 - icon.ImageTransparency) * 100) or 0
            if vis > 99 then break end
            DoPickupItem(hrp, item)
            task.wait(0.1)
        end
        S_INTERNAL.PICKING_UP = false
    end

    -- ===== FEATURE FUNCTIONS (PORTED) =====

    local function ApplyInstantSkillcheck(state)
        local ok, hi = pcall(function() return game:GetService("ReplicatedStorage").Events.SkillcheckUpdate end)
        if not ok or not hi then return end
        if state then
            if getcallbackvalue then
                local ok2, orig = pcall(function() return getcallbackvalue(hi,"OnClientInvoke") end)
                if ok2 and orig then S_INTERNAL.skillcheckOrigCB = orig end
            end
            hi.OnClientInvoke = function()
                task.spawn(function()
                    pcall(function()
                        local gui   = _LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
                        local menu  = gui.Menu
                        menu.SkillCheckFrame.Visible = false
                        menu.Calibrate.Visible = false
                        gui.Correct:Play(); gui.GoldAreaHit:Play()
                        menu.SkillCheckMessage.Text = "Great Job!"
                        menu.SkillCheckMessage.UIGradient.Enabled = false
                        menu.SkillCheckMessage.UIGradientWin.Enabled = true
                        menu.SkillCheckMessage.Visible = true
                        menu.SkillCheckMessage.TextTransparency = 0
                        task.wait(1)
                        game:GetService("TweenService"):Create(menu.SkillCheckMessage, TweenInfo.new(1),
                            {TextTransparency=1, TextStrokeTransparency=1}):Play()
                    end)
                end)
                return "supercomplete"
            end
        else
            if S_INTERNAL.skillcheckOrigCB then
                hi.OnClientInvoke = S_INTERNAL.skillcheckOrigCB; S_INTERNAL.skillcheckOrigCB = nil
            else hi.OnClientInvoke = nil end
        end
    end

    local function DoAutoVote()
        if tick() - S_INTERNAL.lastVoteTime < C.VOTE_SPAM_INTERVAL then return end
        S_INTERNAL.lastVoteTime = tick()
        if not IsCardVoting() then return end
        local inv  = GetInvStats()
        local igp  = workspace:FindFirstChild("InGamePlayers")
        local pm   = igp and igp:FindFirstChild(_LocalPlayer.Name)
        local stF  = pm and pm:FindFirstChild("Stats")
        local hpS  = stF and stF:FindFirstChild("Health")
        local mhS  = stF and stF:FindFirstChild("MaxHealth")
        local hp   = hpS and hpS.Value or 4
        local mhp  = mhS and mhS.Value or 4
        local full = (hp >= mhp)
        local info = workspace:FindFirstChild("Info"); if not info then return end
        local ch   = info:FindFirstChild("CardHolder") or info:FindFirstChild("Cards")
        if not ch then return end
        local best, bestT = nil, 999
        for _, card in ipairs(ch:GetChildren()) do
            local t = CARD_PRIORITY[card.Name] or 4
            if HEAL_CARDS[card.Name] and full then t = 5 end
            if t < bestT then bestT = t; best = card end
        end
        if best then pcall(function() game:GetService("ReplicatedStorage").Events.VoteCard:FireServer(best) end) end
    end

    local function DoAutoBuy(hrp)
        if not hrp then return end
        if tick() - S_INTERNAL.lastBuyTime < C.BUY_COOLDOWN then return end
        if not IsDandyStoreOpen() then return end
        local inv = GetInvStats()
        local best, bestT = nil, math.huge
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                local iname = (obj.Parent and obj.Parent.Name) or ""
                local bl = false
                for _, b in ipairs(BUY_BLACKLIST) do
                    if b.name == iname and b.bl then bl=true; break end
                end
                if bl then continue end
                if (iname=="Bandage" or iname=="HealthKit") and inv.healingCount >= 2 then continue end
                local tier = 999
                for _, bp in ipairs(BUY_PRIORITY) do
                    if bp.name == iname then tier = bp.tier; break end
                end
                if tier >= 999 then continue end
                local part = obj.Parent:IsA("BasePart") and obj.Parent
                          or obj.Parent:FindFirstChildWhichIsA("BasePart", true)
                if part and (hrp.Position - part.Position).Magnitude <= 20 and tier < bestT then
                    bestT = tier; best = obj
                end
            end
        end
        if best then
            S_INTERNAL.lastBuyTime = tick()
            best.HoldDuration = 0
            fireproximityprompt(best)
        end
    end

    local function DoNormalAutoFarm(hrp, base, vis, panic, fav, activeGen)
        if not getgenv().settings.autofarm then return end
        if not fav or not fav.Value then return end
        if vis > 99 or panic then return end
        if S_INTERNAL.PICKING_UP then return end
        if tick() - S_INTERNAL.lastFarmTeleport < C.FARM_LOOP_DELAY then return end
        S_INTERNAL.lastFarmTeleport = tick()
        if activeGen then
            local cv = activeGen:FindFirstChild("Connie", true)
            if (cv and cv:IsA("BoolValue") and cv.Value) or not IsGenSafe(activeGen) then
                if getgenv().settings.safetp and base and not InBaseBounds(base, hrp.Position) then
                    hrp.CFrame = base.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
                end
            else
                local pipe = FindGenPipePart(activeGen)
                if pipe then hrp.CFrame = pipe.CFrame
                else
                    local cf = GetGenTeleportCFrame(activeGen)
                    if cf then hrp.CFrame = cf end
                end
            end
            return
        end
        local gens = {}
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == "Generator" and obj:IsA("Model") then
                local cv = obj:FindFirstChild("Connie", true)
                if cv and cv:IsA("BoolValue") and cv.Value then continue end
                local st = obj:FindFirstChild("Stats"); if not st then continue end
                local comp = st:FindFirstChild("Completed")
                if comp and comp.Value then continue end
                local ap = st:FindFirstChild("ActivePlayer")
                if ap and ap.Value ~= nil and ap.Value ~= "" and ap.Value ~= _LocalPlayer.Name then continue end
                if IsGenSafe(obj) then gens[#gens+1] = obj end
            end
        end
        if #gens == 0 then
            if getgenv().settings.safetp and base and not InBaseBounds(base, hrp.Position) then
                if tick() - S_INTERNAL.lastFarmBaseTP >= C.BASE_TP_COOLDOWN then
                    S_INTERNAL.lastFarmBaseTP = tick()
                    hrp.CFrame = base.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
                end
            end
            return
        end
        local closest, closestD = nil, math.huge
        for _, g in ipairs(gens) do
            local d = (hrp.Position - g:GetPivot().Position).Magnitude
            if d < closestD then closestD=d; closest=g end
        end
        if not closest then return end
        local tpPart = FindGenTeleportPosition(closest)
        if tpPart then
            hrp.CFrame = tpPart.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
            task.wait(0.2)
            for _, p in ipairs(closest:GetDescendants()) do
                if p:IsA("ProximityPrompt") then
                    p.HoldDuration = 0
                    fireproximityprompt(p)
                end
            end
        else
            if getgenv().settings.safetp and base and not InBaseBounds(base, hrp.Position) then
                if tick() - S_INTERNAL.lastFarmBaseTP >= C.BASE_TP_COOLDOWN then
                    S_INTERNAL.lastFarmBaseTP = tick()
                    hrp.CFrame = base.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
                end
            end
        end
    end
    local function u75()
        pcall(function()
            local v44, v45, v46 = pairs(game.Workspace:WaitForChild('CurrentRoom'):GetChildren())

            while true do
                local v47

                v46, v47 = v44(v45, v46)

                if v46 == nil then
                    break
                end
                if v47:IsA('Model') then
                    local function v61(p48, p49, p50, p51)
                        local v52 = p51 and p51:FindFirstChild(p48) or game.Workspace:FindFirstChild(p48)

                        if getgenv().settings[p50] then
                            local v53, v54, v55 = pairs(v52:GetChildren())

                            while true do
                                local v56

                                v55, v56 = v53(v54, v55)

                                if v55 == nil then
                                    break
                                end
                                if not v56:FindFirstChild('ESP') then
                                    u43(v56, p49)
                                end
                            end
                        else
                            local v57, v58, v59 = pairs(v52:GetDescendants())

                            while true do
                                local v60

                                v59, v60 = v57(v58, v59)

                                if v59 == nil then
                                    break
                                end
                                if v60.Name == 'ESP' and v60:IsA('Highlight') then
                                    v60:Destroy()
                                end
                            end
                        end
                    end

                    v61('InGamePlayers', Color3.new(0.235294, 0.247059, 1), 'players')
                    v61('Monsters', Color3.new(1, 0, 0), 'monsters', v47)

                    if getgenv().settings.generators then
                        local v62, v63, v64 = pairs(v47:WaitForChild('Generators'):GetChildren())

                        while true do
                            local v65

                            v64, v65 = v62(v63, v64)

                            if v64 == nil then
                                break
                            end
                            if not v65:FindFirstChild('ESP') then
                                u43(v65, Color3.new(0.643137, 0.643137, 0.643137))
                            end

                            local v66, v67, v68 = pairs(v65:GetDescendants())

                            while true do
                                local v69

                                v68, v69 = v66(v67, v68)

                                if v68 == nil then
                                    break
                                end
                                if v69.Name == 'Completed' and (v69:IsA('BoolValue') and v69.Value) then
                                    local _ESP = v65:FindFirstChild('ESP')

                                    if _ESP then
                                        _ESP.FillColor = Color3.new(0, 1, 0)
                                    end
                                end
                            end
                        end
                    else
                        local v71, v72, v73 = pairs(v47:WaitForChild('Generators'):GetDescendants())

                        while true do
                            local v74

                            v73, v74 = v71(v72, v73)

                            if v73 == nil then
                                break
                            end
                            if v74.Name == 'ESP' and v74:IsA('Highlight') then
                                v74:Destroy()
                            end
                        end
                    end

                    v61('Items', Color3.new(0, 1, 0.133333), 'items', v47)
                end
            end
        end)
    end
    local function u88()
        if getgenv().settings.aura then
            pcall(function()
                local v76, v77, v78 = pairs(game.Workspace:WaitForChild('CurrentRoom'):GetChildren())

                while true do
                    local v79

                    v78, v79 = v76(v77, v78)

                    if v78 == nil then
                        break
                    end

                    local v80, v81, v82 = pairs(v79:WaitForChild('Items'):GetChildren())

                    while true do
                        local v83

                        v82, v83 = v80(v81, v82)

                        if v82 == nil then
                            break
                        end

                        local v84, v85, v86 = pairs(v83:GetDescendants())

                        while true do
                            local v87

                            v86, v87 = v84(v85, v86)

                            if v86 == nil then
                                break
                            end
                            if v87.Name == 'ProximityPrompt' and (_LocalPlayer.Character.HumanoidRootPart.Position - v87.Parent.Position).Magnitude <= 6 then
                                fireproximityprompt(v87, 6)
                            end
                        end
                    end
                end
            end)
        end
    end

    local _SkillCheckFrame = _LocalPlayer.PlayerGui.ScreenGui:WaitForChild('Menu'):FindFirstChild('SkillCheckFrame')
    local v90 = _SkillCheckFrame
    local u91 = _SkillCheckFrame.FindFirstChild(v90, 'GoldArea')
    local v92 = _SkillCheckFrame
    local u93 = _SkillCheckFrame.FindFirstChild(v92, 'Marker')

    v4:AddToggle({
        Name = 'Item Aura',
        Default = false,
        Callback = function(p94)
            getgenv().settings.aura = p94

            u88()
        end,
    })

    local u95 = nil

    v4:AddButton({
        Name = 'Pickup All Capsules',
        Callback = function()
            pcall(function()
                u95 = _LocalPlayer.Character.HumanoidRootPart.CFrame

                local v96, v97, v98 = pairs(game.Workspace:WaitForChild('CurrentRoom'):GetChildren())

                while true do
                    local v99

                    v98, v99 = v96(v97, v98)

                    if v98 == nil then
                        break
                    end

                    local v100, v101, v102 = pairs(v99:WaitForChild('Items'):GetChildren())

                    while true do
                        local v103

                        v102, v103 = v100(v101, v102)

                        if v102 == nil then
                            break
                        end
                        if v103.Name == 'ResearchCapsule' then
                            _LocalPlayer.Character.HumanoidRootPart.CFrame = v103:FindFirstChild('Prompt').CFrame

                            wait(0.2)
                            fireproximityprompt(v103:FindFirstChild('Prompt'):FindFirstChild('ProximityPrompt'), 6)
                            wait(0.2)
                        end
                    end
                end

                wait(0.2)

                _LocalPlayer.Character.HumanoidRootPart.CFrame = u95
            end)
        end,
    })
    v4:AddToggle({
        Name = 'Auto Skillcheck',
        Default = false,
        Callback = function(p104)
            getgenv().settings.skillcheck = p104

            while getgenv().settings.skillcheck do
                pcall(function()
                    if _SkillCheckFrame.Visible == true and u93.AbsolutePosition.Magnitude >= u91.AbsolutePosition.Magnitude then
                        _VirtualInputManager:SendKeyEvent(true, 'Space', false, game)
                        _VirtualInputManager:SendKeyEvent(false, 'Space', false, game)
                    end

                    task.wait()
                end)
            end
        end,
    })
    v4:AddButton({
        Name = 'FullBright',
        Callback = function()
            _Lighting.Brightness = 2
            _Lighting.ClockTime = 14
            _Lighting.FogEnd = 100000
            _Lighting.GlobalShadows = false
            _Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end,
    })
    v4:AddSection({
        Name = 'ESP',
    })

    local v105, v106, v107 = ipairs({
        'Monsters',
        'Generators',
        'Items',
        'Players',
    })
    local u108 = u88
    local v109 = _RunService
    local u110 = _LocalPlayer

    while true do
        local u111

        v107, u111 = v105(v106, v107)

        if v107 == nil then
            break
        end

        v4:AddToggle({
            Name = u111,
            Default = false,
            Callback = function(p112)
                getgenv().settings[string.lower(u111)] = p112

                u75()
            end,
        })
    end

    v5:AddButton({
        Name = 'Generator',
        Callback = function()
            pcall(function()
                local v113, v114, v115 = pairs(game.Workspace:WaitForChild('CurrentRoom'):GetChildren())

                while true do
                    local v116

                    v115, v116 = v113(v114, v115)

                    if v115 == nil then
                        break
                    end

                    local v117, v118, v119 = pairs(v116:WaitForChild('Generators'):GetChildren())

                    while true do
                        local v120

                        v119, v120 = v117(v118, v119)

                        if v119 == nil then
                            break
                        end
                        if v120.Stats.Completed.Value ~= true then
                            local _Prompt = v120:FindFirstChild('Prompt')

                            if _Prompt and _Prompt:IsA('BasePart') then
                                u110.Character.HumanoidRootPart.CFrame = _Prompt.CFrame
                            end
                        end
                    end
                end
            end)
        end,
    })
    v5:AddButton({
        Name = 'Elevator',
        Callback = function()
            local _Elevators = workspace:FindFirstChild('Elevators')
            local v123 = _Elevators and _Elevators.Elevator:FindFirstChild('ForceZone')

            if v123 then
                u110.Character.HumanoidRootPart.CFrame = v123.CFrame
            end
        end,
    })

    u12 = v5:AddDropdown({
        Name = 'Players',
        Default = '',
        Options = u19(),
        Callback = function(p124)
            u22(p124)
        end,
    })

    local v_autofarm = v3:MakeTab({
        Name = 'Auto Farm',
        Icon = 'rbxassetid://16163351938',
    })

    v_autofarm:AddToggle({
        Name = 'Auto Farm',
        Default = false,
        Callback = function(v) getgenv().settings.autofarm = v end,
    })
    v_autofarm:AddToggle({
        Name = 'Instant Skillcheck',
        Default = false,
        Callback = function(v)
            getgenv().settings.instant_skillcheck = v
            ApplyInstantSkillcheck(v)
        end,
    })
    v_autofarm:AddToggle({
        Name = 'Auto Vote',
        Default = false,
        Callback = function(v) getgenv().settings.autovote = v end,
    })
    v_autofarm:AddToggle({
        Name = 'Auto Buy',
        Default = false,
        Callback = function(v) getgenv().settings.autobuy = v end,
    })
    v_autofarm:AddToggle({
        Name = 'Auto Stop Extracting',
        Default = false,
        Callback = function(v) getgenv().settings.firestop = v end,
    })
    v_autofarm:AddToggle({
        Name = 'Auto Pickup Items',
        Default = false,
        Callback = function(v) getgenv().settings.pickup = v end,
    })
    v_autofarm:AddToggle({
        Name = 'Teleport to Safe Area',
        Default = false,
        Callback = function(v) getgenv().settings.safetp = v end,
    })

    -- ===== LOOPS =====
    task.spawn(function()
        while true do
            task.wait(C.VOTE_SPAM_INTERVAL)
            if getgenv().settings.autovote then pcall(DoAutoVote) end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(C.PICKUP_LOOP_INTERVAL)
            if not getgenv().settings.pickup then continue end
            local char = _LocalPlayer.Character
            local hrp  = char and char.PrimaryPart
            if not hrp then continue end
            if not IsFloorActive() then continue end
            if GetActiveGen() then continue end
            local panic = workspace:FindFirstChild("Panic", true)
            if panic and panic:IsA("BoolValue") and panic.Value then continue end
            local icon = _LocalPlayer.PlayerGui:FindFirstChild("MonsterIcon", true)
            local vis  = icon and math.floor((1 - icon.ImageTransparency) * 100) or 0
            if vis > 99 then continue end
            RunPickupBatch(hrp)
        end
    end)

    v109.RenderStepped:Connect(function()
        pcall(function()
            u75()
            u108()

            local char = _LocalPlayer.Character
            if not char or not char.PrimaryPart then return end
            local hrp  = char.PrimaryPart
            local base = FindBase()
            local panic = (function()
                local p = workspace:FindFirstChild("Panic", true)
                return p and p:IsA("BoolValue") and p.Value
            end)()
            local fav    = GetFloorActiveValue()
            local favVal = fav and fav:IsA("BoolValue") and fav.Value
            local icon   = _LocalPlayer.PlayerGui:FindFirstChild("MonsterIcon", true)
            local vis    = icon and math.floor((1 - icon.ImageTransparency) * 100) or 0
            local isDanger = vis >= 1
            local activeGen = GetActiveGen()

            -- Sprint
            local needSprint = (activeGen ~= nil) or (not favVal)
            if needSprint and not S_INTERNAL.sprintLoopActive then StartSprintLoop()
            elseif not needSprint and S_INTERNAL.sprintLoopActive then
                S_INTERNAL.sprintLoopActive = false
                if S_INTERNAL.isSprinting then pcall(function() FireSprint(false) end) end
            end

            -- Auto Stop Extracting
            if getgenv().settings.firestop then
                local cg = GetActiveGen()
                if cg then
                    local _, tc, bc = GetGenThreats(cg:GetPivot().Position)
                    if (tc+bc) > 0 or (icon and icon.ImageTransparency == 0) then
                        StartStopFireLoop()
                    end
                end
            end

            -- Teleport to Safe Area
            if getgenv().settings.safetp and isDanger and not panic then
                if tick() - S_INTERNAL.lastIconTeleport >= C.ICON_LOOP_DELAY then
                    S_INTERNAL.lastIconTeleport = tick()
                    if base and not InBaseBounds(base, hrp.Position) then
                        hrp.CFrame = base.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
                    end
                end
            end

            -- Panic TP
            if panic then
                local pb = FindPanicBase()
                if pb and tick() - S_INTERNAL.lastPanicTeleport >= C.PANIC_COOLDOWN then
                    S_INTERNAL.lastPanicTeleport = tick()
                    hrp.CFrame = pb.CFrame * CFrame.new(0, C.TELEPORT_HEIGHT, 0)
                end
            end

            -- Auto Buy
            if getgenv().settings.autobuy then pcall(DoAutoBuy, hrp) end

            -- Auto Farm
            DoNormalAutoFarm(hrp, base, vis, panic, fav, activeGen)
        end)
    end)
end

v6:AddLabel('Made by Nexustester')
v6:AddLabel('For the discord Nova Hub')
v6:AddButton({
    Name = 'Discord Server',
    Callback = function()
        setclipboard('https://discord.gg/qf5sx2QFZH')
    end,
})

local function v125()
    u12:Refresh(u19(), true)
end

_Players.PlayerAdded:Connect(v125)
_Players.PlayerRemoving:Connect(v125)
v2:Init()
