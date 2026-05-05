-- [[ LOAD ORIGINAL PHANWARE BASE ]] --
-- Script ini adalah modifikasi dari Phantom Ware V10 dengan penambahan Slimy AI


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")

-- [[ STAFF IDENTIFICATION SYSTEM ]] --
local staff = {
    ["8008797519"] = {name = "owneraiking", title = "PHANTOM WARE OWNER", color = Color3.fromRGB(0, 255, 0)},
    ["3492744393"] = {name = "Nanarain45677", title = "MANAGER PHANTOM WARE", color = Color3.fromRGB(0, 190, 255)},
    ["10642124279"] = {name = "Raja_pendek21", title = "RAJA WARE OWNER", color = Color3.fromRGB(255, 0, 0)},
    ["10587072700"] = {name = "Ryansocooolsmith", title = "AGAR WARE OWNER", color = Color3.fromRGB(255, 255, 0)},
    ["7999975433"] = {name = "TCGBZZ", title = "Bacon mafia Koi", color = Color3.fromRGB(255, 255, 255)}
}

local function applyTag(player)
    local function createTag(char)
        local userIdStr = tostring(player.UserId)
        if staff[userIdStr] or staff[player.Name] then
            local data = staff[userIdStr] or staff[player.Name]
            local head = char:WaitForChild("Head", 10)
            if head then
                if head:FindFirstChild("PhanStaffTag") then head.PhanStaffTag:Destroy() end
                local bill = Instance.new("BillboardGui", head)
                bill.Name = "PhanStaffTag"; bill.Size = UDim2.new(0, 250, 0, 50); bill.AlwaysOnTop = true; bill.ExtentsOffset = Vector3.new(0, 3, 0)
                local lbl = Instance.new("TextLabel", bill)
                lbl.Size = UDim2.new(1, 0, 1, 0); lbl.BackgroundTransparency = 1; lbl.Text = data.title; lbl.TextColor3 = data.color; lbl.Font = Enum.Font.Code; lbl.TextSize = 20
                task.spawn(function() while bill.Parent do for i = 0, 1, 0.01 do lbl.TextColor3 = Color3.fromHSV(i, 0.8, 1) task.wait(0.05) end end end)
            end
        end
    end
    player.CharacterAdded:Connect(createTag); if player.Character then createTag(player.Character) end
end
for _, p in pairs(Players:GetPlayers()) do applyTag(p) end
Players.PlayerAdded:Connect(applyTag)

-- [[ UI SYSTEM ]] --
local sg = Instance.new("ScreenGui", PlayerGui); sg.Name = "PhanWare_V10_Slimy"; sg.ResetOnSpawn = false
local toggleBtn = Instance.new("TextButton", sg)
toggleBtn.Name = "PW_Toggle"; toggleBtn.Size = UDim2.new(0, 50, 0, 50); toggleBtn.Position = UDim2.new(0, 20, 1, -70); toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 40, 0); toggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 0); toggleBtn.BorderSizePixel = 2; toggleBtn.Text = "PW"; toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0); toggleBtn.Font = Enum.Font.Code; toggleBtn.TextSize = 20

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300); main.Position = UDim2.new(0.5, -225, 0.5, -150); main.BackgroundColor3 = Color3.fromRGB(0, 0, 0); main.BorderColor3 = Color3.fromRGB(0, 255, 0); main.BorderSizePixel = 2; main.Active = true; main.Draggable = true; main.Visible = false

local sideBar = Instance.new("Frame", main); sideBar.Size = UDim2.new(0, 80, 1, -35); sideBar.Position = UDim2.new(0, 0, 0, 35); sideBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15); sideBar.BorderSizePixel = 0
local sideLayout = Instance.new("UIListLayout", sideBar); sideLayout.Padding = UDim.new(0, 5)

local function createTabBtn(text)
    local btn = Instance.new("TextButton", sideBar); btn.Size = UDim2.new(1, 0, 0, 40); btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); btn.Text = text; btn.TextColor3 = Color3.fromRGB(0, 255, 0); btn.Font = Enum.Font.Code; btn.BorderSizePixel = 0; return btn
end

local homeTabBtn = createTabBtn("HOME"); local antiTabBtn = createTabBtn("ANTI"); local settingsTabBtn = createTabBtn("SETTINGS")
local contentFrame = Instance.new("Frame", main); contentFrame.Size = UDim2.new(1, -90, 1, -45); contentFrame.Position = UDim2.new(0, 85, 0, 40); contentFrame.BackgroundTransparency = 1

local function createPage()
    local page = Instance.new("ScrollingFrame", contentFrame); page.Size = UDim2.new(1, 0, 1, 0); page.BackgroundTransparency = 1; page.CanvasSize = UDim2.new(0, 0, 1.5, 0); page.Visible = false; page.ScrollBarThickness = 3
    local layout = Instance.new("UIGridLayout", page); layout.CellSize = UDim2.new(0.48, 0, 0, 40); layout.CellPadding = UDim2.new(0.02, 0, 0.03, 0); return page
end

local homePage = createPage(); homePage.Visible = true; homeTabBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
local antiPage = createPage(); local settingsPage = createPage()

local function showPage(p, b)
    homePage.Visible = false; antiPage.Visible = false; settingsPage.Visible = false
    homeTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); antiTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); settingsTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    p.Visible = true; b.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
end

homeTabBtn.MouseButton1Click:Connect(function() showPage(homePage, homeTabBtn) end)
antiTabBtn.MouseButton1Click:Connect(function() showPage(antiPage, antiTabBtn) end)
settingsTabBtn.MouseButton1Click:Connect(function() showPage(settingsPage, settingsTabBtn) end)

local function createBtn(text, parent)
    local btn = Instance.new("TextButton", parent); btn.Text = text; btn.BackgroundColor3 = Color3.fromRGB(0, 30, 0); btn.TextColor3 = Color3.fromRGB(0, 255, 0); btn.BorderColor3 = Color3.fromRGB(0, 255, 0); btn.Font = Enum.Font.Code; btn.TextSize = 12; return btn
end

-- [[ NEW BUTTON: EXECUTE SLIMY AI ]] --
local slimyBtn = createBtn("Execute Slimy AI", homePage)
slimyBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 60) -- Warna ungu gelap supaya nampak beza
slimyBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ai-Chatbot-180730"))()
end)

-- [[ ORIGINAL CONTENT ]] --
createBtn("[ FIRE BRICK ]", homePage).MouseButton1Click:Connect(function() pcall(function() LocalPlayer.Character.Delete.Script.Event:FireServer(game:GetService("ReplicatedStorage").Brick, LocalPlayer.Character.HumanoidRootPart.Position) end) end)
createBtn("Custom Script", homePage).MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://pastebin.com/raw/SiH0fKHC"))() end)

local btnGrab = createBtn("[ AUTO GRAB: OFF ]", homePage); local grabbing = false
btnGrab.MouseButton1Click:Connect(function() 
    grabbing = not grabbing; btnGrab.Text = grabbing and "[ AUTO GRAB: ON ]" or "[ AUTO GRAB: OFF ]"; 
    if grabbing then task.spawn(function() while grabbing do pcall(function() for _,v in pairs(workspace:GetChildren()) do if v:IsA("Tool") then LocalPlayer.Character.Humanoid:EquipTool(v) end end end) task.wait(0.1) end end) end 
end)

createBtn("Agar Ware", homePage).MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/agarv69/UNIVERSAL-SCRIPT-BY-AGARV/refs/heads/main/1"))() end)
createBtn("Raja Ware", homePage).MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/agarvsocooolsmith/Scripts/refs/heads/main/RAJAWARE.lua"))() end)

-- [[ TOGGLE & INTRO LOGIC ]] --
local mainTitle = Instance.new("TextLabel", main); mainTitle.Text = ">_ PHANTOM WARE V10 + SLIMY"; mainTitle.Size = UDim2.new(1, 0, 0, 35); mainTitle.BackgroundColor3 = Color3.fromRGB(0, 40, 0); mainTitle.TextColor3 = Color3.fromRGB(0, 255, 0); mainTitle.Font = Enum.Font.Code

local hasExecuted = false
toggleBtn.MouseButton1Click:Connect(function()
    if not hasExecuted then
        hasExecuted = true
        toggleBtn.Visible = false
        local introLabel = Instance.new("TextLabel", sg)
        introLabel.Size = UDim2.new(1, 0, 1, 0); introLabel.BackgroundTransparency = 1; introLabel.Text = "Phantom Ware 👑"; introLabel.TextColor3 = Color3.fromRGB(255, 255, 255); introLabel.Font = Enum.Font.SourceSansLight; introLabel.TextSize = 50; introLabel.TextTransparency = 1
        TweenService:Create(introLabel, TweenInfo.new(1), {TextTransparency = 0}):Play(); task.wait(2)
        TweenService:Create(introLabel, TweenInfo.new(1), {TextTransparency = 1}):Play(); task.wait(1); introLabel:Destroy()
        
        main.Visible = true; toggleBtn.Visible = true
    else
        main.Visible = not main.Visible
    end
end)
