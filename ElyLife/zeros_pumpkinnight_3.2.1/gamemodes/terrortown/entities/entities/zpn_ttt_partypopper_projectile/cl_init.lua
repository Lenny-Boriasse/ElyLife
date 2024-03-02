include("shared.lua")

function ENT:Initialize()
	zclib.Effect.ParticleEffectAttach("zpn_ppp_head", PATTACH_POINT_FOLLOW, self, 0)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:OnRemove()
	self:StopParticles()
	zclib.Effect.ParticleEffect("zpn_ppp", self:GetPos(), self:GetAngles(), Entity(1))
	sound.Play(zpn.Sounds["projectile_explosion"], self:GetPos(), 90, 100, 0.5)
end
