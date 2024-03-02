ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_pumpkinnight/zpn_pumpkin01.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Minion"
ENT.Category = "Zeros PumpkinNight"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "PlayerTarget")
	self:NetworkVar("Int", 0, "MonsterHealth")
end
