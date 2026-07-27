local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

local localPlayer = Players.LocalPlayer
local playerName = localPlayer and localPlayer.Name or "User"
local startTime = os.date("%H:%M:%S")

-- === PROTECTED GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BroPixelLoader_V2"
screenGui.ResetOnSpawn = false

local function parentGui(gui)
    if gethui then
        gui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = CoreGui
    else
        gui.Parent = CoreGui
    end
end
parentGui(screenGui)

-- === BLUR EFFECT ===
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.6), {Size = 16}):Play()

-- === MAIN CONTAINERS ===
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
background.BackgroundTransparency = 1
background.Parent = screenGui

-- CanvasGroup для плавного исчезновения всего сразу
local mainContainer = Instance.new("CanvasGroup")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 420, 0, 340)
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.BackgroundColor3 = Color3.fromRGB(18, 22, 32)
mainContainer.GroupTransparency = 1
mainContainer.Parent = background

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainContainer

-- Glowing Border
local mainStroke = Instance.new("UIStroke")
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Thickness = 1.8
mainStroke.Transparency = 0.2
mainStroke.Parent = mainContainer

local strokeGradient = Instance.new("UIGradient")
strokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 217, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 255))
})
strokeGradient.Parent = mainStroke

-- Glow Behind
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1, 80, 1, 80)
glow.Position = UDim2.new(0.5, 0, 0.5, 0)
glow.AnchorPoint = Vector2.new(0.5, 0.5)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://5028857472"
glow.ImageColor3 = Color3.fromRGB(139, 92, 255)
glow.ImageTransparency = 0.8
glow.ZIndex = 0
glow.Parent = mainContainer

-- === PARTICLES SYSTEM ===
local particlesFolder = Instance.new("Folder")
particlesFolder.Name = "Particles"
particlesFolder.Parent = mainContainer

for i = 1, 30 do
    local particle = Instance.new("Frame")
    local size = math.random(2, 4)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = (i % 2 == 0) and Color3.fromRGB(139, 92, 255) or Color3.fromRGB(0, 217, 255)
    particle.BackgroundTransparency = math.random(4, 8) / 10
    particle.Parent = particlesFolder
    
    local pCorner = Instance.new("UICorner")
    pCorner.CornerRadius = UDim.new(1, 0)
    pCorner.Parent = particle
    
    -- Анимация парения частиц
    task.spawn(function()
        while screenGui.Parent do
            local targetX = math.clamp(particle.Position.X.Scale + (math.random(-10, 10) / 100), 0.05, 0.95)
            local targetY = math.clamp(particle.Position.Y.Scale + (math.random(-10, 10) / 100), 0.05, 0.95)
            local tween = TweenService:Create(particle, TweenInfo.new(math.random(3, 6), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(targetX, 0, targetY, 0),
                BackgroundTransparency = math.random(3, 9) / 10
            })
            tween:Play()
            tween.Completed:Wait()
        end
    end)
end

-- === HEADER ===
local titleBro = Instance.new("TextLabel")
titleBro.Size = UDim2.new(1, 0, 0, 28)
titleBro.Position = UDim2.new(0, 0, 0, 20)
titleBro.BackgroundTransparency = 1
titleBro.Text = "BRO PIXEL"
titleBro.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBro.TextSize = 24
titleBro.Font = Enum.Font.GothamBold
titleBro.Parent = mainContainer

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 217, 255))
})
titleGradient.Parent = titleBro

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 16)
subtitle.Position = UDim2.new(0, 0, 0, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Premium Experience"
subtitle.TextColor3 = Color3.fromRGB(140, 150, 175)
subtitle.TextSize = 12
subtitle.Font = Enum.Font.GothamMedium
subtitle.Parent = mainContainer

-- === STAGES (CHECKPOINTS) DISPLAY ===
local stageLabels = {}
local stageNames = {
    "Initializing Core Engine...",
    "Loading Assets & Dictionary...",
    "Preparing User Interface...",
    "Verifying License Key...",
    "Finalizing Execution..."
}

local stagesFrame = Instance.new("Frame")
stagesFrame.Size = UDim2.new(0, 340, 0, 110)
stagesFrame.Position = UDim2.new(0.5, -170, 0, 78)
stagesFrame.BackgroundTransparency = 1
stagesFrame.Parent = mainContainer

local stagesLayout = Instance.new("UIListLayout")
stagesLayout.SortOrder = Enum.SortOrder.LayoutOrder
stagesLayout.Padding = UDim.new(0, 4)
stagesLayout.Parent = stagesFrame

for i, name in ipairs(stageNames) do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = "  ○  " .. name
    lbl.TextColor3 = Color3.fromRGB(100, 110, 135)
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = i
    lbl.Parent = stagesFrame
    stageLabels[i] = lbl
end

-- === PROGRESS BAR ===
local progressBarBg = Instance.new("Frame")
progressBarBg.Size = UDim2.new(0, 340, 0, 10)
progressBarBg.Position = UDim2.new(0.5, -170, 0, 202)
progressBarBg.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
progressBarBg.Parent = mainContainer

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = progressBarBg

local progressBarFill = Instance.new("Frame")
progressBarFill.Size = UDim2.new(0, 0, 1, 0)
progressBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressBarFill.ClipsDescendants = true
progressBarFill.Parent = progressBarBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = progressBarFill

-- Gradient with animation (wave)
local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 217, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 255))
})
barGradient.Parent = progressBarFill

local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(0, 60, 0, 18)
percentText.Position = UDim2.new(0.5, 110, 0, 216)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(0, 217, 255)
percentText.TextSize = 13
percentText.Font = Enum.Font.GothamBold
percentText.TextXAlignment = Enum.TextXAlignment.Right
percentText.Parent = mainContainer

-- === FOOTER INFO ===
local footerLeft = Instance.new("TextLabel")
footerLeft.Size = UDim2.new(0, 180, 0, 36)
footerLeft.Position = UDim2.new(0, 40, 1, -48)
footerLeft.BackgroundTransparency = 1
footerLeft.Text = "Session: " .. playerName .. "\nStarted: " .. startTime
footerLeft.TextColor3 = Color3.fromRGB(110, 120, 145)
footerLeft.TextSize = 11
footerLeft.Font = Enum.Font.Gotham
footerLeft.TextXAlignment = Enum.TextXAlignment.Left
footerLeft.Parent = mainContainer

local footerRight = Instance.new("TextLabel")
footerRight.Size = UDim2.new(0, 180, 0, 36)
footerRight.Position = UDim2.new(1, -220, 1, -48)
footerRight.BackgroundTransparency = 1
footerRight.Text = "Build: v1.0.0\nLua: " .. (_VERSION or "5.1")
footerRight.TextColor3 = Color3.fromRGB(110, 120, 145)
footerRight.TextSize = 11
footerRight.Font = Enum.Font.Gotham
footerRight.TextXAlignment = Enum.TextXAlignment.Right
footerRight.Parent = mainContainer

-- === LOOP ANIMATIONS ===

-- 1. Pulse Logo
task.spawn(function()
    while screenGui.Parent do
        TweenService:Create(titleBro, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextSize = 25}):Play()
        task.wait(1.2)
        TweenService:Create(titleBro, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextSize = 24}):Play()
        task.wait(1.2)
    end
end)

-- 2. Rotating Border Gradient & Progress Bar Wave
task.spawn(function()
    local rot = 0
    local offset = 0
    while screenGui.Parent do
        rot = (rot + 2) % 360
        offset = (offset + 0.02) % 1
        strokeGradient.Rotation = rot
        barGradient.Offset = Vector2.new(offset, 0)
        task.wait(0.02)
    end
end)

-- === OPENING ANIMATION ===
mainContainer.Size = UDim2.new(0, 360, 0, 280)
local fadeInBg = TweenService:Create(background, TweenInfo.new(0.5), {BackgroundTransparency = 0.3})
local fadeInContainer = TweenService:Create(mainContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    GroupTransparency = 0,
    Size = UDim2.new(0, 420, 0, 340)
})

fadeInBg:Play()
fadeInContainer:Play()
task.wait(0.6)

-- === SMOOTH PERCENT & STAGE EXECUTION ===
local currentPct = 0

local function updateProgress(targetPct, stageIndex, duration)
    -- Обновляем чекпоинты
    for i = 1, #stageNames do
        if i < stageIndex then
            stageLabels[i].Text = "  ✓  " .. stageNames[i]
            stageLabels[i].TextColor3 = Color3.fromRGB(0, 230, 118)
        elseif i == stageIndex then
            stageLabels[i].Text = "  ●  " .. stageNames[i]
            stageLabels[i].TextColor3 = Color3.fromRGB(0, 217, 255)
        else
            stageLabels[i].Text = "  ○  " .. stageNames[i]
            stageLabels[i].TextColor3 = Color3.fromRGB(100, 110, 135)
        end
    end
    
    -- Анимация шкалы
    TweenService:Create(progressBarFill, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(targetPct / 100, 0, 1, 0)
    }):Play()
    
    -- Плавный счётчик процентов (49..50..51)
    local startPct = currentPct
    local steps = math.floor(duration / 0.03)
    for step = 1, steps do
        currentPct = math.floor(startPct + ((targetPct - startPct) * (step / steps)))
        percentText.Text = tostring(currentPct) .. "%"
        task.wait(0.03)
    end
    currentPct = targetPct
    percentText.Text = tostring(currentPct) .. "%"
end

-- Запуск всех этапов
updateProgress(20, 1, 0.4)
updateProgress(45, 2, 0.5)

-- Проверка ключа перед загрузкой
local userKey = getgenv().PixelKey or _G.PixelKey or PixelKey
if not userKey or userKey == "" then
    stageLabels[3].Text = "  ❌  Key missing! Set getgenv().PixelKey"
    stageLabels[3].TextColor3 = Color3.fromRGB(255, 75, 75)
    percentText.Text = "FAIL"
    percentText.TextColor3 = Color3.fromRGB(255, 75, 75)
    
    task.wait(2.5)
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 0}):Play()
    TweenService:Create(mainContainer, TweenInfo.new(0.4), {GroupTransparency = 1, Size = UDim2.new(0, 300, 0, 240)}):Play()
    task.wait(0.4)
    screenGui:Destroy()
    blur:Destroy()
    return
end

updateProgress(70, 3, 0.4)

-- Скачивание основного скрипта
local scriptRaw
local downloadSuccess = pcall(function()
    scriptRaw = game:HttpGet("https://raw.githubusercontent.com/bro-pixel11/Bro-PixelHub/main/wordbomb.lua")
end)

updateProgress(90, 4, 0.4)
updateProgress(100, 5, 0.3)

-- Все галочки зеленые
for i = 1, #stageNames do
    stageLabels[i].Text = "  ✓  " .. stageNames[i]
    stageLabels[i].TextColor3 = Color3.fromRGB(0, 230, 118)
end

subtitle.Text = "✓ Ready! Launching..."
subtitle.TextColor3 = Color3.fromRGB(0, 230, 118)

task.wait(0.4)

-- === CLOSING ANIMATION ===
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
local shrinkUI = TweenService:Create(mainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
    Size = UDim2.new(0, 0, 0, 0),
    GroupTransparency = 1
})
local fadeBg = TweenService:Create(background, TweenInfo.new(0.5), {BackgroundTransparency = 1})

shrinkUI:Play()
fadeBg:Play()
shrinkUI.Completed:Wait()

screenGui:Destroy()
blur:Destroy()

-- Запуск основного скрипта
if downloadSuccess and scriptRaw then
    local loadedScript, parseErr = loadstring(scriptRaw)
    if loadedScript then
        loadedScript()
    else
        warn("❌ Script Error: " .. tostring(parseErr))
    end
else
    warn("❌ Failed to download script from GitHub!")
end
