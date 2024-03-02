AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

util.AddNetworkString("sgm_vcs.wheelgrabber_hit")
util.AddNetworkString("sgm_vcs.wheelgrabber_remove")
util.AddNetworkString("sgm_vcs.wheelgrabber_cooldown")

function ENT:Initialize()
	self:SetModel( self.Model )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_VEHICLE_CLIP )

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetMass(100)
	end

	self:SetRenderMode( RENDERMODE_NONE )
	self:DrawShadow(false)

	--create a fake prop without collisions for visuals
	timer.Simple(0, function() 
	self.FakeProp = ents.Create("prop_physics")
	self.FakeProp:SetModel( self.Model )
	self.FakeProp:SetMoveType( MOVETYPE_NONE )
	self.FakeProp:SetPos(self:GetPos())
	self.FakeProp:SetAngles(self:GetAngles())
	self.FakeProp:SetParent(self:GetOwner())
	self.FakeProp:SetBodygroup(3,1)
	self.FakeProp:SetModelScale(self:GetModelScale(), 0)
	self.FakeProp:Activate()
	self:DeleteOnRemove(self.FakeProp)
	end)
end

local grabberOffset = Vector(0, 10.488, -2.049)

--[[
	Handle touching wheels
--]]
function ENT:Touch(ent)
	if ent:GetClass() ~= "prop_vehicle_jeep" then return end
	if SGM_VCS.IsCopCar(ent) then return end

	if !self:GetDeployed() then return end
	if IsValid(ent.WheelWrap) then return end

	local owner = self:GetOwner()
	local vehClass = owner:GetVehicleClass()
	local tr = self:GetTouchTrace()
	local hitPos = tr.HitPos

	if ent:IsValid() and ent:IsValidVehicle() then
		--if we hit a vehicle, begin to loop through every wheel
		for i=0,3,1 do
			local contactPoint = ent:GetWheelContactPoint(i)

			--if we hit a wheel, lock it up and exit the loop
			if hitPos:DistToSqr(contactPoint) < 1600 and !self:GetHit() and !IsValid(owner.RopedVehicle) then
				self:SetHit(true)
				self:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )

				if IsValid(owner:GetDriver()) then
					net.Start("sgm_vcs.wheelgrabber_hit")
					net.Send(owner:GetDriver())
				end

				SGM_VCS.LockupWheel(owner, ent, i+1, (SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].pos + (grabberOffset*(SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].scale or 1))) or vector_origin, ent:WorldToLocal(contactPoint), self.WheelWrapModel)

				self.FakeProp:SetBodygroup(2,2)

				if SGM_VCS.Config.WheelGrabber.DisableHandbrake then
					owner:SetHasBrakePedal(false)
				end
				break
			end
		end
	end
end

function ENT:OnRemove()
	local owner = self:GetOwner()
	if IsValid(owner.RopedVehicleConstraint) then
		owner.RopedVehicleConstraint:Remove()
	end
	if IsValid(owner.FakeRopedVehicleConstraint) then
		owner.FakeRopedVehicleConstraint:Remove()
	end
end