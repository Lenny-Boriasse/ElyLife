local plusThree = Vector(0,0,3)
local spikeAng = Angle(0,90,0)
local spikeTraceBottom = Vector(0,0,-60)

local trackerSpawnPos = Vector(0, 90, 30)
local trackerSpawnAng = Angle(0,0,100)

--[[
	Handle player keypresses
--]]
hook.Add("PlayerButtonDown", "SGM_VCS.KeyPresses", function(ply, button)
    if !ply:InVehicle() then return end

    local vehicle = ply:GetVehicle()
    if vehicle:GetClass() ~= "prop_vehicle_jeep" or !SGM_VCS.IsCopCar(vehicle) or !SGM_VCS.IsPlayerCop(ply) then return end

	local vehClass = vehicle:GetVehicleClass()

	local cur_time = CurTime()

	vehicle.lastSpike = vehicle.lastSpike or 0

	--handle spike strips
	if button == SGM_VCS.Config.Spikes.KeyBind and (vehicle.lastSpike < cur_time - SGM_VCS.Config.Spikes.Cooldown) and !ply.hasSpikesOut and SGM_VCS.Config.Spikes.Enabled then
		local wsc = vehicle:WorldSpaceCenter()
		local trace = util.TraceLine({
			start = wsc + vehicle:GetForward()*-120,
			endpos = wsc + vehicle:GetForward()*-120 + spikeTraceBottom,
			mask = MASK_SOLID_BRUSHONLY,
		})

		if trace.Hit then
			vehicle.lastSpike = cur_time

			local spike = ents.Create("nfs_spikes_sgm")
			vehicle:DeleteOnRemove(spike)
			spike:SetPos(trace.HitPos + plusThree)
			spike:SetAngles(vehicle:LocalToWorldAngles(spikeAng))
			spike:Spawn()
			spike:SetOwner(vehicle)

			if IsValid(spike:GetPhysicsObject()) then 
				spike:GetPhysicsObject():SetVelocity(vehicle:GetVelocity()*0.75)
			end
			
			spike:CallOnRemove("spikeRemoved", function()
				if IsValid(ply) then
					ply.hasSpikesOut = false
					net.Start("sgm_vcs.spikes_removed")
					net.Send(ply)
				end
			end)

			ply.hasSpikesOut = true

			timer.Simple(1, function()
				if IsValid(spike) then
					spike:Use(ply, vehicle)
				end
			end)
		end
	end

	--handle wheel grabber
	if button == SGM_VCS.Config.WheelGrabber.KeyBind and SGM_VCS.Config.WheelGrabber.Enabled then
		if !SGM_VCS.Config.WheelGrabber.VehicleList[vehClass] then return end

		vehicle.lastGrabber = vehicle.lastGrabber or 0

		if (vehicle.lastGrabber > cur_time - SGM_VCS.Config.WheelGrabber.Cooldown) and !vehicle.WheelGrabber:GetDeployed() then 
			if IsValid(ply) then
				net.Start("sgm_vcs.wheelgrabber_cooldown")
				net.Send(ply)
			end
			return
		end

		vehicle.lastGrabber = cur_time

		if !IsValid(vehicle.WheelGrabber.FakeProp) then return end

		if IsValid(vehicle.WheelGrabber) and !vehicle.WheelGrabber:GetDeployed() then
			vehicle.WheelGrabber:SetDeployed(true)
			vehicle.WheelGrabber:EmitSound("npc/turret_floor/deploy.wav", 70, 105)
			vehicle.WheelGrabber.FakeProp:SetBodygroup(3, 0)
			vehicle.WheelGrabber.FakeProp:SetBodygroup(1, 1)

			if vehicle.WheelGrabber:GetHit() then
				vehicle.WheelGrabber.FakeProp:SetBodygroup(2,2)
			else
				vehicle.WheelGrabber.FakeProp:SetBodygroup(2,1)
			end

			vehicle.WheelGrabber.FakeProp:ResetSequenceInfo()
			vehicle.WheelGrabber.FakeProp:SetSequence("collapse")

			if SGM_VCS.Config.WheelGrabber.ForceCloseTimer > 0 then
				timer.Simple(SGM_VCS.Config.WheelGrabber.ForceCloseTimer,function()
					if IsValid(vehicle.WheelGrabber) and vehicle.WheelGrabber:GetDeployed() then
						--update the visuals on the fake wheel grabber model
						vehicle.WheelGrabber:SetDeployed(false)
						vehicle.WheelGrabber:EmitSound("npc/turret_floor/retract.wav", 70, 105)
						vehicle.WheelGrabber.FakeProp:SetBodygroup(3, 1)
						vehicle.WheelGrabber.FakeProp:SetBodygroup(2, 0)
						vehicle.WheelGrabber.FakeProp:SetBodygroup(1, 0)
						vehicle.WheelGrabber.FakeProp:ResetSequenceInfo()
						vehicle.WheelGrabber.FakeProp:SetSequence("unfold")

						if SGM_VCS.Config.WheelGrabber.DisableHandbrake then
							vehicle:SetHasBrakePedal(true)
						end

						if IsValid(vehicle.RopedVehicleConstraint) then
							vehicle.WheelGrabber:EmitSound("npc/roller/blade_in.wav", 70, 120)
							vehicle.RopedVehicleConstraint:Remove()
						end

						if IsValid(vehicle.FakeRopedVehicleConstraint) then
							vehicle.FakeRopedVehicleConstraint:Remove()
						end
					end
				end)
			end
		else
			--update the visuals on the fake wheel grabber model
			vehicle.WheelGrabber:SetDeployed(false)
			vehicle.WheelGrabber:EmitSound("npc/turret_floor/retract.wav", 75, 105)

			vehicle.WheelGrabber.FakeProp:SetBodygroup(3, 1)
			vehicle.WheelGrabber.FakeProp:SetBodygroup(2, 0)
			vehicle.WheelGrabber.FakeProp:SetBodygroup(1, 0)
			vehicle.WheelGrabber.FakeProp:ResetSequenceInfo()
			vehicle.WheelGrabber.FakeProp:SetSequence("unfold")

			if SGM_VCS.Config.WheelGrabber.DisableHandbrake then
				vehicle:SetHasBrakePedal(true)
			end

			if IsValid(vehicle.RopedVehicleConstraint) then
				vehicle.WheelGrabber:EmitSound("npc/roller/blade_in.wav", 75, 120)
				vehicle.RopedVehicleConstraint:Remove()
			end

			if IsValid(vehicle.FakeRopedVehicleConstraint) then
				vehicle.FakeRopedVehicleConstraint:Remove()
			end
		end
	end
	--handle gps tracker
	vehicle.lastTracker = vehicle.lastTracker or 0

	if button == SGM_VCS.Config.GPSTracker.KeyBind and SGM_VCS.Config.GPSTracker.Enabled then
		if (vehicle.lastTracker > cur_time - SGM_VCS.Config.GPSTracker.Cooldown) then 
			if IsValid(ply) then
				net.Start("sgm_vcs.gpstracker_cooldown")
				net.Send(ply)
			end
			return
		end

		if ply.hasGPSTrackerOut then
			if IsValid(ply) then
				net.Start("sgm_vcs.gpstracker_alreadyactive")
				net.Send(ply)
			end
			return
		end

		vehicle.lastTracker = cur_time

		local tracker = ents.Create("gps_tracker_sgm")
		vehicle:DeleteOnRemove(tracker)
		tracker:SetPos(vehicle:LocalToWorld(trackerSpawnPos))
		tracker:SetAngles(vehicle:LocalToWorldAngles(trackerSpawnAng))
		tracker:Spawn()
		tracker:SetOwner(vehicle)

		if IsValid(tracker:GetPhysicsObject()) then
			tracker:GetPhysicsObject():SetVelocity(vehicle:GetVelocity() + tracker:GetUp() * -800)
		end
		
		tracker:CallOnRemove("trackerRemoved", function()
			if IsValid(ply) then
				ply.hasGPSTrackerOut = false
				net.Start("sgm_vcs.gpstracker_remove")
				net.Send(ply)
			end
		end)

		ply.hasGPSTrackerOut = true
	end
end)

--[[
	Add wheel grabbers to vehicles when they're spawned
--]]
hook.Add("OnEntityCreated", "SGM_VCS.SpawnWheelGrabber", function(ent)
	if ent:GetClass() ~= "prop_vehicle_jeep" then return end

	timer.Simple(0.25, function()
		local vehClass = ent:GetVehicleClass()
		if !SGM_VCS.Config.WheelGrabber.VehicleList[vehClass] then return end

		if !IsValid(ent.WheelGrabber) then
			ent.WheelGrabber = ents.Create("tire_grabber_sgm")
			ent:DeleteOnRemove(ent.WheelGrabber)
			ent.WheelGrabber:SetPos(ent:LocalToWorld(SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].pos or vector_origin))
			ent.WheelGrabber:SetAngles(ent:LocalToWorldAngles(SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].ang or angle_zero))
			ent.WheelGrabber:SetOwner(ent)
			ent.WheelGrabber:Spawn()
			ent.WheelGrabber:SetModelScale(SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].scale or 1, 0)
			ent.WheelGrabber:Activate()

			timer.Simple(0.25, function()
				if IsValid(ent.WheelGrabber.FakeProp) then
					ent.WheelGrabber.FakeProp:SetBodygroup(4, SGM_VCS.Config.WheelGrabber.VehicleList[vehClass].style or 0)
				end
			end)

			constraint.Weld(ent.WheelGrabber, ent, 0, 0, false, false)
		end
	end)
end)

--[[
	Generate a list of current cops, this is used to broadcast GPS tracker information
--]]

local lastCopUpdate = 0
local cops = {}

hook.Add("Think", "SGM_VCS.UpdateCopList", function()
	--only run every 15 seconds for optimization purposes
	local cur_time = CurTime()

	if cur_time < lastCopUpdate + 15 then return end
	lastCopUpdate = cur_time
	local players = player.GetHumans()
	table.Empty(cops)
	for _,v in ipairs(players) do
		if SGM_VCS.IsPlayerCop(v) then
			table.insert(cops, v)
		end
	end
	--print("[SGM VCS] Updating cops list...")
	--PrintTable(cops)
end)

--[[
	Update tracker information and clear information from non-cops
--]]

local lastTrackerUpdate = 0

hook.Add("Think", "SGM_VCS.UpdateTrackerPositions", function()
	local cur_time = CurTime()

	if cur_time < lastTrackerUpdate + 5 then return end
	lastTrackerUpdate = cur_time
	--make sure to clear tracker entities from non-cops
	net.Start("sgm_vcs.gpstracker_clear")
	net.SendOmit(cops)
	--Entity(1):ChatPrint("tracker tick")
end)