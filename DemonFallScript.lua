-- استمع لحدث إسقاط العناصر من الحقيبة
game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function(item)
    -- تحقق إذا كان العنصر قد أُسقط
    if not item:IsDescendantOf(game.Players.LocalPlayer.Backpack) then
        return
    end
    
    -- اسم العنصر المُزال
    local itemName = item.Name
    local itemPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    -- تكثير العنصر إلى 1000 ووضعهم في مكان العنصر المُسقط
    for i = 1, 1000 do
        local clonedItem = item:Clone()
        clonedItem.Parent = workspace
        clonedItem.Position = itemPosition + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
    end
end)
