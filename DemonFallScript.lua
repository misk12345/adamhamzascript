local function onItemDrop(item)
    -- عدد العناصر التي تريد إنشاؤها عند الرمي
    local amount = 1000

    for i = 1, amount do
        -- إنشاء نسخة جديدة من العنصر
        local newItem = item:Clone()
        newItem.Parent = workspace

        -- وضع العنصر في مكان عشوائي بالقرب من مكان الرمي
        newItem.Position = item.Position + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
    end

    -- حذف العنصر الأصلي
    item:Destroy()
end

-- ربط الدالة مع حدث الرمي
game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        child.Activated:Connect(function()
            -- استدعاء الدالة عند تفعيل الأداة
            onItemDrop(child)
        end)
    end
end)
