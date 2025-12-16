-- 🔥 Obfuscated by Reyzzarjam Dex V4 (Safe Mode)
-- 🔥 Protected Script
-- 🛡️ Anti-Tamper & Error Free

local Players = game:GetService("\080\108\097\121\101\114\115")
local TweenService = game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101")
local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101")
local Lighting = game:GetService("\076\105\103\104\116\105\110\103")
local _Rvbaz952 = game:GetService("\087\111\114\107\115\112\097\099\101")
local TeleportService = game:GetService("\084\101\108\101\112\111\114\116\083\101\114\118\105\099\101")
local CoreGui = game:GetService("\067\111\114\101\071\117\105")
local VirtualUser = game:GetService("\086\105\114\116\117\097\108\085\115\101\114")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")
local HttpService = game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
local _XjAbF897 = game:GetService("\083\116\097\116\115")
local TextChatService = game:GetService("\084\101\120\116\067\104\097\116\083\101\114\118\105\099\101")
local ProximityPromptService = game:GetService("\080\114\111\120\105\109\105\116\121\080\114\111\109\112\116\083\101\114\118\105\099\101")
local LocalPlayer = Players.LocalPlayer
local Camera = _Rvbaz952.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local _KuYEQ981 = 2693023319
local _JOZxJ208 = game.PlaceId
if _JOZxJ208 ~= _KuYEQ981 then
    LocalPlayer:Kick("⛔\032\077\065\065\070\033\032\083\099\114\105\112\116\032\105\110\105\032\104\097\110\121\097\032\117\110\116\117\107\032\065\110\116\097\114\099\116\105\099\097\032\069\120\112\101\100\105\116\105\111\110\046\092\110\071\097\109\101\032\073\068\032\065\110\100\097\058\032" .. _JOZxJ208 .. "\092\110\071\097\109\101\032\073\068\032\084\097\114\103\101\116\058\032" .. _KuYEQ981)
    return 
end
local _JqLOR991 = {
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
local _KwPyw64 = "\068\097\114\107"
local _znjmN83 = _JqLOR991[_KwPyw64]
local _KKAWm609 = {} 
local function RegisterTheme(instance, property, themeKey)
    table.insert(_KKAWm609, {Obj = instance, Prop = property, Key = themeKey})
    instance[property] = _znjmN83[themeKey]
end
local function ApplyTheme(themeName)
    if _JqLOR991[themeName] then
        _KwPyw64 = themeName
        _znjmN83 = _JqLOR991[themeName]
        for _, data in pairs(_KKAWm609) do
            if data.Obj and data.Obj.Parent then
                TweenService:Create(data.Obj, TweenInfo.new(0.3), {[data.Prop] = _znjmN83[data.Key]}):Play()
            end
        end
        return true
    end
    return false
end
local _RxUlZ833 = {
    BaseSize = UDim2.new(0, 700, 0, 450), 
    LargeSize = UDim2.new(0, 900, 0, 550), 
    FontSmall = 12,
    FontNormal = 14, 
    FontHeader = 18
}
local _plMZj882 = {} 
local _lxAau354 = {
    InfiniteJump = false,
    Noclip = false, 
    Fly = false, 
    AntiFall = false,
    Bhop = false, 
    WalkSpeed = 16, 
    JumpPower = 50, 
    LoopSpeed = false, 
    FlyVehicle = false,
    MasterESP = false, 
    ProximityWarning = false,
    ProximityDist = 50,
    ProximityMode = "\065\108\108",
    FullbrightLoop = false, 
    NoFog = false, 
    NoParticles = false,
    AntiVoid = false, 
    VoidHeight = -50, 
    LastSafePos = nil, 
    WalkOnWater = false, 
    GravityControl = false,
    AntiDrown = false,
    AutoInteract = false,
    GodModeBug = false,
    Freecam = false, 
    FreecamSpeed = 1, 
    FreecamPos = Camera.CFrame, 
    FreecamRot = Vector2.new(0, 0),
    FreecamPart = nil,
    MaxZoom = false,
    SpectatingPlayer = nil,
    CinematicCamera = false,
    FOV = 90,
    IdentityMode = "\068\101\102\097\117\108\116",
    CustomNameText = "\082\101\121\122\122\032\072\117\098\032\085\115\101\114",
    AdminDetector = false,
    AdminGroupId = 0,
    TargetJobId = "",
    AnimLogger = false,
    EventLogger = false,
    ChatLogger = false,
    ChatSpammer = false, 
    SpamMessage = "\082\101\121\122\122\032\072\117\098\032\111\110\032\084\111\112\033", 
    ForceUnlockMouse = false,
    AutoReconnect = true,
    IsRespawning = false,
    LastPos = nil,
    AntiAFK = true,
    ClickTP = false,
    ShowStats = false,
    AnimChanger = false,
    AnimFixLoop = nil,
    CurrentAnimID = 0,
    CurrentAnimTrack = nil,
    AnimRigType = "\082\049\053",
    EspMaterial = false,
    ChatBypass = false,
    AutoBadge = false,
    UnlockFPS = false,
    SelectedLang = "\073\068",   
    CurrentVersion = "\049\046\051\032\076\105\116\101\032\084\080\032\070\105\120", 
}
local _GigZv195 = {
    Speed = 80,         
    HeightOffset = 150, 
    DropHeight = 10   
}
local _kwYzs580 = {
    {Name = "\067\104\101\099\107\112\111\105\110\116\032\049", CFrame = CFrame.new(-3720, 224, 233)},
    {Name = "\067\104\101\099\107\112\111\105\110\116\032\050", CFrame = CFrame.new(1789, 105, -137)}, 
    {Name = "\067\104\101\099\107\112\111\105\110\116\032\051", CFrame = CFrame.new(5893, 320, -19)},
    {Name = "\067\104\101\099\107\112\111\105\110\116\032\052", CFrame = CFrame.new(8992, 595, 102)},
    {Name = "\083\085\077\077\073\084\032\040\070\073\078\073\083\072\041", CFrame = CFrame.new(10996, 549, 112)},
}
local _PjbLz508 = {
    WaitTime = 140,    
    LoopDelay = 3,      
    HoverHeight = 35
}
LocalPlayer.Idled:Connect(function()
    if _lxAau354.AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)
local _EITgY164 = 16
local _flWOE54 = 50
task.spawn(function()
    if LocalPlayer.Character then
        local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
        if _cOPpa623 then
            _EITgY164 = _cOPpa623.WalkSpeed
            if _cOPpa623.UseJumpPower then
                _flWOE54 = _cOPpa623.JumpPower
            else
                _flWOE54 = _cOPpa623.JumpHeight
            end
            _lxAau354.WalkSpeed = _EITgY164
            _lxAau354.JumpPower = _flWOE54
        end
    end
end)
local function MakeDraggable(Frame)
    local _LVprM534, dragInput, dragStart, startPos
    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            _LVprM534 = true; dragStart = input.Position; startPos = Frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then _LVprM534 = false end end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and _LVprM534 then
            local _zjVKj104 = input.Position - dragStart
            TweenService:Create(Frame, TweenInfo.new(0.05), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + _zjVKj104.X, startPos.Y.Scale, startPos.Y.Offset + _zjVKj104.Y)}):Play()
        end
    end)
end
local function GetSafeGui() 
    return CoreGui:FindFirstChild("\082\111\098\108\111\120\071\117\105") or LocalPlayer:WaitForChild("\080\108\097\121\101\114\071\117\105") 
end
pcall(function()
    if GetSafeGui():FindFirstChild("\082\101\121\122\122\072\117\098\076\105\116\101") then GetSafeGui().ReyzzHubLite:Destroy() end
end)
local _OyOeY313 = Instance.new("\083\099\114\101\101\110\071\117\105")
_OyOeY313.Name = "\082\101\121\122\122\072\117\098\076\105\116\101" 
_OyOeY313.Parent = GetSafeGui()
_OyOeY313.ResetOnSpawn = false
_OyOeY313.IgnoreGuiInset = true
_OyOeY313.ZIndexBehavior = Enum.ZIndexBehavior.Global
local _eXzJs938 = Instance.new("\070\114\097\109\101", _OyOeY313)
_eXzJs938.Name = "\086\050\083\116\097\116\117\115\080\097\110\101\108"
_eXzJs938.Size = UDim2.new(0, 260, 0, 110) 
_eXzJs938.Position = UDim2.new(0.5, -130, 0.15, 0) 
RegisterTheme(_eXzJs938, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
_eXzJs938.Visible = false 
Instance.new("\085\073\067\111\114\110\101\114", _eXzJs938).CornerRadius = UDim.new(0, 8)
local _EMWXF96 = Instance.new("\085\073\083\116\114\111\107\101", _eXzJs938)
RegisterTheme(_EMWXF96, "\067\111\108\111\114", "\065\099\099\101\110\116")
_EMWXF96.Thickness = 2
MakeDraggable(_eXzJs938) 
local _yrkSX601 = Instance.new("\084\101\120\116\076\097\098\101\108", _eXzJs938)
_yrkSX601.Size = UDim2.new(1, 0, 0, 25)
_yrkSX601.BackgroundTransparency = 1
_yrkSX601.Text = "⚡\032\065\085\084\079\032\083\085\077\077\073\084\032\086\050\032\083\084\065\084\085\083"
RegisterTheme(_yrkSX601, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
_yrkSX601.Font = Enum.Font.GothamBlack
_yrkSX601.TextSize = 14
local _KstYW364 = Instance.new("\084\101\120\116\076\097\098\101\108", _eXzJs938)
_KstYW364.Name = "\073\110\102\111\076\097\098\101\108"
_KstYW364.Size = UDim2.new(0.9, 0, 0, 80)
_KstYW364.Position = UDim2.new(0.05, 0, 0, 25)
_KstYW364.BackgroundTransparency = 1
_KstYW364.Text = "\083\121\115\116\101\109\058\032\079\070\070\092\110\087\097\105\116\105\110\103\032\102\111\114\032\084\111\103\103\108\101\046\046\046" 
RegisterTheme(_KstYW364, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
_KstYW364.Font = Enum.Font.Code
_KstYW364.TextSize = 13
_KstYW364.TextXAlignment = Enum.TextXAlignment.Left
_KstYW364.TextYAlignment = Enum.TextYAlignment.Top
local _gyJpA296 = Instance.new("\070\114\097\109\101", _OyOeY313); 
_gyJpA296.Name = "\080\114\111\120\087\097\114\110\105\110\103"; 
_gyJpA296.Size = UDim2.new(0, 300, 0, 60); 
_gyJpA296.AutomaticSize = Enum.AutomaticSize.Y 
_gyJpA296.Position = UDim2.new(0.5, -150, 0.15, 0); 
_gyJpA296.BackgroundColor3 = Color3.fromRGB(40, 10, 10); 
_gyJpA296.Visible = false; 
_gyJpA296.BackgroundTransparency = 0.2
Instance.new("\085\073\067\111\114\110\101\114", _gyJpA296).CornerRadius = UDim.new(0, 10); 
local _UkjYp406 = Instance.new("\085\073\083\116\114\111\107\101", _gyJpA296); _UkjYp406.Color = Color3.fromRGB(255, 80, 80); _UkjYp406.Thickness = 3
local _EBMkY428 = Instance.new("\085\073\080\097\100\100\105\110\103", _gyJpA296); _EBMkY428.PaddingBottom = UDim.new(0, 10) 
local _WwpuT64 = Instance.new("\084\101\120\116\076\097\098\101\108", _gyJpA296); _WwpuT64.Size = UDim2.new(0, 50, 0, 40); _WwpuT64.BackgroundTransparency = 1; _WwpuT64.Text = "⚠️"; _WwpuT64.TextSize = 35
local _ZJQnD823 = Instance.new("\084\101\120\116\076\097\098\101\108", _gyJpA296); _ZJQnD823.Size = UDim2.new(1, -60, 0, 30); _ZJQnD823.Position = UDim2.new(0, 50, 0, 5); _ZJQnD823.BackgroundTransparency = 1; _ZJQnD823.Text = "\078\069\065\082\066\089\032\084\072\082\069\065\084\032\068\069\084\069\067\084\069\068\033"; _ZJQnD823.TextColor3 = Color3.fromRGB(255, 80, 80); _ZJQnD823.Font = Enum.Font.GothamBlack; _ZJQnD823.TextSize = 16; _ZJQnD823.TextXAlignment = Enum.TextXAlignment.Left
local _LhxgF748 = Instance.new("\084\101\120\116\076\097\098\101\108", _gyJpA296); 
_LhxgF748.Size = UDim2.new(1, -60, 0, 0); 
_LhxgF748.AutomaticSize = Enum.AutomaticSize.Y 
_LhxgF748.Position = UDim2.new(0, 50, 0, 35); 
_LhxgF748.BackgroundTransparency = 1; 
_LhxgF748.Text = "\046\046\046"; 
RegisterTheme(_LhxgF748, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116"); 
_LhxgF748.Font = Enum.Font.Code; 
_LhxgF748.TextSize = 14; 
_LhxgF748.TextXAlignment = Enum.TextXAlignment.Left; 
_LhxgF748.TextYAlignment = Enum.TextYAlignment.Top
local _ognYz438 = Instance.new("\070\114\097\109\101", _OyOeY313)
_ognYz438.Name = "\084\111\097\115\116\067\111\110\116\097\105\110\101\114"
_ognYz438.Size = UDim2.new(0, 350, 1, -20)
_ognYz438.Position = UDim2.new(1, -360, 0, 0)
_ognYz438.BackgroundTransparency = 1
_ognYz438.ZIndex = 10000
local _kDlIo967 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _ognYz438)
_kDlIo967.SortOrder = Enum.SortOrder.LayoutOrder
_kDlIo967.VerticalAlignment = Enum.VerticalAlignment.Bottom
_kDlIo967.HorizontalAlignment = Enum.HorizontalAlignment.Right
_kDlIo967.Padding = UDim.new(0, 8)
local function ShowToast(_bGacx359)
    local _IkbKJ135 = Instance.new("\070\114\097\109\101", _ognYz438)
    _IkbKJ135.Size = UDim2.new(0, 320, 0, 55)
    _IkbKJ135.BackgroundTransparency = 1
    RegisterTheme(_IkbKJ135, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
    Instance.new("\085\073\067\111\114\110\101\114", _IkbKJ135).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("\085\073\083\116\114\111\107\101", _IkbKJ135)
    RegisterTheme(Stroke, "\067\111\108\111\114", "\065\099\099\101\110\116")
    Stroke.Thickness = 1
    Stroke.Transparency = 1
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _IkbKJ135)
    _IJOez494.Size = UDim2.new(1, -20, 1, 0)
    _IJOez494.Position = UDim2.new(0, 15, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    _IJOez494.Text = _bGacx359
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 15
    _IJOez494.TextWrapped = true
    _IJOez494.TextTransparency = 1
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    _IkbKJ135.BackgroundTransparency = 0.1
    TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
    TweenService:Create(_IJOez494, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    local _KVMgV140 = UDim2.new(0, 320, 0, 55)
    _IkbKJ135.Size = UDim2.new(0, 290, 0, 55)
    TweenService:Create(_IkbKJ135, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = _KVMgV140, BackgroundTransparency = 0.1}):Play()
    task.delay(3, function()
        if _IkbKJ135 and _IkbKJ135.Parent then
            local _AjwFJ118 = TweenService:Create(_IkbKJ135, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 350, 0, 55)
            })
            _AjwFJ118:Play()
            TweenService:Create(Stroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
            TweenService:Create(_IJOez494, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
            _AjwFJ118.Completed:Connect(function()
                _IkbKJ135:Destroy()
            end)
        end
    end)
end
local _JfANM939 = Instance.new("\070\114\097\109\101", _OyOeY313)
_JfANM939.Name = "\065\099\116\105\118\101\077\111\100\115\076\105\115\116"
_JfANM939.Position = UDim2.new(1, -220, 0.4, 0) 
_JfANM939.Size = UDim2.new(0, 200, 0.5, 0)
_JfANM939.BackgroundTransparency = 1
local _znORZ305 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _JfANM939)
_znORZ305.SortOrder = Enum.SortOrder.LayoutOrder
_znORZ305.VerticalAlignment = Enum.VerticalAlignment.Top
_znORZ305.HorizontalAlignment = Enum.HorizontalAlignment.Right
_znORZ305.Padding = UDim.new(0, 4)
local function UpdateActiveList(featureName, isEnabled)
    local _Hpqai93 = _JfANM939:FindFirstChild(featureName)
    if isEnabled then
        if not _Hpqai93 then
            local _QtWIy485 = Instance.new("\084\101\120\116\076\097\098\101\108", _JfANM939)
            _QtWIy485.Name = featureName
            _QtWIy485.Size = UDim2.new(1, 0, 0, 22)
            _QtWIy485.BackgroundTransparency = 1
            _QtWIy485.Text = featureName .. "\032\032" 
            _QtWIy485.Font = Enum.Font.GothamBold
            _QtWIy485.TextSize = 14
            RegisterTheme(_QtWIy485, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
            _QtWIy485.TextXAlignment = Enum.TextXAlignment.Right
            _QtWIy485.TextTransparency = 1
            TweenService:Create(_QtWIy485, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        end
    else
        if _Hpqai93 then
            local _gYinP221 = TweenService:Create(_Hpqai93, TweenInfo.new(0.3), {TextTransparency = 1})
            _gYinP221:Play(); _gYinP221.Completed:Connect(function() _Hpqai93:Destroy() end)
        end
    end
end
local function RejoinServer()
    ShowToast("\082\101\106\111\105\110\105\110\103\032\083\101\114\118\101\114\046\046\046")
    if #Players:GetPlayers() <= 1 then
        Players.LocalPlayer:Kick("\082\101\106\111\105\110\105\110\103\046\046\046") 
        task.wait()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        local _puQDd325, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
        if not _puQDd325 then
            ShowToast("\073\110\115\116\097\110\099\101\032\082\101\106\111\105\110\032\070\097\105\108\101\100\046\032\070\105\110\100\105\110\103\032\078\101\119\046\046\046")
            task.wait(1)
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end
    end
end
local function JoinJobId()
    if _lxAau354.TargetJobId ~= "" then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, _lxAau354.TargetJobId, LocalPlayer)
    end
end
local function JoinLowestServer()
    ShowToast("\083\099\097\110\110\105\110\103\032\102\111\114\032\108\111\119\101\115\116\032\115\101\114\118\101\114\046\046\046")
    local _TrREs866 = game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
    local _OmkyJ7 = game.PlaceId
    local function GetServers(cursor)
        local _DXKkf783 = "\104\116\116\112\115\058\047\047\103\097\109\101\115\046\114\111\098\108\111\120\046\099\111\109\047\118\049\047\103\097\109\101\115\047" .. _OmkyJ7 .. "\047\115\101\114\118\101\114\115\047\080\117\098\108\105\099\063\115\111\114\116\079\114\100\101\114\061\065\115\099\038\108\105\109\105\116\061\049\048\048"
        if cursor then _DXKkf783 = _DXKkf783 .. "\038\099\117\114\115\111\114\061" .. cursor end
        local _puQDd325, result = pcall(function() return game:HttpGet(_DXKkf783) end)
        if _puQDd325 then return _TrREs866:JSONDecode(result) end
        return nil
    end
    task.spawn(function()
        local _HCIuh10 = GetServers(nil)
        if _HCIuh10 and _HCIuh10.data then
            local _GMIRx716 = nil
            for _, server in pairs(_HCIuh10.data) do
                if server.playing and server.maxPlayers and server.playing > 0 and server.playing < server.maxPlayers then
                    if not _GMIRx716 or server.playing < _GMIRx716.playing then _GMIRx716 = server end
                end
            end
            if _GMIRx716 then
                ShowToast("\070\111\117\110\100\033\032\080\108\097\121\101\114\115\058\032" .. _GMIRx716.playing)
                TeleportService:TeleportToPlaceInstance(_OmkyJ7, _GMIRx716.id, LocalPlayer)
            else ShowToast("\078\111\032\115\117\105\116\097\098\108\101\032\115\101\114\118\101\114\032\102\111\117\110\100\046") end
        else ShowToast("\070\097\105\108\101\100\032\116\111\032\102\101\116\099\104\032\115\101\114\118\101\114\115\046") end
    end)
end
local function GetVisualPart(character)
    if not character then return nil end
    return character.PrimaryPart 
        or character:FindFirstChild("\072\101\097\100") 
        or character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") 
        or character:FindFirstChild("\084\111\114\115\111") 
        or character:FindFirstChild("\085\112\112\101\114\084\111\114\115\111")
        or character:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116")
end
local function SmartMove(targetPos)
    if not LocalPlayer.Character then return end
    local _ZtLLU592 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
    if not _ZtLLU592 or not _cOPpa623 then return end
    local _jrBsw387 = (targetPos - _ZtLLU592.Position).Magnitude
    local _ZoPRL494 = _jrBsw387 / _GigZv195.Speed
    local _ptbEj858 = TweenInfo.new(_ZoPRL494, Enum.EasingStyle.Linear)
    local _gYinP221 = TweenService:Create(_ZtLLU592, _ptbEj858, {CFrame = CFrame.new(targetPos)})
    _cOPpa623.PlatformStand = true
_gYinP221:Play()
    _gYinP221.Completed:Wait()
    _ZtLLU592.Velocity = Vector3.new(0, 0, 0) 
    _ZtLLU592.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    _cOPpa623.PlatformStand = false
end
local function StartSummitV2()
    task.spawn(function()
        _lxAau354.AntiFall = true 
        _eXzJs938.Visible = true 
        while _lxAau354.AutoSummitV2 do
            for i, point in ipairs(_kwYzs580) do
                if not _lxAau354.AutoSummitV2 then break end
                local _MKvpP413 = point.Name
                local _fKkGO537 = 0
                while _fKkGO537 < _PjbLz508.WaitTime do
                    if not _lxAau354.AutoSummitV2 then break end
                    local _lXPZx43 = _PjbLz508.WaitTime - _fKkGO537
                    _KstYW364.Text = string.format(
                        "\084\065\082\071\069\084\032\032\058\032\037\115\092\110\080\082\079\071\082\069\083\083\058\032\037\100\047\037\100\032\040\076\111\111\112\105\110\103\041\092\110\084\073\077\069\032\032\032\032\058\032\037\100\115\092\110\083\084\065\084\085\083\032\032\058\032\072\111\118\101\114\105\110\103\046\046\046",
                        _MKvpP413, i, #_kwYzs580, _lXPZx43
                    )
                    if _fKkGO537 % _PjbLz508.LoopDelay == 0 then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") then
                            local _ZtLLU592 = LocalPlayer.Character.HumanoidRootPart
                            _ZtLLU592.CFrame = CFrame.new(point.CFrame.Position + Vector3.new(0, _PjbLz508.HoverHeight, 0))
                            _ZtLLU592.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                    task.wait(1)
                    _fKkGO537 = _fKkGO537 + 1
                end
                if _lxAau354.AutoSummitV2 and LocalPlayer.Character then
                    _KstYW364.Text = "\083\084\065\084\085\083\058\032\067\076\065\073\077\073\078\071\032\067\072\069\067\075\080\079\073\078\084\046\046\046\092\110\068\111\032\110\111\116\032\109\111\118\101\033"
                    local _ZtLLU592 = LocalPlayer.Character.HumanoidRootPart
                    _ZtLLU592.CFrame = point.CFrame
                    _ZtLLU592.Velocity = Vector3.new(0,0,0)
                    task.wait(3) 
                end
            end
            if _lxAau354.AutoSummitV2 then
                ShowToast("🏆\032\083\085\077\077\073\084\032\082\069\065\067\072\069\068\033\032\082\101\115\112\097\119\110\105\110\103\046\046\046")
                _KstYW364.Text = "\083\084\065\084\085\083\058\032\070\073\078\073\083\072\069\068\033\092\110\082\101\115\112\097\119\110\105\110\103\032\105\110\032\051\115\046\046\046"
                task.wait(3)
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
                    LocalPlayer.Character.Humanoid.Health = 0 
                end
                LocalPlayer.CharacterAdded:Wait()
                task.wait(2)
                ShowToast("♻️\032\082\069\083\084\065\082\084\073\078\071\032\082\079\085\084\069\046\046\046")
            end
        end
        _KstYW364.Text = "\083\121\115\116\101\109\058\032\079\070\070\092\110\083\116\097\116\117\115\058\032\073\100\108\101\046"
        task.delay(3, function()
            if not _lxAau354.AutoSummitV2 then _eXzJs938.Visible = false end
        end)
    end)
end
local function StartAutoFarm()
    task.spawn(function()
        while _lxAau354.AutoBadge do 
            if not LocalPlayer.Character then task.wait(1) continue end
            local _ZtLLU592 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
            local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
            if not _ZtLLU592 or not _cOPpa623 then task.wait(1) continue end
            _cOPpa623:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            _cOPpa623:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            if _cOPpa623:GetState() == Enum.HumanoidStateType.Freefall then
                _cOPpa623:ChangeState(Enum.HumanoidStateType.Physics)
            end
            if Camera.CameraSubject ~= _cOPpa623 then
                Camera.CameraType = Enum.CameraType.Custom
                Camera.CameraSubject = _cOPpa623
            end
            ShowToast("🚀\032\083\116\097\114\116\105\110\103\032\070\097\114\109\032\082\111\117\116\101\046\046\046")
            for i, point in ipairs(_kwYzs580) do
                if not _lxAau354.AutoBadge then break end 
                ShowToast("\071\111\105\110\103\032\116\111\058\032" .. point.Name)
                local _oaqHQ40 = point.CFrame.Position + Vector3.new(0, _GigZv195.HeightOffset, 0)
                SmartMove(_oaqHQ40)
                local _sGnWq602 = point.CFrame.Position 
                SmartMove(_sGnWq602)
                task.wait(0.5)
            end
            if _lxAau354.AutoBadge then
                ShowToast("🏁\032\083\085\077\077\073\084\032\082\069\065\067\072\069\068\033\032\087\097\105\116\105\110\103\046\046\046")
                task.wait(2)
                ShowToast("♻️\032\082\101\115\101\116\116\105\110\103\032\067\104\097\114\097\099\116\101\114\046\046\046")
                local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
                if _cOPpa623 then _cOPpa623.Health = 0 end
                break 
            end
        end
    end)
end
local _UhjvY868 = {}
local CoreGui = game:GetService("\067\111\114\101\071\117\105")
local function ProcessLeaderboard(obj)
    if not (obj:IsA("\084\101\120\116\076\097\098\101\108") or obj:IsA("\084\101\120\116\066\117\116\116\111\110")) then return end
    if not obj:FindFirstAncestor("\080\108\097\121\101\114\076\105\115\116") then return end
    local _RJtOz309 = LocalPlayer.Name
    local _iSwmQ623 = LocalPlayer.DisplayName
    local _bGacx359 = obj.Text
    if string.find(_bGacx359, _RJtOz309) or string.find(_bGacx359, _iSwmQ623) then
        if _lxAau354.IdentityMode ~= "\068\101\102\097\117\108\116" then
            obj.TextTransparency = 1 
        else
            obj.TextTransparency = 0
        end
    end
end
CoreGui.DescendantAdded:Connect(ProcessLeaderboard)
local function ClearOriginalTags(_ARHwe269)
    if not _ARHwe269 then return end
    local _cOPpa623 = _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100")
    if _cOPpa623 then 
        _cOPpa623.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        pcall(function() _cOPpa623.DisplayName = "\032" end) 
    end
    for _, _Kschh846 in pairs(_ARHwe269:GetDescendants()) do
        if (_Kschh846:IsA("\066\105\108\108\098\111\097\114\100\071\117\105") or _Kschh846:IsA("\083\117\114\102\097\099\101\071\117\105") or _Kschh846:IsA("\084\101\120\116\076\097\098\101\108")) then
            if _Kschh846.Name ~= "\082\101\121\122\122\069\083\080\095\086\050"
               and _Kschh846.Name ~= "\082\101\121\122\122\070\097\107\101\084\097\103"
               and _Kschh846.Name ~= "\082\101\121\122\122\073\116\101\109\069\083\080"
               and _Kschh846.Name ~= "\084\111\097\115\116\067\111\110\116\097\105\110\101\114"
               and _Kschh846.Name ~= "\065\099\116\105\118\101\077\111\100\115\076\105\115\116"
               and not _Kschh846:IsDescendantOf(CoreGui) then
                _Kschh846:Destroy()
            end
        end
    end
end
local function CreateFakeTag(_ARHwe269, _bGacx359)
    if not _ARHwe269 then return end
    local _FJpnl698 = _ARHwe269:FindFirstChild("\072\101\097\100") or _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    if not _FJpnl698 then return end
    local _Hpqai93 = _FJpnl698:FindFirstChild("\082\101\121\122\122\070\097\107\101\084\097\103")
    if _Hpqai93 then
        if _Hpqai93:FindFirstChild("\084\097\103\076\097\098\101\108") then
            _Hpqai93.TagLabel.Text = _bGacx359
            return
        else
            _Hpqai93:Destroy()
        end
    end
    local _iUNoL602 = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105", _FJpnl698)
    _iUNoL602.Name = "\082\101\121\122\122\070\097\107\101\084\097\103"
    _iUNoL602.Size = UDim2.new(4, 0, 0.5, 0)
    _iUNoL602.StudsOffset = Vector3.new(0, 3, 0)
    _iUNoL602.AlwaysOnTop = true
    local _LiAnF957 = Instance.new("\084\101\120\116\076\097\098\101\108", _iUNoL602)
    _LiAnF957.Name = "\084\097\103\076\097\098\101\108"
    _LiAnF957.Size = UDim2.new(1, 0, 1, 0)
    _LiAnF957.BackgroundTransparency = 1
    _LiAnF957.Text = _bGacx359
    _LiAnF957.Font = Enum.Font.GothamBlack
    _LiAnF957.TextScaled = true
    _LiAnF957.TextStrokeTransparency = 0
    _LiAnF957.TextColor3 = Color3.new(1, 1, 1)
    table.insert(_UhjvY868, _LiAnF957)
end
local function UpdateIdentity()
    _UhjvY868 = {}
    for _, _Kschh846 in pairs(CoreGui:GetDescendants()) do
        ProcessLeaderboard(_Kschh846)
    end
    if _lxAau354.IdentityMode == "\068\101\102\097\117\108\116" then
        return
    end
    if LocalPlayer.Character then
        if _lxAau354.IdentityMode == "\068\101\115\116\114\111\121\032\078\097\109\101\032\040\083\101\108\102\041" or _lxAau354.IdentityMode == "\068\101\115\116\114\111\121\032\078\097\109\101\032\040\065\108\108\041" then
            ClearOriginalTags(LocalPlayer.Character)
        elseif _lxAau354.IdentityMode == "\080\114\111\109\111\116\101\032\068\105\115\099\111\114\100" then
            ClearOriginalTags(LocalPlayer.Character)
            CreateFakeTag(LocalPlayer.Character, "\100\105\115\099\111\114\100\046\103\103\047\102\110\085\055\101\098\116\071\113\056")
        elseif _lxAau354.IdentityMode == "\067\117\115\116\111\109\032\078\097\109\101" then
            ClearOriginalTags(LocalPlayer.Character)
            CreateFakeTag(LocalPlayer.Character, _lxAau354.CustomNameText)
        end
        if _lxAau354.IdentityMode == "\068\101\115\116\114\111\121\032\078\097\109\101\032\040\065\108\108\041" then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    ClearOriginalTags(p.Character)
                end
            end
        end
    end
end
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if _lxAau354.IdentityMode ~= "\068\101\102\097\117\108\116" then
        UpdateIdentity()
    end
end)
task.spawn(function()
    while true do
        if _lxAau354.IdentityMode ~= "\068\101\102\097\117\108\116" then
            if _lxAau354.IdentityMode == "\080\114\111\109\111\116\101\032\068\105\115\099\111\114\100" or _lxAau354.IdentityMode == "\067\117\115\116\111\109\032\078\097\109\101" then
                local _VBzIW351 = tick() % 5 / 5
                local _oNuuI174 = Color3.fromHSV(_VBzIW351, 1, 1)
                for i, _LiAnF957 in pairs(_UhjvY868) do
                    if _LiAnF957 and _LiAnF957.Parent then
                        _LiAnF957.TextColor3 = _oNuuI174
                    else
                        table.remove(_UhjvY868, i)
                    end
                end
            end
            if LocalPlayer.Character then
                local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
                if _cOPpa623 and _cOPpa623.DisplayName ~= "\032" then
                    _cOPpa623.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    pcall(function() _cOPpa623.DisplayName = "\032" end)
                end
            end
        end
        task.wait(0.1)
    end
end)
local _AtXGi921 = Instance.new("\080\097\114\116", _Rvbaz952)
_AtXGi921.Name = "\074\101\115\117\115\087\097\108\107"
_AtXGi921.Size = Vector3.new(20, 1, 20)
_AtXGi921.Anchored = true
_AtXGi921.Transparency = 1
_AtXGi921.CanCollide = false 
UserInputService.JumpRequest:Connect(function()
    if _lxAau354.InfiniteJump then
        if LocalPlayer.Character then
            local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
            if _cOPpa623 then _cOPpa623:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end)
local function BoostFPS()
    Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9; settings().Rendering.QualityLevel = "\076\101\118\101\108\048\049"
    for _, _Kschh846 in pairs(game:GetDescendants()) do
        if _Kschh846:IsA("\080\097\114\116") or _Kschh846:IsA("\077\101\115\104\080\097\114\116") then 
            _Kschh846.Material = Enum.Material.SmoothPlastic; _Kschh846.Reflectance = 0; _Kschh846.CastShadow = false
        elseif _Kschh846:IsA("\068\101\099\097\108") or _Kschh846:IsA("\084\101\120\116\117\114\101") or _Kschh846:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") then _Kschh846:Destroy() end
    end
    ShowToast("\070\080\083\032\066\111\111\115\116\101\100\033")
end
local function ClearMemory()
    local _xeTaW768 = _Rvbaz952:FindFirstChildOfClass("\084\101\114\114\097\105\110")
    if _xeTaW768 then _xeTaW768.WaterWaveSize = 0; _xeTaW768.WaterWaveSpeed = 0; _xeTaW768.WaterReflectance = 0; _xeTaW768.WaterTransparency = 0 end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = "\076\101\118\101\108\048\049"
    for _, _Kschh846 in pairs(game:GetDescendants()) do
        if _Kschh846:IsA("\068\101\099\097\108") or _Kschh846:IsA("\084\101\120\116\117\114\101") then _Kschh846.Transparency = 1 end
    end
    collectgarbage("\099\111\108\108\101\099\116") 
    ShowToast("\077\101\109\111\114\121\032\067\108\101\097\114\101\100\032\038\032\071\067\032\082\117\110\033")
end
local function StartFly()
    local _ARHwe269 = LocalPlayer.Character; if not _ARHwe269 then return end
    local _ZtLLU592 = GetVisualPart(_ARHwe269); if not _ZtLLU592 then return end
    for _, _Kschh846 in pairs(_ZtLLU592:GetChildren()) do if _Kschh846.Name == "\071\070\108\121\086" or _Kschh846.Name == "\071\070\108\121\071" then _Kschh846:Destroy() end end
    local _ahumS229 = Instance.new("\066\111\100\121\086\101\108\111\099\105\116\121", _ZtLLU592); _ahumS229.Name = "\071\070\108\121\086"; _ahumS229.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    local _iUNoL602 = Instance.new("\066\111\100\121\071\121\114\111", _ZtLLU592); _iUNoL602.Name = "\071\070\108\121\071"; _iUNoL602.MaxTorque = Vector3.new(1e9, 1e9, 1e9); _iUNoL602.P = 9000
    task.spawn(function()
        while _lxAau354.Fly and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100") and _ARHwe269.Humanoid.Health > 0 do
            if not _ZtLLU592:FindFirstChild("\071\070\108\121\086") then break end
            local _xoLPc435 = Camera.CFrame; local _uKclR342 = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then _uKclR342 = _uKclR342 + _xoLPc435.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then _uKclR342 = _uKclR342 - _xoLPc435.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then _uKclR342 = _uKclR342 - _xoLPc435.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then _uKclR342 = _uKclR342 + _xoLPc435.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then _uKclR342 = _uKclR342 + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then _uKclR342 = _uKclR342 - Vector3.new(0, 1, 0) end
            _ahumS229.Velocity = _uKclR342 * 60; _iUNoL602.CFrame = _xoLPc435
            task.wait()
        end
        pcall(function() _ahumS229:Destroy(); _iUNoL602:Destroy() end)
        _ARHwe269.Humanoid.PlatformStand = false
    end)
    _ARHwe269.Humanoid.PlatformStand = true
end
local function StopFly()
    pcall(function()
        local _ZtLLU592 = GetVisualPart(LocalPlayer.Character)
        if _ZtLLU592 and _ZtLLU592:FindFirstChild("\071\070\108\121\086") then _ZtLLU592.GFlyV:Destroy() end
        if _ZtLLU592 and _ZtLLU592:FindFirstChild("\071\070\108\121\071") then _ZtLLU592.GFlyG:Destroy() end
        LocalPlayer.Character.Humanoid.PlatformStand = false
    end)
end
local function ToggleFreecam(enable)
    _lxAau354.Freecam = enable
    local _ARHwe269 = LocalPlayer.Character
    local _ZtLLU592 = _ARHwe269 and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") 
    local _cOPpa623 = _ARHwe269 and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100")
    if enable then
        local _EmYMH413 = Instance.new("\080\097\114\116", _Rvbaz952)
        _EmYMH413.Name = "\070\114\101\101\099\097\109\070\111\099\117\115"
        _EmYMH413.Anchored = true
        _EmYMH413.CanCollide = false
        _EmYMH413.Transparency = 1
        _EmYMH413.Position = Camera.CFrame.Position
        _lxAau354.FreecamPart = _EmYMH413
        LocalPlayer.ReplicationFocus = _EmYMH413 
        Camera.CameraType = Enum.CameraType.Scriptable
        _lxAau354.FreecamPos = Camera.CFrame
        local _AGvAo797, ry, rz = Camera.CFrame:ToEulerAnglesYXZ()
        _lxAau354.FreecamRot = Vector2.new(_AGvAo797, ry)
        if _ZtLLU592 then 
            _ZtLLU592.Anchored = true 
            _ZtLLU592.Velocity = Vector3.new(0,0,0) 
        end
        if _cOPpa623 then 
            _cOPpa623.PlatformStand = true
        end
    else
        LocalPlayer.ReplicationFocus = nil 
        if _lxAau354.FreecamPart then 
            _lxAau354.FreecamPart:Destroy()
            _lxAau354.FreecamPart = nil 
        end
        Camera.CameraType = Enum.CameraType.Custom
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        if _ARHwe269 then 
            Camera.CameraSubject = _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100")
            if _ZtLLU592 then _ZtLLU592.Anchored = false end
            if _cOPpa623 then _cOPpa623.PlatformStand = false end
        end
    end
end
local function GetTeamColor(player)
    if player == LocalPlayer then return Color3.fromRGB(80, 255, 80) end
    if player.TeamColor == LocalPlayer.TeamColor then return Color3.fromRGB(80, 255, 80) else return Color3.fromRGB(255, 80, 80) end
end
local function StartVehicleFly()
    local _ARHwe269 = LocalPlayer.Character
    if not _ARHwe269 then return end
    local _cOPpa623 = _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100")
    local _ZtLLU592 = nil
    if _cOPpa623 and _cOPpa623.SeatPart then
        _ZtLLU592 = _cOPpa623.SeatPart 
    else
        _ZtLLU592 = _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    end
    if not _ZtLLU592 then return end
    if _ZtLLU592:FindFirstChild("\086\070\108\121\086") then _ZtLLU592.VFlyV:Destroy() end
    if _ZtLLU592:FindFirstChild("\086\070\108\121\071") then _ZtLLU592.VFlyG:Destroy() end
    local _ahumS229 = Instance.new("\066\111\100\121\086\101\108\111\099\105\116\121", _ZtLLU592)
    _ahumS229.Name = "\086\070\108\121\086"
    _ahumS229.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    local _iUNoL602 = Instance.new("\066\111\100\121\071\121\114\111", _ZtLLU592)
    _iUNoL602.Name = "\086\070\108\121\071"
    _iUNoL602.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    _iUNoL602.P = 9000
    task.spawn(function()
        while _lxAau354.FlyVehicle and _ZtLLU592 and _ZtLLU592.Parent do
            local _xoLPc435 = Camera.CFrame
            local _FpWfY350 = 100 
            local _uKclR342 = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then _uKclR342 = _uKclR342 + _xoLPc435.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then _uKclR342 = _uKclR342 - _xoLPc435.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then _uKclR342 = _uKclR342 - _xoLPc435.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then _uKclR342 = _uKclR342 + _xoLPc435.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then _uKclR342 = _uKclR342 + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then _uKclR342 = _uKclR342 - Vector3.new(0, -1, 0) end
            _ahumS229.Velocity = _uKclR342 * _FpWfY350
            _iUNoL602.CFrame = _xoLPc435
            task.wait()
        end
        if _ahumS229 then _ahumS229:Destroy() end
        if _iUNoL602 then _iUNoL602:Destroy() end
    end)
end
local function BypassMessage(_ZbVut581)
    local _qJDCB791 = "‎" 
    local _peIpR841 = ""
    for i = 1, #_ZbVut581 do
        _peIpR841 = _peIpR841 .. string.sub(_ZbVut581, i, i) .. _qJDCB791
    end
    return _peIpR841
end
local function SendBypassChat(_bGacx359)
    local _iBBOZ120 = BypassMessage(_bGacx359)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local _fHFbX306 = TextChatService.TextChannels.RBXGeneral
        if _fHFbX306 then _fHFbX306:SendAsync(_iBBOZ120) end
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_iBBOZ120, "\065\108\108")
    end
end
local function DeleteMap()
    for _, _Kschh846 in pairs(_Rvbaz952:GetChildren()) do
        if _Kschh846.Name ~= "\084\101\114\114\097\105\110" and not _Kschh846:IsA("\067\097\109\101\114\097") and not Players:GetPlayerFromCharacter(_Kschh846) then
            if _Kschh846 ~= LocalPlayer.Character then
                _Kschh846:Destroy()
            end
        end
    end
    ShowToast("🔥\032\077\097\112\032\068\101\108\101\116\101\100\032\102\111\114\032\070\080\083\032\066\111\111\115\116\033")
end
local function RemoveTextures()
    for _, _Kschh846 in pairs(_Rvbaz952:GetDescendants()) do
        if _Kschh846:IsA("\084\101\120\116\117\114\101") or _Kschh846:IsA("\068\101\099\097\108") or _Kschh846:IsA("\083\117\114\102\097\099\101\065\112\112\101\097\114\097\110\099\101") then
            _Kschh846:Destroy()
        elseif _Kschh846:IsA("\066\097\115\101\080\097\114\116") then
            _Kschh846.Material = Enum.Material.SmoothPlastic
            _Kschh846.Reflectance = 0
        end
    end
    ShowToast("🎨\032\084\101\120\116\117\114\101\115\032\082\101\109\111\118\101\100\033")
end
RunService.Heartbeat:Connect(function()
    if _lxAau354.Bhop and LocalPlayer.Character then
        local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
        if _cOPpa623 and _cOPpa623.FloorMaterial ~= Enum.Material.Air and _cOPpa623.MoveDirection.Magnitude > 0 then
            _cOPpa623:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
RunService.Stepped:Connect(function()
    if _lxAau354.Noclip and LocalPlayer.Character then
        for _, _cypkv539 in pairs(LocalPlayer.Character:GetDescendants()) do
            if _cypkv539:IsA("\066\097\115\101\080\097\114\116") and _cypkv539.CanCollide == true then 
                _cypkv539.CanCollide = false
                if _cypkv539.Velocity.Magnitude > 100 then
                   _cypkv539.Velocity = Vector3.new(0, 0, 0)
                   _cypkv539.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)
task.spawn(function()
    while true do
        if _lxAau354.ChatSpammer then
            local _ZbVut581 = _lxAau354.SpamMessage
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                local _fHFbX306 = TextChatService.TextChannels.RBXGeneral
                if _fHFbX306 then _fHFbX306:SendAsync(_ZbVut581) end
            else
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_ZbVut581, "\065\108\108")
            end
            task.wait(0.5) 
        else
            task.wait(1)
        end
    end
end)
local _HdnCQ266 = Instance.new("\070\114\097\109\101", _OyOeY313); _HdnCQ266.Name = "\083\116\097\116\115\080\097\110\101\108"; _HdnCQ266.Size = UDim2.new(0, 220, 0, 180); _HdnCQ266.Position = UDim2.new(0, 10, 0.4, 0); RegisterTheme(_HdnCQ266, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _HdnCQ266.Visible = false
Instance.new("\085\073\067\111\114\110\101\114", _HdnCQ266).CornerRadius = UDim.new(0, 8); local _LudxZ49 = Instance.new("\085\073\083\116\114\111\107\101", _HdnCQ266); RegisterTheme(_LudxZ49, "\067\111\108\111\114", "\065\099\099\101\110\116"); _LudxZ49.Thickness = 1
MakeDraggable(_HdnCQ266)
local _sXSLD371 = Instance.new("\084\101\120\116\076\097\098\101\108", _HdnCQ266); _sXSLD371.Size = UDim2.new(1, 0, 0, 25); _sXSLD371.BackgroundTransparency = 1; _sXSLD371.Text = "\083\089\083\084\069\077\032\077\079\078\073\084\079\082"; RegisterTheme(_sXSLD371, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _sXSLD371.Font = Enum.Font.GothamBlack; _sXSLD371.TextSize = 13
local _bQAvv235 = Instance.new("\070\114\097\109\101", _HdnCQ266); _bQAvv235.Size = UDim2.new(1, -10, 1, -30); _bQAvv235.Position = UDim2.new(0, 5, 0, 30); _bQAvv235.BackgroundTransparency = 1
local _gCTCg857 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _bQAvv235); _gCTCg857.Padding = UDim.new(0, 2)
local function CreateStatLabel(_pVKXs820)
    local _QkLqp83 = Instance.new("\070\114\097\109\101", _bQAvv235); _QkLqp83.Size = UDim2.new(1, 0, 0, 18); _QkLqp83.BackgroundTransparency = 1
    local _ddyJE952 = Instance.new("\084\101\120\116\076\097\098\101\108", _QkLqp83); _ddyJE952.Size = UDim2.new(0.5, 0, 1, 0); _ddyJE952.BackgroundTransparency = 1; _ddyJE952.Text = _pVKXs820; RegisterTheme(_ddyJE952, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109"); _ddyJE952.Font = Enum.Font.GothamBold; _ddyJE952.TextSize = 12; _ddyJE952.TextXAlignment = Enum.TextXAlignment.Left
    local _Kschh846 = Instance.new("\084\101\120\116\076\097\098\101\108", _QkLqp83); _Kschh846.Size = UDim2.new(0.5, 0, 1, 0); _Kschh846.Position = UDim2.new(0.5, 0, 0, 0); _Kschh846.BackgroundTransparency = 1; _Kschh846.Text = "\046\046\046"; RegisterTheme(_Kschh846, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116"); _Kschh846.Font = Enum.Font.Code; _Kschh846.TextSize = 12; _Kschh846.TextXAlignment = Enum.TextXAlignment.Right
    return _Kschh846
end
local _pqtlg387 = CreateStatLabel("\070\080\083\058")
local _Ikfqg346 = CreateStatLabel("\080\105\110\103\058")
local _Eyysg564 = CreateStatLabel("\080\108\097\121\101\114\115\058")
local _ZVdRn9 = CreateStatLabel("\077\101\109\111\114\121\058")
local _jsfht7 = CreateStatLabel("\082\101\099\118\058")
local _eFxZd150 = CreateStatLabel("\083\101\110\116\058")
local _gEWmZ883 = CreateStatLabel("\073\110\115\116\097\110\099\101\115\058")
task.spawn(function()
    while true do
        if _lxAau354.ShowStats and _HdnCQ266.Visible then
            local _RNpge308 = math.floor(1 / RunService.RenderStepped:Wait())
            _pqtlg387.Text = tostring(_RNpge308)
            local _fjFDx815 = 0
            pcall(function() _fjFDx815 = math.floor(LocalPlayer:GetNetworkPing() * 2000) end)
            if _fjFDx815 == 0 then pcall(function() _fjFDx815 = math.floor(_XjAbF897.Network.ServerStatsItem["\068\097\116\097\032\080\105\110\103"]:GetValue()) end) end
            _Ikfqg346.Text = _fjFDx815 .. "\032\109\115"
            pcall(function() _Eyysg564.Text = #Players:GetPlayers() .. "\032\047\032" .. Players.MaxPlayers end)
            local _GyMMZ383 = math.floor(_XjAbF897:GetTotalMemoryUsageMb())
            _ZVdRn9.Text = _GyMMZ383 .. "\032\077\066"
            local _tNKXC18 = 0; local _DgwoZ452 = 0
            pcall(function() _tNKXC18 = math.floor(_XjAbF897.Network.ServerStatsItem["\068\097\116\097\032\082\101\099\101\105\118\101"]:GetValue()) end)
            pcall(function() _DgwoZ452 = math.floor(_XjAbF897.Network.ServerStatsItem["\068\097\116\097\032\083\101\110\100"]:GetValue()) end)
            _jsfht7.Text = _tNKXC18 .. "\032\075\066\047\115"
            _eFxZd150.Text = _DgwoZ452 .. "\032\075\066\047\115"
            pcall(function() _gEWmZ883.Text = tostring(#_Rvbaz952:GetDescendants()) end)
        else
            task.wait(1)
        end
        task.wait(0.5) 
    end
end)
local _ffWgt758 = Instance.new("\070\114\097\109\101", _OyOeY313); _ffWgt758.Name = "\065\110\105\109\076\111\103\103\101\114"; _ffWgt758.Size = UDim2.new(0, 220, 0, 160); _ffWgt758.Position = UDim2.new(0, 10, 0.5, -80); RegisterTheme(_ffWgt758, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _ffWgt758.Visible = false
Instance.new("\085\073\067\111\114\110\101\114", _ffWgt758).CornerRadius = UDim.new(0, 8); local _bRgdk313 = Instance.new("\085\073\083\116\114\111\107\101", _ffWgt758); RegisterTheme(_bRgdk313, "\067\111\108\111\114", "\065\099\099\101\110\116"); _bRgdk313.Thickness = 1; MakeDraggable(_ffWgt758)
local _Qmrve497 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _ffWgt758); _Qmrve497.Size = UDim2.new(1, -10, 1, -30); _Qmrve497.Position = UDim2.new(0, 5, 0, 30); _Qmrve497.BackgroundTransparency = 1; _Qmrve497.ScrollBarThickness = 3; _Qmrve497.AutomaticCanvasSize = Enum.AutomaticSize.Y
local _pvPao740 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _Qmrve497); _pvPao740.Padding = UDim.new(0, 2); local _knCVN24 = Instance.new("\084\101\120\116\076\097\098\101\108", _ffWgt758); _knCVN24.Size = UDim2.new(1, 0, 0, 25); _knCVN24.BackgroundTransparency = 1; _knCVN24.Text = "\065\078\073\077\032\076\079\071"; RegisterTheme(_knCVN24, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _knCVN24.Font = Enum.Font.GothamBlack; _knCVN24.TextSize = 14
local _xjxgf247 = Instance.new("\070\114\097\109\101", _OyOeY313); _xjxgf247.Name = "\069\118\101\110\116\076\111\103\103\101\114"; _xjxgf247.Size = UDim2.new(0, 240, 0, 160); _xjxgf247.Position = UDim2.new(0, 240, 0.5, -80); RegisterTheme(_xjxgf247, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _xjxgf247.Visible = false
Instance.new("\085\073\067\111\114\110\101\114", _xjxgf247).CornerRadius = UDim.new(0, 8); local _dYsgn847 = Instance.new("\085\073\083\116\114\111\107\101", _xjxgf247); RegisterTheme(_dYsgn847, "\067\111\108\111\114", "\065\099\099\101\110\116"); _dYsgn847.Thickness = 1; MakeDraggable(_xjxgf247)
local _fptiF876 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _xjxgf247); _fptiF876.Size = UDim2.new(1, -10, 1, -30); _fptiF876.Position = UDim2.new(0, 5, 0, 30); _fptiF876.BackgroundTransparency = 1; _fptiF876.ScrollBarThickness = 3; _fptiF876.AutomaticCanvasSize = Enum.AutomaticSize.Y
local _lJjfk385 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _fptiF876); _lJjfk385.Padding = UDim.new(0, 2); local _wQrDL445 = Instance.new("\084\101\120\116\076\097\098\101\108", _xjxgf247); _wQrDL445.Size = UDim2.new(0.7, 0, 0, 25); _wQrDL445.BackgroundTransparency = 1; _wQrDL445.Text = "\082\069\077\079\084\069\032\083\080\089"; RegisterTheme(_wQrDL445, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _wQrDL445.Font = Enum.Font.GothamBlack; _wQrDL445.TextSize = 14; _wQrDL445.Position = UDim2.new(0,5,0,0); _wQrDL445.TextXAlignment = Enum.TextXAlignment.Left
local _OXLAU204 = Instance.new("\070\114\097\109\101", _OyOeY313); _OXLAU204.Name = "\067\104\097\116\076\111\103\103\101\114"; _OXLAU204.Size = UDim2.new(0, 260, 0, 180); _OXLAU204.Position = UDim2.new(1, -280, 0.5, -80); RegisterTheme(_OXLAU204, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _OXLAU204.Visible = false
Instance.new("\085\073\067\111\114\110\101\114", _OXLAU204).CornerRadius = UDim.new(0, 8); local _EdUeF614 = Instance.new("\085\073\083\116\114\111\107\101", _OXLAU204); RegisterTheme(_EdUeF614, "\067\111\108\111\114", "\065\099\099\101\110\116"); _EdUeF614.Thickness = 1; MakeDraggable(_OXLAU204)
local _gPDUO318 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _OXLAU204); _gPDUO318.Size = UDim2.new(1, -10, 1, -30); _gPDUO318.Position = UDim2.new(0, 5, 0, 30); _gPDUO318.BackgroundTransparency = 1; _gPDUO318.ScrollBarThickness = 3; _gPDUO318.AutomaticCanvasSize = Enum.AutomaticSize.Y
local _Yeone432 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _gPDUO318); _Yeone432.Padding = UDim.new(0, 4); local _rQvCZ872 = Instance.new("\084\101\120\116\076\097\098\101\108", _OXLAU204); _rQvCZ872.Size = UDim2.new(1, 0, 0, 25); _rQvCZ872.BackgroundTransparency = 1; _rQvCZ872.Text = "\067\072\065\084\032\076\079\071"; RegisterTheme(_rQvCZ872, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _rQvCZ872.Font = Enum.Font.GothamBlack; _rQvCZ872.TextSize = 14
local _JKIoh571 = {}
local function ClearAnimLog() for _, child in pairs(_Qmrve497:GetChildren()) do if child:IsA("\084\101\120\116\066\117\116\116\111\110") then child:Destroy() end end _JKIoh571 = {} end
local function ClearEventLog() for _, child in pairs(_fptiF876:GetChildren()) do if child:IsA("\084\101\120\116\066\117\116\116\111\110") then child:Destroy() end end end
local function ClearChatLog() for _, child in pairs(_gPDUO318:GetChildren()) do if child:IsA("\084\101\120\116\076\097\098\101\108") then child:Destroy() end end end
local function UpdateAnimLogger()
    if not _lxAau354.AnimLogger then _ffWgt758.Visible = false; ClearAnimLog() return end
    _ffWgt758.Visible = true
    local _ARHwe269 = LocalPlayer.Character; if not _ARHwe269 then return end
    local _cOPpa623 = _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100"); if not _cOPpa623 then return end
    local _FyFxw936 = _cOPpa623:FindFirstChildOfClass("\065\110\105\109\097\116\111\114"); if not _FyFxw936 then return end
    _FyFxw936.AnimationPlayed:Connect(function(_vKlmA372)
        if not _lxAau354.AnimLogger then return end
        local _RnXAk204 = _vKlmA372.Animation.AnimationId
        local _EyMUO961 = string.match(_RnXAk204, "\037\100\043") or "\085\110\107\110\111\119\110"
        if _JKIoh571[_vKlmA372] then return end
        local _LiAnF957 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _Qmrve497)
        _LiAnF957.Size = UDim2.new(1, 0, 0, 20); _LiAnF957.BackgroundTransparency = 1; _LiAnF957.Text = "\073\068\058\032" .. _EyMUO961; RegisterTheme(_LiAnF957, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116"); _LiAnF957.Font = Enum.Font.Code; _LiAnF957.TextSize = 13; _LiAnF957.TextXAlignment = Enum.TextXAlignment.Left
        _LiAnF957.MouseButton1Click:Connect(function() setclipboard(_EyMUO961); ShowToast("\065\110\105\109\032\073\068\032\067\111\112\105\101\100") end)
        _JKIoh571[_vKlmA372] = _LiAnF957
        _vKlmA372.Stopped:Connect(function() if _JKIoh571[_vKlmA372] then _JKIoh571[_vKlmA372]:Destroy(); _JKIoh571[_vKlmA372] = nil end end)
    end)
end
local function InitEventLogger()
    if not _lxAau354.EventLogger then _xjxgf247.Visible = false; ClearEventLog() return end
    _xjxgf247.Visible = true
    local _LCQgS462 = {"\067\104\097\114\097\099\116\101\114\083\111\117\110\100\069\118\101\110\116", "\085\112\100\097\116\101\083\116\097\116\101", "\082\101\112\108\105\099\097\116\105\111\110", "\084\111\117\099\104", "\070\111\111\116\115\116\101\112", "\077\111\118\101", "\072\101\097\114\116\098\101\097\116", "\082\101\110\100\101\114"}
    local function LogEvent(_pVKXs820, args)
        if not _lxAau354.EventLogger then return end
        for _, blocked in pairs(_LCQgS462) do if string.find(_pVKXs820, blocked) then return end end
        local _LiAnF957 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _fptiF876)
        _LiAnF957.Size = UDim2.new(1, 0, 0, 20); _LiAnF957.BackgroundTransparency = 1; _LiAnF957.Text = "\062\032" .. _pVKXs820; _LiAnF957.TextColor3 = Color3.fromRGB(80, 255, 80); _LiAnF957.Font = Enum.Font.Code; _LiAnF957.TextSize = 12; _LiAnF957.TextXAlignment = Enum.TextXAlignment.Left; _LiAnF957.TextTruncate = Enum.TextTruncate.AtEnd
        _LiAnF957.MouseButton1Click:Connect(function()
            local _LLQUO674 = "\082\101\109\111\116\101\058\032" .. _pVKXs820 .. "\092\110\065\114\103\115\058\032"; for i,_Kschh846 in pairs(args) do _LLQUO674 = _LLQUO674 .. tostring(_Kschh846) .. "\044\032" end; setclipboard(_LLQUO674); ShowToast("\065\114\103\115\032\067\111\112\105\101\100")
        end)
        local _IvmoL432 = _fptiF876:GetChildren(); if #_IvmoL432 > 30 then for i=1, 5 do if _IvmoL432[i] and _IvmoL432[i]:IsA("\084\101\120\116\066\117\116\116\111\110") then _IvmoL432[i]:Destroy() end end end
    end
    local function ConnectRemote(rc) if rc:IsA("\082\101\109\111\116\101\069\118\101\110\116") then rc.OnClientEvent:Connect(function(...) LogEvent(rc.Name, {...}) end) end end
    for _, _Kschh846 in pairs(ReplicatedStorage:GetDescendants()) do ConnectRemote(_Kschh846) end
    ReplicatedStorage.DescendantAdded:Connect(ConnectRemote)
end
local function InitChatLogger()
    if not _lxAau354.ChatLogger then _OXLAU204.Visible = false; ClearChatLog() return end
    _OXLAU204.Visible = true
    local function LogMessage(player, _ZbVut581)
        if not _lxAau354.ChatLogger then return end
        local _kkSmC400 = os.date("\037\072\058\037\077")
        local _pVKXs820 = (player and player.DisplayName) or "\085\110\107\110\111\119\110"
        local _LiAnF957 = Instance.new("\084\101\120\116\076\097\098\101\108", _gPDUO318)
        _LiAnF957.Size = UDim2.new(1, 0, 0, 25); _LiAnF957.BackgroundTransparency = 1; _LiAnF957.Font = Enum.Font.GothamMedium; _LiAnF957.TextSize = 12; _LiAnF957.TextXAlignment = Enum.TextXAlignment.Left; _LiAnF957.TextWrapped = true
        _LiAnF957.RichText = true; _LiAnF957.Text = string.format("\060\102\111\110\116\032\099\111\108\111\114\061\039\114\103\098\040\048\044\050\053\053\044\049\052\048\041\039\062\091\037\115\093\032\037\115\058\060\047\102\111\110\116\062\032\037\115", _kkSmC400, _pVKXs820, _ZbVut581); RegisterTheme(_LiAnF957, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
        _gPDUO318.CanvasPosition = Vector2.new(0, 99999)
        local _IvmoL432 = _gPDUO318:GetChildren(); if #_IvmoL432 > 40 then for i=1, 5 do if _IvmoL432[i] and _IvmoL432[i]:IsA("\084\101\120\116\076\097\098\101\108") then _IvmoL432[i]:Destroy() end end end
    end
    local _puQDd325, _ = pcall(function()
        TextChatService.MessageReceived:Connect(function(_ZbVut581) if _ZbVut581.TextSource then LogMessage(Players:GetPlayerByUserId(_ZbVut581.TextSource.UserId), _ZbVut581.Text) end end)
    end)
    if not _puQDd325 then
        pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) LogMessage(Players[data.FromSpeaker], data.Message) end) end)
    end
end
RunService.Heartbeat:Connect(function() 
    if _lxAau354.AntiFall then 
        pcall(function() 
            local _ARHwe269 = LocalPlayer.Character 
            local _cOPpa623 = _ARHwe269 and _ARHwe269:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") 
            local _lHvTU969 = _ARHwe269 and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
            if _cOPpa623 and _lHvTU969 then 
                local _SZAaR494 = _cOPpa623:GetState() 
                if (_SZAaR494 == Enum.HumanoidStateType.Freefall or _SZAaR494 == Enum.HumanoidStateType.FallingDown) and _lHvTU969.Velocity.Y < -50 then 
                    _cOPpa623:ChangeState(Enum.HumanoidStateType.PlatformStanding) 
                end 
            end 
        end)
    end
end)
RunService.RenderStepped:Connect(function(dt)
    if _lxAau354.MaxZoom then
        LocalPlayer.CameraMaxZoomDistance = 1000
        LocalPlayer.CameraMinZoomDistance = 0.5 
    end
    if _lxAau354.GravityControl and LocalPlayer.Character then
        local _ZtLLU592 = GetVisualPart(LocalPlayer.Character)
        if _ZtLLU592 then
            local _tlZoj399 = Ray.new(_ZtLLU592.Position, -_ZtLLU592.CFrame.UpVector * 10)
            local _cypkv539, _ZMlOZ577, normal = _Rvbaz952:FindPartOnRay(_tlZoj399, LocalPlayer.Character)
            if _cypkv539 then
                local _VrUAM770 = _ZtLLU592.CFrame.RightVector
                local _CAdOk206 = normal
                local _PjNJF257 = _VrUAM770:Cross(_CAdOk206).Unit
                local _poimM947 = _CAdOk206:Cross(_PjNJF257).Unit
                _ZtLLU592.CFrame = CFrame.fromMatrix(_ZtLLU592.Position, _PjNJF257, _CAdOk206, _poimM947)
            end
        end
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") then
        local _ZtLLU592 = LocalPlayer.Character.HumanoidRootPart
        if _ZtLLU592.Position.Y > _lxAau354.VoidHeight + 10 and LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            _lxAau354.LastSafePos = _ZtLLU592.CFrame
        end
        if _lxAau354.AntiVoid and _ZtLLU592.Position.Y < _lxAau354.VoidHeight then
            if _lxAau354.LastSafePos then
                _ZtLLU592.CFrame = _lxAau354.LastSafePos + Vector3.new(0, 3, 0)
                _ZtLLU592.Velocity = Vector3.new(0,0,0)
                ShowToast("\065\110\116\105\045\086\111\105\100\058\032\083\097\118\101\100\033")
            end
        end
    end
    if _lxAau354.WalkOnWater and LocalPlayer.Character then
        local _ZtLLU592 = GetVisualPart(LocalPlayer.Character)
        if _ZtLLU592 then
            local _zjqzJ579 = RaycastParams.new(); _zjqzJ579.FilterDescendantsInstances = {LocalPlayer.Character, _AtXGi921}
            local _tlZoj399 = _Rvbaz952:Raycast(_ZtLLU592.Position, Vector3.new(0, -10, 0), _zjqzJ579)
            if _tlZoj399 and _tlZoj399.Material == Enum.Material.Water then
                _AtXGi921.CanCollide = true
                _AtXGi921.Position = Vector3.new(_ZtLLU592.Position.X, _tlZoj399.Position.Y, _ZtLLU592.Position.Z)
            else
                _AtXGi921.CanCollide = false
            end
        end
    else
        _AtXGi921.CanCollide = false
    end
    if _lxAau354.ForceUnlockMouse then
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then UserInputService.MouseBehavior = Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = true end
    end
    if _lxAau354.Freecam then
        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
            local _zjVKj104 = UserInputService:GetMouseDelta(); _lxAau354.FreecamRot = _lxAau354.FreecamRot - Vector2.new(_zjVKj104.Y * 0.003, _zjVKj104.X * 0.003)
        else UserInputService.MouseBehavior = Enum.MouseBehavior.Default end
        local _lDepp394 = CFrame.fromEulerAnglesYXZ(_lxAau354.FreecamRot.X, _lxAau354.FreecamRot.Y, 0)
        local _jXwpW245 = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then _jXwpW245 = _jXwpW245 + _lDepp394.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then _jXwpW245 = _jXwpW245 - _lDepp394.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then _jXwpW245 = _jXwpW245 + _lDepp394.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then _jXwpW245 = _jXwpW245 - _lDepp394.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then _jXwpW245 = _jXwpW245 + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then _jXwpW245 = _jXwpW245 - Vector3.new(0,1,0) end
        local _JScdP269 = _lxAau354.FreecamSpeed * 50 * dt; if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then _JScdP269 = _JScdP269 * 3 end
        _lxAau354.FreecamPos = _lxAau354.FreecamPos + (_jXwpW245 * _JScdP269); Camera.CFrame = CFrame.new(_lxAau354.FreecamPos.Position) * _lDepp394
        if _lxAau354.FreecamPart then _lxAau354.FreecamPart.CFrame = Camera.CFrame end
    end
    if _lxAau354.FullbrightLoop then Lighting.Brightness=2; Lighting.ClockTime=14; Lighting.FogEnd=1e9; Lighting.GlobalShadows=false end
    if _lxAau354.NoFog then 
        Lighting.FogEnd = 9e9; Lighting.FogStart = 9e9
        local _xUeOo303 = Lighting:FindFirstChildOfClass("\065\116\109\111\115\112\104\101\114\101")
        if _xUeOo303 then _xUeOo303.Density = 0; _xUeOo303.Haze = 0; _xUeOo303.Glare = 0 end
    end
    if _lxAau354.NoParticles then for _, _Kschh846 in pairs(_Rvbaz952:GetDescendants()) do if _Kschh846:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") then _Kschh846.Enabled=false end end end
    if _lxAau354.ProximityWarning then
        local _QsJcA167 = ""
        local _OeYru990 = 0
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local _ZtLLU592 = GetVisualPart(p.Character)
                local _inBBS958 = GetVisualPart(LocalPlayer.Character)
                if _ZtLLU592 and _inBBS958 then
                    local _lMDCI727 = (_ZtLLU592.Position - _inBBS958.Position).Magnitude
                    if _lMDCI727 < _lxAau354.ProximityDist then
                        local _lNJxd577 = true
                        if _lxAau354.ProximityMode == "\069\110\101\109\121\032\079\110\108\121" then
                            if p.TeamColor == LocalPlayer.TeamColor then _lNJxd577 = false end
                        end
                        if _lNJxd577 then
                            _QsJcA167 = _QsJcA167 .. "⚠️\032" .. p.DisplayName .. "\032\091" .. math.floor(_lMDCI727) .. "\109\093\092\110"
                            _OeYru990 = _OeYru990 + 1
                        end
                    end
                end
            end
        end
        if _OeYru990 > 0 then
            _gyJpA296.Visible = true
            _LhxgF748.Text = _QsJcA167
        else
            _gyJpA296.Visible = false
        end
    else
        _gyJpA296.Visible = false
    end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if _lxAau354.MasterESP and p.Character then
                local _pHGHg509 = GetVisualPart(p.Character)
                if _pHGHg509 then
                    local _rlfbH530 = GetTeamColor(p); local _inBBS958 = GetVisualPart(LocalPlayer.Character)
                    local _lMDCI727 = 0; if _inBBS958 then _lMDCI727 = math.floor((_inBBS958.Position - _pHGHg509.Position).Magnitude) end
                    if p.Character:FindFirstChild("\071\073\110\102\111") then p.Character.GInfo:Destroy() end
                    local _nMejl565 = p.Character:FindFirstChild("\082\101\121\122\122\069\083\080\095\086\050")
                    if not _nMejl565 then
                        _nMejl565 = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105", p.Character); _nMejl565.Name = "\082\101\121\122\122\069\083\080\095\086\050"; _nMejl565.Size = UDim2.new(0, 200, 0, 100); _nMejl565.StudsOffset = Vector3.new(0, 4, 0); _nMejl565.AlwaysOnTop = true 
                        local _aQRRM770 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _nMejl565); _aQRRM770.SortOrder = Enum.SortOrder.LayoutOrder; _aQRRM770.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        local _AwhAQ248 = Instance.new("\084\101\120\116\076\097\098\101\108", _nMejl565); _AwhAQ248.Name = "\078\097\109\101\076\098\108"; _AwhAQ248.Size = UDim2.new(1,0,0,15); _AwhAQ248.BackgroundTransparency = 1; _AwhAQ248.Font = Enum.Font.GothamBold; _AwhAQ248.TextSize = 14; _AwhAQ248.TextStrokeTransparency = 0; _AwhAQ248.LayoutOrder = 1
                        local _SRSgA454 = Instance.new("\084\101\120\116\076\097\098\101\108", _nMejl565); _SRSgA454.Name = "\072\080\076\098\108"; _SRSgA454.Size = UDim2.new(1,0,0,15); _SRSgA454.BackgroundTransparency = 1; _SRSgA454.Font = Enum.Font.Code; _SRSgA454.TextSize = 12; _SRSgA454.TextStrokeTransparency = 0; _SRSgA454.LayoutOrder = 2
                        local _MQgqc651 = Instance.new("\084\101\120\116\076\097\098\101\108", _nMejl565); _MQgqc651.Name = "\068\105\115\116\076\098\108"; _MQgqc651.Size = UDim2.new(1,0,0,15); _MQgqc651.BackgroundTransparency = 1; _MQgqc651.Font = Enum.Font.GothamBold; _MQgqc651.TextSize = 11; _MQgqc651.TextStrokeTransparency = 0; _MQgqc651.LayoutOrder = 3
                    end
                    _nMejl565.Adornee = _pHGHg509
                    local _oncBV504 = _nMejl565:FindFirstChild("\078\097\109\101\076\098\108"); if _oncBV504 then _oncBV504.Text = p.DisplayName; _oncBV504.TextColor3 = _rlfbH530 end
                    local _TGBTa346 = _nMejl565:FindFirstChild("\072\080\076\098\108"); local _cOPpa623 = p.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
                    if _TGBTa346 then
                        if _cOPpa623 then
                            local _ffJES197 = math.floor(_cOPpa623.Health); local _pCgMe334 = _cOPpa623.MaxHealth; local _GjaxB28 = math.clamp(_ffJES197 / _pCgMe334, 0, 1)
                            _TGBTa346.Text = "\072\080\058\032" .. _ffJES197; _TGBTa346.TextColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(0, 255, 0), _GjaxB28)
                        else _TGBTa346.Text = "\072\080\058\032\063"; _TGBTa346.TextColor3 = Color3.new(1,1,1) end
                    end
                    local _NQTbU947 = _nMejl565:FindFirstChild("\068\105\115\116\076\098\108")
                    if _NQTbU947 then 
                        local _diZWF317 = "\091" .. _lMDCI727 .. "\109\093"
                        _NQTbU947.Text = _diZWF317
                        local _VjqLP402 = math.clamp(_lMDCI727 / 150, 0, 1); _NQTbU947.TextColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), _VjqLP402) 
                    end
                    local _mwwIy128 = p.Character:FindFirstChild("\071\072\105\103\104\108\105\103\104\116")
                    if not _mwwIy128 then _mwwIy128 = Instance.new("\072\105\103\104\108\105\103\104\116", p.Character); _mwwIy128.Name = "\071\072\105\103\104\108\105\103\104\116"; _mwwIy128.FillColor = _rlfbH530; _mwwIy128.OutlineColor = Color3.new(1,1,1); _mwwIy128.FillTransparency = 0.5; _mwwIy128.OutlineTransparency = 0; _mwwIy128.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop end
                    _mwwIy128.Adornee = p.Character; _mwwIy128.FillColor = _rlfbH530
                end
            else
                if p.Character then
                    if p.Character:FindFirstChild("\071\072\105\103\104\108\105\103\104\116") then p.Character.GHighlight:Destroy() end
                    if p.Character:FindFirstChild("\071\073\110\102\111") then p.Character.GInfo:Destroy() end
                    if p.Character:FindFirstChild("\082\101\121\122\122\069\083\080\095\086\050") then p.Character.ReyzzESP_V2:Destroy() end
                end
            end
        end
    end
    if _lxAau354.NightVision then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
        Lighting.ColorShift_Top = Color3.new(1, 1, 1)
        Lighting.Brightness = 5
        Lighting.ExposureCompensation = 2
    end
    if _lxAau354.AntiDrown and LocalPlayer.Character then
        local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
        if _cOPpa623 then
            if _cOPpa623:GetState() == Enum.HumanoidStateType.Dead then return end
            local _FJpnl698 = LocalPlayer.Character:FindFirstChild("\072\101\097\100")
            if _FJpnl698 and _FJpnl698.Position.Y < workspace.Terrain.WaterWaveSize then
            end
        end
    end
end)
RunService.Heartbeat:Connect(function()
    if _lxAau354.LoopSpeed and LocalPlayer.Character then
        local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
        if _cOPpa623 then
            if _cOPpa623.WalkSpeed ~= _lxAau354.WalkSpeed then 
                _cOPpa623.WalkSpeed = _lxAau354.WalkSpeed 
            end
            if _cOPpa623.UseJumpPower then
                if _cOPpa623.JumpPower ~= _lxAau354.JumpPower then _cOPpa623.JumpPower = _lxAau354.JumpPower end
            else
                if _cOPpa623.JumpHeight ~= _lxAau354.JumpPower then _cOPpa623.JumpHeight = _lxAau354.JumpPower end
            end
        end
    end
end)
local _EGTpO878 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _OyOeY313)
_EGTpO878.Size = UDim2.new(0, 50, 0, 50); _EGTpO878.Position = UDim2.new(0, 50, 0, 50); RegisterTheme(_EGTpO878, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _EGTpO878.Text = "\082"; RegisterTheme(_EGTpO878, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _EGTpO878.TextSize = 32; _EGTpO878.Font = Enum.Font.GothamBlack; _EGTpO878.AutoButtonColor = false; _EGTpO878.Visible = true; _EGTpO878.ZIndex = 9999
Instance.new("\085\073\067\111\114\110\101\114", _EGTpO878).CornerRadius = UDim.new(0, 15); local _QQQur259 = Instance.new("\085\073\083\116\114\111\107\101", _EGTpO878); RegisterTheme(_QQQur259, "\067\111\108\111\114", "\065\099\099\101\110\116"); _QQQur259.Thickness = 3; _QQQur259.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MakeDraggable(_EGTpO878)
local _IJbPu805 = Instance.new("\070\114\097\109\101", _OyOeY313)
_IJbPu805.Size = _RxUlZ833.BaseSize 
_IJbPu805.Position = UDim2.new(0.5, -350, 0.5, -225)
RegisterTheme(_IJbPu805, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100") 
_IJbPu805.Visible = false
_IJbPu805.ClipsDescendants = true
Instance.new("\085\073\067\111\114\110\101\114", _IJbPu805).CornerRadius = UDim.new(0, 12)
_IJbPu805.BackgroundTransparency = 0.15 
local _QeryG214 = Instance.new("\085\073\083\116\114\111\107\101", _IJbPu805)
_QeryG214.Name = "\077\097\105\110\066\111\114\100\101\114"
_QeryG214.Thickness = 2 
_QeryG214.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
RegisterTheme(_QeryG214, "\067\111\108\111\114", "\065\099\099\101\110\116")
MakeDraggable(_IJbPu805)
local _qFuDi422 = Instance.new("\070\114\097\109\101", _IJbPu805)
_qFuDi422.Size = UDim2.new(1, 0, 0, 40)
RegisterTheme(_qFuDi422, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100") 
_qFuDi422.BackgroundTransparency = 1
_qFuDi422.BorderSizePixel = 0
local _Ntyzj640 = Instance.new("\084\101\120\116\076\097\098\101\108", _qFuDi422)
_Ntyzj640.Text = "\082\101\121\122\122\072\117\098\086\049\046\048\032\124\032\065\110\116\097\114\099\116\105\099\097\032\069\120\112\101\100\105\116\105\111\110" 
_Ntyzj640.Size = UDim2.new(0.7, 0, 1, 0)
_Ntyzj640.Position = UDim2.new(0, 15, 0, 0)
_Ntyzj640.BackgroundTransparency = 1
RegisterTheme(_Ntyzj640, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
_Ntyzj640.Font = Enum.Font.GothamBold
_Ntyzj640.TextSize = 14
_Ntyzj640.TextXAlignment = Enum.TextXAlignment.Left
local _twNtn463 = Instance.new("\070\114\097\109\101", _qFuDi422); _twNtn463.Size = UDim2.new(0, 80, 1, 0); _twNtn463.Position = UDim2.new(1, -80, 0, 0); _twNtn463.BackgroundTransparency = 1
local function CreateWinBtn(_bGacx359, order, callback)
    local _SuPeu234 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _twNtn463)
    _SuPeu234.Size = UDim2.new(0, 40, 1, 0)
    _SuPeu234.Position = UDim2.new(0, (order-1)*40, 0, 0)
    _SuPeu234.BackgroundTransparency = 1
    _SuPeu234.Text = _bGacx359
    RegisterTheme(_SuPeu234, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
    _SuPeu234.Font = Enum.Font.GothamMedium
    _SuPeu234.TextSize = 16
    _SuPeu234.MouseEnter:Connect(function() _SuPeu234.TextColor3 = _znjmN83.Text end)
    _SuPeu234.MouseLeave:Connect(function() _SuPeu234.TextColor3 = _znjmN83.TextDim end)
    _SuPeu234.MouseButton1Click:Connect(callback)
end
CreateWinBtn("\045", 1, function() _IJbPu805.Visible = false end)
CreateWinBtn("\088", 2, function() _OyOeY313:Destroy() end)
local _MQfWe927 = Instance.new("\070\114\097\109\101", _IJbPu805)
_MQfWe927.Size = UDim2.new(1, 0, 0, 1)
_MQfWe927.Position = UDim2.new(0, 0, 0, 40)
RegisterTheme(_MQfWe927, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\083\116\114\111\107\101")
_MQfWe927.BorderSizePixel = 0
local _fMhpP582 = 160
local Sidebar = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _IJbPu805)
Sidebar.Size = UDim2.new(0, _fMhpP582, 1, -41)
Sidebar.Position = UDim2.new(0, 0, 0, 41)
RegisterTheme(Sidebar, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\083\105\100\101\098\097\114")
Sidebar.BackgroundTransparency = 0.5
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 2
local _UlhDl895 = Instance.new("\085\073\080\097\100\100\105\110\103", Sidebar); _UlhDl895.PaddingTop = UDim.new(0, 10)
local _HliVg767 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", Sidebar); _HliVg767.Padding = UDim.new(0, 5); _HliVg767.HorizontalAlignment = Enum.HorizontalAlignment.Center
local _BdXeW407 = Instance.new("\070\114\097\109\101", _IJbPu805)
_BdXeW407.Size = UDim2.new(1, -_fMhpP582, 1, -41)
_BdXeW407.Position = UDim2.new(0, _fMhpP582, 0, 41)
_BdXeW407.BackgroundTransparency = 1
_BdXeW407.ClipsDescendants = true
local function CreateTab(Name, IconText)
    local _jecUi494 = Instance.new("\084\101\120\116\066\117\116\116\111\110", Sidebar)
    _jecUi494.Size = UDim2.new(1, 0, 0, 45) 
    _jecUi494.BackgroundTransparency = 1
    _jecUi494.Text = ""
    local _zfVdx490 = Instance.new("\070\114\097\109\101", _jecUi494)
    RegisterTheme(_zfVdx490, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\065\099\099\101\110\116")
    _zfVdx490.Size = UDim2.new(0, 4, 0.6, 0) 
    _zfVdx490.Position = UDim2.new(0, 0, 0.2, 0)
    _zfVdx490.Visible = false
    Instance.new("\085\073\067\111\114\110\101\114", _zfVdx490).CornerRadius = UDim.new(0, 2)
    local _YDckL844 = Instance.new("\084\101\120\116\076\097\098\101\108", _jecUi494)
    _YDckL844.Text = IconText or "•"
    _YDckL844.Size = UDim2.new(0, 30, 1, 0)
    _YDckL844.Position = UDim2.new(0, 15, 0, 0)
    _YDckL844.BackgroundTransparency = 1
    RegisterTheme(_YDckL844, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
    _YDckL844.Font = Enum.Font.GothamMedium
    _YDckL844.TextSize = 18
    local _soYIx315 = Instance.new("\084\101\120\116\076\097\098\101\108", _jecUi494)
    _soYIx315.Text = Name
    _soYIx315.Size = UDim2.new(0, 100, 1, 0)
    _soYIx315.Position = UDim2.new(0, 50, 0, 0)
    _soYIx315.BackgroundTransparency = 1
    RegisterTheme(_soYIx315, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
    _soYIx315.Font = Enum.Font.GothamBold
    _soYIx315.TextSize = 14
    _soYIx315.TextXAlignment = Enum.TextXAlignment.Left
    local _UnFof410 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _BdXeW407)
    _UnFof410.Size = UDim2.new(1, 0, 1, 0)
    _UnFof410.BackgroundTransparency = 1
    _UnFof410.Visible = false
    _UnFof410.ScrollBarThickness = 4
    _UnFof410.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local _SGRlN966 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _UnFof410); _SGRlN966.Padding = UDim.new(0, 10); _SGRlN966.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local _FRHKt325 = Instance.new("\085\073\080\097\100\100\105\110\103", _UnFof410); _FRHKt325.PaddingTop = UDim.new(0, 20); _FRHKt325.PaddingBottom = UDim.new(0, 20)
    _jecUi494.MouseButton1Click:Connect(function()
        for _, _Kschh846 in pairs(Sidebar:GetChildren()) do
            if _Kschh846:IsA("\084\101\120\116\066\117\116\116\111\110") then
                local _StrPL905 = _Kschh846:FindFirstChild("\070\114\097\109\101")
                local _Pvjun559 = _Kschh846:FindFirstChild("\084\101\120\116\076\097\098\101\108")
                local _YzsQX596 = _Kschh846:GetChildren()[3] 
                if _StrPL905 then _StrPL905.Visible = false end
                if _Pvjun559 then _Pvjun559.TextColor3 = _znjmN83.TextDim end
                if _YzsQX596 then _YzsQX596.TextColor3 = _znjmN83.TextDim end
                _Kschh846.BackgroundTransparency = 1
            end
        end
        for _, _Kschh846 in pairs(_BdXeW407:GetChildren()) do if _Kschh846:IsA("\083\099\114\111\108\108\105\110\103\070\114\097\109\101") then _Kschh846.Visible = false end end
        _zfVdx490.Visible = true
        _YDckL844.TextColor3 = _znjmN83.Text 
        _soYIx315.TextColor3 = _znjmN83.Text
        _jecUi494.BackgroundColor3 = _znjmN83.ElementBG
        _jecUi494.BackgroundTransparency = 0.95
        _UnFof410.Visible = true
    end)
    return _UnFof410
end
local function CreateToggle(_UnFof410, Text, Callback, DefaultState)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 50)
    RegisterTheme(_YbwVC250, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
    _YbwVC250.BackgroundTransparency = 1 
    local _uMZuD838 = Instance.new("\070\114\097\109\101", _YbwVC250)
    _uMZuD838.Size = UDim2.new(1, 0, 0, 1); _uMZuD838.Position = UDim2.new(0,0,1,0); 
    RegisterTheme(_uMZuD838, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071"); _uMZuD838.BorderSizePixel = 0
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _IJOez494.Size = UDim2.new(0.7, 0, 1, 0)
    _IJOez494.Position = UDim2.new(0, 10, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 14
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    _IJOez494.Text = Text 
    local _oTsrZ674 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _YbwVC250)
    _oTsrZ674.Size = UDim2.new(1, 0, 1, 0)
    _oTsrZ674.BackgroundTransparency = 1
    _oTsrZ674.Text = ""
    local _OMPOl167 = Instance.new("\070\114\097\109\101", _YbwVC250)
    _OMPOl167.Size = UDim2.new(0, 44, 0, 24)
    _OMPOl167.Position = UDim2.new(1, -54, 0.5, -12)
    RegisterTheme(_OMPOl167, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
    Instance.new("\085\073\067\111\114\110\101\114", _OMPOl167).CornerRadius = UDim.new(1, 0)
    local _eipak772 = Instance.new("\070\114\097\109\101", _OMPOl167)
    _eipak772.Size = UDim2.new(0, 18, 0, 18)
    _eipak772.Position = UDim2.new(0, 3, 0.5, -9)
    RegisterTheme(_eipak772, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
    Instance.new("\085\073\067\111\114\110\101\114", _eipak772).CornerRadius = UDim.new(1, 0)
    local _jpKUp680 = DefaultState or false
    local function Update(_SZAaR494) 
        _jpKUp680 = _SZAaR494
        Callback(_jpKUp680)
        if _jpKUp680 then 
            TweenService:Create(_OMPOl167, TweenInfo.new(0.2), {BackgroundColor3 = _znjmN83.Accent}):Play()
            TweenService:Create(_eipak772, TweenInfo.new(0.2), {Position = UDim2.new(1, -21, 0.5, -9), BackgroundColor3 = Color3.new(1,1,1)}):Play()
            ShowToast(Text .. "\058\032\079\078")
        else 
            TweenService:Create(_OMPOl167, TweenInfo.new(0.2), {BackgroundColor3 = _znjmN83.ElementBG}):Play()
            TweenService:Create(_eipak772, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -9), BackgroundColor3 = _znjmN83.TextDim}):Play()
            ShowToast(Text .. "\058\032\079\070\070")
        end 
        UpdateActiveList(Text, _jpKUp680)
    end
    _oTsrZ674.MouseButton1Click:Connect(function() Update(not _jpKUp680) end)
    _plMZj882[Text] = Update 
    return Update
end
local function C(_bGacx359, r, g, b)
    return "\060\102\111\110\116\032\099\111\108\111\114\061\034\114\103\098\040" .. r .. "\044" .. g .. "\044" .. b .. "\041\034\062" .. _bGacx359 .. "\060\047\102\111\110\116\062"
end
local function CreateLabel(_UnFof410, Text)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 30)
    _YbwVC250.BackgroundTransparency = 1
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _IJOez494.Size = UDim2.new(1, -10, 1, 0)
    _IJOez494.Position = UDim2.new(0, 5, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    _IJOez494.RichText = true 
    _IJOez494.Text = Text
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 13
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    _IJOez494.TextWrapped = true
    return _IJOez494
end
local function CreateInput(_UnFof410, Text, Placeholder, Callback, IsString)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 50)
    _YbwVC250.BackgroundTransparency = 1
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _IJOez494.Text = Text 
    _IJOez494.Size = UDim2.new(1, 0, 0, 20)
    _IJOez494.Position = UDim2.new(0, 5, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 12
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    local _tVBrz290 = Instance.new("\070\114\097\109\101", _YbwVC250)
    _tVBrz290.Size = UDim2.new(1, 0, 0, 30)
    _tVBrz290.Position = UDim2.new(0, 0, 0, 20)
    RegisterTheme(_tVBrz290, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
    _tVBrz290.ClipsDescendants = true 
    Instance.new("\085\073\067\111\114\110\101\114", _tVBrz290).CornerRadius = UDim.new(0, 6)
    local Stroke = Instance.new("\085\073\083\116\114\111\107\101", _tVBrz290)
    Stroke.Thickness = 1
    RegisterTheme(Stroke, "\067\111\108\111\114", "\083\116\114\111\107\101")
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local _idMed682 = Instance.new("\084\101\120\116\066\111\120", _tVBrz290)
    _idMed682.Size = UDim2.new(1, -10, 1, 0)
    _idMed682.Position = UDim2.new(0, 5, 0, 0)
    _idMed682.BackgroundTransparency = 1
    _idMed682.Text = ""
    _idMed682.PlaceholderText = tostring(Placeholder)
    RegisterTheme(_idMed682, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
    RegisterTheme(_idMed682, "\080\108\097\099\101\104\111\108\100\101\114\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
    _idMed682.Font = Enum.Font.GothamMedium
    _idMed682.TextSize = 13
    _idMed682.TextXAlignment = Enum.TextXAlignment.Left
    _idMed682.ClearTextOnFocus = false
    _idMed682.Focused:Connect(function()
        TweenService:Create(Stroke, TweenInfo.new(0.2), {Color = _znjmN83.Accent}):Play()
    end)
    _idMed682.FocusLost:Connect(function(enter)
        TweenService:Create(Stroke, TweenInfo.new(0.2), {Color = _znjmN83.Stroke}):Play()
        if IsString then 
            Callback(_idMed682.Text) 
        else 
            local _LhSfw335 = tonumber(_idMed682.Text)
            if _LhSfw335 then Callback(_LhSfw335) else _idMed682.Text = "" end 
        end 
    end)
    return _idMed682
end
local function CreateButton(_UnFof410, Text, Callback)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 45)
    _YbwVC250.BackgroundTransparency = 1
    local _jecUi494 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _YbwVC250)
    _jecUi494.Size = UDim2.new(1, 0, 1, 0)
    RegisterTheme(_jecUi494, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
    _jecUi494.Text = Text 
    RegisterTheme(_jecUi494, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
    _jecUi494.Font = Enum.Font.GothamBold
    _jecUi494.TextSize = 14
    Instance.new("\085\073\067\111\114\110\101\114", _jecUi494).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("\085\073\083\116\114\111\107\101", _jecUi494); RegisterTheme(Stroke, "\067\111\108\111\114", "\083\116\114\111\107\101"); Stroke.Thickness = 1
    _jecUi494.MouseButton1Click:Connect(function() 
        TweenService:Create(_jecUi494, TweenInfo.new(0.1), {BackgroundColor3 = _znjmN83.Accent, TextColor3 = _znjmN83.Background}):Play()
        task.wait(0.1)
        TweenService:Create(_jecUi494, TweenInfo.new(0.2), {BackgroundColor3 = _znjmN83.ElementBG, TextColor3 = _znjmN83.Accent}):Play()
        Callback() 
    end)
    return _jecUi494
end
local function CreateSlider(_UnFof410, Text, Min, Max, Default, Callback)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 60)
    RegisterTheme(_YbwVC250, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
    Instance.new("\085\073\067\111\114\110\101\114", _YbwVC250).CornerRadius = UDim.new(0, 8)
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _IJOez494.Text = Text
    _IJOez494.Size = UDim2.new(0.5, 0, 0, 30)
    _IJOez494.Position = UDim2.new(0, 15, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 14
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    local _WMHEb367 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _WMHEb367.Text = tostring(Default)
    _WMHEb367.Size = UDim2.new(0.2, 0, 0, 30)
    _WMHEb367.Position = UDim2.new(0.75, 0, 0, 0)
    _WMHEb367.BackgroundTransparency = 1
    RegisterTheme(_WMHEb367, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
    _WMHEb367.Font = Enum.Font.Code
    _WMHEb367.TextSize = 14
    _WMHEb367.TextXAlignment = Enum.TextXAlignment.Right
    local _cyETP370 = Instance.new("\070\114\097\109\101", _YbwVC250)
    _cyETP370.Size = UDim2.new(0.9, 0, 0, 6)
    _cyETP370.Position = UDim2.new(0.05, 0, 0.65, 0)
    RegisterTheme(_cyETP370, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
    Instance.new("\085\073\067\111\114\110\101\114", _cyETP370).CornerRadius = UDim.new(1, 0)
    local _zVRoE897 = Instance.new("\070\114\097\109\101", _cyETP370)
    _zVRoE897.Size = UDim2.new(0, 0, 1, 0)
    RegisterTheme(_zVRoE897, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\065\099\099\101\110\116")
    Instance.new("\085\073\067\111\114\110\101\114", _zVRoE897).CornerRadius = UDim.new(1, 0)
    local _BIAFI201 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _cyETP370)
    _BIAFI201.Size = UDim2.new(1, 0, 1, 0); _BIAFI201.BackgroundTransparency = 1; _BIAFI201.Text = ""
    local function Set(val)
        local _SHtQk571 = math.clamp((val - Min) / (Max - Min), 0, 1)
        _zVRoE897.Size = UDim2.new(_SHtQk571, 0, 1, 0)
        _WMHEb367.Text = tostring(math.floor(val))
        Callback(val)
    end
    Set(Default)
    local _LVprM534 = false
    _BIAFI201.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then _LVprM534 = true end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then _LVprM534 = false end end)
    UserInputService.InputChanged:Connect(function(input)
        if _LVprM534 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local _ZMlOZ577 = input.Position.X; local _kQxLP421 = _cyETP370.AbsoluteSize.X; local _vHGup911 = _cyETP370.AbsolutePosition.X
            local _SHtQk571 = math.clamp((_ZMlOZ577 - _vHGup911) / _kQxLP421, 0, 1)
            Set(Min + (Max - Min) * _SHtQk571)
        end
    end)
end
local function CreateDropdown(_UnFof410, Text, Options, Default, Callback)
    local _YbwVC250 = Instance.new("\070\114\097\109\101", _UnFof410)
    _YbwVC250.Size = UDim2.new(0.95, 0, 0, 50)
    RegisterTheme(_YbwVC250, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
    _YbwVC250.ZIndex = 5 
    Instance.new("\085\073\067\111\114\110\101\114", _YbwVC250).CornerRadius = UDim.new(0, 8)
    local _IJOez494 = Instance.new("\084\101\120\116\076\097\098\101\108", _YbwVC250)
    _IJOez494.Text = Text
    _IJOez494.Size = UDim2.new(0.4, 0, 1, 0)
    _IJOez494.Position = UDim2.new(0, 15, 0, 0)
    _IJOez494.BackgroundTransparency = 1
    RegisterTheme(_IJOez494, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
    _IJOez494.Font = Enum.Font.GothamBold
    _IJOez494.TextSize = 14
    _IJOez494.TextXAlignment = Enum.TextXAlignment.Left
    _IJOez494.ZIndex = 10 
    local _JrAym259 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _YbwVC250)
    _JrAym259.Size = UDim2.new(0, 140, 0, 30)
    _JrAym259.Position = UDim2.new(1, -150, 0.5, -15)
    RegisterTheme(_JrAym259, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
    _JrAym259.Text = Default .. "\032\032▼"
    RegisterTheme(_JrAym259, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
    _JrAym259.Font = Enum.Font.GothamBold
    _JrAym259.TextSize = 12
    _JrAym259.ZIndex = 20 
    Instance.new("\085\073\067\111\114\110\101\114", _JrAym259).CornerRadius = UDim.new(0, 6)
    local _mUUBo657 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _YbwVC250) 
    _mUUBo657.Name = "\068\114\111\112\100\111\119\110\076\105\115\116"
    _mUUBo657.Size = UDim2.new(0, 140, 0, 0)
    _mUUBo657.Position = UDim2.new(1, -150, 0.5, 20)
    RegisterTheme(_mUUBo657, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
    _mUUBo657.Visible = false
    _mUUBo657.ZIndex = 30 
    _mUUBo657.ClipsDescendants = true
    _mUUBo657.BorderSizePixel = 0
    _mUUBo657.ScrollBarThickness = 4
    RegisterTheme(_mUUBo657, "\083\099\114\111\108\108\066\097\114\073\109\097\103\101\067\111\108\111\114\051", "\065\099\099\101\110\116")
    _mUUBo657.AutomaticCanvasSize = Enum.AutomaticSize.Y 
    _mUUBo657.CanvasSize = UDim2.new(0,0,0,0)
    Instance.new("\085\073\067\111\114\110\101\114", _mUUBo657).CornerRadius = UDim.new(0, 6)
    local _dGgZH892 = Instance.new("\085\073\083\116\114\111\107\101", _mUUBo657); RegisterTheme(_dGgZH892, "\067\111\108\111\114", "\083\116\114\111\107\101"); _dGgZH892.Thickness = 1
    local _abCUG36 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _mUUBo657); 
    _abCUG36.SortOrder = Enum.SortOrder.LayoutOrder; 
    _abCUG36.Padding = UDim.new(0, 2)
    local _zmKXf463 = Instance.new("\085\073\080\097\100\100\105\110\103", _mUUBo657)
    _zmKXf463.PaddingTop = UDim.new(0, 5)
    _zmKXf463.PaddingLeft = UDim.new(0, 5)
    local _seSNw334 = false
    _JrAym259.MouseButton1Click:Connect(function()
        _seSNw334 = not _seSNw334
        if _seSNw334 then
            _mUUBo657.Visible = true
            local _mUWYB798 = #Options * 30 + 10 
            local _rRNlo639 = math.min(_mUWYB798, 160) 
            TweenService:Create(_mUUBo657, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 140, 0, _rRNlo639)}):Play()
            _JrAym259.Text = _JrAym259.Text:gsub("▼", "▲")
        else
            local _aHPZe58 = TweenService:Create(_mUUBo657, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 140, 0, 0)})
            _aHPZe58:Play()
            _aHPZe58.Completed:Connect(function() if not _seSNw334 then _mUUBo657.Visible = false end end)
            _JrAym259.Text = _JrAym259.Text:gsub("▲", "▼")
        end
    end)
    for _, opt in ipairs(Options) do
        local _HNzBi300 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _mUUBo657)
        _HNzBi300.Size = UDim2.new(1, -10, 0, 28)
        _HNzBi300.BackgroundTransparency = 1
        _HNzBi300.Text = opt
        RegisterTheme(_HNzBi300, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109")
        _HNzBi300.Font = Enum.Font.GothamMedium
        _HNzBi300.TextSize = 12
        _HNzBi300.ZIndex = 31
        _HNzBi300.MouseButton1Click:Connect(function()
            _JrAym259.Text = opt .. "\032\032▼"
            Callback(opt)
            _seSNw334 = false
            local _aHPZe58 = TweenService:Create(_mUUBo657, TweenInfo.new(0.2), {Size = UDim2.new(0, 140, 0, 0)})
            _aHPZe58:Play()
            _aHPZe58.Completed:Connect(function() if not _seSNw334 then _mUUBo657.Visible = false end end)
        end)
    end
end
local _FPOrW722 = CreateTab("\077\097\105\110", "🏠"); 
local _kXtKh860 = CreateTab("\065\110\116\097\114\099\116\105\099\097", "❄️")
local _xGLzb379 = CreateTab("\086\105\115\117\097\108\115", "👁️"); 
local _ehvuv59 = CreateTab("\067\097\109\101\114\097", "📷"); 
local _fNlix938 = CreateTab("\084\101\108\101\112\111\114\116", "🚀"); 
local _qhGcf930 = CreateTab("\087\111\114\108\100", "🌍"); 
local _XKZqt176 = CreateTab("\077\105\115\099", "⚙️"); 
local _aYgfO437 = CreateTab("\065\098\111\117\116", "ℹ️")
do
CreateToggle(_kXtKh860, "\065\117\116\111\032\083\117\109\109\105\116\032\091\066\069\084\065\093", function(_Kschh846)
    _lxAau354.AutoBadge = _Kschh846
    if _Kschh846 then
        task.spawn(function()
            while _lxAau354.AutoBadge do
                if LocalPlayer.Character then
                    for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                        if p:IsA("\066\097\115\101\080\097\114\116") then p.CanCollide = false end
                    end
                end
                task.wait(0.1)
            end
        end)
        StartAutoFarm()
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
        ShowToast("\065\117\116\111\032\070\097\114\109\032\083\116\111\112\112\101\100\046")
    end
end)
CreateToggle(_kXtKh860, "\065\117\116\111\032\083\117\109\109\105\116\032\086\050\032\040\073\110\102\105\110\105\116\101\041", function(_Kschh846)
    _lxAau354.AutoSummitV2 = _Kschh846
    if _Kschh846 then
        StartSummitV2()
        ShowToast("\083\117\109\109\105\116\032\086\050\058\032\083\084\065\082\084\032\076\079\079\080")
    else
        ShowToast("\083\117\109\109\105\116\032\086\050\058\032\083\084\079\080\080\073\078\071\046\046\046")
    end
end)
CreateToggle(_kXtKh860, "🛡️\032\065\110\116\105\032\070\097\108\108\032\068\097\109\097\103\101", function(_Kschh846)
        _lxAau354.AntiFall = _Kschh846
        if _Kschh846 then
            ShowToast("\065\110\116\105\032\070\097\108\108\058\032\079\078")
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end
            ShowToast("\065\110\116\105\032\070\097\108\108\058\032\079\070\070")
        end
    end)
CreateSlider(_kXtKh860, "\070\097\114\109\032\083\112\101\101\100", 16, 50, 25, function(_Kschh846)
        _GigZv195.Speed = _Kschh846
    end)
CreateToggle(_FPOrW722, "\073\110\102\105\110\105\116\101\032\074\117\109\112\032\040\083\104\105\102\116\043\074\041", function(_Kschh846) _lxAau354.InfiniteJump = _Kschh846 end)
local _PQwUr302 = C("\075\101\121\098\105\110\100\032\087\111\114\107\032\079\110\032", 255, 0, 0) .. C("\075\101\121\098\111\097\114\100\032\038\032\077\111\117\115\101", 0, 255, 28)
CreateLabel(_FPOrW722, _PQwUr302)
CreateToggle(_FPOrW722, "\066\104\111\112\032\065\117\116\111\032\040\066\117\110\110\121\032\072\111\112\041", function(_Kschh846) _lxAau354.Bhop = _Kschh846 end) 
CreateToggle(_FPOrW722, "\078\111\099\108\105\112", function(_Kschh846) _lxAau354.Noclip = _Kschh846 end)
CreateToggle(_FPOrW722, "\070\108\121", function(_Kschh846) _lxAau354.Fly = _Kschh846; if _Kschh846 then StartFly() else StopFly() end end)
CreateToggle(_FPOrW722, "\070\108\121\032\086\101\104\105\099\108\101\032\040\067\097\114\047\066\105\107\101\041", function(_Kschh846) 
    _lxAau354.FlyVehicle = _Kschh846
    if _Kschh846 then 
        StartVehicleFly()
        ShowToast("\086\101\104\105\099\108\101\032\070\108\121\058\032\079\078")
    else
        local _ARHwe269 = LocalPlayer.Character
        if _ARHwe269 then
            for _, d in pairs(_ARHwe269:GetDescendants()) do
                if d.Name == "\086\070\108\121\086" or d.Name == "\086\070\108\121\071" then d:Destroy() end
            end
        end
        ShowToast("\086\101\104\105\099\108\101\032\070\108\121\058\032\079\070\070")
    end
end)
local _paLWx861 = CreateInput(_FPOrW722, "\083\101\116\032\087\097\108\107\032\083\112\101\101\100", _lxAau354.WalkSpeed, function(_Kschh846)
    _lxAau354.WalkSpeed = _Kschh846
end)
local _cajwH570 = CreateInput(_FPOrW722, "\083\101\116\032\074\117\109\112\032\080\111\119\101\114", _lxAau354.JumpPower, function(_Kschh846)
    _lxAau354.JumpPower = _Kschh846
end)
CreateToggle(_FPOrW722, "\069\110\097\098\108\101\032\083\112\101\101\100\047\074\117\109\112\032\076\111\111\112", function(_Kschh846)
    _lxAau354.LoopSpeed = _Kschh846 
    if _Kschh846 then 
        ShowToast("\083\112\101\101\100\032\076\111\111\112\058\032\065\067\084\073\086\065\084\069\068")
    else 
        ShowToast("\083\112\101\101\100\032\076\111\111\112\058\032\068\073\083\065\066\076\069\068") 
    end
end)
CreateButton(_FPOrW722, "\082\101\115\101\116\032\116\111\032\077\097\112\032\068\101\102\097\117\108\116", function()
    _lxAau354.LoopSpeed = false
    _lxAau354.WalkSpeed = _EITgY164
    _lxAau354.JumpPower = _flWOE54
    if _paLWx861 then _paLWx861.Text = tostring(_EITgY164) end
    if _cajwH570 then _cajwH570.Text = tostring(_flWOE54) end
    if LocalPlayer.Character then
        local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
        if _cOPpa623 then
            _cOPpa623.WalkSpeed = _EITgY164
            if _cOPpa623.UseJumpPower then 
                _cOPpa623.JumpPower = _flWOE54 
            else 
                _cOPpa623.JumpHeight = _flWOE54 
            end
        end
    end
    ShowToast("\082\101\115\116\111\114\101\100\032\077\097\112\032\068\101\102\097\117\108\116\058\032" .. _EITgY164 .. "\032\047\032" .. _flWOE54)
end)
CreateButton(_FPOrW722, "\082\101\115\112\097\119\110\032\038\032\082\101\116\117\114\110", function()
    if LocalPlayer.Character then local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100"); local _ZtLLU592 = GetVisualPart(LocalPlayer.Character)
    if _cOPpa623 and _cOPpa623.Health > 0 and _ZtLLU592 then _lxAau354.LastPos = _ZtLLU592.CFrame; _lxAau354.IsRespawning = true; _cOPpa623.Health = 0; ShowToast("\082\101\115\112\097\119\110\105\110\103\046\046\046\032\087\097\105\116\046") end end
end)
end
do
CreateToggle(_xGLzb379, "\069\083\080\032\080\108\097\121\101\114\032\040\083\109\097\114\116\041", function(_Kschh846) _lxAau354.MasterESP = _Kschh846 end)
CreateToggle(_xGLzb379, "\080\114\111\120\105\109\105\116\121\032\087\097\114\110\105\110\103", function(_Kschh846) _lxAau354.ProximityWarning = _Kschh846 end)
CreateDropdown(_xGLzb379, "\087\097\114\110\105\110\103\032\077\111\100\101", {"\065\108\108\032\080\108\097\121\101\114\115", "\069\110\101\109\121\032\079\110\108\121"}, "\065\108\108\032\080\108\097\121\101\114\115", function(_Kschh846) _lxAau354.ProximityMode = _Kschh846 end)
CreateSlider(_xGLzb379, "\087\097\114\110\105\110\103\032\068\105\115\116\097\110\099\101", 10, 200, 50, function(_Kschh846) _lxAau354.ProximityDist = _Kschh846 end)
end
CreateToggle(_ehvuv59, "\070\114\101\101\099\097\109\032\040\083\104\105\102\116\043\080\041", ToggleFreecam)
CreateInput(_ehvuv59, "\068\114\111\110\101\032\083\112\101\101\100", 1, function(_Kschh846) _lxAau354.FreecamSpeed = _Kschh846 end)
CreateButton(_ehvuv59, "\082\101\115\101\116\032\067\097\109\101\114\097", function() ToggleFreecam(false); _lxAau354.Freecam = false; Camera.CameraType = Enum.CameraType.Custom end)
CreateToggle(_ehvuv59, "\077\097\120\032\090\111\111\109\032\049\048\048\048", function(_Kschh846) 
    _lxAau354.MaxZoom = _Kschh846 
    if _Kschh846 then LocalPlayer.CameraMaxZoomDistance = 1000 end
end)
CreateSlider(_ehvuv59, "\070\105\101\108\100\032\111\102\032\086\105\101\119\032\040\070\079\086\041", 30, 120, 70, function(_Kschh846) Camera.FieldOfView = _Kschh846 end)
CreateDropdown(_ehvuv59, "\086\105\101\119\032\077\111\100\101", {"\068\101\102\097\117\108\116", "\070\105\114\115\116\032\080\101\114\115\111\110", "\084\104\105\114\100\032\080\101\114\115\111\110"}, "\068\101\102\097\117\108\116", function(_Kschh846) 
    if _Kschh846 == "\070\105\114\115\116\032\080\101\114\115\111\110" then
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    elseif _Kschh846 == "\084\104\105\114\100\032\080\101\114\115\111\110" then
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = 10
        LocalPlayer.CameraMaxZoomDistance = 100
    else
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = 0.5
        LocalPlayer.CameraMaxZoomDistance = 400
    end
end)
do
local _MuwFK785 = {
    ["\066\097\115\101\099\097\109\112"] = Vector3.new(-6068, -139, -37), 
    ["\084\105\109\032\083\038\082\032\066\097\115\101\099\097\109\112"] = Vector3.new(-6058, -154, -109),
    ["\067\104\101\099\107\112\111\105\110\116\032\049"] = Vector3.new(-3720, 224, 236),
    ["\084\105\109\032\083\038\082\032\067\080\032\049"] = Vector3.new(-3640, 243, 390),
    ["\067\104\101\099\107\112\111\105\110\116\032\050"] = Vector3.new(1789, 105, -138), 
    ["\084\105\109\032\083\038\082\032\067\080\032\050"] = Vector3.new(1751, 119, 43),
    ["\077\111\117\110\116\032\086\105\110\115\111\110"] = Vector3.new(3727, 1508, -178),
    ["\067\104\101\099\107\112\111\105\110\116\032\051"] = Vector3.new(5892, 321, -20),
    ["\084\105\109\032\083\038\082\032\067\080\032\051"] = Vector3.new(5853, 327, -218),
    ["\067\104\101\099\107\112\111\105\110\116\032\052"] = Vector3.new(8992, 595, 103),
    ["\083\111\117\116\104\032\080\111\108\101\032\045\032\083\117\109\109\105\116"] = Vector3.new(10996, 549, 113),
}
local _wzqtV924 = {}
for k, _Kschh846 in pairs(_MuwFK785) do
    table.insert(_wzqtV924, k)
end
table.sort(_wzqtV924)
CreateDropdown(_kXtKh860, "\084\101\108\101\112\111\114\116\032\067\104\101\099\107\112\111\105\110\116\115", _wzqtV924, "\083\101\108\101\099\116\046\046\046", function(selectedName)
    local _oNbnm623 = _MuwFK785[selectedName]
    if _oNbnm623 then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_oNbnm623 + Vector3.new(0, 10, 0))
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            ShowToast("\084\101\108\101\112\111\114\116\101\100\032\116\111\058\032" .. selectedName)
        else
            ShowToast("\069\114\114\111\114\058\032\067\104\097\114\097\099\116\101\114\032\110\111\116\032\114\101\097\100\121\033")
        end
    end
end)
CreateButton(_fNlix938, "\067\111\112\121\032\067\117\114\114\101\110\116\032\080\111\115\105\116\105\111\110\032\040\088\089\090\041", function()
    local _ARHwe269 = LocalPlayer.Character
    local _ZtLLU592 = _ARHwe269 and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    if _ZtLLU592 then
        local _ZMlOZ577 = _ZtLLU592.Position
        local _vbrXy759 = math.floor(_ZMlOZ577.X)
        local _IwFbf581 = math.floor(_ZMlOZ577.Y)
        local _vXjNU126 = math.floor(_ZMlOZ577.Z)
        local _aLonM953 = _vbrXy759 .. "\044\032" .. _IwFbf581 .. "\044\032" .. _vXjNU126
        setclipboard(_aLonM953)
        ShowToast("\067\111\112\105\101\100\058\032" .. _aLonM953)
    else
        ShowToast("\069\114\114\111\114\058\032\067\104\097\114\097\099\116\101\114\032\110\111\116\032\102\111\117\110\100\033")
    end
end)
CreateInput(_fNlix938, "\084\101\108\101\112\111\114\116\032\116\111\032\040\088\044\032\089\044\032\090\041", "\069\120\097\109\112\108\101\058\032\049\048\048\044\032\053\048\044\032\045\050\048\048", function(_bGacx359)
    _bGacx359 = _bGacx359:gsub("\032", "")
    local _vbrXy759, _IwFbf581, _vXjNU126 = _bGacx359:match("\040\091\094\044\093\043\041\044\040\091\094\044\093\043\041\044\040\091\094\044\093\043\041")
    if _vbrXy759 and _IwFbf581 and _vXjNU126 then
        local _ARHwe269 = LocalPlayer.Character
        local _ZtLLU592 = _ARHwe269 and _ARHwe269:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
        if _ZtLLU592 then
            _ZtLLU592.CFrame = CFrame.new(tonumber(_vbrXy759), tonumber(_IwFbf581), tonumber(_vXjNU126))
            ShowToast("\084\101\108\101\112\111\114\116\101\100\032\116\111\032\067\117\115\116\111\109\032\067\111\111\114\100\115\033")
        end
    else
        ShowToast("\070\111\114\109\097\116\032\083\097\108\097\104\033\032\071\117\110\097\107\097\110\058\032\088\044\032\089\044\032\090")
    end
end, true)
CreateToggle(_fNlix938, "\067\084\082\076\032\043\032\067\108\105\099\107\032\084\080", function(_Kschh846) _lxAau354.ClickTP = _Kschh846 end)
CreateButton(_fNlix938, "\070\111\114\099\101\032\082\101\102\114\101\115\104\032\076\105\115\116", RefreshList)
local _Ryidc632 = Instance.new("\084\101\120\116\076\097\098\101\108", _fNlix938); _Ryidc632.Text = "\083\069\082\086\069\082\032\072\079\080\080\069\082"; _Ryidc632.Size = UDim2.new(0.95, 0, 0, 25); _Ryidc632.BackgroundTransparency = 1; RegisterTheme(_Ryidc632, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _Ryidc632.Font = Enum.Font.GothamBold; _Ryidc632.TextSize = 14
CreateButton(_fNlix938, "\082\101\106\111\105\110\032\083\101\114\118\101\114\032\040\082\101\116\114\121\041", RejoinServer)
CreateButton(_fNlix938, "\074\111\105\110\032\076\111\119\101\115\116\032\083\101\114\118\101\114", JoinLowestServer)
CreateInput(_fNlix938, "\074\111\105\110\032\074\111\098\032\073\068", "\080\097\115\116\101\032\073\068\032\072\101\114\101", function(id) _lxAau354.TargetJobId = id end, true)
CreateButton(_fNlix938, "\074\111\105\110\032\074\111\098\032\073\068", JoinJobId)
CreateButton(_fNlix938, "\083\116\111\112\032\083\112\101\099\116\097\116\105\110\103\032\047\032\082\101\115\101\116\032\067\097\109", function()
    _lxAau354.SpectatingPlayer = nil
    _lxAau354.CinematicCamera = false 
    Camera.CameraType = Enum.CameraType.Custom
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
        Camera.CameraSubject = LocalPlayer.Character.Humanoid
    end
    ShowToast("\083\112\101\099\116\097\116\105\110\103\032\083\116\111\112\112\101\100")
end)
local _mXALs478 = "" 
local _YheQo544 = CreateInput(_fNlix938, "\083\101\097\114\099\104\032\080\108\097\121\101\114", "\084\121\112\101\032\078\097\109\101\046\046\046", function(val)
    _mXALs478 = string.lower(val)
    RefreshList()
end, true)
_YheQo544:GetPropertyChangedSignal("\084\101\120\116"):Connect(function()
    _mXALs478 = string.lower(_YheQo544.Text) 
    RefreshList() 
end)
local _aNhDI861 = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101", _fNlix938)
_aNhDI861.Size = UDim2.new(0.95, 0, 1, -120) 
_aNhDI861.Position = UDim2.new(0, 10, 0, 110) 
RegisterTheme(_aNhDI861, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100")
_aNhDI861.BackgroundTransparency = 0.5
_aNhDI861.ScrollBarThickness = 2
_aNhDI861.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("\085\073\067\111\114\110\101\114", _aNhDI861).CornerRadius = UDim.new(0, 8)
local _yhxeD996 = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _aNhDI861)
_yhxeD996.Padding = UDim.new(0, 5)
RefreshList = function()
    for _,_Kschh846 in pairs(_aNhDI861:GetChildren()) do 
        if _Kschh846:IsA("\070\114\097\109\101") then _Kschh846:Destroy() end 
    end
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local _FXejE603 = string.lower(p.DisplayName) 
            local _PwQFX571 = string.lower(p.Name)
            if _mXALs478 == "" or string.find(_FXejE603, _mXALs478) or string.find(_PwQFX571, _mXALs478) then
                local _pJPtu231 = Instance.new("\070\114\097\109\101", _aNhDI861)
                _pJPtu231.Size = UDim2.new(1, 0, 0, 35)
                _pJPtu231.BackgroundTransparency = 1
                local _mfvfs982 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _pJPtu231)
                _mfvfs982.Size = UDim2.new(0.6, -5, 1, 0)
                RegisterTheme(_mfvfs982, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071")
                _mfvfs982.Text = "\084\080\058\032" .. p.DisplayName
                RegisterTheme(_mfvfs982, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
                _mfvfs982.Font = Enum.Font.GothamMedium
                _mfvfs982.TextSize = 12
                Instance.new("\085\073\067\111\114\110\101\114", _mfvfs982).CornerRadius = UDim.new(0, 6)
                local _idFNI439 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _pJPtu231)
                _idFNI439.Size = UDim2.new(0.4, -5, 1, 0)
                _idFNI439.Position = UDim2.new(0.6, 5, 0, 0)
                RegisterTheme(_idFNI439, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\083\105\100\101\098\097\114")
                _idFNI439.Text = "\083\112\101\099\116\097\116\101"
                RegisterTheme(_idFNI439, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116")
                _idFNI439.Font = Enum.Font.GothamBold
                _idFNI439.TextSize = 11
                Instance.new("\085\073\067\111\114\110\101\114", _idFNI439).CornerRadius = UDim.new(0, 6)
                _mfvfs982.MouseButton1Click:Connect(function() 
                    if p.Character and GetVisualPart(p.Character) then 
                        LocalPlayer.Character:MoveTo(GetVisualPart(p.Character).Position) 
                    else 
                        ShowToast("⚠️\032\080\108\097\121\101\114\032\116\111\111\032\102\097\114\032\047\032\078\111\116\032\082\101\110\100\101\114\101\100\033") 
                    end
                end)
                _idFNI439.MouseButton1Click:Connect(function() 
                    if p.Character and p.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
                        _lxAau354.SpectatingPlayer = p
                        ShowToast("\083\112\101\099\116\097\116\105\110\103\058\032" .. p.DisplayName)
                        pcall(function() LocalPlayer.ReplicationFocus = p.Character.PrimaryPart end)
                        if not _lxAau354.CinematicCamera then
                            Camera.CameraType = Enum.CameraType.Custom
                            Camera.CameraSubject = p.Character.Humanoid 
                        end
                    else 
                        ShowToast("⚠️\032\067\097\110\110\111\116\032\083\112\101\099\116\097\116\101") 
                    end 
                end)
            end
        end
    end
end
Players.PlayerAdded:Connect(function(p) task.wait(1); RefreshList(); ShowToast(p.DisplayName .. "\032\074\111\105\110\101\100\032\083\101\114\118\101\114") end)
Players.PlayerRemoving:Connect(function(p) task.wait(0.1); RefreshList(); ShowToast(p.DisplayName .. "\032\076\101\102\116\032\083\101\114\118\101\114") end)
task.spawn(RefreshList)
end
CreateToggle(_qhGcf930, "\070\117\108\108\098\114\105\103\104\116\032\076\111\111\112", function(_Kschh846) _lxAau354.FullbrightLoop = _Kschh846 end)
CreateToggle(_qhGcf930, "\078\111\032\070\111\103", function(_Kschh846) _lxAau354.NoFog = _Kschh846 end)
CreateToggle(_qhGcf930, "\078\111\032\080\097\114\116\105\099\108\101\115", function(_Kschh846) _lxAau354.NoParticles = _Kschh846 end)
CreateToggle(_qhGcf930, "\087\097\108\107\032\111\110\032\087\097\116\101\114", function(_Kschh846) _lxAau354.WalkOnWater = _Kschh846 end) 
CreateToggle(_qhGcf930, "\065\110\116\105\045\086\111\105\100\032\040\082\101\116\117\114\110\032\083\097\102\101\041", function(_Kschh846) _lxAau354.AntiVoid = _Kschh846 end) 
CreateInput(_qhGcf930, "\086\111\105\100\032\072\101\105\103\104\116\032\040\089\041", -50, function(_Kschh846) _lxAau354.VoidHeight = _Kschh846 end) 
CreateButton(_qhGcf930, "\066\111\111\115\116\032\070\080\083", BoostFPS)
CreateToggle(_qhGcf930, "\083\104\111\119\032\083\101\114\118\101\114\032\083\116\097\116\115", function(_Kschh846) _lxAau354.ShowStats = _Kschh846; _HdnCQ266.Visible = _Kschh846 end)
CreateToggle(_qhGcf930, "\071\114\097\118\105\116\121\032\067\111\110\116\114\111\108\032\040\077\097\103\110\101\116\041", function(_Kschh846) _lxAau354.GravityControl = _Kschh846 end)
CreateButton(_qhGcf930, "🔥\032\068\101\108\101\116\101\032\077\097\112\032\040\069\120\116\114\101\109\101\032\070\080\083\041", DeleteMap)
CreateButton(_qhGcf930, "🎨\032\082\101\109\111\118\101\032\084\101\120\116\117\114\101\115\032\040\065\110\116\105\045\076\097\103\041", RemoveTextures)
local _yXfgP912 = Instance.new("\084\101\120\116\076\097\098\101\108", _XKZqt176); _yXfgP912.Text = "\084\072\069\077\069\032\038\032\085\073\032\083\069\084\084\073\078\071\083"; _yXfgP912.Size = UDim2.new(0.95, 0, 0, 20); _yXfgP912.BackgroundTransparency = 1; RegisterTheme(_yXfgP912, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _yXfgP912.Font = Enum.Font.GothamBlack; _yXfgP912.TextSize = 12
CreateDropdown(_XKZqt176, "\083\101\108\101\099\116\032\084\104\101\109\101", {"\068\097\114\107", "\076\105\103\104\116", "\078\101\111\110\067\121\097\110", "\078\101\111\110\071\114\101\101\110", "\078\101\111\110\082\101\100"}, "\068\097\114\107", function(val) 
    ApplyTheme(val)
end)
CreateToggle(_XKZqt176, "\065\110\116\105\045\068\114\111\119\110\032\040\087\097\116\101\114\041", function(_Kschh846) _lxAau354.AntiDrown = _Kschh846 end)
CreateToggle(_XKZqt176, "\065\117\116\111\032\073\110\116\101\114\097\099\116\032\040\069\041", function(_Kschh846) _lxAau354.AutoInteract = _Kschh846 end)
CreateButton(_XKZqt176, "\068\101\108\101\116\101\032\075\105\108\108\032\066\114\105\099\107\115\032\040\065\110\116\105\045\075\105\108\108\041", function()
    local _OeYru990 = 0
    for _, _Kschh846 in pairs(workspace:GetDescendants()) do
        if _Kschh846:IsA("\066\097\115\101\080\097\114\116") and (_Kschh846.Name == "\075\105\108\108" or _Kschh846.Name == "\076\097\118\097" or _Kschh846:FindFirstChild("\084\111\117\099\104\073\110\116\101\114\101\115\116")) then
            if _Kschh846:FindFirstChild("\084\111\117\099\104\073\110\116\101\114\101\115\116") then
                _Kschh846.TouchInterest:Destroy()
                _OeYru990 = _OeYru990 + 1
            end
        end
    end
    ShowToast("\082\101\109\111\118\101\100\032" .. _OeYru990 .. "\032\075\105\108\108\032\090\111\110\101\115\033")
end)
CreateToggle(_XKZqt176, "\067\104\097\116\032\083\112\097\109\109\101\114", function(_Kschh846) _lxAau354.ChatSpammer = _Kschh846 end)
CreateInput(_XKZqt176, "\083\112\097\109\032\077\101\115\115\097\103\101", "\082\101\121\122\122\032\072\117\098\032\083\114\105\112\116\032\088\112\108\111\105\116\032\111\110\032\084\111\112\033", function(_Kschh846) _lxAau354.SpamMessage = _Kschh846 end, true) 
local _rtqvi143 = CreateInput(_XKZqt176, "\066\121\112\097\115\115\032\067\104\097\116\032\040\078\111\032\083\101\110\115\111\114\041", "\084\121\112\101\032\104\101\114\101\046\046\046", function(_bGacx359)
    SendBypassChat(_bGacx359)
end, true)
CreateToggle(_XKZqt176, "\067\104\097\116\032\076\111\103\103\101\114\032\040\083\112\121\041", function(_Kschh846) _lxAau354.ChatLogger = _Kschh846; InitChatLogger() end)
CreateToggle(_XKZqt176, "\065\117\116\111\032\065\110\105\109\032\076\111\103\103\101\114", function(_Kschh846) _lxAau354.AnimLogger = _Kschh846; UpdateAnimLogger() end)
CreateToggle(_XKZqt176, "\082\101\109\111\116\101\032\083\112\121\032\040\076\111\103\103\101\114\041", function(_Kschh846) _lxAau354.EventLogger = _Kschh846; InitEventLogger() end)
CreateButton(_XKZqt176, "\067\108\101\097\114\032\077\101\109\111\114\121\047\067\097\099\104\101", ClearMemory)
local _WJQVS812 = Instance.new("\084\101\120\116\076\097\098\101\108", _XKZqt176); _WJQVS812.Text = "\069\088\084\082\065\032\085\084\073\076\073\084\073\069\083"; _WJQVS812.Size = UDim2.new(0.95, 0, 0, 20); _WJQVS812.BackgroundTransparency = 1; RegisterTheme(_WJQVS812, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _WJQVS812.Font = Enum.Font.GothamBlack; _WJQVS812.TextSize = 12
CreateToggle(_XKZqt176, "\065\117\116\111\032\071\101\116\032\066\097\100\103\101\115\032\040\082\105\115\107\121\041", function(_Kschh846)
    _lxAau354.AutoBadge = _Kschh846
    if _Kschh846 then
        ShowToast("🚀\032\070\097\114\109\105\110\103\032\066\097\100\103\101\115\032\083\116\097\114\116\101\100\046\046\046")
        task.spawn(function()
            for _, _Kschh846 in pairs(_Rvbaz952:GetDescendants()) do
                if not _lxAau354.AutoBadge then break end
                if _Kschh846:IsA("\066\097\115\101\080\097\114\116") and _Kschh846:FindFirstChild("\084\111\117\099\104\073\110\116\101\114\101\115\116") then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") then
                        local _ZtLLU592 = LocalPlayer.Character.HumanoidRootPart
                        local _hsRds650 = _Kschh846.CFrame
                        firetouchinterest(_ZtLLU592, _Kschh846, 0)
                        firetouchinterest(_ZtLLU592, _Kschh846, 1)
                        _ZtLLU592.CFrame = _Kschh846.CFrame 
                        task.wait(0.1) 
                    end
                end
            end
            if _lxAau354.AutoBadge then ShowToast("✅\032\066\097\100\103\101\032\083\099\097\110\110\105\110\103\032\070\105\110\105\115\104\101\100\033") end
            _lxAau354.AutoBadge = false
        end)
    else
        ShowToast("\066\097\100\103\101\032\070\097\114\109\032\083\116\111\112\112\101\100")
    end
end)
CreateToggle(_XKZqt176, "\085\110\108\111\099\107\032\070\080\083\032\040\077\097\120\041", function(_Kschh846)
    _lxAau354.UnlockFPS = _Kschh846
    if _Kschh846 then
        setfpscap(999)
        ShowToast("\070\080\083\032\067\097\112\032\082\101\109\111\118\101\100\033")
    else
        setfpscap(60)
        ShowToast("\070\080\083\032\076\111\099\107\101\100\032\116\111\032\054\048")
    end
end)
local _bCcAS651 = Instance.new("\084\101\120\116\076\097\098\101\108", _XKZqt176); _bCcAS651.Text = "\065\078\073\077\065\084\073\079\078\032\079\086\069\082\082\073\068\069"; _bCcAS651.Size = UDim2.new(0.95, 0, 0, 20); _bCcAS651.BackgroundTransparency = 1; RegisterTheme(_bCcAS651, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _bCcAS651.Font = Enum.Font.GothamBlack; _bCcAS651.TextSize = 12
local _JkUFt717 = Instance.new("\084\101\120\116\076\097\098\101\108", _XKZqt176)
_JkUFt717.Size = UDim2.new(0.95, 0, 0, 20); _JkUFt717.BackgroundTransparency = 1
_JkUFt717.Font = Enum.Font.Code; _JkUFt717.TextSize = 13
_JkUFt717.Text = "\068\101\116\101\099\116\105\110\103\032\082\105\103\032\084\121\112\101\046\046\046"
RegisterTheme(_JkUFt717, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116")
local function CheckRig()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
        local _omqHq340 = LocalPlayer.Character.Humanoid.RigType
        if _omqHq340 == Enum.HumanoidRigType.R15 then
            _JkUFt717.Text = "✅\032\068\069\084\069\067\084\069\068\058\032\082\049\053\032\040\085\115\101\032\082\049\053\032\076\105\115\116\041"
            _lxAau354.AnimRigType = "\082\049\053"
        else
            _JkUFt717.Text = "⚠️\032\068\069\084\069\067\084\069\068\058\032\082\054\032\040\085\115\101\032\082\054\032\076\105\115\116\041"
            _lxAau354.AnimRigType = "\082\054"
        end
    end
end
task.spawn(function() while task.wait(2) do CheckRig() end end)
local _DwlSP769 = {
    ["\071\104\111\115\116\032\070\108\111\097\116\105\110\103"] = "\049\049\050\048\056\050\056\048\054\055\057\048\048\052\055",
    ["\077\101\116\114\111\032\077\097\110\032\086\068\032\069\109\111\116"] = "\055\049\048\052\051\052\048\057\049\056\055\048\050\054",
    ["\080\117\109\112\107\105\110\032\070\108\111\097\116"] = "\049\048\049\057\056\056\050\057\056\051\050\051\055\048\055",
    ["\090\111\109\098\105\101\032\073\100\108\101"] = "\054\049\054\049\053\056\057\050\057",
    ["\076\101\118\105\116\097\116\105\111\110"] = "\049\051\050\055\056\051\049\054\050\052\055\054\056\053\049",
    ["\075\110\105\103\104\116\032\073\100\108\101"] = "\054\053\055\053\054\052\053\057\054",
    ["\068\117\100\117\107\032\068\073\032\065\119\097\110"] = "\055\048\054\055\051\048\056\050\049\057\056\051\050\056",
    ["\080\111\112\117\108\097\114\032\068\097\110\099\101"] = "\057\051\048\054\050\050\057\056\053\054\054\056\048\054",
    ["\074\111\109\111\107\032\068\097\110\099\101"] = "\049\049\056\051\054\052\054\057\048\050\048\057\054\053\053",
    ["\076\101\109\112\097\114\032\075\101\112\097\108\097"] = "\049\051\056\050\052\051\051\050\050\053\050\048\050\056\057",
    ["\077\097\115\032\082\085\083\068\073\032\069\077\079\084\084"] = "\049\050\054\055\056\048\054\054\053\051\055\057\048\048\052",
    ["\087\072\065\084\032\084\072\069\032\072\069\076\076\032😋"] = "\055\056\048\056\054\055\052\048\053\050\053\050\048\050",
}
local _xEOQZ691 = {
    ["\082\054\032\068\097\110\099\101\032\049"] = "\053\048\055\055\055\049\057\053\053",
    ["\082\054\032\068\097\110\099\101\032\050"] = "\053\048\055\055\055\054\048\052\051",
    ["\082\054\032\068\097\110\099\101\032\051"] = "\053\048\055\055\055\055\050\054\056",
    ["\082\054\032\072\111\114\115\101\032\077\097\110"] = "\049\048\057\050\049\051\048\049\053\055\054",
    ["\082\054\032\082\097\116\032\068\097\110\099\101"] = "\049\049\057\051\056\054\055\049\049\056\053\053\055\054\049",
    ["\082\054\032\065\115\105\107\105\110\032\065\106\097"] = "\055\051\051\051\051\053\057\051\049\053\050\051\057\051",
    ["\082\054\032\082\101\090\111\109\098\105\101\032\065\110\105\109\097\116\101\100"] = "\049\050\048\051\053\051\050\051\056\048\053\052\056\055\050",
    ["\082\054\032\074\111\109\111\107\032\068\097\110\099\101"] = "\049\051\049\055\050\048\049\051\054\052\053\053\056\052\057",
}
local function UpdateAnimation(val)
    if _lxAau354.AnimFixLoop then 
        _lxAau354.AnimFixLoop:Disconnect()
        _lxAau354.AnimFixLoop = nil
    end
    if _lxAau354.CurrentAnimTrack then 
        _lxAau354.CurrentAnimTrack:Stop()
        _lxAau354.CurrentAnimTrack = nil 
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
        local _ARHwe269 = LocalPlayer.Character
        local _cOPpa623 = _ARHwe269.Humanoid
        local _FyFxw936 = _cOPpa623:FindFirstChildOfClass("\065\110\105\109\097\116\111\114") or _cOPpa623:WaitForChild("\065\110\105\109\097\116\111\114")
        local _rcusz910 = Instance.new("\065\110\105\109\097\116\105\111\110")
        _rcusz910.AnimationId = "\114\098\120\097\115\115\101\116\105\100\058\047\047" .. val
        local _vKlmA372 = _FyFxw936:LoadAnimation(_rcusz910)
        _vKlmA372.Priority = Enum.AnimationPriority.Action4 
        _vKlmA372.Looped = true 
        _vKlmA372:Play()
        _lxAau354.CurrentAnimTrack = _vKlmA372
        _lxAau354.AnimFixLoop = RunService.Heartbeat:Connect(function()
            if not _lxAau354.AnimChanger then return end 
            local _KSVXO814 = _ARHwe269:FindFirstChild("\065\110\105\109\097\116\101")
            if _KSVXO814 and _KSVXO814.Disabled == false then
                _KSVXO814.Disabled = true
            end
            for _, _aHPZe58 in pairs(_FyFxw936:GetPlayingAnimationTracks()) do
                if _aHPZe58 ~= _lxAau354.CurrentAnimTrack then
                    _aHPZe58:Stop()
                end
            end
            if _lxAau354.CurrentAnimTrack and not _lxAau354.CurrentAnimTrack.IsPlaying then
                _lxAau354.CurrentAnimTrack:Play()
            end
        end)
    end
end
local _ayhjB669 = {}; for k,_Kschh846 in pairs(_DwlSP769) do table.insert(_ayhjB669, k) end
table.sort(_ayhjB669)
CreateDropdown(_XKZqt176, "\082\049\053\032\065\110\105\109\097\116\105\111\110\115\032\076\105\115\116", _ayhjB669, "\083\101\108\101\099\116\046\046\046", function(_pVKXs820)
    if _lxAau354.AnimRigType == "\082\049\053" then
        _lxAau354.CurrentAnimID = _DwlSP769[_pVKXs820]
        if _lxAau354.AnimChanger then UpdateAnimation(_lxAau354.CurrentAnimID) end
    else
        ShowToast("❌\032\069\114\114\111\114\058\032\089\111\117\032\097\114\101\032\082\054\033\032\085\115\101\032\082\054\032\076\105\115\116\046")
    end
end)
local _MAZWG336 = {}; for k,_Kschh846 in pairs(_xEOQZ691) do table.insert(_MAZWG336, k) end
table.sort(_MAZWG336)
CreateDropdown(_XKZqt176, "\082\054\032\065\110\105\109\097\116\105\111\110\115\032\076\105\115\116", _MAZWG336, "\083\101\108\101\099\116\046\046\046", function(_pVKXs820)
    if _lxAau354.AnimRigType == "\082\054" then
        _lxAau354.CurrentAnimID = _xEOQZ691[_pVKXs820]
        if _lxAau354.AnimChanger then UpdateAnimation(_lxAau354.CurrentAnimID) end
    else
        ShowToast("❌\032\069\114\114\111\114\058\032\089\111\117\032\097\114\101\032\082\049\053\033\032\085\115\101\032\082\049\053\032\076\105\115\116\046")
    end
end)
CreateInput(_XKZqt176, "\067\117\115\116\111\109\032\073\068\032\040\077\097\110\117\097\108\041", "\080\097\115\116\101\032\073\068\046\046\046", function(val)
    _lxAau354.CurrentAnimID = val
    if _lxAau354.AnimChanger then UpdateAnimation(val) end
end, true)
CreateToggle(_XKZqt176, "\069\110\097\098\108\101\032\067\117\115\116\111\109\032\065\110\105\109", function(_Kschh846) 
    _lxAau354.AnimChanger = _Kschh846
    if _Kschh846 then
        if _lxAau354.CurrentAnimID ~= 0 then
            UpdateAnimation(_lxAau354.CurrentAnimID)
            ShowToast("\065\110\105\109\032\076\111\097\100\101\100\032\040\070\111\114\099\101\100\041\033")
        else
            ShowToast("⚠️\032\083\101\108\101\099\116\032\065\110\105\109\097\116\105\111\110\032\070\105\114\115\116\033")
        end
    else
        if _lxAau354.AnimFixLoop then 
            _lxAau354.AnimFixLoop:Disconnect()
            _lxAau354.AnimFixLoop = nil
        end
        if LocalPlayer.Character then
            local _cOPpa623 = LocalPlayer.Character:FindFirstChild("\072\117\109\097\110\111\105\100")
            if _cOPpa623 then
                local _FyFxw936 = _cOPpa623:FindFirstChildOfClass("\065\110\105\109\097\116\111\114") or _cOPpa623:WaitForChild("\065\110\105\109\097\116\111\114")
                for _, _vKlmA372 in pairs(_FyFxw936:GetPlayingAnimationTracks()) do
                    _vKlmA372:Stop()
                end
            end
            local _KSVXO814 = LocalPlayer.Character:FindFirstChild("\065\110\105\109\097\116\101")
            if _KSVXO814 then 
                _KSVXO814.Disabled = true
                task.delay(0.1, function()
                    _KSVXO814.Disabled = false
                end)
            end
        end
        _lxAau354.CurrentAnimTrack = nil
        ShowToast("\065\110\105\109\032\082\101\115\101\116\032\038\032\068\105\115\097\098\108\101\100")
    end
end)
CreateToggle(_XKZqt176, "\065\100\109\105\110\032\068\101\116\101\099\116\111\114", function(_Kschh846) _lxAau354.AdminDetector = _Kschh846 end)
CreateInput(_XKZqt176, "\065\100\109\105\110\032\071\114\111\117\112\032\073\068", 0, function(_Kschh846) _lxAau354.AdminGroupId = tonumber(_Kschh846) or 0 end)
local _GWwfs839 = CreateToggle(_XKZqt176, "\065\117\116\111\032\082\101\099\111\110\110\101\099\116", function(_Kschh846) _lxAau354.AutoReconnect = _Kschh846 end)
CreateToggle(_XKZqt176, "\065\110\116\105\045\065\070\075", function(_Kschh846) _lxAau354.AntiAFK = _Kschh846 end)
local _KthmD214 = Instance.new("\084\101\120\116\076\097\098\101\108", _XKZqt176); _KthmD214.Text = "\073\068\069\078\084\073\084\089\032\047\032\078\065\077\069\032\083\080\079\079\070\069\082"; _KthmD214.Size = UDim2.new(0.95, 0, 0, 20); _KthmD214.BackgroundTransparency = 1; RegisterTheme(_KthmD214, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _KthmD214.Font = Enum.Font.GothamBlack; _KthmD214.TextSize = 12
local _jWSva857 = CreateInput(_XKZqt176, "\067\117\115\116\111\109\032\078\097\109\101\032\084\101\120\116", "\073\110\112\117\116\032\078\097\109\101\046\046\046", function(val)
    _lxAau354.CustomNameText = val
    if _lxAau354.IdentityMode == "\067\117\115\116\111\109\032\078\097\109\101" then
        UpdateIdentity() 
    end
end, true)
_jWSva857.Parent.Parent.Visible = false
CreateDropdown(_XKZqt176, "\073\100\101\110\116\105\116\121\032\077\111\100\101", 
    {"\068\101\102\097\117\108\116", "\068\101\115\116\114\111\121\032\078\097\109\101\032\040\083\101\108\102\041", "\068\101\115\116\114\111\121\032\078\097\109\101\032\040\065\108\108\041", "\080\114\111\109\111\116\101\032\068\105\115\099\111\114\100", "\067\117\115\116\111\109\032\078\097\109\101"}, 
    "\068\101\102\097\117\108\116", 
    function(val)
        _lxAau354.IdentityMode = val
        if val == "\067\117\115\116\111\109\032\078\097\109\101" then
            _jWSva857.Parent.Parent.Visible = true
        else
            _jWSva857.Parent.Parent.Visible = false
        end
        UpdateIdentity()
    end
)
CreateButton(_XKZqt176, "\082\101\102\114\101\115\104\032\073\100\101\110\116\105\116\121\032\040\067\108\105\099\107\032\105\102\032\082\101\115\112\097\119\110\041", function()
    UpdateIdentity()
end)
task.spawn(function() if _lxAau354.AutoReconnect then _GWwfs839(true) end end)
local _OzYGB985 = CreateToggle(_XKZqt176, "\085\110\108\111\099\107\032\077\111\117\115\101\032\040\070\049\041", function(_Kschh846) _lxAau354.ForceUnlockMouse = _Kschh846; if not _Kschh846 then UserInputService.MouseBehavior = Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = true end end)
local _ZwNEn762 = Instance.new("\084\101\120\116\076\097\098\101\108", _aYgfO437); _ZwNEn762.Text = "\082\101\121\122\122\097\114\106\097\109\032\066\108\111\120\072\117\098\032\068\121\110\097\109\105\099"; _ZwNEn762.Size = UDim2.new(1, 0, 0, 40); _ZwNEn762.BackgroundTransparency = 1; RegisterTheme(_ZwNEn762, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _ZwNEn762.Font = Enum.Font.GothamBlack; _ZwNEn762.TextSize = 28; _ZwNEn762.TextXAlignment = Enum.TextXAlignment.Center
local _dJBcZ701 = Instance.new("\084\101\120\116\076\097\098\101\108", _aYgfO437); _dJBcZ701.Text = "\065\110\116\097\114\099\116\105\099\097\032\069\120\112\101\100\105\116\105\111\110\092\110\077\111\100\105\102\105\101\100\032\102\111\114\032\098\101\116\116\101\114\032\112\101\114\102\111\114\109\097\110\099\101\046"; _dJBcZ701.Size = UDim2.new(1, 0, 0, 60); _dJBcZ701.BackgroundTransparency = 1; RegisterTheme(_dJBcZ701, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109"); _dJBcZ701.Font = Enum.Font.Gotham; _dJBcZ701.TextSize = 14
local _QCScL369 = CreateButton(_aYgfO437, "\067\111\112\121\032\068\105\115\099\111\114\100\032\076\105\110\107", function() setclipboard("\104\116\116\112\115\058\047\047\100\105\115\099\111\114\100\046\103\103\047\102\110\085\055\101\098\116\071\113\056"); ShowToast("\068\105\115\099\111\114\100\032\076\105\110\107\032\067\111\112\105\101\100\033") end); _QCScL369.BackgroundColor3 = Color3.fromRGB(88, 101, 242); _QCScL369.TextColor3 = Color3.fromRGB(255, 255, 255)
local _xYUFR140 = Instance.new("\070\114\097\109\101", _aYgfO437); _xYUFR140.Size = UDim2.new(0.95, 0, 0, 80); RegisterTheme(_xYUFR140, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\069\108\101\109\101\110\116\066\071"); Instance.new("\085\073\067\111\114\110\101\114", _xYUFR140).CornerRadius = UDim.new(0, 8); local _upnLb638 = Instance.new("\085\073\083\116\114\111\107\101", _xYUFR140); RegisterTheme(_upnLb638, "\067\111\108\111\114", "\083\116\114\111\107\101")
local _FfFuN133 = Instance.new("\084\101\120\116\076\097\098\101\108", _xYUFR140); _FfFuN133.Text = "\067\085\082\082\069\078\084\032\083\069\082\086\069\082\032\074\079\066\032\073\068"; _FfFuN133.Size = UDim2.new(1, 0, 0, 25); _FfFuN133.BackgroundTransparency = 1; RegisterTheme(_FfFuN133, "\084\101\120\116\067\111\108\111\114\051", "\084\101\120\116\068\105\109"); _FfFuN133.Font = Enum.Font.GothamBold; _FfFuN133.TextSize = 12
local _wZFZA450 = Instance.new("\084\101\120\116\066\111\120", _xYUFR140); _wZFZA450.Size = UDim2.new(0.9, 0, 0, 30); _wZFZA450.Position = UDim2.new(0.05, 0, 0.4, 0); RegisterTheme(_wZFZA450, "\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051", "\066\097\099\107\103\114\111\117\110\100"); _wZFZA450.Text = game.JobId; RegisterTheme(_wZFZA450, "\084\101\120\116\067\111\108\111\114\051", "\065\099\099\101\110\116"); _wZFZA450.Font = Enum.Font.Code; _wZFZA450.TextSize = 12; _wZFZA450.ClearTextOnFocus = false; _wZFZA450.TextEditable = false; Instance.new("\085\073\067\111\114\110\101\114", _wZFZA450).CornerRadius = UDim.new(0, 6)
local _kYJyh855 = Instance.new("\084\101\120\116\066\117\116\116\111\110", _xYUFR140); _kYJyh855.Size = UDim2.new(1, 0, 1, 0); _kYJyh855.BackgroundTransparency = 1; _kYJyh855.Text = ""; _kYJyh855.MouseButton1Click:Connect(function() setclipboard(game.JobId); ShowToast("\083\101\114\118\101\114\032\074\111\098\032\073\068\032\067\111\112\105\101\100\033") end)
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end 
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        if _lxAau354.ClickTP and Mouse.Target then
            local _ZMlOZ577 = Mouse.Hit.Position
            if LocalPlayer.Character and GetVisualPart(LocalPlayer.Character) then LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_ZMlOZ577 + Vector3.new(0, 3, 0)); ShowToast("\084\101\108\101\112\111\114\116\101\100\033") end
        end
    end
    if input.KeyCode == Enum.KeyCode.J and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then local _CuuKo998 = _lxAau354.InfiniteJump; if _plMZj882["\073\110\102\105\110\105\116\101\032\074\117\109\112\032\040\083\104\105\102\116\043\074\041"] then _plMZj882["\073\110\102\105\110\105\116\101\032\074\117\109\112\032\040\083\104\105\102\116\043\074\041"](not _CuuKo998) end end
    if input.KeyCode == Enum.KeyCode.P and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then local _CuuKo998 = _lxAau354.Freecam; if _plMZj882["\070\114\101\101\099\097\109\032\040\083\104\105\102\116\043\080\041"] then _plMZj882["\070\114\101\101\099\097\109\032\040\083\104\105\102\116\043\080\041"](not _CuuKo998) end end
    if input.KeyCode == Enum.KeyCode.F1 then local _CuuKo998 = _lxAau354.ForceUnlockMouse; if _plMZj882["\085\110\108\111\099\107\032\077\111\117\115\101\032\040\070\049\041"] then _plMZj882["\085\110\108\111\099\107\032\077\111\117\115\101\032\040\070\049\041"](not _CuuKo998) end end
end)
LocalPlayer.CharacterAdded:Connect(function(newChar)
    if _lxAau354.AnimLogger then task.wait(1); UpdateAnimLogger() end
    if _lxAau354.IsRespawning and _lxAau354.LastPos then
        local _ZtLLU592 = newChar:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116", 10); local _cOPpa623 = newChar:WaitForChild("\072\117\109\097\110\111\105\100", 10)
        if _ZtLLU592 and _cOPpa623 then if _lxAau354.LastPos.Y > -300 then task.wait(0.25); _ZtLLU592.CFrame = _lxAau354.LastPos; ShowToast("\082\101\116\117\114\110\101\100\032\116\111\032\076\097\115\116\032\080\111\115\105\116\105\111\110") else ShowToast("\076\097\115\116\032\080\111\115\032\119\097\115\032\086\111\105\100\032\040\083\097\102\101\116\121\032\080\114\101\118\101\110\116\101\100\032\084\080\041") end; _lxAau354.IsRespawning = false; _lxAau354.LastPos = nil end
    end
    if _lxAau354.AnimChanger and _lxAau354.CurrentAnimID ~= 0 then
        task.wait(1)
        UpdateAnimation(_lxAau354.CurrentAnimID)
    end
    if _lxAau354.AutoBadge then
        task.wait(3) 
        ShowToast("♻️\032\082\101\115\116\097\114\116\105\110\103\032\082\111\117\116\101\046\046\046")
        StartAutoFarm()
    end
end)
_EGTpO878.MouseButton1Click:Connect(function() _IJbPu805.Visible = not _IJbPu805.Visible end)
local _mxGvi295 = Sidebar:FindFirstChildOfClass("\084\101\120\116\066\117\116\116\111\110")
if _mxGvi295 then 
    local _zfVdx490 = _mxGvi295:FindFirstChild("\070\114\097\109\101")
    local _YDckL844 = _mxGvi295:FindFirstChild("\084\101\120\116\076\097\098\101\108")
    local _soYIx315 = _mxGvi295:GetChildren()[3]
    local _UnFof410 = _BdXeW407:FindFirstChildOfClass("\083\099\114\111\108\108\105\110\103\070\114\097\109\101")
    if _zfVdx490 then _zfVdx490.Visible = true end
    if _YDckL844 then _YDckL844.TextColor3 = _znjmN83.Text end
    if _soYIx315 then _soYIx315.TextColor3 = _znjmN83.Text end
    _mxGvi295.BackgroundColor3 = _znjmN83.ElementBG
    _mxGvi295.BackgroundTransparency = 0.95
    if _UnFof410 then _UnFof410.Visible = true end
end
