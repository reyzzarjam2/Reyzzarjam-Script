-- [[ 1. PASTIKAN LINK INI SUDAH BERISI KODE TERBARU YANG ADA DI BAWAH INI ]]
local ScriptLink = "https://raw.githubusercontent.com/reyzzarjam2/Reyzzarjam-Script/refs/heads/main/autorejoin.lua"

-----------------------------------------------------------
-- SYSTEM VARIABLES & IY QUEUE
-----------------------------------------------------------
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local ConfigFile = "ReyzzRejoin_Memory.txt"

-- Deteksi Queue ala Infinite Yield
local queueteleport = (syn and syn.queue_on_teleport) 
    or queue_on_teleport 
    or (fluxus and fluxus.queue_on_teleport) 
    or (request and request.queue_on_teleport)
    or (function() return print("⚠️ Executor ini tidak support Queue!") end)

-----------------------------------------------------------
-- SISTEM MEMORI (SAVE & LOAD LEBIH KUAT)
-----------------------------------------------------------
local IsActive = false

local function SaveConfig(boolVal)
    -- Simpan sebagai string bersih
    writefile(ConfigFile, tostring(boolVal))
    print("💾 Config Saved:", tostring(boolVal))
end

local function LoadConfig()
    if isfile(ConfigFile) then
        local content = readfile(ConfigFile)
        -- Hapus spasi/enter yang mungkin ikut terbaca (PENTING!)
        content = string.gsub(content, "%s+", "")
        print("📂 Membaca Config:", content)
        return content == "true"
    end
    return false
end

-- Load status saat script jalan
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
Title.Text = "AUTO REJOIN (MEMORY)"
Title.Size = UDim2.new(1,0,0,25)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold; Title.TextSize = 11

local StatusBtn = Instance.new("TextButton", Frame)
StatusBtn.Size = UDim2.new(0.9, 0, 0, 40)
StatusBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
-- Set tampilan awal sesuai Config yang dimuat
StatusBtn.BackgroundColor3 = IsActive and Color3.fromRGB(50, 255, 100) or Color3.fromRGB(255, 50, 50)
StatusBtn.Text = IsActive and "ACTIVE (Auto-Start)" or "OFF"
StatusBtn.TextColor3 = Color3.new(1,1,1)
StatusBtn.Font = Enum.Font.GothamBlack
Instance.new("UICorner", StatusBtn).CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- LOGIKA UTAMA
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
            
            -- Tunggu 2 Detik
            task.wait(15)
            
            -- Cek lagi
            if IsActive then
                IY_Rejoin()
            end
        end
    end)
end

-- Event Klik Tombol
StatusBtn.MouseButton1Click:Connect(function()
    IsActive = not IsActive
    SaveConfig(IsActive) -- Simpan ke file
    
    if IsActive then
        StatusBtn.Text = "ACTIVE (Running...)"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
        StartLoop()
    else
        StatusBtn.Text = "OFF"
        StatusBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- [[ AUTO START JIKA CONFIG TRUE ]]
if IsActive then
    print("✅ Config 'true' ditemukan! Memulai loop otomatis...")
    StartLoop()
end
