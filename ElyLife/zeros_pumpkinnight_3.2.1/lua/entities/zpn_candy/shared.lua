ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Candy"
ENT.Category = "Zeros PumpkinNight"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "Candy")
    self:NetworkVar("Bool", 0, "DisplayCandy")

    if SERVER then
        self:SetCandy(5)
        self:SetDisplayCandy(false)
    end
end
