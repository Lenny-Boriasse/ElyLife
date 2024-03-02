AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 0
	local ent = ents.Create(self.ClassName)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	self:SetModel("models/hunter/misc/sphere2x2.mdl")
	self:SetModelScale(2)
	//local r = 400
	//self.PhysObjRadius = r

	//self:PhysicsInitSphere(r, "default")
	//self:SetCollisionBounds(Vector(-r, -r, -r), Vector(r, r, r))

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self:DrawShadow(false)
	self.PhysgunDisabled = true

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		phys:SetMass(100)
		phys:EnableMotion(false)
		phys:Wake()
	else
		self:Remove()

		return
	end

	self:SetTrigger(true)
	self:SetCustomCollisionCheck(true)

	SafeRemoveEntityDelayed(self,zpn.config.Boss.FireRain.Firepit_Duration)
end

function ENT:GravGunPickupAllowed( ply )
	return false
end

function ENT:Touch(other)

	if IsValid(other) and other:IsPlayer() and other:Alive() and (other.zpn_LastFireDamage == nil or other.zpn_LastFireDamage < CurTime()) then

		// Give the player some damage
		local d = DamageInfo()
		d:SetDamage(1)
		d:SetAttacker(self.FireAreaSpawner or self)
		d:SetDamageType(zpn.Theme.FireArea.damagetype)
		other:TakeDamageInfo(d)

		other.zpn_LastFireDamage = CurTime() + 0.75
	end
end
