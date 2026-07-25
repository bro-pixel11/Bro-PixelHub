local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer
local playerName = localPlayer and localPlayer.Name or "User"

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BroPixelLoader"
screenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(screenGui)
    screenGui.Parent = CoreGui
elseif gethui then
    screenGui.Parent = gethui()
else
    screenGui.Parent = CoreGui
end

local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(11, 14, 20)
background.BackgroundTransparency = 1
background.Parent = screenGui

local mainContainer = Instance.new("CanvasGroup")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 380, 0, 290)
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.BackgroundColor3 = Color3.fromRGB(26, 31, 43)
mainContainer.GroupTransparency = 1
mainContainer.Parent = background

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainContainer

local mainStroke = Instance.new("UIStroke")
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Color = Color3.fromRGB(139, 92, 255)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = mainContainer

local glow = Instance.new("ImageLabel")
glow.Name = "Glow"
glow.Size = UDim2.new(1, 60, 1, 60)
glow.Position = UDim2.new(0.5, 0, 0.5, 0)
glow.AnchorPoint = Vector2.new(0.5, 0.5)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://5028857472"
glow.ImageColor3 = Color3.fromRGB(139, 92, 255)
glow.ImageTransparency = 0.85
glow.ZIndex = 0
glow.Parent = mainContainer

local strokeGradient = Instance.new("UIGradient")
strokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 217, 255))
})
strokeGradient.Rotation = 45
strokeGradient.Parent = mainStroke

local titleBro = Instance.new("TextLabel")
titleBro.Name = "TitleBro"
titleBro.Size = UDim2.new(1, 0, 0, 30)
titleBro.Position = UDim2.new(0, 0, 0, 18)
titleBro.BackgroundTransparency = 1
titleBro.Text = "BRO"
titleBro.TextColor3 = Color3.fromRGB(139, 92, 255)
titleBro.TextSize = 28
titleBro.Font = Enum.Font.GothamBold
titleBro.Parent = mainContainer

local titlePixel = Instance.new("TextLabel")
titlePixel.Name = "TitlePixel"
titlePixel.Size = UDim2.new(1, 0, 0, 24)
titlePixel.Position = UDim2.new(0, 0, 0, 46)
titlePixel.BackgroundTransparency = 1
titlePixel.Text = "PIXEL HUB"
titlePixel.TextColor3 = Color3.fromRGB(255, 255, 255)
titlePixel.TextSize = 20
titlePixel.Font = Enum.Font.GothamBold
titlePixel.Parent = mainContainer

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, 0, 0, 16)
subtitle.Position = UDim2.new(0, 0, 0, 74)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Premium Word Bomb Script"
subtitle.TextColor3 = Color3.fromRGB(0, 217, 255)
subtitle.TextSize = 12
subtitle.Font = Enum.Font.GothamMedium
subtitle.Parent = mainContainer

local welcomeText = Instance.new("TextLabel")
welcomeText.Name = "WelcomeText"
welcomeText.Size = UDim2.new(1, 0, 0, 16)
welcomeText.Position = UDim2.new(0, 0, 0, 94)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "Welcome, " .. playerName
welcomeText.TextColor3 = Color3.fromRGB(180, 185, 200)
welcomeText.TextSize = 13
welcomeText.Font = Enum.Font.Gotham
welcomeText.Parent = mainContainer

local spinner = Instance.new("ImageLabel")
spinner.Name = "Spinner"
spinner.Size = UDim2.new(0, 20, 0, 20)
spinner.Position = UDim2.new(0.5, -10, 0, 122)
spinner.BackgroundTransparency = 1
spinner.Image = "rbxassetid://6031280882"
spinner.ImageColor3 = Color3.fromRGB(0, 217, 255)
spinner.Parent = mainContainer

local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(1, 0, 0, 16)
statusText.Position = UDim2.new(0, 0, 0, 150)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing Bro-Pixel Hub..."
statusText.TextColor3 = Color3.fromRGB(200, 205, 215)
statusText.TextSize = 12
statusText.Font = Enum.Font.Gotham
statusText.Parent = mainContainer

local percentText = Instance.new("TextLabel")
percentText.Name = "PercentText"
percentText.Size = UDim2.new(1, 0, 0, 16)
percentText.Position = UDim2.new(0, 0, 0, 168)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(139, 92, 255)
percentText.TextSize = 13
percentText.Font = Enum.Font.GothamBold
percentText.Parent = mainContainer

local progressBarBackground = Instance.new("Frame")
progressBarBackground.Name = "ProgressBarBackground"
progressBarBackground.Size = UDim2.new(0, 300, 0, 8)
progressBarBackground.Position = UDim2.new(0.5, -150, 0, 194)
progressBarBackground.BackgroundColor3 = Color3.fromRGB(15, 18, 26)
progressBarBackground.Parent = mainContainer

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = progressBarBackground

local progressBarFill = Instance.new("Frame")
progressBarFill.Name = "ProgressBarFill"
progressBarFill.Size = UDim2.new(0, 0, 1, 0)
progressBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressBarFill.Parent = progressBarBackground

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = progressBarFill

local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 217, 255))
})
barGradient.Parent = progressBarFill

local statusDot = Instance.new("Frame")
statusDot.Name = "StatusDot"
statusDot.Size = UDim2.new(0, 6, 0, 6)
statusDot.Position = UDim2.new(0, 20, 1, -22)
statusDot.BackgroundColor3 = Color3.fromRGB(0, 230, 118)
statusDot.Parent = mainContainer

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

local footerLeft = Instance.new("TextLabel")
footerLeft.Name = "FooterLeft"
footerLeft.Size = UDim2.new(0, 200, 0, 16)
footerLeft.Position = UDim2.new(0, 32, 1, -27)
footerLeft.BackgroundTransparency = 1
footerLeft.Text = "Status: Online  •  Build: Release"
footerLeft.TextColor3 = Color3.fromRGB(120, 130, 150)
footerLeft.TextSize = 11
footerLeft.Font = Enum.Font.Gotham
footerLeft.TextXAlignment = Enum.TextXAlignment.Left
footerLeft.Parent = mainContainer

local footerRight = Instance.new("TextLabel")
footerRight.Name = "FooterRight"
footerRight.Size = UDim2.new(0, 80, 0, 16)
footerRight.Position = UDim2.new(1, -100, 1, -27)
footerRight.BackgroundTransparency = 1
footerRight.Text = "v1.0.0"
footerRight.TextColor3 = Color3.fromRGB(120, 130, 150)
footerRight.TextSize = 11
footerRight.Font = Enum.Font.Gotham
footerRight.TextXAlignment = Enum.TextXAlignment.Right
footerRight.Parent = mainContainer

task.spawn(function()
    while screenGui.Parent do
        spinner.Rotation = spinner.Rotation + 6
        task.wait(0.01)
    end
end)

TweenService:Create(
    titleBro,
    TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { TextTransparency = 0.2 }
):Play()

TweenService:Create(
    glow,
    TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { ImageTransparency = 0.65 }
):Play()

mainContainer.Size = UDim2.new(0, 320, 0, 240)

local fadeInBg = TweenService:Create(background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.35
})

local fadeInContainer = TweenService:Create(mainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    GroupTransparency = 0,
    Size = UDim2.new(0, 380, 0, 290)
})

fadeInBg:Play()
fadeInContainer:Play()
task.wait(0.6)

local stages = {
    {pct = 0.05, text = "Initializing Bro-Pixel Hub...", delay = 0.30},
    {pct = 0.12, text = "Checking compatibility...", delay = 0.40},
    {pct = 0.22, text = "Initializing security modules...", delay = 0.35},
    {pct = 0.35, text = "Connecting to GitHub repository...", delay = 0.45},
    {pct = 0.48, text = "Downloading latest build...", delay = 0.50},
    {pct = 0.62, text = "Preparing authentication...", delay = 0.40},
    {pct = 0.75, text = "Initializing interface...", delay = 0.45},
    {pct = 0.88, text = "Loading Word Bomb module...", delay = 0.40},
    {pct = 0.96, text = "Finalizing setup...", delay = 0.30},
    {pct = 1.00, text = "Launching Bro-Pixel Hub...", delay = 0.30}
}

for _, stage in ipairs(stages) do
    statusText.Text = stage.text
    percentText.Text = tostring(math.floor(stage.pct * 100)) .. "%"
    
    local fillTween = TweenService:Create(progressBarFill, TweenInfo.new(stage.delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(stage.pct, 0, 1, 0)
    })
    fillTween:Play()
    task.wait(stage.delay + 0.05)
end

task.wait(0.3)

local fadeOutContainer = TweenService:Create(mainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    GroupTransparency = 1,
    Size = UDim2.new(0, 340, 0, 260)
})

local fadeOutBg = TweenService:Create(background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1
})

fadeOutContainer:Play()
fadeOutBg:Play()
fadeOutBg.Completed:Wait()

screenGui:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/bro-pixel11/Bro-PixelHub/main/wordbomb.lua"))()
