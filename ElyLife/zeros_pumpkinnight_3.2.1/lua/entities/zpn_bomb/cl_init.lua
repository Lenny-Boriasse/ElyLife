include("shared.lua")

function ENT:Initialize()
	zclib.EntityTracker.Add(self)

	zclib.Effect.ParticleEffectAttach("zpn_fuse", PATTACH_POINT_FOLLOW, self, 1)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
end
