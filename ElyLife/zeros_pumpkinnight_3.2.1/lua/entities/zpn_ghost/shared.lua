ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_pumpkinnight/zpn_ghost.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Ghost"
ENT.Category = "Zeros PumpkinNight"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "MonsterHealth")
    self:NetworkVar("Int", 1, "Candy")
    self:NetworkVar("Int", 2, "ActionState")
    self:NetworkVar("Vector", 0, "TargetPos")

    if SERVER then
        self:SetCandy(0)
        self:SetActionState(0)
        self:SetTargetPos(Vector(0, 0, 0))
    end
end
