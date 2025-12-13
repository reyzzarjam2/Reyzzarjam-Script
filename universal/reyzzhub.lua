local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local StatsService = game:GetService("Stats")
local TextChatService = game:GetService("TextChatService")
local ProximityPromptService = game:GetService("ProximityPromptService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- [[ THEME SYSTEM ]]
local Themes = {
    Dark = {
        Background = Color3.fromRGB(24, 28, 36),
        Sidebar = Color3.fromRGB(18, 22, 28),
        ElementBG = Color3.fromRGB(35, 40, 48),
        Accent = Color3.fromRGB(0, 230, 255),
        Text = Color3.fromRGB(240, 240, 240),
        TextDim = Color3.fromRGB(120, 130, 140),
        Stroke = Color3.fromRGB(45, 50, 60)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 245),
        Sidebar = Color3.fromRGB(220, 220, 230),
        ElementBG = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 255),
        Text = Color3.fromRGB(30, 30, 30),
        TextDim = Color3.fromRGB(100, 100, 100),
        Stroke = Color3.fromRGB(200, 200, 200)
    },
    NeonCyan = {
        Background = Color3.fromRGB(10, 15, 20),
        Sidebar = Color3.fromRGB(5, 10, 15),
        ElementBG = Color3.fromRGB(20, 30, 40),
        Accent = Color3.fromRGB(0, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(100, 200, 200),
        Stroke = Color3.fromRGB(0, 100, 100)
    },
    NeonGreen = {
        Background = Color3.fromRGB(10, 20, 10),
        Sidebar = Color3.fromRGB(5, 15, 5),
        ElementBG = Color3.fromRGB(20, 35, 20),
        Accent = Color3.fromRGB(50, 255, 50),
        Text = Color3.fromRGB(220, 255, 220),
        TextDim = Color3.fromRGB(100, 180, 100),
        Stroke = Color3.fromRGB(20, 80, 20)
    },
    NeonRed = {
        Background = Color3.fromRGB(20, 10, 10),
        Sidebar = Color3.fromRGB(15, 5, 5),
        ElementBG = Color3.fromRGB(35, 20, 20),
        Accent = Color3.fromRGB(255, 50, 50),
        Text = Color3.fromRGB(255, 220, 220),
        TextDim = Color3.fromRGB(180, 100, 100),
        Stroke = Color3.fromRGB(80, 20, 20)
    }
}

local CurrentThemeName = 'Dark'
local SelectedLanguage = "ID"

local TextData = {
    Fly = {ID = "Mode Terbang", EN = "Fly Mode"},
    Speed = {ID = "Kecepatan Lari", EN = "Walk Speed"},
    Infinitejump = {ID = "Kekuatan Lompat", EN = "Jump Power"},
    walkonwater = {ID = "Jalan di Atas Air", EN = "Walk on Water"},
    WalkSpeed = {ID = "Kecepatan Lari", EN = "Walk Speed"},
    autoregen = {ID = "Regenerasi Otomatis", EN = "Auto Regen"},
}

local CurrentTheme = Themes[CurrentThemeName]
local ThemeRegistry = {} 

local function RegisterTheme(instance, property, themeKey)
    table.insert(ThemeRegistry, {Obj = instance, Prop = property, Key = themeKey})
    instance[property] = CurrentTheme[themeKey]
end

local function ApplyTheme(themeName)
    if Themes[themeName] then
        CurrentThemeName = themeName
        CurrentTheme = Themes[themeName]
        for _, data in pairs(ThemeRegistry) do
            if data.Obj and data.Obj.Parent then
                TweenService:Create(data.Obj, TweenInfo.new(0.3), {[data.Prop] = CurrentTheme[data.Key]}):Play()
            end
        end
        return true
    end
    return false
end

local UIScale = {
    BaseSize = UDim2.new(0, 700, 0, 450), 
    LargeSize = UDim2.new(0, 900, 0, 550), 
    FontSmall = 12,
    FontNormal = 14, 
    FontHeader = 18
}

local Toggles = {} 

-- [[ STATE VARIABLES ]]
local State = {
    -- Combat
    Aimbot = false, 
    AimbotPart = "Head",
    AimbotButton = Enum.UserInputType.MouseButton2,
    WallCheck = false,
    TouchFling = false,
    HitboxLoop = false,
    HitboxSize = 15,
    HitboxInvisible = true,
    HitboxPart = "HumanoidRootPart", 
    AutoClicker = false,
    CPS = 10,
    WeaponRapidFire = false,
    RapidFireCPS = 20,
    
    -- Movement/Main
    InfiniteJump = false,
    NoFall = false,
    Noclip = false, 
    Fly = false, 
    Spider = false,
    Bhop = false, 
    WalkSpeed = 16, 
    JumpPower = 50, 
    AutoRegen = false,
    LoopSpeed = false, 
    FakeLag = false,

    -- Visuals
    MasterESP = false, 
    ShowInventory = false,
    Tracers = false, 
    XRay = false,
    Crosshair = false,
    NpcESP = false,
    ItemESP = false,
    
    -- World
    FullbrightLoop = false, 
    NoFog = false, 
    NoParticles = false,
    AntiVoid = false, 
    VoidHeight = -50, 
    LastSafePos = nil, 
    WalkOnWater = false, 
    GravityControl = false,
    
    -- Camera
    Freecam = false, 
    FreecamSpeed = 1, 
    FreecamPos = Camera.CFrame, 
    FreecamRot = Vector2.new(0, 0),
    FreecamPart = nil,
    MaxZoom = false,
    SpectatingPlayer = nil,
    CinematicCamera = false,
    FOV = 70,

    -- Safety / Misc
    SpectatorList = false,
    AdminDetector = false,
    AdminGroupId = 0,
    ProximityWarning = false,
    ProximityDist = 50,
    ProximityMode = "All",
    
    TargetJobId = "",
    AnimLogger = false,
    EventLogger = false,
    ChatLogger = false,
    ChatSpammer = false, 
    SpamMessage = "Reyzz Hub on Top!", 
    InstantPrompt = false, 
    ForceUnlockMouse = false,
    AutoReconnect = true,
    IsRespawning = false,
    LastPos = nil,
    AntiAFK = true,
    ClickTP = false,
    SpinBot = false,
    SpinSpeed = 100,
    IsMaximized = false,
    ShowStats = false,
    AnimChanger = false,
    CurrentAnimID = 0,
    CurrentAnimTrack = nil,
    AnimRigType = "R15",
    Radar = false,
    RadarRange = 150,
    RadarSize = 150,
    FlyVehicle = false, 
    BhopLegit = false, 
    EspMaterial = false, 
    GravityWall = false,
    WallRun = false,    
    ChatBypass = false,   
    SelectedLang = "ID",   
    CurrentVersion = "6.3", 
}


LocalPlayer.Idled:Connect(function()
    if State.AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

task.spawn(function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            State.WalkSpeed = hum.WalkSpeed
            State.JumpPower = hum.UseJumpPower and hum.JumpPower or hum.JumpHeight
        end
    end
end)

local function GetSafeGui() 
    return CoreGui:FindFirstChild("RobloxGui") or LocalPlayer:WaitForChild("PlayerGui") 
end

pcall(function()
    if GetSafeGui():FindFirstChild("ReyzzHubV52") then GetSafeGui().ReyzzHubV52:Destroy() end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ReyzzHubV52" 
ScreenGui.Parent = GetSafeGui()
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- [[ OVERLAY GUIS ]]
local CrosshairFrame = Instance.new("Frame", ScreenGui); CrosshairFrame.Name = "Crosshair"; CrosshairFrame.Size = UDim2.new(0, 20, 0, 20); CrosshairFrame.Position = UDim2.new(0.5, -10, 0.5, -10); CrosshairFrame.BackgroundTransparency = 1; CrosshairFrame.Visible = false
local CH_H = Instance.new("Frame", CrosshairFrame); CH_H.Size = UDim2.new(1, 0, 0, 2); CH_H.Position = UDim2.new(0, 0, 0.5, -1); RegisterTheme(CH_H, "BackgroundColor3", "Accent"); CH_H.BorderSizePixel = 0
local CH_V = Instance.new("Frame", CrosshairFrame); CH_V.Size = UDim2.new(0, 2, 1, 0); CH_V.Position = UDim2.new(0.5, -1, 0, 0); RegisterTheme(CH_V, "BackgroundColor3", "Accent"); CH_V.BorderSizePixel = 0

-- [PROXIMITY WARNING GUI - FIXED AUTO SIZE]
local ProxFrame = Instance.new("Frame", ScreenGui); 
ProxFrame.Name = "ProxWarning"; 
ProxFrame.Size = UDim2.new(0, 300, 0, 60); 
ProxFrame.AutomaticSize = Enum.AutomaticSize.Y 
ProxFrame.Position = UDim2.new(0.5, -150, 0.15, 0); 
ProxFrame.BackgroundColor3 = Color3.fromRGB(40, 10, 10); 
ProxFrame.Visible = false; 
ProxFrame.BackgroundTransparency = 0.2
Instance.new("UICorner", ProxFrame).CornerRadius = UDim.new(0, 10); 
local ProxStroke = Instance.new("UIStroke", ProxFrame); ProxStroke.Color = Color3.fromRGB(255, 80, 80); ProxStroke.Thickness = 3
local ProxPadding = Instance.new("UIPadding", ProxFrame); ProxPadding.PaddingBottom = UDim.new(0, 10) 

local ProxIcon = Instance.new("TextLabel", ProxFrame); ProxIcon.Size = UDim2.new(0, 50, 0, 40); ProxIcon.BackgroundTransparency = 1; ProxIcon.Text = "⚠️"; ProxIcon.TextSize = 35
local ProxTitle = Instance.new("TextLabel", ProxFrame); ProxTitle.Size = UDim2.new(1, -60, 0, 30); ProxTitle.Position = UDim2.new(0, 50, 0, 5); ProxTitle.BackgroundTransparency = 1; ProxTitle.Text = "NEARBY THREAT DETECTED!"; ProxTitle.TextColor3 = Color3.fromRGB(255, 80, 80); ProxTitle.Font = Enum.Font.GothamBlack; ProxTitle.TextSize = 16; ProxTitle.TextXAlignment = Enum.TextXAlignment.Left

local ProxList = Instance.new("TextLabel", ProxFrame); 
ProxList.Size = UDim2.new(1, -60, 0, 0); 
ProxList.AutomaticSize = Enum.AutomaticSize.Y 
ProxList.Position = UDim2.new(0, 50, 0, 35); 
ProxList.BackgroundTransparency = 1; 
ProxList.Text = "..."; 
RegisterTheme(ProxList, "TextColor3", "Text"); 
ProxList.Font = Enum.Font.Code; 
ProxList.TextSize = 14; 
ProxList.TextXAlignment = Enum.TextXAlignment.Left; 
ProxList.TextYAlignment = Enum.TextYAlignment.Top

-- [[ NEW STACKING TOAST SYSTEM ]]
local ToastContainer = Instance.new("Frame", ScreenGui)
ToastContainer.Name = "ToastContainer"
ToastContainer.Size = UDim2.new(0, 350, 1, -20)
ToastContainer.Position = UDim2.new(1, -360, 0, 0)
ToastContainer.BackgroundTransparency = 1
ToastContainer.ZIndex = 10000

local ToastLayout = Instance.new("UIListLayout", ToastContainer)
ToastLayout.SortOrder = Enum.SortOrder.LayoutOrder
ToastLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
ToastLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ToastLayout.Padding = UDim.new(0, 8)

local function ShowToast(text)
    local NewToast = Instance.new("Frame", ToastContainer)
    NewToast.Size = UDim2.new(0, 320, 0, 55)
    NewToast.BackgroundTransparency = 1
    RegisterTheme(NewToast, "BackgroundColor3", "Background")
    
    Instance.new("UICorner", NewToast).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", NewToast)
    RegisterTheme(Stroke, "Color", "Accent")
    Stroke.Thickness = 1
    Stroke.Transparency = 1
    
    local Lbl = Instance.new("TextLabel", NewToast)
    Lbl.Size = UDim2.new(1, -20, 1, 0)
    Lbl.Position = UDim2.new(0, 15, 0, 0)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = text
    RegisterTheme(Lbl, "TextColor3", "Text")
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 15
    Lbl.TextWrapped = true
    Lbl.TextTransparency = 1
    Lbl.TextXAlignment = Enum.TextXAlignment.Left

    NewToast.BackgroundTransparency = 0.1
    TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
    TweenService:Create(Lbl, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    local originalSize = UDim2.new(0, 320, 0, 55)
    NewToast.Size = UDim2.new(0, 290, 0, 55)
    TweenService:Create(NewToast, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = originalSize, BackgroundTransparency = 0.1}):Play()

    task.delay(3, function()
        if NewToast and NewToast.Parent then
            local outTween = TweenService:Create(NewToast, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 350, 0, 55)
            })
            outTween:Play()
            TweenService:Create(Stroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
            TweenService:Create(Lbl, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
            
            outTween.Completed:Connect(function()
                NewToast:Destroy()
            end)
        end
    end)
end

local ActiveListFrame = Instance.new("Frame", ScreenGui)
ActiveListFrame.Name = "ActiveModsList"
ActiveListFrame.Position = UDim2.new(1, -220, 0.4, 0) 
ActiveListFrame.Size = UDim2.new(0, 200, 0.5, 0)
ActiveListFrame.BackgroundTransparency = 1
local ActiveListLayout = Instance.new("UIListLayout", ActiveListFrame)
ActiveListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ActiveListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
ActiveListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ActiveListLayout.Padding = UDim.new(0, 4)

local function UpdateActiveList(featureName, isEnabled)
    local existing = ActiveListFrame:FindFirstChild(featureName)
    if isEnabled then
        if not existing then
            local label = Instance.new("TextLabel", ActiveListFrame)
            label.Name = featureName
            label.Size = UDim2.new(1, 0, 0, 22)
            label.BackgroundTransparency = 1
            label.Text = featureName .. "  " 
            label.Font = Enum.Font.GothamBold
            label.TextSize = 14
            RegisterTheme(label, "TextColor3", "Accent")
            label.TextXAlignment = Enum.TextXAlignment.Right
            label.TextTransparency = 1
            TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        end
    else
        if existing then
            local tween = TweenService:Create(existing, TweenInfo.new(0.3), {TextTransparency = 1})
            tween:Play(); tween.Completed:Connect(function() existing:Destroy() end)
        end
    end
end

local function MakeDraggable(Frame)
    local dragging, dragInput, dragStart, startPos
    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = Frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            TweenService:Create(Frame, TweenInfo.new(0.05), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
        end
    end)
end

-- [[ CORE LOGIC FUNCTIONS ]]
local function RejoinServer()
    ShowToast("Rejoining Server...")
    if #Players:GetPlayers() <= 1 then
        Players.LocalPlayer:Kick("Rejoining...") 
        task.wait()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        local success, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
        if not success then
            ShowToast("Instance Rejoin Failed. Finding New...")
            task.wait(1)
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end
    end
end

local function JoinJobId()
    if State.TargetJobId ~= "" then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, State.TargetJobId, LocalPlayer)
    end
end

local function JoinLowestServer()
    ShowToast("Scanning for lowest server...")
    local Http = game:GetService("HttpService")
    local PlaceId = game.PlaceId
    local function GetServers(cursor)
        local Url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor then Url = Url .. "&cursor=" .. cursor end
        local success, result = pcall(function() return game:HttpGet(Url) end)
        if success then return Http:JSONDecode(result) end
        return nil
    end
    task.spawn(function()
        local ServerData = GetServers(nil)
        if ServerData and ServerData.data then
            local BestServer = nil
            for _, server in pairs(ServerData.data) do
                if server.playing and server.maxPlayers and server.playing > 0 and server.playing < server.maxPlayers then
                    if not BestServer or server.playing < BestServer.playing then BestServer = server end
                end
            end
            if BestServer then
                ShowToast("Found! Players: " .. BestServer.playing)
                TeleportService:TeleportToPlaceInstance(PlaceId, BestServer.id, LocalPlayer)
            else ShowToast("No suitable server found.") end
        else ShowToast("Failed to fetch servers.") end
    end)
end

local function GetHitboxPart(character)
    if not character then return nil end
    return character:FindFirstChild("HumanoidRootPart")
end

local function GetVisualPart(character)
    if not character then return nil end
    return character.PrimaryPart 
        or character:FindFirstChild("Head") 
        or character:FindFirstChild("HumanoidRootPart") 
        or character:FindFirstChild("Torso") 
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChildWhichIsA("BasePart")
end

local function GetClosestPlayer()
    local closestDist = math.huge
    local closestPlr = nil
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local part = p.Character:FindFirstChild(State.AimbotPart)
            local hum = p.Character:FindFirstChild("Humanoid")
            if part and hum and hum.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local isVisible = true
                    if State.WallCheck then
                        local origin = Camera.CFrame.Position
                        local direction = (part.Position - origin).Unit * (part.Position - origin).Magnitude
                        local params = RaycastParams.new()
                        params.FilterDescendantsInstances = {LocalPlayer.Character, p.Character, Camera}
                        params.FilterType = Enum.RaycastFilterType.Exclude
                        local result = Workspace:Raycast(origin, direction, params)
                        if result then isVisible = false end
                    end

                    if isVisible then
                        local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                        local dist = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closestPlr = p
                        end
                    end
                end
            end
        end
    end
    return closestPlr
end

local WoWPart = Instance.new("Part", Workspace)
WoWPart.Name = "JesusWalk"
WoWPart.Size = Vector3.new(20, 1, 20)
WoWPart.Anchored = true
WoWPart.Transparency = 1
WoWPart.CanCollide = false 

UserInputService.JumpRequest:Connect(function()
    if State.InfiniteJump then
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end)

local function ToggleXRay(enable)
    if enable then
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
                if v.Transparency < 0.5 then v:SetAttribute("OrigTrans", v.Transparency); v.Transparency = 0.5 end
            end
        end
    else
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v:GetAttribute("OrigTrans") then
                v.Transparency = v:GetAttribute("OrigTrans"); v:SetAttribute("OrigTrans", nil)
            end
        end
    end
end

local function BoostFPS()
    Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9; settings().Rendering.QualityLevel = "Level01"
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then 
            v.Material = Enum.Material.SmoothPlastic; v.Reflectance = 0; v.CastShadow = false
        elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") then v:Destroy() end
    end
    ShowToast("FPS Boosted!")
end

local function ClearMemory()
    local terrain = Workspace:FindFirstChildOfClass("Terrain")
    if terrain then terrain.WaterWaveSize = 0; terrain.WaterWaveSpeed = 0; terrain.WaterReflectance = 0; terrain.WaterTransparency = 0 end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = "Level01"
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
    end
    collectgarbage("collect") 
    ShowToast("Memory Cleared & GC Run!")
end

local function StartFly()
    local char = LocalPlayer.Character; if not char then return end
    local root = GetVisualPart(char); if not root then return end
    for _, v in pairs(root:GetChildren()) do if v.Name == "GFlyV" or v.Name == "GFlyG" then v:Destroy() end end
    local bv = Instance.new("BodyVelocity", root); bv.Name = "GFlyV"; bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    local bg = Instance.new("BodyGyro", root); bg.Name = "GFlyG"; bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9); bg.P = 9000
    task.spawn(function()
        while State.Fly and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 do
            if not root:FindFirstChild("GFlyV") then break end
            local camCF = Camera.CFrame; local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
            bv.Velocity = dir * 60; bg.CFrame = camCF
            task.wait()
        end
        pcall(function() bv:Destroy(); bg:Destroy() end)
        char.Humanoid.PlatformStand = false
    end)
    char.Humanoid.PlatformStand = true
end

local function StopFly()
    pcall(function()
        local root = GetVisualPart(LocalPlayer.Character)
        if root and root:FindFirstChild("GFlyV") then root.GFlyV:Destroy() end
        if root and root:FindFirstChild("GFlyG") then root.GFlyG:Destroy() end
        LocalPlayer.Character.Humanoid.PlatformStand = false
    end)
end

local function ToggleFreecam(enable)
    State.Freecam = enable
    local char = LocalPlayer.Character; local root = GetVisualPart(char)
    if enable then
        local fp = Instance.new("Part", Workspace); fp.Name = "FreecamFocus"; fp.Anchored = true; fp.CanCollide = false; fp.Transparency = 1; fp.Position = Camera.CFrame.Position
        State.FreecamPart = fp; LocalPlayer.ReplicationFocus = fp 
        Camera.CameraType = Enum.CameraType.Scriptable; State.FreecamPos = Camera.CFrame
        local rx, ry, rz = Camera.CFrame:ToEulerAnglesYXZ(); State.FreecamRot = Vector2.new(rx, ry)
        if root then root.Anchored = true end
    else
        LocalPlayer.ReplicationFocus = nil 
        if State.FreecamPart then State.FreecamPart:Destroy(); State.FreecamPart = nil end
        Camera.CameraType = Enum.CameraType.Custom; UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        if char then Camera.CameraSubject = char:FindFirstChild("Humanoid"); if root then root.Anchored = false end end
    end
end

local function GetTeamColor(player)
    if player == LocalPlayer then return Color3.fromRGB(80, 255, 80) end
    if player.TeamColor == LocalPlayer.TeamColor then return Color3.fromRGB(80, 255, 80) else return Color3.fromRGB(255, 80, 80) end
end

local TracerLines = {}
local function ClearTracers()
    for _, line in pairs(TracerLines) do line:Remove() end
    TracerLines = {}
end

local function UpdateTracers()
    if not State.Tracers then return end
    local validTargets = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local part = GetVisualPart(p.Character)
            if part then table.insert(validTargets, {Player = p, Part = part}) end
        end
    end
    for i, target in ipairs(validTargets) do
        local line = TracerLines[i]
        if not line then
            local l = Drawing.new("Line"); l.Thickness = 1.5; l.Transparency = 1; l.Visible = false
            TracerLines[i] = l; line = l
        end
        local screenPos, onScreen = Camera:WorldToViewportPoint(target.Part.Position)
        if onScreen then
            line.Visible = true; line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y); line.To = Vector2.new(screenPos.X, screenPos.Y); line.Color = GetTeamColor(target.Player)
        else line.Visible = false end
    end
    for i = #validTargets + 1, #TracerLines do if TracerLines[i] then TracerLines[i]:Remove(); TracerLines[i] = nil end end
end

-- [ LOGIC V5 ]
-- [ FLY VEHICLE ]
local function StartVehicleFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    local root = nil
    
    if hum and hum.SeatPart then
        root = hum.SeatPart 
    else
        root = char:FindFirstChild("HumanoidRootPart")
    end
    
    if not root then return end

    if root:FindFirstChild("VFlyV") then root.VFlyV:Destroy() end
    if root:FindFirstChild("VFlyG") then root.VFlyG:Destroy() end

    local bv = Instance.new("BodyVelocity", root)
    bv.Name = "VFlyV"
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    
    local bg = Instance.new("BodyGyro", root)
    bg.Name = "VFlyG"
    bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    bg.P = 9000

    task.spawn(function()
        while State.FlyVehicle and root and root.Parent do
            local camCF = Camera.CFrame
            local speed = 100 
            local dir = Vector3.zero

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, -1, 0) end

            bv.Velocity = dir * speed
            bg.CFrame = camCF
            task.wait()
        end
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end)
end

-- WALL RUN
local function GetSurfaceNormal()
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude

    local directions = {
        -root.CFrame.UpVector * 5, 
        -root.CFrame.RightVector * 3, 
        root.CFrame.RightVector * 3, 
        root.CFrame.LookVector * 3,
        -root.CFrame.LookVector * 3
    }

    for _, dir in pairs(directions) do
        local result = Workspace:Raycast(root.Position, dir, params)
        if result and result.Instance and result.Instance.CanCollide then
            return result.Normal 
        end
    end
    return nil
end

-- LOGIKA CHAT BYPASS
local function BypassMessage(msg)
    local invisibleChar = "‎" 
    local newMsg = ""
    
    for i = 1, #msg do
        newMsg = newMsg .. string.sub(msg, i, i) .. invisibleChar
    end
    
    return newMsg
end

local function SendBypassChat(text)
    local safeText = BypassMessage(text)
    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then channel:SendAsync(safeText) end
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(safeText, "All")
    end
end

RunService.Heartbeat:Connect(function(dt)
    if State.WallRun and LocalPlayer.Character then
        local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        
        if root and hum then
            local normal = GetSurfaceNormal()
            if normal then
                local currentUp = root.CFrame.UpVector
                local newUp = normal

                if currentUp:Dot(newUp) < 0.99 then
                    local axis = currentUp:Cross(newUp)
                    local angle = math.acos(math.clamp(currentUp:Dot(newUp), -1, 1))

                    local rot = CFrame.fromAxisAngle(axis, angle * 5 * dt)
                    root.CFrame = rot * root.CFrame
                end

                hum.AutoRotate = false
                if not root:FindFirstChild("AntiGrav") then
                    local f = Instance.new("BodyForce", root)
                    f.Name = "AntiGrav"
                    f.Force = Vector3.new(0, workspace.Gravity * root.AssemblyMass, 0)
                else
                    root.AntiGrav.Force = Vector3.new(0, workspace.Gravity * root.AssemblyMass, 0)
                end
            else
                 if root:FindFirstChild("AntiGrav") then root.AntiGrav:Destroy() end
                 hum.AutoRotate = true
            end
        end
    else
        if LocalPlayer.Character then
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root and root:FindFirstChild("AntiGrav") then root.AntiGrav:Destroy() end
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.AutoRotate = true end
        end
    end
end)

-- [ LOGIKA DELETE MAP ]
local function DeleteMap()
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name ~= "Terrain" and not v:IsA("Camera") and not Players:GetPlayerFromCharacter(v) then
            if v ~= LocalPlayer.Character then
                v:Destroy()
            end
        end
    end
    ShowToast("🔥 Map Deleted for FPS Boost!")
end

-- [ LOGIKA TEXTURE REMOVER ]
local function RemoveTextures()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") or v:IsA("SurfaceAppearance") then
            v:Destroy()
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
    ShowToast("🎨 Textures Removed!")
end

-- 7. UPDATE CHECKER
local function CheckUpdate()
    ShowToast("Checking updates...")

    local url = "https://pastebin.com/raw/ContohLinkVersiKamu?i=1"

    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        ShowToast("❌ ERROR: " .. tostring(result))
        return
    end

    if result ~= State.CurrentVersion then
        ShowToast("⚠️ NEW UPDATE AVAILABLE: " .. result)
    else
        ShowToast("✅ You are using the latest version!")
    end
end

-- 8. LANGUAGE SYSTEM (KAMUS)
local LangDict = {
    ["ID"] = {
        Warn = "PERINGATAN",
        Cpy = "Tautan Disalin",
        Stat = "Status"
    },
    ["EN"] = {
        Warn = "WARNING",
        Cpy = "Link Copied",
        Stat = "Status"
    }
}
local function GetTxt(key)
    return LangDict[State.SelectedLang][key] or key
end

-- [ LOGIKA AUTO BHOP LEGIT ]
RunService.Heartbeat:Connect(function()
    if State.BhopLegit and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum and hum.FloorMaterial ~= Enum.Material.Air and hum.MoveDirection.Magnitude > 0 then
            -- Fitur Legit: Kadang-kadang GAGAL loncat biar dikira manusia
            -- Peluang loncat 85%
            if math.random(1, 100) <= 85 then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- [FIXED HITBOX LOOP - SUPER LIGHTWEIGHT v6.2]
RunService.Heartbeat:Connect(function()
    if State.HitboxLoop then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local char = p.Character
                if char and char.Parent then
                    local target = char:FindFirstChild("HumanoidRootPart")
                    if target then
                        target.CanCollide = false 
                        local newSize = Vector3.new(State.HitboxSize, State.HitboxSize, State.HitboxSize)
                        if target.Size ~= newSize then 
                            target.Size = newSize 
                        end
                        
                        local targetTrans = State.HitboxInvisible and 1 or 0.6
                        if target.Transparency ~= targetTrans then 
                            target.Transparency = targetTrans 
                        end
                    end
                end
            end
        end
    end
end)

-- [[ UPDATED: NOCLIP BYPASS V2 ]]
RunService.Stepped:Connect(function()
    if State.Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then 
                part.CanCollide = false
                if part.Velocity.Magnitude > 100 then
                   part.Velocity = Vector3.new(0, 0, 0)
                   part.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)

-- [FIXED: WEAPON RAPID FIRE - PAKE DIRECT TOOL MANIPULATION]
task.spawn(function()
    while true do
        if State.WeaponRapidFire and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            local char = LocalPlayer.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate() 
                task.wait()  
                tool:Deactivate() 
            end
            
            local delay = 1 / math.max(1, State.RapidFireCPS)
            task.wait(delay)
        else
            task.wait(0.2)
        end
    end
end)

-- [[ SMART INSTANT PROXIMITY (OPTIMIZED) ]]
task.spawn(function()
    local LastState = false -- Penanda: Apakah fitur baru saja dimatikan?
    while true do
        if State.InstantPrompt then
            LastState = true -- Tandai bahwa fitur sedang aktif
            -- [ MODE AKTIF: KERJA ]
            for _, prompt in pairs(Workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    -- Backup durasi asli
                    if not prompt:GetAttribute("OriginalDur") then
                        prompt:SetAttribute("OriginalDur", prompt.HoldDuration)
                    end
                    -- Paksa jadi 0
                    if prompt.HoldDuration > 0 then prompt.HoldDuration = 0 end
                end
            end
            task.wait(0.5) -- Cek setiap 0.5 detik saat aktif
        else
            -- [ MODE MATI: BERES-BERES SEKALI, LALU TIDUR ]
            if LastState == true then
                -- Kembalikan durasi asli (Restore)
                for _, prompt in pairs(Workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        local original = prompt:GetAttribute("OriginalDur")
                        if original then
                            prompt.HoldDuration = original
                            prompt:SetAttribute("OriginalDur", nil)
                        end
                    end
                end
                LastState = false -- Tandai sudah selesai beres-beres
                ShowToast("Proximity Restored")
            end
            
            -- Nah, sekarang dia "Tidur Panjang" karena LastState sudah false
            task.wait(2) 
        end
    end
end)

task.spawn(function()
    while true do
        if State.ChatSpammer then
            local msg = State.SpamMessage
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                local channel = TextChatService.TextChannels.RBXGeneral
                if channel then channel:SendAsync(msg) end
            else
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
            end
            task.wait(0.5) 
        else
            task.wait(1)
        end
    end
end)


-- [[ ADVANCED STATS PANEL ]]
local StatsFrame = Instance.new("Frame", ScreenGui); StatsFrame.Name = "StatsPanel"; StatsFrame.Size = UDim2.new(0, 220, 0, 180); StatsFrame.Position = UDim2.new(0, 10, 0.4, 0); RegisterTheme(StatsFrame, "BackgroundColor3", "Background"); StatsFrame.Visible = false
Instance.new("UICorner", StatsFrame).CornerRadius = UDim.new(0, 8); local StatsStroke = Instance.new("UIStroke", StatsFrame); RegisterTheme(StatsStroke, "Color", "Accent"); StatsStroke.Thickness = 1
MakeDraggable(StatsFrame)
local StatsHeader = Instance.new("TextLabel", StatsFrame); StatsHeader.Size = UDim2.new(1, 0, 0, 25); StatsHeader.BackgroundTransparency = 1; StatsHeader.Text = "SYSTEM MONITOR"; RegisterTheme(StatsHeader, "TextColor3", "Accent"); StatsHeader.Font = Enum.Font.GothamBlack; StatsHeader.TextSize = 13
local StatsContainer = Instance.new("Frame", StatsFrame); StatsContainer.Size = UDim2.new(1, -10, 1, -30); StatsContainer.Position = UDim2.new(0, 5, 0, 30); StatsContainer.BackgroundTransparency = 1
local StatsList = Instance.new("UIListLayout", StatsContainer); StatsList.Padding = UDim.new(0, 2)

local function CreateStatLabel(name)
    local f = Instance.new("Frame", StatsContainer); f.Size = UDim2.new(1, 0, 0, 18); f.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", f); l.Size = UDim2.new(0.5, 0, 1, 0); l.BackgroundTransparency = 1; l.Text = name; RegisterTheme(l, "TextColor3", "TextDim"); l.Font = Enum.Font.GothamBold; l.TextSize = 12; l.TextXAlignment = Enum.TextXAlignment.Left
    local v = Instance.new("TextLabel", f); v.Size = UDim2.new(0.5, 0, 1, 0); v.Position = UDim2.new(0.5, 0, 0, 0); v.BackgroundTransparency = 1; v.Text = "..."; RegisterTheme(v, "TextColor3", "Text"); v.Font = Enum.Font.Code; v.TextSize = 12; v.TextXAlignment = Enum.TextXAlignment.Right
    return v
end

local FPSLabel = CreateStatLabel("FPS:")
local PingLabel = CreateStatLabel("Ping:")
local PlrLabel = CreateStatLabel("Players:")
local MemLabel = CreateStatLabel("Memory:")
local RecvLabel = CreateStatLabel("Recv:")
local SentLabel = CreateStatLabel("Sent:")
local InstLabel = CreateStatLabel("Instances:")

task.spawn(function()
    while true do
        if State.ShowStats and StatsFrame.Visible then
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            FPSLabel.Text = tostring(fps)
            local pingVal = 0
            pcall(function() pingVal = math.floor(LocalPlayer:GetNetworkPing() * 2000) end)
            if pingVal == 0 then pcall(function() pingVal = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()) end) end
            PingLabel.Text = pingVal .. " ms"
            pcall(function() PlrLabel.Text = #Players:GetPlayers() .. " / " .. Players.MaxPlayers end)
            local mem = math.floor(StatsService:GetTotalMemoryUsageMb())
            MemLabel.Text = mem .. " MB"
            local recv = 0; local sent = 0
            pcall(function() recv = math.floor(StatsService.Network.ServerStatsItem["Data Receive"]:GetValue()) end)
            pcall(function() sent = math.floor(StatsService.Network.ServerStatsItem["Data Send"]:GetValue()) end)
            RecvLabel.Text = recv .. " KB/s"
            SentLabel.Text = sent .. " KB/s"
            pcall(function() InstLabel.Text = tostring(#Workspace:GetDescendants()) end)
        else
            task.wait(1)
        end
        task.wait(0.5) 
    end
end)

local AnimLogFrame = Instance.new("Frame", ScreenGui); AnimLogFrame.Name = "AnimLogger"; AnimLogFrame.Size = UDim2.new(0, 220, 0, 160); AnimLogFrame.Position = UDim2.new(0, 10, 0.5, -80); RegisterTheme(AnimLogFrame, "BackgroundColor3", "Background"); AnimLogFrame.Visible = false
Instance.new("UICorner", AnimLogFrame).CornerRadius = UDim.new(0, 8); local ALStroke = Instance.new("UIStroke", AnimLogFrame); RegisterTheme(ALStroke, "Color", "Accent"); ALStroke.Thickness = 1; MakeDraggable(AnimLogFrame)
local ALContainer = Instance.new("ScrollingFrame", AnimLogFrame); ALContainer.Size = UDim2.new(1, -10, 1, -30); ALContainer.Position = UDim2.new(0, 5, 0, 30); ALContainer.BackgroundTransparency = 1; ALContainer.ScrollBarThickness = 3; ALContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
local ALList = Instance.new("UIListLayout", ALContainer); ALList.Padding = UDim.new(0, 2); local ALHeader = Instance.new("TextLabel", AnimLogFrame); ALHeader.Size = UDim2.new(1, 0, 0, 25); ALHeader.BackgroundTransparency = 1; ALHeader.Text = "ANIM LOG"; RegisterTheme(ALHeader, "TextColor3", "Accent"); ALHeader.Font = Enum.Font.GothamBlack; ALHeader.TextSize = 14

local EventLogFrame = Instance.new("Frame", ScreenGui); EventLogFrame.Name = "EventLogger"; EventLogFrame.Size = UDim2.new(0, 240, 0, 160); EventLogFrame.Position = UDim2.new(0, 240, 0.5, -80); RegisterTheme(EventLogFrame, "BackgroundColor3", "Background"); EventLogFrame.Visible = false
Instance.new("UICorner", EventLogFrame).CornerRadius = UDim.new(0, 8); local ELStroke = Instance.new("UIStroke", EventLogFrame); RegisterTheme(ELStroke, "Color", "Accent"); ELStroke.Thickness = 1; MakeDraggable(EventLogFrame)
local ELContainer = Instance.new("ScrollingFrame", EventLogFrame); ELContainer.Size = UDim2.new(1, -10, 1, -30); ELContainer.Position = UDim2.new(0, 5, 0, 30); ELContainer.BackgroundTransparency = 1; ELContainer.ScrollBarThickness = 3; ELContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
local ELList = Instance.new("UIListLayout", ELContainer); ELList.Padding = UDim.new(0, 2); local ELHeader = Instance.new("TextLabel", EventLogFrame); ELHeader.Size = UDim2.new(0.7, 0, 0, 25); ELHeader.BackgroundTransparency = 1; ELHeader.Text = "REMOTE SPY"; RegisterTheme(ELHeader, "TextColor3", "Accent"); ELHeader.Font = Enum.Font.GothamBlack; ELHeader.TextSize = 14; ELHeader.Position = UDim2.new(0,5,0,0); ELHeader.TextXAlignment = Enum.TextXAlignment.Left

local ChatLogFrame = Instance.new("Frame", ScreenGui); ChatLogFrame.Name = "ChatLogger"; ChatLogFrame.Size = UDim2.new(0, 260, 0, 180); ChatLogFrame.Position = UDim2.new(1, -280, 0.5, -80); RegisterTheme(ChatLogFrame, "BackgroundColor3", "Background"); ChatLogFrame.Visible = false
Instance.new("UICorner", ChatLogFrame).CornerRadius = UDim.new(0, 8); local CLStroke = Instance.new("UIStroke", ChatLogFrame); RegisterTheme(CLStroke, "Color", "Accent"); CLStroke.Thickness = 1; MakeDraggable(ChatLogFrame)
local CLContainer = Instance.new("ScrollingFrame", ChatLogFrame); CLContainer.Size = UDim2.new(1, -10, 1, -30); CLContainer.Position = UDim2.new(0, 5, 0, 30); CLContainer.BackgroundTransparency = 1; CLContainer.ScrollBarThickness = 3; CLContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
local CLList = Instance.new("UIListLayout", CLContainer); CLList.Padding = UDim.new(0, 4); local CLHeader = Instance.new("TextLabel", ChatLogFrame); CLHeader.Size = UDim2.new(1, 0, 0, 25); CLHeader.BackgroundTransparency = 1; CLHeader.Text = "CHAT LOG"; RegisterTheme(CLHeader, "TextColor3", "Accent"); CLHeader.Font = Enum.Font.GothamBlack; CLHeader.TextSize = 14

-- [[ RADAR GUI (TACTICAL) ]]
local RadarFrame = Instance.new("Frame", ScreenGui)
RadarFrame.Name = "RadarGUI"
RadarFrame.Size = UDim2.new(0, 160, 0, 160)
RadarFrame.Position = UDim2.new(0, 20, 0.7, 0)
RegisterTheme(RadarFrame, "BackgroundColor3", "Background")
RadarFrame.Visible = false
RadarFrame.ClipsDescendants = true
RadarFrame.BackgroundTransparency = 0.3 -- Sedikit transparan biar keren
Instance.new("UICorner", RadarFrame).CornerRadius = UDim.new(0, 100) 
local RadarStroke = Instance.new("UIStroke", RadarFrame); RegisterTheme(RadarStroke, "Color", "Accent"); RadarStroke.Thickness = 2
MakeDraggable(RadarFrame)
local Ring1 = Instance.new("Frame", RadarFrame)
Ring1.Size = UDim2.new(0.5, 0, 0.5, 0); Ring1.Position = UDim2.new(0.25, 0, 0.25, 0)
Ring1.BackgroundTransparency = 1; Instance.new("UICorner", Ring1).CornerRadius = UDim.new(1,0)
local S1 = Instance.new("UIStroke", Ring1); S1.Color = Color3.fromRGB(100, 100, 100); S1.Thickness = 1; S1.Transparency = 0.5
local Ring2 = Instance.new("Frame", RadarFrame)
Ring2.Size = UDim2.new(0.25, 0, 0.25, 0); Ring2.Position = UDim2.new(0.375, 0, 0.375, 0)
Ring2.BackgroundTransparency = 1; Instance.new("UICorner", Ring2).CornerRadius = UDim.new(1,0)
local S2 = Instance.new("UIStroke", Ring2); S2.Color = Color3.fromRGB(100, 100, 100); S2.Thickness = 1; S2.Transparency = 0.5
local HLine = Instance.new("Frame", RadarFrame); HLine.Size = UDim2.new(1, 0, 0, 1); HLine.Position = UDim2.new(0, 0, 0.5, 0); HLine.BackgroundColor3 = Color3.fromRGB(100, 100, 100); HLine.BackgroundTransparency = 0.5; HLine.BorderSizePixel = 0
local VLine = Instance.new("Frame", RadarFrame); VLine.Size = UDim2.new(0, 1, 1, 0); VLine.Position = UDim2.new(0.5, 0, 0, 0); VLine.BackgroundColor3 = Color3.fromRGB(100, 100, 100); VLine.BackgroundTransparency = 0.5; VLine.BorderSizePixel = 0
local RadarArrow = Instance.new("TextLabel", RadarFrame)
RadarArrow.Size = UDim2.new(0, 20, 0, 20)
RadarArrow.Position = UDim2.new(0.5, -10, 0.5, -12) -- Pas di tengah
RadarArrow.BackgroundTransparency = 1
RadarArrow.Text = "▲" -- Simbol Panah
RadarArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
RadarArrow.Font = Enum.Font.GothamBlack
RadarArrow.TextSize = 14
RadarArrow.ZIndex = 10
local RadarContent = Instance.new("Frame", RadarFrame)
RadarContent.Size = UDim2.new(1,0,1,0); RadarContent.BackgroundTransparency = 1

local ActiveAnimLabels = {}
local function ClearAnimLog() for _, child in pairs(ALContainer:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end ActiveAnimLabels = {} end
local function ClearEventLog() for _, child in pairs(ELContainer:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end end
local function ClearChatLog() for _, child in pairs(CLContainer:GetChildren()) do if child:IsA("TextLabel") then child:Destroy() end end end

local function UpdateAnimLogger()
    if not State.AnimLogger then AnimLogFrame.Visible = false; ClearAnimLog() return end
    AnimLogFrame.Visible = true
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChild("Humanoid"); if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator"); if not animator then return end
    animator.AnimationPlayed:Connect(function(track)
        if not State.AnimLogger then return end
        local animId = track.Animation.AnimationId
        local idNum = string.match(animId, "%d+") or "Unknown"
        if ActiveAnimLabels[track] then return end
        local lbl = Instance.new("TextButton", ALContainer)
        lbl.Size = UDim2.new(1, 0, 0, 20); lbl.BackgroundTransparency = 1; lbl.Text = "ID: " .. idNum; RegisterTheme(lbl, "TextColor3", "Text"); lbl.Font = Enum.Font.Code; lbl.TextSize = 13; lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.MouseButton1Click:Connect(function() setclipboard(idNum); ShowToast("Anim ID Copied") end)
        ActiveAnimLabels[track] = lbl
        track.Stopped:Connect(function() if ActiveAnimLabels[track] then ActiveAnimLabels[track]:Destroy(); ActiveAnimLabels[track] = nil end end)
    end)
end

local function InitEventLogger()
    if not State.EventLogger then EventLogFrame.Visible = false; ClearEventLog() return end
    EventLogFrame.Visible = true
    local Blacklist = {"CharacterSoundEvent", "UpdateState", "Replication", "Touch", "Footstep", "Move", "Heartbeat", "Render"}
    local function LogEvent(name, args)
        if not State.EventLogger then return end
        for _, blocked in pairs(Blacklist) do if string.find(name, blocked) then return end end
        local lbl = Instance.new("TextButton", ELContainer)
        lbl.Size = UDim2.new(1, 0, 0, 20); lbl.BackgroundTransparency = 1; lbl.Text = "> " .. name; lbl.TextColor3 = Color3.fromRGB(80, 255, 80); lbl.Font = Enum.Font.Code; lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd
        lbl.MouseButton1Click:Connect(function()
            local s = "Remote: " .. name .. "\nArgs: "; for i,v in pairs(args) do s = s .. tostring(v) .. ", " end; setclipboard(s); ShowToast("Args Copied")
        end)
        local children = ELContainer:GetChildren(); if #children > 30 then for i=1, 5 do if children[i] and children[i]:IsA("TextButton") then children[i]:Destroy() end end end
    end
    local function ConnectRemote(rc) if rc:IsA("RemoteEvent") then rc.OnClientEvent:Connect(function(...) LogEvent(rc.Name, {...}) end) end end
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do ConnectRemote(v) end
    ReplicatedStorage.DescendantAdded:Connect(ConnectRemote)
end

local function InitChatLogger()
    if not State.ChatLogger then ChatLogFrame.Visible = false; ClearChatLog() return end
    ChatLogFrame.Visible = true
    
    local function LogMessage(player, msg)
        if not State.ChatLogger then return end
        local time = os.date("%H:%M")
        local name = (player and player.DisplayName) or "Unknown"
        local lbl = Instance.new("TextLabel", CLContainer)
        lbl.Size = UDim2.new(1, 0, 0, 25); lbl.BackgroundTransparency = 1; lbl.Font = Enum.Font.GothamMedium; lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextWrapped = true
        lbl.RichText = true; lbl.Text = string.format("<font color='rgb(0,255,140)'>[%s] %s:</font> %s", time, name, msg); RegisterTheme(lbl, "TextColor3", "Text")
        CLContainer.CanvasPosition = Vector2.new(0, 99999)
        local children = CLContainer:GetChildren(); if #children > 40 then for i=1, 5 do if children[i] and children[i]:IsA("TextLabel") then children[i]:Destroy() end end end
    end

    local success, _ = pcall(function()
        TextChatService.MessageReceived:Connect(function(msg) if msg.TextSource then LogMessage(Players:GetPlayerByUserId(msg.TextSource.UserId), msg.Text) end end)
    end)
    if not success then
        pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) LogMessage(Players[data.FromSpeaker], data.Message) end) end)
    end
end

-- [[ WORLD ESP LOGIC (NPC / ITEMS) ]]
local NpcTracerLines = {}
local CacheNPCs = {} 

-- [[ WORLD ESP LOGIC (OPTIMIZED & SLEEP MODE) ]]
task.spawn(function()
    local CleanupDone = true -- Penanda: Apakah sampah GUI sudah dibuang?

    while true do
        if State.NpcESP or State.ItemESP then
            CleanupDone = false -- Kita sedang "mengotori" layar dengan GUI
            CacheNPCs = {} 

            -- [ MODE AKTIF: SCANNING ]
            for _, obj in pairs(Workspace:GetDescendants()) do
                -- LOGIKA ITEM ESP
                if State.ItemESP and (obj:IsA("Tool") or obj:IsA("Handle") or obj.Name == "Handle") then
                    local target = obj:IsA("Tool") and obj:FindFirstChild("Handle") or obj
                    if target and target:IsA("BasePart") then
                        if not target:FindFirstChild("ReyzzItemESP") then
                            local b = Instance.new("BillboardGui", target)
                            b.Name = "ReyzzItemESP"; b.Size = UDim2.new(0, 100, 0, 50); b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0, 2, 0)
                            local t = Instance.new("TextLabel", b); t.Size = UDim2.new(1,0,1,0); t.BackgroundTransparency = 1; t.TextColor3 = Color3.fromRGB(0, 255, 255); t.TextStrokeTransparency = 0; t.TextSize = 10
                            t.Text = (obj:IsA("Tool") and obj.Name or obj.Parent.Name)
                        end
                    end
                elseif not State.ItemESP and obj:FindFirstChild("ReyzzItemESP") then
                    obj.ReyzzItemESP:Destroy()
                end
                
                -- LOGIKA NPC ESP
                if State.NpcESP and obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
                    local hum = obj:FindFirstChild("Humanoid")
                    if root and hum then
                        if not obj:FindFirstChild("ReyzzNpcESP") then
                            local b = Instance.new("BillboardGui", obj)
                            b.Name = "ReyzzNpcESP"; b.Size = UDim2.new(0, 200, 0, 80); b.Adornee = root; b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0, 4, 0)
                            
                            local nameLbl = Instance.new("TextLabel", b); nameLbl.Name="NameL"; nameLbl.Size=UDim2.new(1,0,0,15); nameLbl.BackgroundTransparency=1; nameLbl.TextColor3=Color3.fromRGB(255, 170, 0); nameLbl.TextSize=11; nameLbl.Font=Enum.Font.GothamBold
                            nameLbl.Text = "[NPC] " .. obj.Name
                            
                            local hpLbl = Instance.new("TextLabel", b); hpLbl.Name="HPL"; hpLbl.Size=UDim2.new(1,0,0,15); hpLbl.Position=UDim2.new(0,0,0,15); hpLbl.BackgroundTransparency=1; hpLbl.TextSize=10; hpLbl.TextColor3=Color3.new(1,1,1)
                        end
                        
                        local gui = obj:FindFirstChild("ReyzzNpcESP")
                        if gui and gui:FindFirstChild("HPL") then 
                            gui.HPL.Text = "HP: " .. math.floor(hum.Health) 
                        end
                        table.insert(CacheNPCs, root)
                    end
                elseif not State.NpcESP and obj:IsA("Model") and obj:FindFirstChild("ReyzzNpcESP") then
                    obj.ReyzzNpcESP:Destroy()
                end
            end
            task.wait(2) -- Scan tiap 2 detik (Sudah cukup cepat)
        else
            -- [ MODE MATI: BERSIHKAN SEKALI, LALU TIDUR ]
            if not CleanupDone then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "ReyzzItemESP" or v.Name == "ReyzzNpcESP" then v:Destroy() end
                end
                CacheNPCs = {}
                CleanupDone = true -- Tandai sudah bersih
            end
            
            -- Tidur panjang, CPU istirahat total
            task.wait(3) 
        end
    end
end)


RunService.RenderStepped:Connect(function(dt)
    if State.Tracers then pcall(UpdateTracers) end
    -- [[ RADAR LOGIC V2 (REAL TEAM COLORS) ]]
    if State.Radar then
        RadarFrame.Visible = true
        for _, v in pairs(RadarContent:GetChildren()) do v.Visible = false end

        local centerPos = RadarFrame.AbsoluteSize / 2
        local scale = RadarFrame.AbsoluteSize.X / 2 

        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local char = p.Character
                local root = char:FindFirstChild("HumanoidRootPart")
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                if root and myRoot then
                    local dist = (root.Position - myRoot.Position).Magnitude
                    
                    if dist <= State.RadarRange then
                        local dot = RadarContent:FindFirstChild("Dot_" .. p.Name)
                        if not dot then
                            dot = Instance.new("Frame", RadarContent)
                            dot.Name = "Dot_" .. p.Name
                            dot.Size = UDim2.new(0, 8, 0, 8)
                            Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
                            local s = Instance.new("UIStroke", dot); s.Color = Color3.new(1,1,1); s.Thickness = 1; s.Transparency = 0.2
                            dot.ZIndex = 5
                        end

                        if p.TeamColor then
                            dot.BackgroundColor3 = p.TeamColor.Color
                        else
                            if p.TeamColor == LocalPlayer.TeamColor then
                                dot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                            else
                                dot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                            end
                        end
                        local camAngle = math.atan2(Camera.CFrame.LookVector.X, Camera.CFrame.LookVector.Z)
                        local relativePos = root.Position - myRoot.Position
                        local relAngle = math.atan2(relativePos.X, relativePos.Z) - camAngle
                        local relDist = (dist / State.RadarRange) * scale 
                        local r_len = math.min(relDist, scale - 5) 
                        local x = math.sin(relAngle) * r_len
                        local y = math.cos(relAngle) * r_len
                        
                        dot.Position = UDim2.new(0, centerPos.X + x - 4, 0, centerPos.Y - y - 4)
                        dot.Visible = true
                    end
                end
            end
        end
    else
        RadarFrame.Visible = false
    end
    if State.Crosshair then CrosshairFrame.Visible = true else CrosshairFrame.Visible = false end
    
    -- [[ UNDEAD CAMERA FIXER ]]
    if State.AutoRegen and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            if Camera.CameraSubject ~= hum then
                Camera.CameraSubject = hum
            end
            if Camera.CameraType ~= Enum.CameraType.Custom then
                Camera.CameraType = Enum.CameraType.Custom
            end
        end
        local Lighting = game:GetService("Lighting")
        for _, v in pairs(Lighting:GetChildren()) do
            if (v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect")) and v.Enabled then
                v.Enabled = false 
            end
        end
    end

    -- [[ FIX: MAX ZOOM LOOP FORCE (Improved) ]]
    if State.MaxZoom then
        LocalPlayer.CameraMaxZoomDistance = 1000
        LocalPlayer.CameraMinZoomDistance = 0.5 
    end

    -- [[ NPC TRACERS LOGIC (FIXED MEMORY LEAK) ]]
    if State.NpcESP or #NpcTracerLines > 0 then
        for _, l in pairs(NpcTracerLines) do l:Remove() end
        NpcTracerLines = {}
    end
    
    if State.NpcESP then
        for _, root in pairs(CacheNPCs) do
            if root and root.Parent then
                local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local line = Drawing.new("Line")
                    line.Visible = true
                    line.Thickness = 1
                    line.Transparency = 1
                    line.Color = Color3.fromRGB(255, 170, 0)
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y) -- Bottom Middle
                    line.To = Vector2.new(screenPos.X, screenPos.Y)
                    table.insert(NpcTracerLines, line)
                end
            end
        end
    end

    if State.Aimbot and UserInputService:IsMouseButtonPressed(State.AimbotButton) then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = target.Character:FindFirstChild(State.AimbotPart)
            if part then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
            end
        end
    end

    if State.AutoClicker then
        local interval = 1 / State.CPS
        if tick() % interval < 0.05 then 
            mouse1click() 
        end
    end

    if State.Bhop and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 and hum.FloorMaterial ~= Enum.Material.Air then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    if State.FakeLag and LocalPlayer.Character then
        local root = GetVisualPart(LocalPlayer.Character)
        if root then
            if tick() % 0.2 < 0.1 then root.Anchored = true else root.Anchored = false end
        end
    else
        if LocalPlayer.Character then 
            local root = GetVisualPart(LocalPlayer.Character)
            if root and root.Anchored and not State.Freecam then root.Anchored = false end
        end
    end

    if State.GravityControl and LocalPlayer.Character then
        local root = GetVisualPart(LocalPlayer.Character)
        if root then
            local ray = Ray.new(root.Position, -root.CFrame.UpVector * 10)
            local part, pos, normal = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
            if part then
                local currentRight = root.CFrame.RightVector
                local newUp = normal
                local newRight = currentRight:Cross(newUp).Unit
                local newLook = newUp:Cross(newRight).Unit
                root.CFrame = CFrame.fromMatrix(root.Position, newRight, newUp, newLook)
            end
        end
    end

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        if root.Position.Y > State.VoidHeight + 10 and LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            State.LastSafePos = root.CFrame
        end
        if State.AntiVoid and root.Position.Y < State.VoidHeight then
            if State.LastSafePos then
                root.CFrame = State.LastSafePos + Vector3.new(0, 3, 0)
                root.Velocity = Vector3.new(0,0,0)
                ShowToast("Anti-Void: Saved!")
            end
        end
    end

    if State.WalkOnWater and LocalPlayer.Character then
        local root = GetVisualPart(LocalPlayer.Character)
        if root then
            local params = RaycastParams.new(); params.FilterDescendantsInstances = {LocalPlayer.Character, WoWPart}
            local ray = Workspace:Raycast(root.Position, Vector3.new(0, -10, 0), params)
            if ray and ray.Material == Enum.Material.Water then
                WoWPart.CanCollide = true
                WoWPart.Position = Vector3.new(root.Position.X, ray.Position.Y, root.Position.Z)
            else
                WoWPart.CanCollide = false
            end
        end
    else
        WoWPart.CanCollide = false
    end

    if State.Spider and LocalPlayer.Character then
        local root = GetVisualPart(LocalPlayer.Character)
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if root and hum then
            local ray = Ray.new(root.Position, root.CFrame.LookVector * 2)
            local part, _ = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
            if part and hum.MoveDirection.Magnitude > 0 then
                root.Velocity = Vector3.new(root.Velocity.X, 25, root.Velocity.Z) -- Panjat
            end
        end
    end

    if (State.SpinBot or State.TouchFling) and LocalPlayer.Character then
        local root = GetVisualPart(LocalPlayer.Character)
        if root then
            local vel = root:FindFirstChild("SpinBotVel")
            if not vel then vel = Instance.new("BodyAngularVelocity", root); vel.Name = "SpinBotVel"; vel.MaxTorque = Vector3.new(0, math.huge, 0) end
            if State.TouchFling then vel.AngularVelocity = Vector3.new(0, 9999, 0) else vel.AngularVelocity = Vector3.new(0, State.SpinSpeed, 0) end
        end
    else
        if LocalPlayer.Character then local root = GetVisualPart(LocalPlayer.Character); if root and root:FindFirstChild("SpinBotVel") then root.SpinBotVel:Destroy() end end
    end
    
    if State.ForceUnlockMouse then
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then UserInputService.MouseBehavior = Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = true end
    end

    if State.Freecam then
        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
            local delta = UserInputService:GetMouseDelta(); State.FreecamRot = State.FreecamRot - Vector2.new(delta.Y * 0.003, delta.X * 0.003)
        else UserInputService.MouseBehavior = Enum.MouseBehavior.Default end
        local rotCFrame = CFrame.fromEulerAnglesYXZ(State.FreecamRot.X, State.FreecamRot.Y, 0)
        local moveDir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + rotCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - rotCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + rotCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - rotCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then moveDir = moveDir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then moveDir = moveDir - Vector3.new(0,1,0) end
        local spd = State.FreecamSpeed * 50 * dt; if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then spd = spd * 3 end
        State.FreecamPos = State.FreecamPos + (moveDir * spd); Camera.CFrame = CFrame.new(State.FreecamPos.Position) * rotCFrame
        if State.FreecamPart then State.FreecamPart.CFrame = Camera.CFrame end
    end
    
    if State.FullbrightLoop then Lighting.Brightness=2; Lighting.ClockTime=14; Lighting.FogEnd=1e9; Lighting.GlobalShadows=false end
    if State.NoFog then 
        Lighting.FogEnd = 9e9; Lighting.FogStart = 9e9
        local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if Atmosphere then Atmosphere.Density = 0; Atmosphere.Haze = 0; Atmosphere.Glare = 0 end
    end
    if State.NoParticles then for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("ParticleEmitter") then v.Enabled=false end end end
    
    if State.SpectatingPlayer and State.CinematicCamera then
        local p = State.SpectatingPlayer
        if p and p.Character then
            local targetPart = p.Character:FindFirstChild("Head") or GetVisualPart(p.Character)
            if targetPart then
                Camera.CameraType = Enum.CameraType.Scriptable
                local vel = targetPart.Velocity; local targetPos = targetPart.Position; local currentCF = Camera.CFrame; local time = tick()
                local breathY = math.sin(time * 1.5) * 0.15; local speed = vel.Magnitude
                local walkSwayX = math.cos(time * 8) * (speed * 0.005); local walkSwayY = math.abs(math.sin(time * 8)) * (speed * 0.005)
                local tiltZ = math.clamp(-targetPart.CFrame.RightVector:Dot(vel) * 0.05, -0.1, 0.1)
                local finalPos = targetPos + Vector3.new(0, 2 + breathY + walkSwayY, 0)
                local smoothCF = currentCF:Lerp(CFrame.new(finalPos + (targetPart.CFrame.LookVector * -6), finalPos), 0.15)
                Camera.CFrame = smoothCF * CFrame.Angles(walkSwayY, walkSwayX, tiltZ)
            end
        else
            State.SpectatingPlayer = nil; State.CinematicCamera = false
            Camera.CameraType = Enum.CameraType.Custom; Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        end
    end

    if State.ProximityWarning then
        local nearbyText = ""
        local count = 0
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local root = GetVisualPart(p.Character)
                local myRoot = GetVisualPart(LocalPlayer.Character)
                if root and myRoot then
                    local dist = (root.Position - myRoot.Position).Magnitude
                    if dist < State.ProximityDist then
                        local isThreat = true
                        if State.ProximityMode == "Enemy Only" then
                            if p.TeamColor == LocalPlayer.TeamColor then isThreat = false end
                        end
                        
                        if isThreat then
                            nearbyText = nearbyText .. "⚠️ " .. p.DisplayName .. " [" .. math.floor(dist) .. "m]\n"
                            count = count + 1
                        end
                    end
                end
            end
        end
        if count > 0 then
            ProxFrame.Visible = true
            ProxList.Text = nearbyText
        else
            ProxFrame.Visible = false
        end
    else
        ProxFrame.Visible = false
    end

    -- ESP MATERIAL
    if State.EspMaterial then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                for _, part in pairs(p.Character:GetChildren()) do
                    if part:IsA("BasePart") and not part:FindFirstChild("MatChams") then
                        local box = Instance.new("BoxHandleAdornment", part)
                        box.Name = "MatChams"
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Adornee = part
                        box.Size = part.Size
                        box.Transparency = 0.5
                        box.Color3 = p.TeamColor.Color
                    end
                end
            end
        end
    else
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then
                for _, part in pairs(p.Character:GetChildren()) do
                    if part:FindFirstChild("MatChams") then part.MatChams:Destroy() end
                end
            end
        end
    end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if State.MasterESP and p.Character then
                local targetPart = GetVisualPart(p.Character)
                if targetPart then
                    local targetColor = GetTeamColor(p); local myRoot = GetVisualPart(LocalPlayer.Character)
                    local dist = 0; if myRoot then dist = math.floor((myRoot.Position - targetPart.Position).Magnitude) end
                    if p.Character:FindFirstChild("GInfo") then p.Character.GInfo:Destroy() end
                    local info = p.Character:FindFirstChild("ReyzzESP_V2")
                    if not info then
                        info = Instance.new("BillboardGui", p.Character); info.Name = "ReyzzESP_V2"; info.Size = UDim2.new(0, 200, 0, 100); info.StudsOffset = Vector3.new(0, 4, 0); info.AlwaysOnTop = true 
                        local layout = Instance.new("UIListLayout", info); layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        local nLbl = Instance.new("TextLabel", info); nLbl.Name = "NameLbl"; nLbl.Size = UDim2.new(1,0,0,15); nLbl.BackgroundTransparency = 1; nLbl.Font = Enum.Font.GothamBold; nLbl.TextSize = 14; nLbl.TextStrokeTransparency = 0; nLbl.LayoutOrder = 1
                        local hLbl = Instance.new("TextLabel", info); hLbl.Name = "HPLbl"; hLbl.Size = UDim2.new(1,0,0,15); hLbl.BackgroundTransparency = 1; hLbl.Font = Enum.Font.Code; hLbl.TextSize = 12; hLbl.TextStrokeTransparency = 0; hLbl.LayoutOrder = 2
                        local dLbl = Instance.new("TextLabel", info); dLbl.Name = "DistLbl"; dLbl.Size = UDim2.new(1,0,0,15); dLbl.BackgroundTransparency = 1; dLbl.Font = Enum.Font.GothamBold; dLbl.TextSize = 11; dLbl.TextStrokeTransparency = 0; dLbl.LayoutOrder = 3
                    end
                    info.Adornee = targetPart
                    local nameL = info:FindFirstChild("NameLbl"); if nameL then nameL.Text = p.DisplayName; nameL.TextColor3 = targetColor end
                    local hpL = info:FindFirstChild("HPLbl"); local hum = p.Character:FindFirstChild("Humanoid")
                    if hpL then
                        if hum then
                            local hp = math.floor(hum.Health); local maxHp = hum.MaxHealth; local perc = math.clamp(hp / maxHp, 0, 1)
                            hpL.Text = "HP: " .. hp; hpL.TextColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(0, 255, 0), perc)
                        else hpL.Text = "HP: ?"; hpL.TextColor3 = Color3.new(1,1,1) end
                    end
                    local distL = info:FindFirstChild("DistLbl")
                    if distL then 
                        local txt = "[" .. dist .. "m]"
                        if State.ShowInventory then
                            local tool = p.Character:FindFirstChildOfClass("Tool")
                            if tool then txt = txt .. "\n[item: " .. tool.Name .. "]" end
                        end
                        distL.Text = txt
                        local distPerc = math.clamp(dist / 150, 0, 1); distL.TextColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), distPerc) 
                    end
                    local hl = p.Character:FindFirstChild("GHighlight")
                    if not hl then hl = Instance.new("Highlight", p.Character); hl.Name = "GHighlight"; hl.FillColor = targetColor; hl.OutlineColor = Color3.new(1,1,1); hl.FillTransparency = 0.5; hl.OutlineTransparency = 0; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop end
                    hl.Adornee = p.Character; hl.FillColor = targetColor
                end
            else
                if p.Character then
                    if p.Character:FindFirstChild("GHighlight") then p.Character.GHighlight:Destroy() end
                    if p.Character:FindFirstChild("GInfo") then p.Character.GInfo:Destroy() end
                    if p.Character:FindFirstChild("ReyzzESP_V2") then p.Character.ReyzzESP_V2:Destroy() end
                end
            end
        end
    end
end)
-- [[ SMART SPEED & JUMP LOOP (No Lag) ]]
RunService.Heartbeat:Connect(function()
    if State.LoopSpeed and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            -- [PERBAIKAN] Tambahkan pengecekan agar tidak spam
            if hum.WalkSpeed ~= State.WalkSpeed then 
                hum.WalkSpeed = State.WalkSpeed 
            end
            
            if hum.UseJumpPower then
                if hum.JumpPower ~= State.JumpPower then hum.JumpPower = State.JumpPower end
            else
                if hum.JumpHeight ~= State.JumpPower then hum.JumpHeight = State.JumpPower end
            end
        end
    end

    if State.AutoRegen and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            -- [TRIK 1] State Cancellation
            if hum.Health <= 0 then
                hum:ChangeState(Enum.HumanoidStateType.Running)
                hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
            
            -- [TRIK 2] BreakJoints Prevention
            if hum.BreakJointsOnDeath then hum.BreakJointsOnDeath = false end
            if hum.RequiresNeck then hum.RequiresNeck = false end
            
            -- [TRIK 3] Force Visual & Signal
            if hum.Health < hum.MaxHealth then
                hum.Health = hum.MaxHealth
            end
        end
    end
end)

-- [[ UI CONSTRUCTION ]]

-- Tombol Buka/Tutup Mini
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 50, 0, 50); ToggleButton.Position = UDim2.new(0, 50, 0, 50); RegisterTheme(ToggleButton, "BackgroundColor3", "Background"); ToggleButton.Text = "R"; RegisterTheme(ToggleButton, "TextColor3", "Accent"); ToggleButton.TextSize = 32; ToggleButton.Font = Enum.Font.GothamBlack; ToggleButton.AutoButtonColor = false; ToggleButton.Visible = true; ToggleButton.ZIndex = 9999
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 15); local IconStroke = Instance.new("UIStroke", ToggleButton); RegisterTheme(IconStroke, "Color", "Accent"); IconStroke.Thickness = 3; IconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MakeDraggable(ToggleButton)

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UIScale.BaseSize; MainFrame.Position = UDim2.new(0.5, -350, 0.5, -225); RegisterTheme(MainFrame, "BackgroundColor3", "Background"); MainFrame.Visible = false; MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
MakeDraggable(MainFrame)

-- Header Sesuai Gambar
local HeaderFrame = Instance.new("Frame", MainFrame)
HeaderFrame.Size = UDim2.new(1, 0, 0, 40)
RegisterTheme(HeaderFrame, "BackgroundColor3", "Background") 
HeaderFrame.BorderSizePixel = 0
local HeaderTitle = Instance.new("TextLabel", HeaderFrame)
HeaderTitle.Text = "ReyzzHubV3.3 | Work Now | [BETA TEST]" 
HeaderTitle.Size = UDim2.new(0.7, 0, 1, 0)
HeaderTitle.Position = UDim2.new(0, 15, 0, 0)
HeaderTitle.BackgroundTransparency = 1
RegisterTheme(HeaderTitle, "TextColor3", "Accent")
HeaderTitle.Font = Enum.Font.GothamBold
HeaderTitle.TextSize = 14
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Kontrol Window (Minimize/Close)
local WinControls = Instance.new("Frame", HeaderFrame); WinControls.Size = UDim2.new(0, 80, 1, 0); WinControls.Position = UDim2.new(1, -80, 0, 0); WinControls.BackgroundTransparency = 1
local function CreateWinBtn(text, order, callback)
    local btn = Instance.new("TextButton", WinControls)
    btn.Size = UDim2.new(0, 40, 1, 0)
    btn.Position = UDim2.new(0, (order-1)*40, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    RegisterTheme(btn, "TextColor3", "TextDim")
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 16
    btn.MouseEnter:Connect(function() btn.TextColor3 = CurrentTheme.Text end)
    btn.MouseLeave:Connect(function() btn.TextColor3 = CurrentTheme.TextDim end)
    btn.MouseButton1Click:Connect(callback)
end
CreateWinBtn("-", 1, function() MainFrame.Visible = false end)
CreateWinBtn("X", 2, function() ScreenGui:Destroy() end)

-- Garis Pembatas Header
local HeaderLine = Instance.new("Frame", MainFrame)
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 0, 40)
RegisterTheme(HeaderLine, "BackgroundColor3", "Stroke")
HeaderLine.BorderSizePixel = 0

-- Sidebar (Kiri)
local SidebarWidth = 160
local Sidebar = Instance.new("ScrollingFrame", MainFrame)
Sidebar.Size = UDim2.new(0, SidebarWidth, 1, -41)
Sidebar.Position = UDim2.new(0, 0, 0, 41)
RegisterTheme(Sidebar, "BackgroundColor3", "Sidebar")
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 2
local SidePadding = Instance.new("UIPadding", Sidebar); SidePadding.PaddingTop = UDim.new(0, 10)
local TabListLayout = Instance.new("UIListLayout", Sidebar); TabListLayout.Padding = UDim.new(0, 5); TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Content Area (Kanan)
local Content = Instance.new("Frame", MainFrame)
Content.Size = UDim2.new(1, -SidebarWidth, 1, -41)
Content.Position = UDim2.new(0, SidebarWidth, 0, 41)
Content.BackgroundTransparency = 1
Content.ClipsDescendants = true

local function CreateTab(Name, IconText)
    -- Tab Button seperti di gambar: Indikator Cyan vertikal di kiri
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(1, 0, 0, 45) -- Lebar penuh sidebar
    Btn.BackgroundTransparency = 1
    Btn.Text = ""
    
    local ActiveBar = Instance.new("Frame", Btn)
    RegisterTheme(ActiveBar, "BackgroundColor3", "Accent")
    ActiveBar.Size = UDim2.new(0, 4, 0.6, 0) -- Garis tipis cyan
    ActiveBar.Position = UDim2.new(0, 0, 0.2, 0)
    ActiveBar.Visible = false
    Instance.new("UICorner", ActiveBar).CornerRadius = UDim.new(0, 2)
    
    -- Icon Text (Unicode)
    local IconLbl = Instance.new("TextLabel", Btn)
    IconLbl.Text = IconText or "•"
    IconLbl.Size = UDim2.new(0, 30, 1, 0)
    IconLbl.Position = UDim2.new(0, 15, 0, 0)
    IconLbl.BackgroundTransparency = 1
    RegisterTheme(IconLbl, "TextColor3", "TextDim")
    IconLbl.Font = Enum.Font.GothamMedium
    IconLbl.TextSize = 18
    
    local NameLbl = Instance.new("TextLabel", Btn)
    NameLbl.Text = Name
    NameLbl.Size = UDim2.new(0, 100, 1, 0)
    NameLbl.Position = UDim2.new(0, 50, 0, 0)
    NameLbl.BackgroundTransparency = 1
    RegisterTheme(NameLbl, "TextColor3", "TextDim")
    NameLbl.Font = Enum.Font.GothamBold
    NameLbl.TextSize = 14
    NameLbl.TextXAlignment = Enum.TextXAlignment.Left

    local Page = Instance.new("ScrollingFrame", Content)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 4
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local PL = Instance.new("UIListLayout", Page); PL.Padding = UDim.new(0, 10); PL.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local PP = Instance.new("UIPadding", Page); PP.PaddingTop = UDim.new(0, 20); PP.PaddingBottom = UDim.new(0, 20)
    
    Btn.MouseButton1Click:Connect(function()
        -- Reset semua tab
        for _, v in pairs(Sidebar:GetChildren()) do
            if v:IsA("TextButton") then
                local ab = v:FindFirstChild("Frame")
                local il = v:FindFirstChild("TextLabel")
                local nl = v:GetChildren()[3] -- NameLbl biasanya index 3
                if ab then ab.Visible = false end
                if il then il.TextColor3 = CurrentTheme.TextDim end
                if nl then nl.TextColor3 = CurrentTheme.TextDim end
                v.BackgroundTransparency = 1
            end
        end
        for _, v in pairs(Content:GetChildren()) do if v:IsA("ScrollingFrame") then v.Visible = false end end
        
        -- Set aktif
        ActiveBar.Visible = true
        IconLbl.TextColor3 = CurrentTheme.Text 
        NameLbl.TextColor3 = CurrentTheme.Text
        Btn.BackgroundColor3 = CurrentTheme.ElementBG
        Btn.BackgroundTransparency = 0.95
        
        Page.Visible = true
    end)
    return Page
end

-- [[ COMPONENT CREATORS (Toggle, Input, dll) ]]

local function CreateToggle(Page, Text, Callback, DefaultState)
    -- Desain seperti gambar: Teks kiri, Switch kanan
    local Wrapper = Instance.new("Frame", Page)
    Wrapper.Size = UDim2.new(0.95, 0, 0, 50)
    RegisterTheme(Wrapper, "BackgroundColor3", "Background")
    Wrapper.BackgroundTransparency = 1 
    
    -- Garis pemisah bawah tipis
    local Line = Instance.new("Frame", Wrapper)
    Line.Size = UDim2.new(1, 0, 0, 1); Line.Position = UDim2.new(0,0,1,0); RegisterTheme(Line, "BackgroundColor3", "ElementBG"); Line.BorderSizePixel = 0

    local Lbl = Instance.new("TextLabel", Wrapper)
    Lbl.Text = Text
    Lbl.Size = UDim2.new(0.7, 0, 1, 0)
    Lbl.Position = UDim2.new(0, 10, 0, 0)
    Lbl.BackgroundTransparency = 1
    RegisterTheme(Lbl, "TextColor3", "Text")
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 14
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleBtn = Instance.new("TextButton", Wrapper)
    ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
    ToggleBtn.BackgroundTransparency = 1
    ToggleBtn.Text = ""
    
    -- Visual Switch (Pill Shape)
    local SwitchBg = Instance.new("Frame", Wrapper)
    SwitchBg.Size = UDim2.new(0, 44, 0, 24)
    SwitchBg.Position = UDim2.new(1, -54, 0.5, -12)
    RegisterTheme(SwitchBg, "BackgroundColor3", "ElementBG")
    Instance.new("UICorner", SwitchBg).CornerRadius = UDim.new(1, 0)
    
    local Circle = Instance.new("Frame", SwitchBg)
    Circle.Size = UDim2.new(0, 18, 0, 18)
    Circle.Position = UDim2.new(0, 3, 0.5, -9)
    RegisterTheme(Circle, "BackgroundColor3", "TextDim")
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
    
    local on = DefaultState or false
    
    local function Update(state) 
        on = state
        Callback(on)
        if on then 
            TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.Accent}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -21, 0.5, -9), BackgroundColor3 = Color3.new(1,1,1)}):Play()
            ShowToast(Text .. ": ON")
        else 
            TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.ElementBG}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -9), BackgroundColor3 = CurrentTheme.TextDim}):Play()
            ShowToast(Text .. ": OFF")
        end 
        UpdateActiveList(Text, on)
    end
    
    ToggleBtn.MouseButton1Click:Connect(function() Update(not on) end)
    Toggles[Text] = Update
    return Update
end

local function CreateInput(Page, Text, Placeholder, Callback, IsString)
    -- Desain Kotak Input Gelap
    local Wrapper = Instance.new("Frame", Page)
    Wrapper.Size = UDim2.new(0.95, 0, 0, 50)
    Wrapper.BackgroundTransparency = 1
    
    local BgBox = Instance.new("Frame", Wrapper)
    BgBox.Size = UDim2.new(1, 0, 0, 40)
    BgBox.Position = UDim2.new(0, 0, 0.5, -20)
    RegisterTheme(BgBox, "BackgroundColor3", "ElementBG")
    Instance.new("UICorner", BgBox).CornerRadius = UDim.new(0, 8)
    
    local Lbl = Instance.new("TextLabel", Wrapper)
    Lbl.Text = Text
    Lbl.Size = UDim2.new(0.5, 0, 1, 0)
    Lbl.Position = UDim2.new(0, 15, 0, 0)
    Lbl.BackgroundTransparency = 1
    RegisterTheme(Lbl, "TextColor3", "Text")
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 14
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local InputBox = Instance.new("TextBox", Wrapper)
    InputBox.Size = UDim2.new(0.3, 0, 1, 0)
    InputBox.Position = UDim2.new(0.65, 0, 0, 0) 
    InputBox.BackgroundTransparency = 1
    InputBox.Text = tostring(Placeholder)
    RegisterTheme(InputBox, "TextColor3", "Text")
    RegisterTheme(InputBox, "PlaceholderColor3", "TextDim")
    InputBox.Font = Enum.Font.GothamBold
    InputBox.TextSize = 14
    InputBox.TextXAlignment = Enum.TextXAlignment.Right
    
    InputBox.FocusLost:Connect(function() 
        if IsString then 
            Callback(InputBox.Text) 
        else 
            local num = tonumber(InputBox.Text)
            if num then 
                Callback(num) 
            else 
                InputBox.Text = tostring(Placeholder) 
            end 
        end 
    end)
    return InputBox
end

local function CreateButton(Page, Text, Callback)
    local Wrapper = Instance.new("Frame", Page)
    Wrapper.Size = UDim2.new(0.95, 0, 0, 45)
    Wrapper.BackgroundTransparency = 1
    
    local Btn = Instance.new("TextButton", Wrapper)
    Btn.Size = UDim2.new(1, 0, 1, 0)
    RegisterTheme(Btn, "BackgroundColor3", "ElementBG")
    Btn.Text = Text
    RegisterTheme(Btn, "TextColor3", "Accent")
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Btn); RegisterTheme(Stroke, "Color", "Stroke"); Stroke.Thickness = 1
    
    Btn.MouseButton1Click:Connect(function() 
        TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = CurrentTheme.Accent, TextColor3 = CurrentTheme.Background}):Play()
        task.wait(0.1)
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.ElementBG, TextColor3 = CurrentTheme.Accent}):Play()
        Callback() 
    end)
    return Btn
end

local function CreateSlider(Page, Text, Min, Max, Default, Callback)
    local Wrapper = Instance.new("Frame", Page)
    Wrapper.Size = UDim2.new(0.95, 0, 0, 60)
    RegisterTheme(Wrapper, "BackgroundColor3", "ElementBG")
    Instance.new("UICorner", Wrapper).CornerRadius = UDim.new(0, 8)
    
    local Lbl = Instance.new("TextLabel", Wrapper)
    Lbl.Text = Text
    Lbl.Size = UDim2.new(0.5, 0, 0, 30)
    Lbl.Position = UDim2.new(0, 15, 0, 0)
    Lbl.BackgroundTransparency = 1
    RegisterTheme(Lbl, "TextColor3", "Text")
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 14
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValLbl = Instance.new("TextLabel", Wrapper)
    ValLbl.Text = tostring(Default)
    ValLbl.Size = UDim2.new(0.2, 0, 0, 30)
    ValLbl.Position = UDim2.new(0.75, 0, 0, 0)
    ValLbl.BackgroundTransparency = 1
    RegisterTheme(ValLbl, "TextColor3", "Accent")
    ValLbl.Font = Enum.Font.Code
    ValLbl.TextSize = 14
    ValLbl.TextXAlignment = Enum.TextXAlignment.Right
    
    local SliderBg = Instance.new("Frame", Wrapper)
    SliderBg.Size = UDim2.new(0.9, 0, 0, 6)
    SliderBg.Position = UDim2.new(0.05, 0, 0.65, 0)
    RegisterTheme(SliderBg, "BackgroundColor3", "Background")
    Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(1, 0)
    
    local SliderFill = Instance.new("Frame", SliderBg)
    SliderFill.Size = UDim2.new(0, 0, 1, 0)
    RegisterTheme(SliderFill, "BackgroundColor3", "Accent")
    Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)
    
    local Trigger = Instance.new("TextButton", SliderBg)
    Trigger.Size = UDim2.new(1, 0, 1, 0); Trigger.BackgroundTransparency = 1; Trigger.Text = ""
    
    local function Set(val)
        local pct = math.clamp((val - Min) / (Max - Min), 0, 1)
        SliderFill.Size = UDim2.new(pct, 0, 1, 0)
        ValLbl.Text = tostring(math.floor(val))
        Callback(val)
    end
    Set(Default)
    
    local dragging = false
    Trigger.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = input.Position.X; local size = SliderBg.AbsoluteSize.X; local start = SliderBg.AbsolutePosition.X
            local pct = math.clamp((pos - start) / size, 0, 1)
            Set(Min + (Max - Min) * pct)
        end
    end)
end

local function CreateDropdown(Page, Text, Options, Default, Callback)
    local Wrapper = Instance.new("Frame", Page)
    Wrapper.Size = UDim2.new(0.95, 0, 0, 50)
    RegisterTheme(Wrapper, "BackgroundColor3", "ElementBG")
    Wrapper.ZIndex = 5 
    Instance.new("UICorner", Wrapper).CornerRadius = UDim.new(0, 8)
    
    local Lbl = Instance.new("TextLabel", Wrapper)
    Lbl.Text = Text
    Lbl.Size = UDim2.new(0.4, 0, 1, 0)
    Lbl.Position = UDim2.new(0, 15, 0, 0)
    Lbl.BackgroundTransparency = 1
    RegisterTheme(Lbl, "TextColor3", "Text")
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 14
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.ZIndex = 10 
    
    local MainBtn = Instance.new("TextButton", Wrapper)
    MainBtn.Size = UDim2.new(0, 140, 0, 30)
    MainBtn.Position = UDim2.new(1, -150, 0.5, -15)
    RegisterTheme(MainBtn, "BackgroundColor3", "Background")
    MainBtn.Text = Default .. "  ▼"
    RegisterTheme(MainBtn, "TextColor3", "Accent")
    MainBtn.Font = Enum.Font.GothamBold
    MainBtn.TextSize = 12
    MainBtn.ZIndex = 6
    Instance.new("UICorner", MainBtn).CornerRadius = UDim.new(0, 6)
    
    local DropFrame = Instance.new("Frame", Wrapper)
    DropFrame.Size = UDim2.new(0, 140, 0, 0)
    DropFrame.Position = UDim2.new(1, -150, 0.5, 20)
    RegisterTheme(DropFrame, "BackgroundColor3", "Background")
    DropFrame.Visible = false
    DropFrame.ZIndex = 20
    DropFrame.ClipsDescendants = true
    Instance.new("UICorner", DropFrame).CornerRadius = UDim.new(0, 6)
    local DropStroke = Instance.new("UIStroke", DropFrame); RegisterTheme(DropStroke, "Color", "Stroke"); DropStroke.Thickness = 1
    local ListLayout = Instance.new("UIListLayout", DropFrame); ListLayout.SortOrder = Enum.SortOrder.LayoutOrder; ListLayout.Padding = UDim.new(0, 2)
    
    local isOpened = false
    MainBtn.MouseButton1Click:Connect(function()
        isOpened = not isOpened
        if isOpened then
            DropFrame.Visible = true
            TweenService:Create(DropFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 140, 0, #Options * 30)}):Play()
            MainBtn.Text = MainBtn.Text:gsub("▼", "▲")
        else
            local t = TweenService:Create(DropFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 140, 0, 0)})
            t:Play()
            t.Completed:Connect(function() if not isOpened then DropFrame.Visible = false end end)
            MainBtn.Text = MainBtn.Text:gsub("▲", "▼")
        end
    end)
    for _, opt in ipairs(Options) do
        local OptBtn = Instance.new("TextButton", DropFrame)
        OptBtn.Size = UDim2.new(1, 0, 0, 28)
        OptBtn.BackgroundTransparency = 1
        OptBtn.Text = opt
        RegisterTheme(OptBtn, "TextColor3", "TextDim")
        OptBtn.Font = Enum.Font.GothamMedium
        OptBtn.TextSize = 12
        OptBtn.ZIndex = 21
        OptBtn.MouseButton1Click:Connect(function()
            MainBtn.Text = opt .. "  ▼"
            Callback(opt)
            isOpened = false
            local t = TweenService:Create(DropFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, 140, 0, 0)})
            t:Play()
            t.Completed:Connect(function() if not isOpened then DropFrame.Visible = false end end)
        end)
    end
end

-- [[ MEMBUAT TAB & KONTEN ]]

local T1 = CreateTab("Main", "🏠"); 
local T_Combat = CreateTab("Combat", "⚔️"); 
local T2 = CreateTab("Visuals", "👁️"); 
local T3 = CreateTab("Camera", "📷"); 
local T4 = CreateTab("Teleport", "🚀"); 
local T5 = CreateTab("World", "🌍"); 
local T6 = CreateTab("Misc", "⚙️"); 
local T7 = CreateTab("About", "ℹ️")

-- T1: Main
CreateToggle(T1, "Auto Regen (Semi-God)", function(v) State.AutoRegen = v end)
CreateToggle(T1, "Infinite Jump (Shift+J)", function(v) State.InfiniteJump = v end)
CreateToggle(T1, "Spider Wall (Hold W)", function(v) State.Spider = v end)
CreateToggle(T1, "Wall Run (Gravity)", function(v) State.WallRun = v end)
CreateToggle(T1, "Bhop Auto (Bunny Hop)", function(v) State.Bhop = v end) 
CreateToggle(T1, "Auto Bhop (Legit Mode)", function(v) 
    State.BhopLegit = v 
    if v then ShowToast("Legit Bhop: ON (Randomized)") end
end)
CreateToggle(T1, "No Fall Damage [BETA]", function(v) State.NoFall = v end)
CreateToggle(T1, "Noclip", function(v) State.Noclip = v end)
CreateToggle(T1, TextData.Fly[SelectedLanguage], function(v) State.Fly = v; if v then StartFly() else StopFly() end end)
CreateToggle(T1, "Fly Vehicle (Car/Bike)", function(v) 
    State.FlyVehicle = v
    if v then 
        StartVehicleFly()
        ShowToast("Vehicle Fly: ON")
    else
        local char = LocalPlayer.Character
        if char then
            for _, d in pairs(char:GetDescendants()) do
                if d.Name == "VFlyV" or d.Name == "VFlyG" then d:Destroy() end
            end
        end
        ShowToast("Vehicle Fly: OFF")
    end
end)
CreateToggle(T1, "SpinBot", function(v) State.SpinBot = v end)
CreateInput(T1, "Spin Speed", 100, function(v) State.SpinSpeed = v end)
local WSInput = CreateInput(T1, "Walk Speed [Loop]", State.WalkSpeed, function(v) 
    State.WalkSpeed = v
    State.LoopSpeed = true 
end)

local JPInput = CreateInput(T1, "Jump Power [Loop]", State.JumpPower, function(v) 
    State.JumpPower = v
    State.LoopSpeed = true 
end)

CreateButton(T1, "Reset Default Speed $ Jump (Fix Lag)", function()
    State.LoopSpeed = false
    State.WalkSpeed = 16
    State.JumpPower = 50
    
    WSInput.Text = "16"
    JPInput.Text = "50"
    
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = 16
            if hum.UseJumpPower then hum.JumpPower = 50 else hum.JumpHeight = 50 end
        end
    end
    ShowToast("Speed & Jump Reset!")
end)
CreateButton(T1, "Respawn & Return", function()
    if LocalPlayer.Character then local hum = LocalPlayer.Character:FindFirstChild("Humanoid"); local root = GetVisualPart(LocalPlayer.Character)
    if hum and hum.Health > 0 and root then State.LastPos = root.CFrame; State.IsRespawning = true; hum.Health = 0; ShowToast("Respawning... Wait.") end end
end)

-- T_Combat: Combat
local AimHeader = Instance.new("TextLabel", T_Combat); AimHeader.Text = "COMBAT ASSIST"; AimHeader.Size = UDim2.new(0.95, 0, 0, 20); AimHeader.BackgroundTransparency = 1; RegisterTheme(AimHeader, "TextColor3", "Accent"); AimHeader.Font = Enum.Font.GothamBlack; AimHeader.TextSize = 12
CreateToggle(T_Combat, "Simple Aimbot (Active)", function(v) State.Aimbot = v end) 
-- [NEW] Dropdown Trigger
CreateDropdown(T_Combat, "Aimbot Trigger", {"Right Click", "Left Click"}, "Right Click", function(val)
    if val == "Right Click" then
        State.AimbotButton = Enum.UserInputType.MouseButton2
    else
        State.AimbotButton = Enum.UserInputType.MouseButton1
    end
end)
CreateDropdown(T_Combat, "Aim Part", {"Head", "Torso", "HumanoidRootPart"}, "Head", function(v) State.AimbotPart = v end) 
CreateToggle(T_Combat, "Auto Wall Check", function(v) State.WallCheck = v end)
CreateToggle(T_Combat, "Built-in Auto Clicker", function(v) State.AutoClicker = v end)
CreateSlider(T_Combat, "Click Speed (CPS)", 1, 50, 10, function(v) State.CPS = v end)

local WepHeader = Instance.new("TextLabel", T_Combat); WepHeader.Text = "WEAPON MODS"; WepHeader.Size = UDim2.new(0.95, 0, 0, 20); WepHeader.BackgroundTransparency = 1; RegisterTheme(WepHeader, "TextColor3", "Accent"); WepHeader.Font = Enum.Font.GothamBlack; WepHeader.TextSize = 12
-- [NEW RAPID FIRE UI]
CreateToggle(T_Combat, "Weapon Rapid Fire (Hold Left)", function(v) State.WeaponRapidFire = v end)
CreateSlider(T_Combat, "Rapid Fire Speed", 1, 100, 15, function(v) State.RapidFireCPS = v end)

CreateToggle(T_Combat, "Touch Fling", function(v) State.TouchFling = v end)
local HitboxHeader = Instance.new("TextLabel", T_Combat); HitboxHeader.Text = "HITBOX EXPANDER"; HitboxHeader.Size = UDim2.new(0.95, 0, 0, 20); HitboxHeader.BackgroundTransparency = 1; RegisterTheme(HitboxHeader, "TextColor3", "Accent"); HitboxHeader.Font = Enum.Font.GothamBlack; HitboxHeader.TextSize = 12
-- [FIX: Removed Complex Options, Now Default to HumanoidRootPart]
CreateDropdown(T_Combat, "Hitbox Mode", {"HumanoidRootPart", "Head"}, "HumanoidRootPart", function(val) State.HitboxPart = val; ShowToast("Mode: " .. val) end)
local HBSizeInput = CreateInput(T_Combat, "Hitbox Size", 15, function(v) State.HitboxSize = v end)
CreateToggle(T_Combat, "Invisible Visuals (Clean)", function(v) State.HitboxInvisible = v end, true)
local HBLoopToggle = CreateToggle(T_Combat, "Loop Hitbox (Active)", function(v) State.HitboxLoop = v end)

local ResetBtn = CreateButton(T_Combat, "RESET HITBOX TO DEFAULT", function()
    HBLoopToggle(false); State.HitboxLoop = false; if HBSizeInput then HBSizeInput.Text = "2" end; State.HitboxSize = 2; State.HitboxPart = "HumanoidRootPart"
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local t = p.Character:FindFirstChild("HumanoidRootPart")
            local h = p.Character:FindFirstChild("Head")
            if t then t.Size = Vector3.new(2, 2, 1); t.Transparency = 1; t.CanCollide = true; t.Massless = false end
            if h then h.Size = Vector3.new(1, 1, 1); h.Transparency = 1; h.CanCollide = true; h.Massless = false end
        end
    end
    ShowToast("Hitbox Reset to Default!")
end); ResetBtn.BackgroundColor3 = Color3.fromRGB(255,80,80); ResetBtn.TextColor3 = Color3.new(1,1,1)

-- T2: Visuals
CreateToggle(T2, "ESP Player (Smart)", function(v) State.MasterESP = v end)
CreateToggle(T2, "Show Inventory Tools", function(v) State.ShowInventory = v end)
CreateToggle(T2, "NPC/Mob ESP", function(v) State.NpcESP = v end) 
CreateToggle(T2, "Item ESP (Dropped)", function(v) State.ItemESP = v end) 
CreateToggle(T2, "Tracers (Lines Only)", function(v) 
    State.Tracers = v
    if not v then ClearTracers() end
end)
CreateToggle(T2, "World X-Ray [BETA]", ToggleXRay)
CreateToggle(T2, "Crosshair (HUD)", function(v) State.Crosshair = v end)
CreateToggle(T2, "Proximity Warning", function(v) State.ProximityWarning = v end)
CreateDropdown(T2, "Warning Mode", {"All Players", "Enemy Only"}, "All Players", function(v) State.ProximityMode = v end)
CreateSlider(T2, "Warning Distance", 10, 200, 50, function(v) State.ProximityDist = v end)
local RadarHeader = Instance.new("TextLabel", T2); RadarHeader.Text = "RADAR / MINIMAP"; RadarHeader.Size = UDim2.new(0.95, 0, 0, 20); RadarHeader.BackgroundTransparency = 1; RegisterTheme(RadarHeader, "TextColor3", "Accent"); RadarHeader.Font = Enum.Font.GothamBlack; RadarHeader.TextSize = 12

CreateToggle(T2, "Enable Radar HUD", function(v) State.Radar = v end)

CreateSlider(T2, "Radar Range (Zoom)", 50, 500, 150, function(v) 
    State.RadarRange = v 
end)

-- T3: Camera
CreateToggle(T3, "Freecam (Shift+P)", ToggleFreecam)
CreateInput(T3, "Drone Speed", 1, function(v) State.FreecamSpeed = v end)
CreateButton(T3, "Reset Camera", function() ToggleFreecam(false); State.Freecam = false; Camera.CameraType = Enum.CameraType.Custom end)
CreateToggle(T3, "Max Zoom 1000", function(v) 
    State.MaxZoom = v 
    if v then LocalPlayer.CameraMaxZoomDistance = 1000 end
end)
CreateSlider(T3, "Field of View (FOV)", 30, 120, 70, function(v) Camera.FieldOfView = v end)
CreateDropdown(T3, "View Mode", {"Default", "First Person", "Third Person"}, "Default", function(v) 
    if v == "First Person" then
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    elseif v == "Third Person" then
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = 10
        LocalPlayer.CameraMaxZoomDistance = 100
    else
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = 0.5
        LocalPlayer.CameraMaxZoomDistance = 400
    end
end)

-- T4: Teleport
CreateToggle(T4, "CTRL + Click TP", function(v) State.ClickTP = v end)
local TPList = Instance.new("ScrollingFrame", T4); TPList.Size = UDim2.new(0.95, 0, 0, 200); RegisterTheme(TPList, "BackgroundColor3", "Background"); TPList.ScrollBarThickness = 2; TPList.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", TPList).CornerRadius = UDim.new(0, 8); local TPLayout = Instance.new("UIListLayout", TPList); TPLayout.Padding = UDim.new(0, 5)

local CineToggle = CreateToggle(T4, "Cinematic Spectate (Shake)", function(v) State.CinematicCamera = v end)

CreateButton(T4, "Unspectate (Reset)", function() 
    Camera.CameraType = Enum.CameraType.Custom; Camera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
    LocalPlayer.ReplicationFocus = nil; State.SpectatingPlayer = nil; State.CinematicCamera = false; CineToggle(false)
end)

-- [[ NEW REALTIME PLAYER LIST LOGIC ]]
local function RefreshList()
    for _,v in pairs(TPList:GetChildren()) do 
        if v:IsA("Frame") then v:Destroy() end 
    end

    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local Row = Instance.new("Frame", TPList); Row.Size = UDim2.new(1, 0, 0, 35); Row.BackgroundTransparency = 1
            local TPBtn = Instance.new("TextButton", Row); TPBtn.Size = UDim2.new(0.6, -5, 1, 0); RegisterTheme(TPBtn, "BackgroundColor3", "ElementBG"); TPBtn.Text = "TP: " .. p.DisplayName; RegisterTheme(TPBtn, "TextColor3", "Text"); TPBtn.Font = Enum.Font.GothamMedium; TPBtn.TextSize = 12; Instance.new("UICorner", TPBtn).CornerRadius = UDim.new(0, 6)
            local ViewBtn = Instance.new("TextButton", Row); ViewBtn.Size = UDim2.new(0.4, -5, 1, 0); ViewBtn.Position = UDim2.new(0.6, 5, 0, 0); RegisterTheme(ViewBtn, "BackgroundColor3", "Sidebar"); ViewBtn.Text = "SPECTATE"; RegisterTheme(ViewBtn, "TextColor3", "Accent"); ViewBtn.Font = Enum.Font.GothamBold; ViewBtn.TextSize = 11; Instance.new("UICorner", ViewBtn).CornerRadius = UDim.new(0, 6)
            
            TPBtn.MouseButton1Click:Connect(function() 
                if p.Character and GetVisualPart(p.Character) then LocalPlayer.Character:MoveTo(GetVisualPart(p.Character).Position) 
                else ShowToast("⚠️ Error: Player too far / Not Rendered!") end
            end)
            
            ViewBtn.MouseButton1Click:Connect(function() 
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    State.SpectatingPlayer = p; ShowToast("Spectating: " .. p.DisplayName)
                    pcall(function() LocalPlayer.ReplicationFocus = p.Character.PrimaryPart end)
                    if State.CinematicCamera then else Camera.CameraType = Enum.CameraType.Custom; Camera.CameraSubject = p.Character.Humanoid end
                else ShowToast("⚠️ Cannot Spectate: Player Not Rendered") end 
            end)
        end
    end
end

CreateButton(T4, "Refresh Players", RefreshList)
Players.PlayerAdded:Connect(function(p) 
    task.wait(1) 
    RefreshList() 
    ShowToast("Update List Teleport - " .. p.DisplayName .. " Joined Server") 
end)
Players.PlayerRemoving:Connect(function(p) 
    task.wait(0.1) 
    RefreshList() 
    ShowToast("Update List Teleport - " .. p.DisplayName .. " Left Server") 
end)
task.spawn(RefreshList)


local TPTitle = Instance.new("TextLabel", T4); TPTitle.Text = "SERVER HOPPER"; TPTitle.Size = UDim2.new(0.95, 0, 0, 25); TPTitle.BackgroundTransparency = 1; RegisterTheme(TPTitle, "TextColor3", "Accent"); TPTitle.Font = Enum.Font.GothamBold; TPTitle.TextSize = 14
CreateButton(T4, "Rejoin Server (Retry)", RejoinServer)
CreateButton(T4, "Join Lowest Server", JoinLowestServer)
CreateInput(T4, "Join Job ID", "Paste ID Here", function(id) State.TargetJobId = id end, true)
CreateButton(T4, "Join Job ID", JoinJobId)

-- T5: World
CreateToggle(T5, "Fullbright Loop", function(v) State.FullbrightLoop = v end)
CreateToggle(T5, "No Fog", function(v) State.NoFog = v end)
CreateToggle(T5, "No Particles", function(v) State.NoParticles = v end)
CreateToggle(T5, "Walk on Water", function(v) State.WalkOnWater = v end) 
CreateToggle(T5, "Anti-Void (Return Safe)", function(v) State.AntiVoid = v end) 
CreateInput(T5, "Void Height (Y)", -50, function(v) State.VoidHeight = v end) 
CreateButton(T5, "Boost FPS", BoostFPS)
CreateToggle(T5, "Show Server Stats", function(v) State.ShowStats = v; StatsFrame.Visible = v end)
CreateToggle(T5, "Gravity Control (Magnet)", function(v) State.GravityControl = v end)
CreateButton(T5, "🔥 Delete Map (Extreme FPS)", DeleteMap)
CreateButton(T5, "🎨 Remove Textures (Anti-Lag)", RemoveTextures)

-- T6: Misc
local ThemeHeader = Instance.new("TextLabel", T6); ThemeHeader.Text = "THEME & UI SETTINGS"; ThemeHeader.Size = UDim2.new(0.95, 0, 0, 20); ThemeHeader.BackgroundTransparency = 1; RegisterTheme(ThemeHeader, "TextColor3", "Accent"); ThemeHeader.Font = Enum.Font.GothamBlack; ThemeHeader.TextSize = 12
CreateDropdown(T6, "Select Theme", {"Dark", "Light", "NeonCyan", "NeonGreen", "NeonRed"}, "Dark", function(val) 
    ApplyTheme(val)
end)

CreateToggle(T6, "Instant Proximity (Hold E)", function(v) 
    State.InstantPrompt = v 
end)
CreateToggle(T6, "Chat Spammer", function(v) State.ChatSpammer = v end)
CreateInput(T6, "Spam Message", "Reyzz Hub Sript Xploit on Top!", function(v) State.SpamMessage = v end, true) 
local BypassInput = CreateInput(T6, "Bypass Chat (No Sensor)", "Type here...", function(text)
    SendBypassChat(text)
end, true)
CreateToggle(T6, "Chat Logger (Spy)", function(v) State.ChatLogger = v; InitChatLogger() end)
CreateToggle(T6, "Auto Anim Logger", function(v) State.AnimLogger = v; UpdateAnimLogger() end)
CreateToggle(T6, "Remote Spy (Logger)", function(v) State.EventLogger = v; InitEventLogger() end)
CreateButton(T6, "Clear Memory/Cache", ClearMemory)
CreateToggle(T6, "Fake Lag", function(v) State.FakeLag = v end)
-- [[ ANIMATION CHANGER SYSTEM ]]
local AnimHeader = Instance.new("TextLabel", T6); AnimHeader.Text = "ANIMATION OVERRIDE"; AnimHeader.Size = UDim2.new(0.95, 0, 0, 20); AnimHeader.BackgroundTransparency = 1; RegisterTheme(AnimHeader, "TextColor3", "Accent"); AnimHeader.Font = Enum.Font.GothamBlack; AnimHeader.TextSize = 12

local RigStatusLbl = Instance.new("TextLabel", T6)
RigStatusLbl.Size = UDim2.new(0.95, 0, 0, 20); RigStatusLbl.BackgroundTransparency = 1
RigStatusLbl.Font = Enum.Font.Code; RigStatusLbl.TextSize = 13
RigStatusLbl.Text = "Detecting Rig Type..."
RegisterTheme(RigStatusLbl, "TextColor3", "Text")

local function CheckRig()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local rig = LocalPlayer.Character.Humanoid.RigType
        if rig == Enum.HumanoidRigType.R15 then
            RigStatusLbl.Text = "✅ DETECTED: R15 (Use R15 List)"
            State.AnimRigType = "R15"
        else
            RigStatusLbl.Text = "⚠️ DETECTED: R6 (Use R6 List)"
            State.AnimRigType = "R6"
        end
    end
end
task.spawn(function() while task.wait(2) do CheckRig() end end)

-- [ Database ID Animasi ]
local R15_Anims = {
    ["Toy Animation"] = "782841498",
    ["Ninja Idle"] = "656117400",
    ["Zombie Idle"] = "616158929",
    ["Levitation"] = "132783162476851",
    ["Knight Idle"] = "657564596",
    ["Stylish Idle"] = "616136790",
    ["Duduk DI Awan"] = "70673082198328",
    ["Popular Dance"] = "93062298566806",
    ["Jomok Dance"] = "118364690209655",
    ["Lempar Kepala"] = "138243322520289"
}
local R6_Anims = {
    ["R6 Dance 1"] = "507771955",
    ["R6 Dance 2"] = "507776043",
    ["R6 Dance 3"] = "507777268",
    ["R6 Zombie"] = "180435571",
    ["R6 Ninja"] = "180435571",
    ["R6 Robot"] = "148840371"
}

local function UpdateAnimation(val)
    -- Hapus track lama jika ada
    if State.CurrentAnimTrack then 
        State.CurrentAnimTrack:Stop()
        State.CurrentAnimTrack = nil 
    end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        local animator = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator")

        -- [[ FORCE NO ANIMATION ]]
        for _, t in pairs(animator:GetPlayingAnimationTracks()) do
            t:Stop()
        end

        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://" .. val
        
        local track = animator:LoadAnimation(anim)
        track.Priority = Enum.AnimationPriority.Action4 
        track.Looped = true 
        track:Play()
        track.TimePosition = 0 
        
        State.CurrentAnimTrack = track
    end
end

local R15Keys = {}; for k,v in pairs(R15_Anims) do table.insert(R15Keys, k) end
table.sort(R15Keys)
CreateDropdown(T6, "R15 Animations List", R15Keys, "Select...", function(name)
    if State.AnimRigType == "R15" then
        State.CurrentAnimID = R15_Anims[name]
        if State.AnimChanger then UpdateAnimation(State.CurrentAnimID) end
    else
        ShowToast("❌ Error: You are R6! Use R6 List.")
    end
end)

local R6Keys = {}; for k,v in pairs(R6_Anims) do table.insert(R6Keys, k) end
table.sort(R6Keys)
CreateDropdown(T6, "R6 Animations List", R6Keys, "Select...", function(name)
    if State.AnimRigType == "R6" then
        State.CurrentAnimID = R6_Anims[name]
        if State.AnimChanger then UpdateAnimation(State.CurrentAnimID) end
    else
        ShowToast("❌ Error: You are R15! Use R15 List.")
    end
end)

CreateInput(T6, "Custom ID (Manual)", "Paste ID...", function(val)
    State.CurrentAnimID = val
    if State.AnimChanger then UpdateAnimation(val) end
end, true)
CreateToggle(T6, "Enable Custom Anim", function(v) 
    State.AnimChanger = v
    if v then
        if State.CurrentAnimID ~= 0 then
            UpdateAnimation(State.CurrentAnimID)
            ShowToast("Anim Loaded!")
        else
            ShowToast("⚠️ Select Animation First!")
        end
    else
        if State.CurrentAnimTrack then 
            State.CurrentAnimTrack:Stop()
            State.CurrentAnimTrack = nil 
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            for _, t in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
                if t.Priority == Enum.AnimationPriority.Action then t:Stop() end
            end
        end
        ShowToast("Anim Disabled")
    end
end)
CreateToggle(T6, "Admin Detector", function(v) State.AdminDetector = v end)
CreateInput(T6, "Admin Group ID", 0, function(v) State.AdminGroupId = tonumber(v) or 0 end)
local AutoRecBtn = CreateToggle(T6, "Auto Reconnect", function(v) State.AutoReconnect = v end)
CreateToggle(T6, "Anti-AFK", function(v) State.AntiAFK = v end)
CreateDropdown(T6, "Language / Bahasa", {"ID", "EN"}, "ID", function(val)
    State.SelectedLang = val
    ShowToast("Language set to: " .. val)
end)

CreateButton(T6, "🔄 Check for Updates", CheckUpdate)

task.spawn(function() if State.AutoReconnect then AutoRecBtn(true) end end)
local MouseLockUpd = CreateToggle(T6, "Unlock Mouse (F1)", function(v) State.ForceUnlockMouse = v; if not v then UserInputService.MouseBehavior = Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = true end end)

-- T7: About
local AboutTitle = Instance.new("TextLabel", T7); AboutTitle.Text = "Reyzz Dynamic"; AboutTitle.Size = UDim2.new(1, 0, 0, 40); AboutTitle.BackgroundTransparency = 1; RegisterTheme(AboutTitle, "TextColor3", "Accent"); AboutTitle.Font = Enum.Font.GothamBlack; AboutTitle.TextSize = 28; AboutTitle.TextXAlignment = Enum.TextXAlignment.Center
local AboutDesc = Instance.new("TextLabel", T7); AboutDesc.Text = "Version 6.2 | Final Physics Fix"; AboutDesc.Size = UDim2.new(1, 0, 0, 60); AboutDesc.BackgroundTransparency = 1; RegisterTheme(AboutDesc, "TextColor3", "TextDim"); AboutDesc.Font = Enum.Font.Gotham; AboutDesc.TextSize = 14
local DiscordBtn = CreateButton(T7, "Copy Discord Link", function() setclipboard("https://discord.gg/fnU7ebtGq8"); ShowToast("Discord Link Copied!") end); DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242); DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local JobIdContainer = Instance.new("Frame", T7); JobIdContainer.Size = UDim2.new(0.95, 0, 0, 80); RegisterTheme(JobIdContainer, "BackgroundColor3", "ElementBG"); Instance.new("UICorner", JobIdContainer).CornerRadius = UDim.new(0, 8); local JS = Instance.new("UIStroke", JobIdContainer); RegisterTheme(JS, "Color", "Stroke")
local JobIdTitle = Instance.new("TextLabel", JobIdContainer); JobIdTitle.Text = "CURRENT SERVER JOB ID"; JobIdTitle.Size = UDim2.new(1, 0, 0, 25); JobIdTitle.BackgroundTransparency = 1; RegisterTheme(JobIdTitle, "TextColor3", "TextDim"); JobIdTitle.Font = Enum.Font.GothamBold; JobIdTitle.TextSize = 12
local JobIdBox = Instance.new("TextBox", JobIdContainer); JobIdBox.Size = UDim2.new(0.9, 0, 0, 30); JobIdBox.Position = UDim2.new(0.05, 0, 0.4, 0); RegisterTheme(JobIdBox, "BackgroundColor3", "Background"); JobIdBox.Text = game.JobId; RegisterTheme(JobIdBox, "TextColor3", "Accent"); JobIdBox.Font = Enum.Font.Code; JobIdBox.TextSize = 12; JobIdBox.ClearTextOnFocus = false; JobIdBox.TextEditable = false; Instance.new("UICorner", JobIdBox).CornerRadius = UDim.new(0, 6)
local CopyJobBtn = Instance.new("TextButton", JobIdContainer); CopyJobBtn.Size = UDim2.new(1, 0, 1, 0); CopyJobBtn.BackgroundTransparency = 1; CopyJobBtn.Text = ""; CopyJobBtn.MouseButton1Click:Connect(function() setclipboard(game.JobId); ShowToast("Server Job ID Copied!") end)

-- [[ STARTUP LOGIC ]]
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end 
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        if State.ClickTP and Mouse.Target then
            local pos = Mouse.Hit.Position
            if LocalPlayer.Character and GetVisualPart(LocalPlayer.Character) then LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0)); ShowToast("Teleported!") end
        end
    end
    if input.KeyCode == Enum.KeyCode.J and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then local currentState = State.InfiniteJump; if Toggles["Infinite Jump (Shift+J)"] then Toggles["Infinite Jump (Shift+J)"](not currentState) end end
    if input.KeyCode == Enum.KeyCode.P and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then local currentState = State.Freecam; if Toggles["Freecam (Shift+P)"] then Toggles["Freecam (Shift+P)"](not currentState) end end
    if input.KeyCode == Enum.KeyCode.F1 then local currentState = State.ForceUnlockMouse; if Toggles["Unlock Mouse (F1)"] then Toggles["Unlock Mouse (F1)"](not currentState) end end
end)

LocalPlayer.CharacterAdded:Connect(function(newChar)
    if State.AnimLogger then task.wait(1); UpdateAnimLogger() end
    if State.IsRespawning and State.LastPos then
        local root = newChar:WaitForChild("HumanoidRootPart", 10); local hum = newChar:WaitForChild("Humanoid", 10)
        if root and hum then if State.LastPos.Y > -300 then task.wait(0.25); root.CFrame = State.LastPos; ShowToast("Returned to Last Position") else ShowToast("Last Pos was Void (Safety Prevented TP)") end; State.IsRespawning = false; State.LastPos = nil end
    end
    if State.AnimChanger and State.CurrentAnimID ~= 0 then
        task.wait(1)
        UpdateAnimation(State.CurrentAnimID)
    end
end)

ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

local FirstTabBtn = Sidebar:FindFirstChildOfClass("TextButton")
if FirstTabBtn then 
    local ActiveBar = FirstTabBtn:FindFirstChild("Frame")
    local IconLbl = FirstTabBtn:FindFirstChild("TextLabel")
    local NameLbl = FirstTabBtn:GetChildren()[3]
    local Page = Content:FindFirstChildOfClass("ScrollingFrame")
    
    if ActiveBar then ActiveBar.Visible = true end
    if IconLbl then IconLbl.TextColor3 = CurrentTheme.Text end
    if NameLbl then NameLbl.TextColor3 = CurrentTheme.Text end
    FirstTabBtn.BackgroundColor3 = CurrentTheme.ElementBG
    FirstTabBtn.BackgroundTransparency = 0.95
    if Page then Page.Visible = true end
end
