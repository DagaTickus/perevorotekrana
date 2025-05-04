local screenRotation = 0
local textyrka = Material("models/screenspace")
hook.Add("RenderScreenspaceEffects", "RotateScreenOnShoot", function()
    if screenRotation ~= 0 then
        local centerX, centerY = ScrW() / 2, ScrH() / 2

        local width, height = ScrW(), ScrH()
        if screenRotation % 180 ~= 0 then
            width, height = ScrH(), ScrW()
        end

        cam.Start2D()
            surface.SetMaterial(textyrka)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRectRotated(centerX, centerY, width, height, screenRotation)
        cam.End2D()
    end
end)
hook.Add("EntityFireBullets", "DetectPlayerShoot", function(ent, data)
    -- стреляет
    if ent:IsPlayer() and ent == LocalPlayer() then
        screenRotation = (screenRotation + 90) % 360
    end
end)
