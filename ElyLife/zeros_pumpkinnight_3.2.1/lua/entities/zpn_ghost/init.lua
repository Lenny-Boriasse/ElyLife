AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create(self.ClassName)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	angle:RotateAroundAxis(angle:Up(),180)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	zpn.Ghost.Initialize(self)
end

function ENT:OnTakeDamage(dmginfo)
	zpn.Ghost.OnTakeDamage(self, dmginfo)
end

function ENT:OnRemove()
	zpn.Ghost.OnRemove(self)
end

function ENT:GravGunPickupAllowed(ply)
	return false
end

function ENT:GravGunPunt(ply)
	return false
end

function ENT:PhysicsSimulate(phys, deltatime)
	zpn.Ghost.PhysicsSimulate(self, phys, deltatime)
end
