if SERVER then return end

// Called when the PumpkinBoss smashes on the ground
net.Receive("zpn_Boss_SmashImpact_net", function(len, ply)
	zclib.Debug("zpn_Boss_SmashImpact_net Len: " .. len)

	local PumpkinBoss = net.ReadEntity()
	local pos = net.ReadVector()
	local scale = net.ReadFloat()

	if IsValid(PumpkinBoss) and pos and scale then

		// Effect
		local effectdata = EffectData()
		effectdata:SetOrigin(pos)
		effectdata:SetScale(500 * scale)
		effectdata:SetRadius( 100 )
		util.Effect("ThumperDust", effectdata, false, true)

		// Sound
		PumpkinBoss:EmitSound("coast.thumper_dust")
	end
end)

// Called when the PumpkinBoss starts healing
net.Receive("zpn_Boss_StartHeal_net", function(len, ply)
	zclib.Debug("zpn_Boss_StartHeal_net Len: " .. len)

	local PumpkinBoss = net.ReadEntity()

	if IsValid(PumpkinBoss) then
		zclib.Animation.PlayTransition(PumpkinBoss,zpn.Theme.Boss.anim["action_heal_start"], 1,zpn.Theme.Boss.anim["action_heal_loop"],1)
	end
end)

// Called when the PumpkinBoss stops healing
net.Receive("zpn_Boss_StopHeal_net", function(len, ply)
	zclib.Debug("zpn_Boss_StopHeal_net Len: " .. len)

	local PumpkinBoss = net.ReadEntity()

	if IsValid(PumpkinBoss) then

		zclib.Animation.Play(PumpkinBoss,zpn.Theme.Boss.anim["action_heal_end"], 1)
	end
end)
