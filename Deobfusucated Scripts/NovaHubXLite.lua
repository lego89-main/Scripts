--[[
    NOVA X Lite - MÁXIMO FPS (v2 - SEM LAG DE LOOP)
    Feito por: NexusTESTER | Corrigido

    CORREÇÃO v2:
    ✗ REMOVIDO: loop Heartbeat varrendo game:GetDescendants() todo frame (causava spike)
    ✗ REMOVIDO: RenderStepped checando FOV todo frame
    ✓ ADICIONADO: DescendantAdded (evento reativo = zero custo quando nada acontece)
    ✓ ADICIONADO: limpeza por batch com task.wait() a cada 200 itens
    ✓ MANTIDO: todas as otimizações visuais
]]

local Players     = game:GetService("Players")
local Lighting    = game:GetService("Lighting")
local Workspace   = game:GetService("Workspace")
local RunService  = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")
local Camera      = Workspace.CurrentCamera

local CONFIG = {
    FOV          = 50,
    QualityLevel = 1,
    MapColor     = Color3.fromRGB(140, 140, 140),
}

local PARTICLE_TYPES = {
    "ParticleEmitter", "Trail", "Smoke", "Sparkles", "Fire", "Beam"
}

if PlayerGui:FindFirstChild("NovaXLite") then
    PlayerGui.NovaXLite:Destroy()
end

-- ─── GUI ────────────────────────────────────────────────────────────────────
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NovaXLite"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 20, 0.5, -170)
MainFrame.Size = UDim2.new(0, 230, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 3)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 38)
Title.Position = UDim2.new(0, 10, 0, 4)
Title.Text = "⚡ NOVA X Lite"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, -10, 0, 16)
Sub.Position = UDim2.new(0, 10, 0, 38)
Sub.Text = "Lite FPS OPTIMIZER  v2"
Sub.TextColor3 = Color3.fromRGB(80, 80, 100)
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 10
Sub.BackgroundTransparency = 1
Sub.TextXAlignment = Enum.TextXAlignment.Left
Sub.Parent = MainFrame

local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -20, 0, 1)
Sep.Position = UDim2.new(0, 10, 0, 57)
Sep.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Sep.BorderSizePixel = 0
Sep.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -34, 0, 6)
CloseButton.Text = "✕"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 12
CloseButton.BorderSizePixel = 0
CloseButton.Parent = MainFrame
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 6)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 20)
StatusLabel.Position = UDim2.new(0, 10, 1, -30)
StatusLabel.Text = "Pronto."
StatusLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame

local function SetStatus(txt, cor)
    StatusLabel.Text = txt
    StatusLabel.TextColor3 = cor or Color3.fromRGB(100, 100, 120)
end

local function CriarBotao(texto, posY, cor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 38)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = texto
    btn.BackgroundColor3 = cor or Color3.fromRGB(30, 30, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    btn.Parent = MainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

local BtnLite   = CriarBotao("⚡  Lite BOOST (TUDO)", 68,  Color3.fromRGB(0, 140, 255))
local BtnFOV     = CriarBotao("🎯  FOV Minimo (" .. CONFIG.FOV .. ")", 116, Color3.fromRGB(30, 30, 45))
local BtnSombras = CriarBotao("🌑  Remover Sombras",   162, Color3.fromRGB(30, 30, 45))
local BtnPartic  = CriarBotao("💨  Remover Particulas",208, Color3.fromRGB(30, 30, 45))
local BtnSons    = CriarBotao("🔇  Remover Sons",      254, Color3.fromRGB(30, 30, 45))

-- ─── HELPERS ────────────────────────────────────────────────────────────────
local function EhParticula(v)
    for _, t in ipairs(PARTICLE_TYPES) do
        if v:IsA(t) then return true end
    end
    return false
end

-- ─── OTIMIZAÇÕES ────────────────────────────────────────────────────────────

local function OtimizarLighting()
    for _, v in ipairs(Lighting:GetChildren()) do
        pcall(v.Destroy, v)
    end
    local s = Instance.new("Sky", Lighting)
    local black = "rbxassetid://6522915678"
    s.SkyboxBk, s.SkyboxDn, s.SkyboxFt = black, black, black
    s.SkyboxLf, s.SkyboxRt, s.SkyboxUp = black, black, black
    s.SunTextureId  = "rbxassetid://0"
    s.MoonTextureId = "rbxassetid://0"
    s.StarCount     = 0
    Lighting.GlobalShadows  = false
    Lighting.FogEnd         = 9e9
    Lighting.FogStart       = 9e9
    Lighting.Brightness     = 2
    Lighting.ClockTime      = 14
    Lighting.Ambient        = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.ShadowSoftness = 0
end

local function OtimizarFOV()
    Camera.FieldOfView = CONFIG.FOV
end

-- BATCH: yield a cada N itens para não travar o jogo durante a limpeza
local function OtimizarMapa()
    local lista = game:GetDescendants()
    local char  = LocalPlayer.Character
    local i = 0
    for _, v in ipairs(lista) do
        i = i + 1
        if i % 200 == 0 then task.wait() end -- respira a cada 200 itens
        pcall(function()
            if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("CharacterMesh") then
                v:Destroy()
            elseif v:IsA("Texture") or v:IsA("Decal") or v:IsA("SelectionBox") then
                v:Destroy()
            elseif EhParticula(v) then
                v:Destroy()
            elseif v:IsA("BasePart") then
                v.Material    = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow  = false
                if char and not v:IsDescendantOf(char) then
                    v.Color = CONFIG.MapColor
                end
            elseif v:IsA("Sound") then
                v.Volume = 0
                v:Stop()
            end
        end)
    end
end

local function RemoverSombras()
    local lista = game:GetDescendants()
    local i = 0
    for _, v in ipairs(lista) do
        i = i + 1
        if i % 300 == 0 then task.wait() end
        if v:IsA("BasePart") then
            pcall(function() v.CastShadow = false end)
        end
    end
    Lighting.GlobalShadows = false
end

local function RemoverParticulas()
    local lista = game:GetDescendants()
    local i = 0
    for _, v in ipairs(lista) do
        i = i + 1
        if i % 300 == 0 then task.wait() end
        if EhParticula(v) then pcall(v.Destroy, v) end
    end
end

local function RemoverSons()
    local lista = game:GetDescendants()
    local i = 0
    for _, v in ipairs(lista) do
        i = i + 1
        if i % 300 == 0 then task.wait() end
        pcall(function()
            if v:IsA("Sound") then v.Volume = 0; v:Stop() end
        end)
    end
end

local function OtimizarGraficos()
    pcall(function() settings().Rendering.QualityLevel = CONFIG.QualityLevel end)
end

local function RemoverAcessorios()
    local char = LocalPlayer.Character
    if not char then return end
    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Hat") then pcall(v.Destroy, v) end
    end
end

-- ─── LISTENER REATIVO ───────────────────────────────────────────────────────
-- Substitui o loop Heartbeat pesado.
-- DescendantAdded só dispara quando um objeto NOVO entra no jogo.
-- Custo em idle = ZERO. Não varre nada, só reage.
local listenerAtivo = false
local listenerConn  = nil

local function AtivarListenerReativo()
    if listenerAtivo then return end
    listenerAtivo = true
    listenerConn = game.DescendantAdded:Connect(function(v)
        if EhParticula(v) then
            pcall(v.Destroy, v)
        elseif v:IsA("Texture") or v:IsA("Decal") then
            pcall(v.Destroy, v)
        elseif v:IsA("BasePart") then
            pcall(function() v.CastShadow = false; v.Reflectance = 0 end)
        elseif v:IsA("Sound") then
            pcall(function() v.Volume = 0 end)
        end
    end)
end

-- ─── BOTÕES ─────────────────────────────────────────────────────────────────

BtnLite.MouseButton1Click:Connect(function()
    BtnLite.Text = "Otimizando..."
    BtnLite.BackgroundColor3 = Color3.fromRGB(200, 130, 0)

    SetStatus("Iluminacao...", Color3.fromRGB(255, 200, 0))
    pcall(OtimizarLighting)
    task.wait()

    SetStatus("FOV + Graficos...", Color3.fromRGB(255, 200, 0))
    pcall(OtimizarFOV)
    pcall(OtimizarGraficos)
    task.wait()

    SetStatus("Limpando mapa (aguarde)...", Color3.fromRGB(255, 200, 0))
    pcall(OtimizarMapa) -- batch interno, nao trava

    SetStatus("Acessorios...", Color3.fromRGB(255, 200, 0))
    pcall(RemoverAcessorios)
    task.wait()

    AtivarListenerReativo() -- listener leve no lugar do loop pesado

    SetStatus("Lite BOOST ATIVO!", Color3.fromRGB(0, 255, 120))
    BtnLite.Text = "Lite BOOST ATIVO"
    BtnLite.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
end)

BtnFOV.MouseButton1Click:Connect(function()
    pcall(OtimizarFOV)
    BtnFOV.Text = "FOV: " .. CONFIG.FOV .. " ATIVO"
    BtnFOV.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
    SetStatus("FOV = " .. CONFIG.FOV, Color3.fromRGB(0, 200, 100))
end)

BtnSombras.MouseButton1Click:Connect(function()
    SetStatus("Removendo sombras...", Color3.fromRGB(255, 200, 0))
    task.spawn(function()
        pcall(RemoverSombras)
        BtnSombras.Text = "Sombras Removidas"
        BtnSombras.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
        SetStatus("Sombras removidas!", Color3.fromRGB(0, 200, 100))
    end)
end)

BtnPartic.MouseButton1Click:Connect(function()
    SetStatus("Removendo particulas...", Color3.fromRGB(255, 200, 0))
    task.spawn(function()
        pcall(RemoverParticulas)
        AtivarListenerReativo()
        BtnPartic.Text = "Particulas Bloqueadas"
        BtnPartic.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
        SetStatus("Particulas bloqueadas!", Color3.fromRGB(0, 200, 100))
    end)
end)

BtnSons.MouseButton1Click:Connect(function()
    SetStatus("Removendo sons...", Color3.fromRGB(255, 200, 0))
    task.spawn(function()
        pcall(RemoverSons)
        BtnSons.Text = "Sons Removidos"
        BtnSons.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
        SetStatus("Sons desativados!", Color3.fromRGB(0, 200, 100))
    end)
end)

CloseButton.MouseButton1Click:Connect(function()
    if listenerConn then listenerConn:Disconnect() end
    ScreenGui:Destroy()
end)

-- ─── RESPAWN ─────────────────────────────────────────────────────────────────
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1.5)
    pcall(OtimizarFOV)
    pcall(RemoverAcessorios)
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
            pcall(v.Destroy, v)
        end
    end
end)

print("[NOVA X Lite v2] Carregado! FOV=" .. CONFIG.FOV)
