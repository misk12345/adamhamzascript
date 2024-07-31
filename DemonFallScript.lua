game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function(item)
    -- تحقق من أن العنصر أُسقط بالفعل من الحقيبة
    if not item:IsDescendantOf(game.Players.LocalPlayer.Backpack) then
        return
    end
    
    -- مضاعفة العنصر إلى 1000 مرة
    for i = 1, 999 do
        local clonedItem = item:Clone()
        clonedItem.Parent = workspace
        clonedItem.Position = item.Position -- ضع النسخ في نفس مكان العنصر الأصلي
    end
    
    -- التأكد من تحديث الرقم ليظهر 1000 بدلاً من 1
    item.Quantity = 1000
end)
