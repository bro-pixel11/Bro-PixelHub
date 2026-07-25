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
mainContainer.Size = UDim2.new(0, 380, 0, 280)
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
titleBro.Size = UDim2.new(1, 0, 0, 32)
titleBro.Position = UDim2.new(0, 0, 0, 22)
titleBro.BackgroundTransparency = 1
titleBro.Text = "BRO"
titleBro.TextColor3 = Color3.fromRGB(139, 92, 255)
titleBro.TextSize = 28
titleBro.Font = Enum.Font.GothamBold
titleBro.Parent = mainContainer

local titlePixel = Instance.new("TextLabel")
titlePixel.Name = "TitlePixel"
titlePixel.Size = UDim2.new(1, 0, 0, 24)
titlePixel.Position = UDim2.new(0, 0, 0, 52)
titlePixel.BackgroundTransparency = 1
titlePixel.Text = "PIXEL HUB"
titlePixel.TextColor3 = Color3.fromRGB(255, 255, 255)
titlePixel.TextSize = 20
titlePixel.Font = Enum.Font.GothamBold
titlePixel.Parent = mainContainer

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, 0, 0, 16)
subtitle.Position = UDim2.new(0, 0, 0, 82)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Premium Word Bomb Script"
subtitle.TextColor3 = Color3.fromRGB(0, 217, 255)
subtitle.TextSize = 12
subtitle.Font = Enum.Font.GothamMedium
subtitle.Parent = mainContainer

local welcomeText = Instance.new("TextLabel")
welcomeText.Name = "WelcomeText"
welcomeText.Size = UDim2.new(1, 0, 0, 16)
welcomeText.Position = UDim2.new(0, 0, 0, 104)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "Welcome, " .. playerName
welcomeText.TextColor3 = Color3.fromRGB(180, 185, 200)
welcomeText.TextSize = 13
welcomeText.Font = Enum.Font.Gotham
welcomeText.Parent = mainContainer

local spinner = Instance.new("ImageLabel")
spinner.Name = "Spinner"
spinner.Size = UDim2.new(0, 22, 0, 22)
spinner.Position = UDim2.new(0.5, -11, 0, 134)
spinner.BackgroundTransparency = 1
spinner.Image = "rbxassetid://6031280882"
spinner.ImageColor3 = Color3.fromRGB(0, 217, 255)
spinner.Parent = mainContainer

local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(1, 0, 0, 16)
statusText.Position = UDim2.new(0, 0, 0, 168)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing..."
statusText.TextColor3 = Color3.fromRGB(200, 205, 215)
statusText.TextSize = 12
statusText.Font = Enum.Font.Gotham
statusText.Parent = mainContainer

local percentText = Instance.new("TextLabel")
percentText.Name = "PercentText"
percentText.Size = UDim2.new(1, 0, 0, 16)
percentText.Position = UDim2.new(0, 0, 0, 186)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(139, 92, 255)
percentText.TextSize = 13
percentText.Font = Enum.Font.GothamBold
percentText.Parent = mainContainer

local progressBarBackground = Instance.new("Frame")
progressBarBackground.Name = "ProgressBarBackground"
progressBarBackground.Size = UDim2.new(0, 300, 0, 8)
progressBarBackground.Position = UDim2.new(0.5, -150, 0, 215)
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

task.spawn(function()
    while screenGui.Parent do
        spinner.Rotation = spinner.Rotation + 6
        task.wait(0.01)
    end
end)

mainContainer.Size = UDim2.new(0, 320, 0, 230)

local fadeInBg = TweenService:Create(background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.35
})

local fadeInContainer = TweenService:Create(mainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    GroupTransparency = 0,
    Size = UDim2.new(0, 380, 0, 280)
})

fadeInBg:Play()
fadeInContainer:Play()
task.wait(0.6)

local stages = {
    {pct = 0.10, text = "Loading Assets...", delay = 0.4},
    {pct = 0.25, text = "Checking Environment...", delay = 0.5},
    {pct = 0.45, text = "Connecting...", delay = 0.6},
    {pct = 0.60, text = "Loading Word Bomb...", delay = 0.5},
    {pct = 0.80, text = "Finishing...", delay = 0.4},
    {pct = 1.00, text = "Ready!", delay = 0.3}
}

for _, stage in ipairs(stages) do
    statusText.Text = stage.text
    percentText.Text = tostring(math.floor(stage.pct * 100)) .. "%"
    
    local fillTween = TweenService:Create(progressBarFill, TweenInfo.new(stage.delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(stage.pct, 0, 1, 0)
    })
    fillTween:Play()
    task.wait(stage.delay + 0.1)
end

task.wait(0.3)

local fadeOutContainer = TweenService:Create(mainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    GroupTransparency = 1,
    Size = UDim2.new(0, 340, 0, 250)
})

local fadeOutBg = TweenService:Create(background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1
})

fadeOutContainer:Play()
fadeOutBg:Play()
fadeOutBg.Completed:Wait()

screenGui:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/bro-pixel11/Bro-PixelHub/main/wordbomb.lua"))()
