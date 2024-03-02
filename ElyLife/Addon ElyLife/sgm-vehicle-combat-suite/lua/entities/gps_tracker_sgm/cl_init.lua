include( "shared.lua" )

function ENT:Initialize()
	self:DrawModel()
	self.TargetName = "Unknown..."
end

local material = Material("sprites/light_glow02_add")
local color_red = Color(255,0,0)
local color_green = Color(0,255,0)

local offsetGreen = Vector(0,0,2.7)
local offsetRed = Vector(0,0,3.7)

local function DrawFlasherGreen(ent, scale)
	local pos = ent:LocalToWorld(offsetGreen)
	cam.Start3D()
		render.SetMaterial(material)
		render.DrawSprite(pos, scale, scale, color_green)
		render.DrawSprite(pos, scale*0.4, scale*0.4, color_green)
	cam.End3D()
end

local function DrawFlasherRed(ent, scale, color)
	local pos = ent:LocalToWorld(offsetRed)
	cam.Start3D()
		render.SetMaterial(material)
		render.DrawSprite(pos, scale, scale, color_red)
		render.DrawSprite(pos, scale*0.4, scale*0.4, color_red)
	cam.End3D()
end

function ENT:Draw()
	self:DrawModel()
	local cur_time = CurTime()

	if self:GetHit() then
		DrawFlasherGreen(self, 6 * math.sin(cur_time*7.5 + math.pi / 4))
	else
		DrawFlasherRed(self, 16 * math.sin(cur_time*7.5 + math.pi / 4))
	end
end

local lastTrackerUpdatePos = 0

function ENT:Think()
	if !self:GetHit() then return end
	local cur_time = CurTime()

	if !self.Position then
		self.Position = self:GetPos()
	end

	if self:GetTargetName() ~= self.TargetName then
		timer.Simple(1,function()
			if IsValid(self) then
				self.TargetName = self:GetTargetName()
			end
		end)
	end

	if lastTrackerUpdatePos + SGM_VCS.Config.GPSTracker.PingTime < cur_time or self:GetCopNearby() then
		lastTrackerUpdatePos = cur_time
		self.Position = self:GetPos()
	end
end