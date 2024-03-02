include("shared.lua")

function ENT:Initialize()
	zclib.Effect.ParticleEffectAttach(zpn.Theme.FireArea.effect, PATTACH_POINT_FOLLOW, self, 0)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	//self:DrawModel()
end

function ENT:OnRemove()
	self:StopParticles()
end
