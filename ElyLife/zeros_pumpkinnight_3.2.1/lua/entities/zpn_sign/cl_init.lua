include("shared.lua")

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()

	self:DrawModel()

	if zclib.Convar.Get("zpn_cl_draw_antighost") == 1 and zclib.util.InDistance(LocalPlayer():GetPos(), self:GetPos(), 3000) then
		render.SetColorMaterial()
		render.DrawSphere( self:GetPos(), zpn.config.AntiGhostSign.Distance, 30, 30, zpn.default_colors["violett01"] )
		render.DrawWireframeSphere( self:GetPos(), zpn.config.AntiGhostSign.Distance, 30, 30, zpn.default_colors["violett03"],true)
	end

end
