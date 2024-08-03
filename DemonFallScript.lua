local Players = game:GetService("Players")

-- إنشاء ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0.5, -175, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Draggable = true
frame.Active = true
frame.Selectable = true
frame.Parent = screenGui

-- إنشاء عنوان
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 30)
titleLabel.Position = UDim2.new(0.5, -150, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "طرد اللاعب"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.Parent = frame

-- إنشاء زر الإغلاق
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Text = "X"
closeButton.Parent = frame

-- حدث عند الضغط على زر الإغلاق
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- إنشاء TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 300, 0, 50)
textBox.Position = UDim2.new(0.5, -150, 0, 50)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 20
textBox.PlaceholderText = "أدخل اسم اللاعب"
textBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
textBox.Parent = frame

-- إنشاء Button لطرد اللاعب
local kickButton = Instance.new("TextButton")
kickButton.Size = UDim2.new(0, 300, 0, 40)
kickButton.Position = UDim2.new(0.5, -150, 0, 120)
kickButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
kickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
kickButton.Font = Enum.Font.SourceSansBold
kickButton.TextSize = 20
kickButton.Text = "طرد اللاعب"
kickButton.Parent = frame

-- وظيفة الطرد
local function kickPlayer()
    local playerName = textBox.Text
    local playerToKick = Players:FindFirstChild(playerName)
    
    if playerToKick then
        playerToKick:Kick("لقد تم طردك من اللعبة.")
    else
        print("اللاعب غير موجود")
    end
end

-- حدث عند الضغط على زر الطرد
kickButton.MouseButton1Click:Connect(kickPlayer)

    end
end

-- حدث عند الضغط على الزر
button.MouseButton1Click:Connect(kickPlayer)
