-- [[ KONFIGURASI LINK GITHUB ]]
-- PASTIKAN INI DIGANTI DENGAN LINK SCRIPT ASLI KAMU!
-- Contoh: "https://raw.githubusercontent.com/PixelatedL/DaHood/main/Main.lua"
local MyGithubLink = "https://raw.githubusercontent.com/USERNAME/REPO/main/script.lua"

-----------------------------------------------------------
-- SYSTEM VARIABLES
-----------------------------------------------------------
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local ConfigFileName = "ReyzzAutoRejoin_Config.txt"

-- [[ 1. DETEKSI FUNGSI QUEUE YANG LEBIH KUAT ]]
local queue_on_teleport = (syn and syn.queue_on_teleport) 
    or queue_on_teleport 
    or (fluxus and fluxus.queue_on_teleport) 
    or (request and request.queue_on_teleport)
    or nil

-- Cek apakah executor support queue
if not queue_on_teleport then
    warn("⚠️ PERINGATAN: Executor kamu TIDAK support 'queue_on_teleport'!")
    warn("Script akan rejoin, tapi TIDAK AKAN execute ulang otomatis.")
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

IsAutoRejoin = LoadConfig()

-----------------------------------------------------------
-- UI SEDERHANA (PANEL)
-----------------------------------------------------------
-- (Hapus UI lama jika ada biar gak numpuk)
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name == "ReyzzRejoinUI" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ReyzzRejoinUI"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 100)
Frame.Position = UDim2.new(0.02, 0, 0.3, 0) 
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true 

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "AUTO REJOIN & EXEC"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 12

local ToggleBtn = Instance.new("TextButton", Frame)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleBtn.BackgroundColor3 = IsAutoRejoin and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
ToggleBtn.Text = IsAutoRejoin and "SYSTEM: ON" or "SYSTEM: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14

local BtnCorner = Instance.new("UICorner", ToggleBtn)
BtnCorner.CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- LOGIKA UTAMA
-----------------------------------------------------------

local function TriggerRejoin()
    if not IsAutoRejoin then return end
    
    -- [[ 2. SCRIPT YANG AKAN DIJALANKAN SETELAH REJOIN ]]
    -- Saya tambahkan print debug & wait agar lebih aman
    local AutoExecScript = [[
        print("✅ Auto-Exec: Script Started!")
        repeat task.wait() until game:IsLoaded()
        task.wait(3) -- Tunggu 3 detik biar game benar-benar siap
        
        print("🚀 Auto-Exec: Loading GitHub Script...")
        local url = "]] .. MyGithubLink .. [["
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        
        if not success then
            warn("❌ Auto-Exec Gagal: " .. tostring(err))
            print("Cek apakah link GitHub kamu benar/valid?")
        else
            print("✅ Auto-Exec Berhasil!")
        end
    ]]
    
    -- Masukkan ke antrian executor
    if queue_on_teleport then
        queue_on_teleport(AutoExecScript)
        print("✅ Queue Teleport Berhasil Diset!")
    else
        warn("❌ Gagal set Queue (Executor tidak support)")
    end

    print("⏳ Auto Rejoin: Teleporting ke Server yang Sama...")
    
    -- Coba Rejoin Server Sama
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
    
    -- Jika gagal (penuh/bug), pindah server random
    if not success then
        warn("⚠️ Rejoin Gagal (Server Penuh/Tutup). Pindah Server Random...")
        TeleportService:Teleport(game.PlaceId, LocalPlayer) 
    end
end

local function StartLoop()
    task.spawn(function()
        if IsAutoRejoin then
            -- Tunggu Karakter Render
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            
            -- Tunggu 2 Detik (Sesuai Request)
            task.wait(2)
            
            if IsAutoRejoin then
                TriggerRejoin()
            end
        end
    end)
end

ToggleBtn.MouseButton1Click:Connect(function()
    IsAutoRejoin = not IsAutoRejoin
    SaveConfig(IsAutoRejoin)
    
    if IsAutoRejoin then
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        ToggleBtn.Text = "SYSTEM: ON"
        StartLoop()
    else
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        ToggleBtn.Text = "SYSTEM: OFF"
    end
end)

if IsAutoRejoin then
    StartLoop()
end
