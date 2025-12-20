-- [[ 1. MASUKKAN LINK SCRIPT KAMU DI SINI ]]
local ScriptLink = "https://raw.githubusercontent.com/reyzzarjam2/Reyzzarjam-Script/refs/heads/main/autorejoin.lua"

-----------------------------------------------------------
-- SYSTEM VARIABLES & IY QUEUE
-----------------------------------------------------------
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Nama file untuk menyimpan ingatan (ON/OFF)
local ConfigFile = "ReyzzRejoin_Memory.txt"

-- Deteksi Queue gaya Infinite Yield (Yang terbukti work di kamu)
local queueteleport = (syn and syn.queue_on_teleport) 
    or queue_on_teleport 
    or (fluxus and fluxus.queue_on_teleport) 
    or (request and request.queue_on_teleport)
    or (function() return print("⚠️ Executor ini tidak support Queue!") end)

-----------------------------------------------------------
-- SISTEM MEMORI (SAVE & LOAD)
-----------------------------------------------------------
local IsActive = false

local function SaveConfig(boolVal)
    writefile(ConfigFile, tostring(boolVal))
end

local function LoadConfig()
    if isfile(ConfigFile) then
        return readfile(ConfigFile) == "true"
    end
    return false
end

-- Load status terakhir saat script baru jalan
IsActive = LoadConfig()

-----------------------------------------------------------
-- UI PANEL
-----------------------------------------------------------
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
Title.Text = "AUTO REJOIN (PERSISTENT)"
Title.Size = UDim2.new(1,0,0,25)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold; Title.TextSize = 11

local StatusBtn = Instance.new("TextButton", Frame)
StatusBtn.Size = UDim2.new(0.9, 0, 0, 40)
StatusBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
-- Set warna awal berdasarkan ingatan (Config)
StatusBtn.BackgroundColor3 = IsActive and Color3.fromRGB(50, 255, 100) or Color3.fromRGB(255, 50, 50)
StatusBtn.Text = IsActive and "ACTIVE (Running...)" or "OFF"
StatusBtn.TextColor3 = Color3.new(1,1,1)
StatusBtn.Font = Enum.Font.GothamBlack
Instance.new("UICorner", StatusBtn).CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- LOGIKA REJOIN & LOOP
-----------------------------------------------------------

local function IY_Rejoin()
    if not IsActive then return end

    -- Script Execute Ulang (Queue)
    local safeScript = [[
        repeat task.wait() until game:IsLoaded()
        pcall(function()
            loadstring(game:HttpGet("]] .. ScriptLink .. [["))()
        end)
    ]]
    queueteleport(safeScript)

    print("⏳ Teleporting...")
    
    if #Players:GetPlayers() <= 1 then
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
end

local function StartLoop()
    task.spawn(function()
        if IsActive then
            -- Tunggu Karakter Render
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            
            -- Tunggu 2 Detik sesuai request
            task.wait(2)
            
            -- Cek lagi (Siapa tau dimatiin pas loading)
            if IsActive then
                IY_Rejoin()
            end
        end
    end)
end

-- Event Klik Tombol
StatusBtn.MouseButton1Click:Connect(function()
    IsActive = not IsActive
    SaveConfig(IsActive) -- SIMPAN STATUS KE FILE
    
    if IsActive then
        StatusBtn.Text = "ACTIVE (Running...)"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
        StartLoop()
    else
        StatusBtn.Text = "OFF"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- [[ AUTO START ]]
-- Jika ingatan (Config) bilang TRUE, langsung jalankan loop tanpa klik tombol
if IsActive then
    print("✅ Config ditemukan: Auto-Start Rejoin Loop")
    StartLoop()
end
