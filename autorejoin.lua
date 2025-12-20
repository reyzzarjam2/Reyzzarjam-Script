-- [[ KONFIGURASI LINK GITHUB ]]
-- Masukkan Link Raw Github script kamu di bawah ini:
local MyGithubLink = "https://raw.githubusercontent.com/reyzzarjam2/Reyzzarjam-Script/refs/heads/main/autorejoin.lua"

-----------------------------------------------------------
-- SYSTEM VARIABLES
-----------------------------------------------------------
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local ConfigFileName = "ReyzzAutoRejoin_Config.txt"
local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport

-- Cek apakah executor support queue
if not queue_on_teleport then
    warn("Executor kamu tidak support queue_on_teleport! Script mungkin tidak akan auto-execute setelah rejoin.")
end

-- [[ FUNGSI SAVE/LOAD CONFIG ]]
local IsAutoRejoin = false

local function SaveConfig(boolValue)
    writefile(ConfigFileName, tostring(boolValue))
end

local function LoadConfig()
    if isfile(ConfigFileName) then
        local content = readfile(ConfigFileName)
        return content == "true"
    end
    return false
end

-- Load status terakhir saat script jalan
IsAutoRejoin = LoadConfig()

-----------------------------------------------------------
-- UI SEDERHANA (PANEL)
-----------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ReyzzRejoinUI"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 90)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0) -- Posisi di kiri layar
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true -- Bisa digeser

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Judul
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "AUTO REJOIN (SAME SERVER)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 12

-- Tombol Toggle
local ToggleBtn = Instance.new("TextButton", Frame)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleBtn.BackgroundColor3 = IsAutoRejoin and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
ToggleBtn.Text = IsAutoRejoin and "STATUS: ON" or "STATUS: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14

local BtnCorner = Instance.new("UICorner", ToggleBtn)
BtnCorner.CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- LOGIKA UTAMA
-----------------------------------------------------------

-- Fungsi Rejoin
local function TriggerRejoin()
    if not IsAutoRejoin then return end
    
    -- 1. Siapkan Code untuk Server Selanjutnya (PENTING)
    -- Ini yang bikin dia execute ulang sendiri
    local AutoExecScript = [[
        repeat task.wait() until game:IsLoaded()
        loadstring(game:HttpGet("]] .. MyGithubLink .. [["))()
    ]]
    
    if queue_on_teleport then
        queue_on_teleport(AutoExecScript)
    end

    -- 2. Lakukan Teleport ke Job ID yang sama
    print("⏳ Auto Rejoin: Teleporting in 3 seconds...")
    
    -- Kita pakai pcall biar kalau server penuh/error dia coba lagi
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
    
    if not success then
        warn("Gagal Rejoin Same Server (Mungkin Penuh/Tutup). Mencoba Server Lain...")
        TeleportService:Teleport(game.PlaceId, LocalPlayer) -- Fallback ke server random
    end
end

-- Fungsi Loop Menunggu Render
local function StartLoop()
    task.spawn(function()
        if IsAutoRejoin then
            -- Tunggu Karakter Ada
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            
            -- Tunggu 2 Detik setelah Render (Sesuai request)
            task.wait(2)
            
            -- Cek lagi takutnya dimatiin pas loading
            if IsAutoRejoin then
                TriggerRejoin()
            end
        end
    end)
end

-- Event Klik Tombol
ToggleBtn.MouseButton1Click:Connect(function()
    IsAutoRejoin = not IsAutoRejoin
    SaveConfig(IsAutoRejoin) -- Simpan status
    
    -- Update Visual Tombol
    if IsAutoRejoin then
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        ToggleBtn.Text = "STATUS: ON"
        StartLoop() -- Jalankan loop
    else
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        ToggleBtn.Text = "STATUS: OFF"
    end
end)

-- Jalankan otomatis saat script pertama kali di-execute (jika config ON)
if IsAutoRejoin then
    StartLoop()
end
