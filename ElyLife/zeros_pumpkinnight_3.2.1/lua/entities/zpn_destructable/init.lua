AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create(self.ClassName)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	zpn.Destructable.Initialize(self)
end

function ENT:PhysicsCollide(data, phys)
	zpn.Destructable.OnPhysicsCollide(self,data)
end


function ENT:OnTakeDamage( dmginfo )
	 zpn.Destructable.OnTakeDamage(self, dmginfo )
end

function ENT:OnRemove()
	zpn.Destructable.OnRemove(self)
end
