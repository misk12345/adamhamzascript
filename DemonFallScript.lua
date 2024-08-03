local Players = game:GetService("Players")

-- إنشاء ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- إنشاء TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0, 10)
textBox.PlaceholderText = "أدخل اسم اللاعب"
textBox.Parent = frame

-- إنشاء Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 30)
button.Position = UDim2.new(0.5, -100, 0, 70)
button.Text = "طرد اللاعب"
button.Parent = frame

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

-- حدث عند الضغط على الزر
button.MouseButton1Click:Connect(kickPlayer)
