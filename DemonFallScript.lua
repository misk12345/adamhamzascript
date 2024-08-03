-- Custom GUI Library
local CustomLib = {}
CustomLib.__index = CustomLib

function CustomLib:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    ScreenGui.Name = "CustomGUI"
    ScreenGui.Parent = game.CoreGui

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0.1, 0)
    Title.Font = Enum.Font.SourceSans
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14
    Title.TextWrapped = true

    local window = {}
    setmetatable(window, CustomLib)
    window.ScreenGui = ScreenGui
    window.MainFrame = MainFrame
    window.Tabs = {}
    return window
end

function CustomLib:NewTab(tabName)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tabName .. "TabButton"
    TabButton.Parent = self.MainFrame
    TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    TabButton.Position = UDim2.new(0, (#self.Tabs) * 0.2, 0)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.Text = tabName
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextScaled = true
    TabButton.TextSize = 14
    TabButton.TextWrapped = true

    local TabFrame = Instance.new("Frame")
    TabFrame.Name = tabName .. "TabFrame"
    TabFrame.Parent = self.MainFrame
    TabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabFrame.Position = UDim2.new(0, 0, 0.1, 0)
    TabFrame.Size = UDim2.new(1, 0, 0.9, 0)
    TabFrame.Visible = false

    table.insert(self.Tabs, TabFrame)

    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.Tabs) do
            tab.Visible = false
        end
        TabFrame.Visible = true
    end)

    return TabFrame
end

function CustomLib:NewButton(tab, buttonText, callback)
    local Button = Instance.new("TextButton")
    Button.Name = buttonText .. "Button"
    Button.Parent = tab
    Button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    Button.Size = UDim2.new(0.9, 0, 0.1, 0)
    Button.Position = UDim2.new(0.05, 0, (#tab:GetChildren() - 1) * 0.12, 0)
    Button.Font = Enum.Font.SourceSans
    Button.Text = buttonText
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.TextSize = 14
    Button.TextWrapped = true

    Button.MouseButton1Click:Connect(callback)
end

function CustomLib:NewDropdown(tab, dropdownText, items, callback)
    local DropdownFrame = Instance.new("Frame")
    local DropdownButton = Instance.new("TextButton")
    local DropdownList = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")

    DropdownFrame.Name = dropdownText .. "DropdownFrame"
    DropdownFrame.Parent = tab
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    DropdownFrame.Size = UDim2.new(0.9, 0, 0.2, 0)
    DropdownFrame.Position = UDim2.new(0.05, 0, (#tab:GetChildren() - 1) * 0.22, 0)

    DropdownButton.Name = dropdownText .. "DropdownButton"
    DropdownButton.Parent = DropdownFrame
    DropdownButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    DropdownButton.Size = UDim2.new(1, 0, 0.5, 0)
    DropdownButton.Font = Enum.Font.SourceSans
    DropdownButton.Text = dropdownText
    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownButton.TextScaled = true
    DropdownButton.TextSize = 14
    DropdownButton.TextWrapped = true

    DropdownList.Name = dropdownText .. "DropdownList"
    DropdownList.Parent = DropdownFrame
    DropdownList.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    DropdownList.BorderSizePixel = 0
    DropdownList.Position = UDim2.new(0, 0, 0.5, 0)
    DropdownList.Size = UDim2.new(1, 0, 0.5, 0)
    DropdownList.CanvasSize = UDim2.new(0, 0, 5, 0)
    DropdownList.ScrollBarThickness = 6
    DropdownList.Visible = false

    UIListLayout.Parent = DropdownList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    DropdownButton.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)

    for _, item in pairs(items) do
        local ItemButton = Instance.new("TextButton")
        ItemButton.Name = item .. "Button"
        ItemButton.Parent = DropdownList
        ItemButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ItemButton.Size = UDim2.new(1, 0, 0.2, 0)
        ItemButton.Font = Enum.Font.SourceSans
        ItemButton.Text = item
        ItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ItemButton.TextScaled = true
        ItemButton.TextSize = 14
        ItemButton.TextWrapped = true

        ItemButton.MouseButton1Click:Connect(function()
            callback(item)
            DropdownButton.Text = dropdownText .. ": " .. item
            DropdownList.Visible = false
        end)
    end
end

return CustomLib

-- حدث عند الضغط على زر الطرد
kickButton.MouseButton1Click:Connect(kickPlayer)

