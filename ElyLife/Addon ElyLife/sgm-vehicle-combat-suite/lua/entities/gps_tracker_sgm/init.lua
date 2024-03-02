AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

util.AddNetworkString("sgm_vcs.gpstracker_add")
util.AddNetworkString("sgm_vcs.gpstracker_update")
util.AddNetworkString("sgm_vcs.gpstracker_clear")
util.AddNetworkString("sgm_vcs.gpstracker_remove")
util.AddNetworkString("sgm_vcs.gpstracker_hit")
util.AddNetworkString("sgm_vcs.gpstracker_cooldown")
util.AddNetworkString("sgm_vcs.gpstracker_alreadyactive")

local color_red = Color(255,0,0)

function ENT:Initialize()
	self:SetModel( self.Model )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetModelScale(0.25)
	self:Activate()

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetMass(10)
	end

	self:SetPoseParameter("blendstates", 65)
	self.Trail = util.SpriteTrail(self, 0, color_red, true, 20, 0, 0.5, 0.1, "trails/laser")

	self:EmitSound("weapons/crossbow/fire1.wav", 75, 125)

	timer.Simple(5, function()
		if !IsValid(self) or self:GetHit() then return end
		self:Remove()
	end)

end

local touchOffset = Vector(0,0,-3)

--[[
	Latch onto vehicles
--]]
function ENT:Touch(ent)
	if ent:GetClass() ~= "prop_vehicle_jeep" then return end
	if SGM_VCS.IsCopCar(ent) then return end

	local owner = self:GetOwner()
	local tr = self:GetTouchTrace()

	local hitPos = tr.HitPos

	if ent:IsValid() and ent:IsValidVehicle() and !self:GetHit() and !IsValid(ent.GPSTracker) then
		local vehClass = ent:GetVehicleClass()
		local targetName = list.Get("Vehicles")[vehClass].Name or "Unknown???"

		if IsValid(owner) then
			owner.lastTracker = owner.lastTracker + SGM_VCS.Config.GPSTracker.SuccessfulHitTimer --put the vehicles tracker system on cooldown after a hit
		end

		ent.GPSTracker = self --register the vehicle as tracked so that we can't have multiple trackers on the same car
		self:SetTargetName(targetName) --get the name of the vehicle we're latched onto
		self:SetHit(true)

		local angle = tr.HitNormal:Angle()
		angle.p = angle.p - 90
		self:SetAngles(angle)
		self:SetNotSolid(true)
		self:SetPos(self:LocalToWorld(touchOffset)) --make the tracker dig into the car a little bit to make it seem latched on
		self:SetParent(ent)
		self:SetPoseParameter("blendstates", 0)

		timer.Simple(1, function() 
			if !IsValid(self) then return end
			if IsValid(self.Trail) then
				self.Trail:Remove()
			end
		end)

		local effectdata = EffectData()
		effectdata:SetMagnitude(2)
		effectdata:SetOrigin(self:GetPos())
		util.Effect("ElectricSpark", effectdata)

		if owner:IsVehicle() and IsValid(owner:GetDriver()) then
			net.Start("sgm_vcs.gpstracker_hit") --notify the driver that they got a successful hit
			net.Send(owner:GetDriver())
		end

		self:EmitSound("npc/scanner/scanner_siren1.wav", 70, 100) --latching sounds
		self:EmitSound("npc/roller/blade_out.wav", 60, 110)
		self:EmitSound("npc/scanner/scanner_scan_loop1.wav", 45, 100) --emit a quiet hum from the tracker while it's latched

		timer.Simple(SGM_VCS.Config.GPSTracker.Duration, function()
			if !IsValid(self) then return end
			self:Remove()
		end)

		net.Start("sgm_vcs.gpstracker_add") --add the tracker to the clientside list of active trackers
			net.WriteEntity(self)
		net.Broadcast()
	end
end

--[[
	Fancy despawn effects
--]]
function ENT:OnRemove()
	self:EmitSound("npc/roller/mine/rmine_tossed1.wav", 70, 110)
	self:EmitSound("npc/scanner/scanner_explode_crash2.wav",70, 120)
	self:StopSound("npc/scanner/scanner_scan_loop1.wav")

	local effectdata = EffectData()
	effectdata:SetMagnitude(2)
	effectdata:SetOrigin(self:GetPos())
	util.Effect("ElectricSpark", effectdata)
end

--[[
	Make sure the entity remains valid on the client while it's in tracking mode
--]]
function ENT:UpdateTransmitState()
	if self:GetHit() then
		return TRANSMIT_ALWAYS
	else
		return TRANSMIT_PVS
	end
end

local lastTrackerUpdate = 0

function ENT:Think()
	if !self:GetHit() then return end

	local cur_time = CurTime()

	if lastTrackerUpdate + 5 > cur_time then return end
	lastTrackerUpdate = cur_time

	local nearbyEnts = ents.FindInSphere(self:GetPos(), 1000)

	self:SetCopNearby(false)

	for _,v in ipairs(nearbyEnts) do
		if v:IsValid() and v:IsPlayer() and SGM_VCS.IsPlayerCop(v) then
			self:SetCopNearby(true)
			break
		end
	end
end