include( "shared.lua" )

function ENT:Initialize()
	self:DrawModel()
end

local midLeft = Vector(0,-5,5.5)
local midRight = Vector(0,5,5.5)

local color_amber = Color(255,128,0)
local color_blue = Color(0,0,255)
local color_green = Color(0,255,0)

local material = Material("sprites/light_glow02_add")

local pos = Vector(0,0,0)

local function DrawFlasher(ent, bone, offsetAmount, scale, color)
	local boneId = ent:LookupBone(bone) or 0

	if boneId > 0 then
		local matrix = ent:GetBoneMatrix(boneId)
		pos = matrix:GetTranslation() + (ent:GetUp() * offsetAmount)
	else
		if isvector(offsetAmount) then
			pos = ent:LocalToWorld(offsetAmount)
		else
			pos = ent:GetPos() + (ent:GetUp() * offsetAmount)
		end
	end

	cam.Start3D()
		render.SetMaterial(material)
		render.DrawSprite(pos, scale, scale, color)
		render.DrawSprite(pos, scale*0.4, scale*0.4, color_green)
	cam.End3D()
end

function ENT:Draw()
	self:DrawModel()
	local cur_time = CurTime()

	if self:GetModel() == self.ExpandedModel then
		if self:GetSequence() ~= self:LookupSequence("deploy_anim") and !self:GetCollapsing() then
			self:SetSequence("deploy_anim")
		else
			if self:GetSequence() ~= self:LookupSequence("collapse_anim") and self:GetCollapsing() then
				self:SetSequence("collapse_anim")
			end
		end
		
		--middle
		DrawFlasher(self, "", midLeft, 64 * math.sin(cur_time*7.5 + math.pi / 4), color_amber)
		DrawFlasher(self, "", midRight, 64 * math.sin(cur_time*7.5 - math.pi / 4), color_amber)
		--outer
		DrawFlasher(self, "Object001", 4, 64 * math.sin(cur_time*7.5), color_blue)
		DrawFlasher(self, "Object002", 4, 64 * math.sin(cur_time*7.5 + math.pi / 2), color_blue)
	end
end