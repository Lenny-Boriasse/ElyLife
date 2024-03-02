AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create(self.ClassName)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	angle:RotateAroundAxis(angle:Up(), 180)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	zpn.Slapper.Initialize(self)
end

function ENT:OnRemove()
	zpn.Slapper.OnRemove(self)
end

function ENT:AcceptInput(key, ply)
	if ((self.lastUsed or CurTime()) <= CurTime()) and (key == "Use" and IsValid(ply) and ply:IsPlayer() and ply:Alive()) and zclib.util.InDistance(ply:GetPos(), self:GetPos(), 300) then
		self.lastUsed = CurTime() + 1
		zpn.Slapper.OnUse(self, ply)
	end
end

function ENT:Touch(other)
	zpn.Slapper.Touch(self, other)
end
