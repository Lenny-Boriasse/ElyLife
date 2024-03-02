include("shared.lua")

function ENT:Initialize()
	zclib.EntityTracker.Add(self)
end

function ENT:Draw()
	self:DrawModel()

	if zclib.Convar.Get("zclib_cl_drawui") == 1 and zclib.util.InDistance(LocalPlayer():GetPos(), self:GetPos(), 500) then
		self:DrawInfo()
	end
end

function ENT:DrawInfo()
	cam.Start3D2D(self:LocalToWorld(Vector(0,0,90 + (3 * math.abs(math.sin(CurTime()) * 1)))), zclib.HUD.GetLookAngles(), 0.1)
		draw.SimpleText(zpn.Theme.NPC.name, zclib.GetFont("zpn_npc_title"), 2, -78, zpn.Theme.Design.color02, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(zpn.Theme.NPC.name, zclib.GetFont("zpn_npc_title"), 0, -80, zpn.Theme.Design.color01, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
