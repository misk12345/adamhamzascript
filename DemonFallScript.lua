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

-- إنشاء Dropdown Menu
local playerDropdown = Instance.new("TextButton")
playerDropdown.Size = UDim2.new(0, 300, 0, 50)
playerDropdown.Position = UDim2.new(0.5, -150, 0, 50)
playerDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
playerDropdown.Font = Enum.Font.SourceSans
playerDropdown.TextSize = 20
playerDropdown.Text = "اختر اللاعب"
playerDropdown.Parent = frame

local dropdownFrame = Instance.new("Frame")
dropdownFrame.Size = UDim2.new(0, 300, 0, 150)
dropdownFrame.Position = UDim2.new(0.5, -150, 0, 100)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdownFrame.Visible = false
dropdownFrame.Parent = frame

local function updateDropdown()
    for _, child in ipairs(dropdownFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local players = Players:GetPlayers()
    for i, player in ipairs(players) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 0, 30)
        button.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 20
        button.Text = player.Name
        button.Parent = dropdownFrame

        button.MouseButton1Click:Connect(function()
            playerDropdown.Text = player.Name
            dropdownFrame.Visible = false
        end)
    end
end

playerDropdown.MouseButton1Click:Connect(function()
    dropdownFrame.Visible = not dropdownFrame.Visible
    updateDropdown()
end)

-- إنشاء Button لطرد اللاعب
local kickButton = Instance.new("TextButton")
kickButton.Size = UDim2.new(0, 300, 0, 40)
kickButton.Position = UDim2.new(0.5, -150, 0, 160)
kickButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
kickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
kickButton.Font = Enum.Font.SourceSansBold
kickButton.TextSize = 20
kickButton.Text = "طرد اللاعب"
kickButton.Parent = frame

-- وظيفة الطرد
local function kickPlayer()
    local playerName = playerDropdown.Text
    if playerName == "اختر اللاعب" then
        print("الرجاء اختيار اللاعب")
        return
    end
    local playerToKick = Players:FindFirstChild(playerName)
    
    if playerToKick then
        playerToKick:Kick("لقد تم طردك من اللعبة.")
    else
        print("اللاعب غير موجود")
    end
end

-- حدث عند الضغط على زر الطرد
kickButton.MouseButton1Click:Connect(kickPlayer)

