
-- [[ 1. MASUKKAN LINK SCRIPT KAMU DI SINI ]]
local ScriptLink = "https://raw.githubusercontent.com/reyzzarjam2/Reyzzarjam-Script/refs/heads/main/autorejoin.lua"

-----------------------------------------------------------
-- INFINITE YIELD STYLE QUEUE DETECTION
-----------------------------------------------------------
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- Ini adalah cara Infinite Yield mencari fungsi queue (Cek satu-satu)
local queueteleport = (syn and syn.queue_on_teleport) 
    or queue_on_teleport 
    or (fluxus and fluxus.queue_on_teleport) 
    or (request and request.queue_on_teleport)
    or (function() return print("⚠️ Executor ini benar-benar tidak support Queue!") end)

-----------------------------------------------------------
-- UI PANEL (Sama seperti request kamu)
-----------------------------------------------------------
local CoreGui = game:GetService("CoreGui")
pcall(function() CoreGui.ReyzzRejoin:Destroy() end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ReyzzRejoin"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 80)
Frame.Position = UDim2.new(0.02, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Active = true; Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "IY STYLE REJOIN"
Title.Size = UDim2.new(1,0,0,25)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold; Title.TextSize = 12

local StatusBtn = Instance.new("TextButton", Frame)
StatusBtn.Size = UDim2.new(0.9, 0, 0, 40)
StatusBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
StatusBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
StatusBtn.Text = "OFF"
StatusBtn.TextColor3 = Color3.new(1,1,1)
StatusBtn.Font = Enum.Font.GothamBlack
Instance.new("UICorner", StatusBtn).CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- LOGIKA "INFINITE YIELD REJOIN"
-----------------------------------------------------------
local IsActive = false

-- Fungsi Rejoin persis gaya IY
local function IY_Rejoin()
    if not IsActive then return end

    -- 1. Susun perintah execute (String yang aman)
    local safeScript = [[
        repeat task.wait() until game:IsLoaded()
        print("🔄 IY Style: Executing Script...")
        pcall(function()
            loadstring(game:HttpGet("]] .. ScriptLink .. [["))()
        end)
    ]]

    -- 2. Masukkan ke Queue menggunakan fungsi deteksi IY
    queueteleport(safeScript)

    -- 3. Teleport (Gunakan TeleportToPlaceInstance agar server sama)
    print("⏳ Teleporting to same server...")
    
    if #Players:GetPlayers() <= 1 then
        -- Kalau sendirian, pakai Rejoin biasa
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        -- Kalau rame, paksa masuk JobId yang sama
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
end

-- Loop Pengecekan
local function StartLoop()
    task.spawn(function()
        if IsActive then
            -- Tunggu Karakter ada (Render)
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            
            -- Tunggu 2 Detik (Sesuai request)
            task.wait(2)
            
            if IsActive then
                IY_Rejoin()
            end
        end
    end)
end

-- Button Logic
StatusBtn.MouseButton1Click:Connect(function()
    IsActive = not IsActive
    if IsActive then
        StatusBtn.Text = "ACTIVE (Running...)"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
        StartLoop()
    else
        StatusBtn.Text = "OFF"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end
end)
