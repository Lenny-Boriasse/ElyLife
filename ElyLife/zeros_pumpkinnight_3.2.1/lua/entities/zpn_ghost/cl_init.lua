include("shared.lua")

function ENT:Initialize()
	zpn.Ghost.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zpn.Ghost.Draw(self)
end

function ENT:Think()
	zpn.Ghost.OnThink(self)
	self:SetNextClientThink(CurTime())

	return true
end

function ENT:OnRemove()
	zpn.Ghost.OnRemove(self)
end
