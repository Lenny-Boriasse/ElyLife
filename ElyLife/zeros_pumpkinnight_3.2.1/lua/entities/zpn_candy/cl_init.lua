include("shared.lua")

function ENT:Initialize()
	zclib.EntityTracker.Add(self)

	if zclib.util.RandomChance(50) then
		zclib.Effect.ParticleEffectAttach("zpn_candy01_fx", PATTACH_POINT_FOLLOW, self, 0)
	elseif zclib.util.RandomChance(50) then
		zclib.Effect.ParticleEffectAttach("zpn_candy02_fx", PATTACH_POINT_FOLLOW, self, 0)
	else
		zclib.Effect.ParticleEffectAttach("zpn_candy03_fx", PATTACH_POINT_FOLLOW, self, 0)
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	if zclib.util.InDistance(LocalPlayer():GetPos(), self:GetPos(), 500) then
		self:SetRenderAngles(Angle(0,  15 * math.abs(CurTime() * 5), 0))
		if self:GetDisplayCandy() then
			cam.Start3D2D(self:LocalToWorld(Vector(0,0,35 + (1 * math.abs(math.sin(CurTime()) * 5)))), zclib.HUD.GetLookAngles(), 0.1)
				local candy = self:GetCandy()
				surface.SetDrawColor(color_white)
				surface.SetMaterial(zpn.default_materials[zpn.CandyIcon(candy,50)])
				surface.DrawTexturedRect(-100,-100,200,200)

				draw.SimpleText("+" .. candy, zclib.GetFont("zpn_candy_shadow"), 0, 110, zpn.default_colors["green01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("+" .. candy, zclib.GetFont("zpn_candy"), 0, 110, zpn.default_colors["green01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			cam.End3D2D()
		end
	end
end

function ENT:OnRemove()

end