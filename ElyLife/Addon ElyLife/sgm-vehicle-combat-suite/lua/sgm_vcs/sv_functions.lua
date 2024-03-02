--[[
	Force a car to spin out
--]]
function SGM_VCS.DoSpinOut(ent, force)
    if !SGM_VCS.Config.Spikes.EnableSpinout then return end

	local phys = ent:GetPhysicsObject()
	if !IsValid(phys) then return end

	if phys:GetMass() >= 4500 then return end

	local oldVehParams = ent:GetVehicleParams() --save the vehicles old parameters so we can reapply them later
	local vehParams = ent:GetVehicleParams()

	local speedMultiplier = (ent:GetVelocity():LengthSqr()/10000)
	vehParams.body.maxAngularVelocity = 720

	ent:SetVehicleParams(vehParams) --apply the new vehicle parameters

    if SGM_VCS.Config.Spikes.SpinoutForceDisableBrakes then
	    ent:SetHasBrakePedal(false)
    end

	local oldVehicleAdd = vehParams.body.addGravity

	--make the car slippery by changing all of its wheels into ice
	local oldWheelMaterial = ent:GetWheel(0):GetMaterial()
	local oldMaterial = phys:GetMaterial()
	phys:SetMaterial("ice")

	for i=0,3,1 do
		if IsValid(ent) then
			ent:GetWheel(i):SetMaterial("ice")
		end
	end

	--determine how long the car should stay slippery

	timer.Simple((speedMultiplier/100), function()
		for i=0,3,1 do
			if IsValid(ent) then
				ent:GetWheel(i):SetMaterial(oldWheelMaterial)
			end
		end

		if IsValid(phys) then
			phys:SetMaterial(oldMaterial)
		end

		if IsValid(ent) then
			ent:SetVehicleParams(oldVehParams) --reset the vehicles parameters back to their original values

            if SGM_VCS.Config.Spikes.SpinoutForceDisableBrakes then
			    ent:SetHasBrakePedal(true)
            end
		end
	end)

	--randomize whether the car spins to the left or the right
	local randomizer = math.random(0,2)

	if randomizer > 1 then
		randomizer = 1
	else
		randomizer = -1
	end

	--spin out the car
	local force = SGM_VCS.Config.Spikes.SpinoutForce or 10
	phys:SetAngleVelocityInstantaneous( phys:GetAngleVelocity() + (vector_up * force * randomizer * ( phys:GetMass()/1500 ) * speedMultiplier ) )

end

--[[
	Helper to find a wheels attachment id
--]]
function SGM_VCS.GetWheelAttachmentById(wheelId)
	if wheelId == 1 then return "wheel_fl" end
	if wheelId == 2 then return "wheel_fr" end
	if wheelId == 3 then return "wheel_rl" end
	if wheelId == 4 then return "wheel_rr" end
	return 0
end

--[[
	Lock up a vehicles wheel and put a wrap around it (optional)
--]]
function SGM_VCS.LockupWheel(attacker, target, wheel, attackerpos, targetpos, wheelWrapModel)

	local vehicleParams = target:GetVehicleParams()
	local wheelRadiusFront = vehicleParams.axles[1].wheels_radius
	local wheelRadiusRear = vehicleParams.axles[2].wheels_radius
	local wheelScale = 1

	if wheel <= 2 then
		wheelScale = wheelRadiusFront
	else
		wheelScale = wheelRadiusRear
	end

	attacker.RopedVehicle = target

	--create a constraint between the two vehicles
	attacker.RopedVehicleConstraint = constraint.Elastic(attacker, target, 0, 0, attackerpos, targetpos, 20000, 2000, 0.01, "cable/cable2", 0, true, color_white)

	--create a fake constraint to avoid issues that come from using visible elastic/rope (visual artifacts)
	attacker.FakeRopedVehicleConstraint = constraint.CreateKeyframeRope(attackerpos, 4, "sentry/props/wheelwrap/wrap_rope", attacker.RopedVehicleConstraint, attacker, attackerpos, 0, target, targetpos, 0)

	target.WheelWeld = constraint.Weld(target, target, 0, wheel, 0, false, false)

	local wheelPhys = target:GetWheel(wheel-1)
	local wheelMat = wheelPhys:GetMaterial()

	wheelPhys:SetMaterial("ice") --set the wheel to ice so it can slide across the ground easily

	local wheelAngles =	wheelPhys:GetAngles()
	wheelAngles.p = wheelAngles.p + 180

	local wheelOrigin = wheelPhys:GetPos()


	if wheelWrapModel ~= nil then
		--spawn the wheel wrap model, set the positions etc, and initialize it
		target.WheelWrap = ents.Create("prop_physics")
		target.WheelWrap:SetMoveType( MOVETYPE_NONE )
		target.WheelWrap:SetNotSolid(true)
		target.WheelWrap:SetModel(wheelWrapModel)
		target:DeleteOnRemove(target.WheelWrap)
		target.WheelWrap:SetParent(target, target:LookupAttachment(SGM_VCS.GetWheelAttachmentById(wheel)))
		target.WheelWrap:SetPos(wheelOrigin)
		target.WheelWrap:SetAngles(wheelAngles)
		target.WheelWrap:Spawn()
		target.WheelWrap:SetNotSolid(true)
		target.WheelWrap:ManipulateBoneScale(0, Vector(0.0575 * wheelScale, 0.0575 * wheelScale, 1.2*(wheelScale/18)))
		target.WheelWrap.Wheel = wheel
		target.WheelWrap:EmitSound("weapons/tripwire/ropeshoot.wav", 80, 120)

		timer.Simple(math.Clamp((target:GetVelocity():LengthSqr()/3000),0.15,0.5), function()
			if IsValid(target.WheelWrap) then
				target.WheelWrap:StopSound("weapons/tripwire/ropeshoot.wav")
			end
		end)

		target.WheelWrap:CallOnRemove("ResetWheels", function()
			local driver = attacker:GetDriver()

			if IsValid(target.WheelWeld) then
				target.WheelWeld:Remove()
			end

			if IsValid(driver) then
				net.Start("sgm_vcs.wheelgrabber_remove") --notify driver of the removal
				net.Send(driver)
			end

			target.WheelWrap:EmitSound("ambient/materials/roust_crash2.wav", 80, 150)
			wheelPhys:SetMaterial(wheelMat or "phx_rubbertire2") --reset the wheel back to a grippy material instead of ice
		end)
	end

	--put the attacking vehicles grabber on cooldown
	if IsValid(attacker.WheelGrabber) then
		attacker.lastGrabber = CurTime() + (SGM_VCS.Config.WheelGrabber.SuccessfulHitTimer or 0)
	end

	target:CallOnRemove("ReenableRopes", function()
		if IsValid(attacker.WheelGrabber) then
			attacker.WheelGrabber:SetHit(false)
			attacker.WheelGrabber:SetCollisionGroup( COLLISION_GROUP_VEHICLE_CLIP )

			if attacker.WheelGrabber:GetBodygroup(2) ~= 1 and attacker.WheelGrabber:GetDeployed() then
				attacker.WheelGrabber:SetBodygroup(2,1)
			end
		end
	end)

	attacker:CallOnRemove("RemoveWheelWelds", function()
		if IsValid(target.WheelWeld) then
			target.WheelWeld:Remove()
		end

		if IsValid(target.WheelWrap) then
			target.WheelWrap:Remove()
		end
	end)

	if SGM_VCS.Config.WheelGrabber.DespawnTimer > 0 then
		timer.Simple(SGM_VCS.Config.WheelGrabber.DespawnTimer, function()
			if IsValid(target.WheelWrap) then
				target.WheelWrap:Remove()
			end
		end)
	end
end

function SGM_VCS.IsCopCar(ent)
	if !IsValid(ent) or !ent:IsValidVehicle() then return false end

	--if using a list as the detection method, use that
    if next(SGM_VCS.Config.DetectionList) ~= nil then return SGM_VCS.Config.DetectionList[ent:GetVehicleClass()] or false end

    if SGM_VCS.Config.DetectionMethod == "BOTH" then
        if SGM_VCS.DetectPhoton(ent) then return true end
        if SGM_VCS.DetectVCModELS(ent) then return true end
    end

    if SGM_VCS.Config.DetectionMethod == "VC" then
        if SGM_VCS.DetectVCModELS(ent) then return true end
    end

    if SGM_VCS.Config.DetectionMethod == "PHOTON" then
        if SGM_VCS.DetectPhoton(ent) then return true end
    end

	return false
end

function SGM_VCS.DetectPhoton(ent)
    if !IsValid(ent) or !ent:IsValidVehicle() then return false end
	if Photon then
		if ent:IsEMV() then return true end
	end
end

function SGM_VCS.DetectVCModELS(ent)
	--hacky way to detect vcmod els
	if next(VC) ~= nil then
		local lights = ent:VC_getLights()
		if lights ~= nil then
			for _,v in ipairs(lights) do
				if v.isELS then
					return true
				end
			end
		end
	end
end
