AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 55
	local ent = ents.Create(self.ClassName)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end
function ENT:GravGunPickupAllowed( ply )
	return false
end

function ENT:Initialize()
	zpn.Minion.Initialize(self)
end

function ENT:PhysicsSimulate(phys, dt)
	zpn.Minion.PhysicsSimulate(self, phys, dt)
end

function ENT:OnTakeDamage(dmginfo)
	zpn.Minion.OnTakeDamage(self, dmginfo)
end

function ENT:OnRemove()
	zpn.Minion.OnRemove(self)
end
