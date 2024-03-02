include("shared.lua")

function ENT:Initialize()
	zclib.Effect.ParticleEffectAttach(zpn.Theme.Projectile.fly_effect, PATTACH_POINT_FOLLOW, self, 0)
	self:EmitSound("zpn_projectile_fly")
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	//self:DrawModel()
end

function ENT:OnRemove()
	self:StopParticles()
	zclib.Effect.ParticleEffect(zpn.Theme.Projectile.explo_effect, self:GetPos(), self:GetAngles(), Entity(1))
	sound.Play(zpn.Sounds[zpn.Theme.Projectile.explo_sound], self:GetPos(), 75, 100, 0.5)
end
