ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_pumpkinnight/zpn_pumpkinboss.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Boss"
ENT.Category = "Zeros PumpkinNight"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar( "Int", 0, "MonsterHealth" )
    self:NetworkVar( "Int", 1, "ActionState" )
    self:NetworkVar( "Int", 2, "Shield" )
    self:NetworkVar( "Vector", 0, "TargetPos" )

    if SERVER then
        self:SetActionState(-1)
        self:SetTargetPos(Vector(0,0,0))
        self:SetShield(0)
    end
end
