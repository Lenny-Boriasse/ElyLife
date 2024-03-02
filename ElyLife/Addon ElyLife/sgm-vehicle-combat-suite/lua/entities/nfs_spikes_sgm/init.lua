AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

util.AddNetworkString("sgm_vcs.spikes_removed")
util.AddNetworkString("sgm_vcs.spikes_successful")
util.AddNetworkString("sgm_vcs.spikes_successful_remove")

function ENT:Initialize()
	self:SetModel( self.CollapsedModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMaterial("ice")
		phys:Wake()
		phys:SetMass(100)
	end

	self:SetUseType( SIMPLE_USE )
	self:EmitSound("buttons/button4.wav", 85, 120)
	self.Expired = false
end

local color_fadered = Color(255,0,0,250)

--[[
	Fancy fading despawn effect
--]]
function ENT:DespawnSpike()
	if !IsValid(self) then return end

	self:SetCollapsing(true)
	self:SetMaterial("debug/debugdrawflat")
	self:SetRenderMode(1)
	self:SetRenderFX(6)
	self:SetColor(color_fadered)
	self:SetNotSolid(true)
	self:EmitSound("buttons/combine_button_locked.wav", 85, 120)

	timer.Simple(1, function()
		if !IsValid(self) then return end
		self:Remove()
	end)
end

--[[
	Handle hitting tires
--]]
function ENT:Touch(ent)
	if self:GetModel() ~= self.ExpandedModel then return end
	if ent:GetClass() ~= "prop_vehicle_jeep" then return end

	if SGM_VCS.IsCopCar(ent) and SGM_VCS.Config.Spikes.DisableFriendlyFire then return end

	local owner = self:GetOwner()
	local driver = owner:GetDriver()
	local tr = self:GetTouchTrace()
	local hitPos = tr.HitPos

	if !IsValid(ent) or !ent:IsValidVehicle() then return end
	
	if VC and SGM_VCS.Config.Spikes.EnableVCDamage then
		if next(VC) == nil then
			print("[SGM VCS] VCMod damage is enabled, but VCMod is not detected!")
			self:Remove()
			return
		end
		--section for if vcmod damage is enabled
		local damagedParts = ent:VC_getDamagedParts()
		local isWheelDamaged = false 

		--loop through all the wheels
		for i=0,3,1 do
			isWheelDamaged = false
			if damagedParts["wheel"] then
				isWheelDamaged = damagedParts["wheel"][i+1] --if the wheel id shows up here, it's damaged
			end

			if hitPos:DistToSqr(ent:GetWheelContactPoint(i)) < 100 and !isWheelDamaged then --if we're touching a wheel, damage it
				if !self:GetHit() then goto skipHit end --if we have already hit something no need to run the code again
				self:SetHit(true)

				if !IsValid(owner) or !IsValid(driver) then goto skipNotif end --if there is no driver, skip the notif
				if SGM_VCS.Config.Spikes.DespawnAfterHit then
					net.Start("sgm_vcs.spikes_successful_remove") --notify driver that their spikes got a hit
				else
					net.Start("sgm_vcs.spikes_successful") --notify driver that their spikes got a hit
				end
				net.Send(driver)

				::skipNotif:: -- skip to here if there is no driver

				::skipHit:: --skip to here if we've already hit something

				--despawn the spikes after a brief delay (if enabled)
				if !SGM_VCS.Config.Spikes.DespawnAfterHit or self.Expired then goto skipExpire end --skip this if we've already expired or don't want it to expire
				self.Expired = true

				timer.Simple(SGM_VCS.Config.Spikes.SpikeTimer, function()
					if !IsValid(self) then return end
					self:DespawnSpike()
				end)

				::skipExpire:: --skip to here if we've already expired or don't want it to expire

				ent:VC_damagePart("wheel", i+1) --actually damage the wheel
				self:EmitSound("npc/roller/blade_cut.wav", 80, 110)
				damagedParts = ent:VC_getDamagedParts() --get the list of all damaged parts on the car
				
				--if we reach a certain threshold of popped tires, pop every tire and spin the car out
				if !damagedParts["wheel"] then break end
				if #damagedParts["wheel"] >= SGM_VCS.Config.Spikes.SpinoutVCThreshold then
					for i=1,4,1 do
						ent:VC_damagePart("wheel", i)
					end
					SGM_VCS.DoSpinOut(ent,10)
				end
			end
		end
	else
		--section for if vcmod damage disabled
		for i=0,3,1 do
			if hitPos:DistToSqr(ent:GetWheelContactPoint(i)) < 100 and !self:GetHit() then --if we hit a tire, spin the car out
				self:SetHit(true)

				if !IsValid(owner) or !IsValid(driver) then goto skipNotif end --if there is no driver, skip the notif
				if SGM_VCS.Config.Spikes.DespawnAfterHit then
					net.Start("sgm_vcs.spikes_successful_remove") --notify driver that their spikes got a hit
				else
					net.Start("sgm_vcs.spikes_successful") --notify driver that their spikes got a hit
				end
				net.Send(driver)

				::skipNotif:: -- skip to here if there is no driver

				--despawn the spikes after a brief delay (if enabled)
				if !SGM_VCS.Config.Spikes.DespawnAfterHit or self.Expired then goto skipExpire end --skip this if we've already expired or don't want it to expire
				self.Expired = true

				timer.Simple(SGM_VCS.Config.Spikes.SpikeTimer, function()
					if IsValid(self) then
						self:DespawnSpike()
					end
				end)

				::skipExpire:: --skip to here if we've already expired or don't want it to expire

				self:EmitSound("npc/roller/blade_cut.wav", 80, 110)
				SGM_VCS.DoSpinOut(ent,10) --spin the car
			end
		end
	end
end

--[[
	Deploy the spikes when they are used by a vehicle
--]]
function ENT:Use(act, caller, type)
	if caller:GetClass() ~= "prop_vehicle_jeep" then return end
	if self:GetModel() == self.CollapsedModel then
		self:SetModel( self.ExpandedModel )
		timer.Simple(0, function()
			self:ResetSequenceInfo()
			self:EmitSound("weapons/stunstick/alyx_stunner2.wav", 80, 150)
			self:EmitSound("npc/roller/blade_out.wav", 85, 120)
		end)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:PhysWake()
	else
		self:SetModel( self.CollapsedModel )
		self:SetSequence("idle")
		self:PhysicsInit( SOLID_VPHYSICS )
		self:PhysWake()
	end
end

local groundTraceOffset = Vector(0,0,-2.5)

--[[
	Handle latching to the ground and also despawn the spikes once they are abandoned
--]]
function ENT:Think()
	if self:GetModel() ~= self.ExpandedModel then return end

	local owner = self:GetOwner()

	local trace = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + groundTraceOffset,
		mask = MASK_SOLID_BRUSHONLY,
	})
	if trace.Hit and trace.Entity:GetClass() == "worldspawn" and !constraint.HasConstraints(self) then
		constraint.Weld(self, Entity(0), 0, 0, 0, 0, 0)

		if IsValid(self:GetPhysicsObject()) then
			self:GetPhysicsObject():EnableMotion(false)
		end
		
		self:EmitSound("Metal.SawbladeStick")

		local effectdata = EffectData()
		effectdata:SetMagnitude(3)
		for i=-1,1,0.25 do
			effectdata:SetOrigin(self:GetPos() + (self:GetRight()*132*i))
			util.Effect("ElectricSpark", effectdata)
		end
	end

	local pos = self:GetPos()
	local oPos = owner:GetPos()
	--if the owner vehicle abandons the spikes, consider them expired and begin the despawn timer
	if pos:DistToSqr(oPos) > SGM_VCS.Config.Spikes.MaxDistance and !self.Expired then
		self.Expired = true
		timer.Simple(SGM_VCS.Config.Spikes.SpikeTimer, function()
			if !IsValid(self) then return end
			self:DespawnSpike()
		end)
	end
end