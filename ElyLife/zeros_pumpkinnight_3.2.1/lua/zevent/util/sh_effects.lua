zclib.NetEvent.AddDefinition("zpn_bomb_explode", {
	[1] = {
		type = "entity"
	}
}, function(received)
	local ent = received[1]
	if not IsValid(ent) then return end
	zclib.Effect.ParticleEffect("zpn_fireexplosion", ent:GetPos(), angle_zero, ent)
	ent:EmitSound("zpn_bomb_explode")
end)

zclib.NetEvent.AddDefinition("zpn_bomb_removefuse", {
	[1] = {
		type = "entity"
	}
}, function(received)
	local ent = received[1]
	if not IsValid(ent) then return end
	ent:StopParticlesNamed("zpn_fuse")
end)

zclib.NetEvent.AddDefinition("zpn_partypopper_normal", {
	[1] = {
		type = "entity"
	},
	[2] = {
		type = "vector"
	},
	[3] = {
		type = "angle"
	},
}, function(received)
	local ent = received[1]
	local pos = received[2]
	local ang = received[3]
	if not IsValid(ent) then return end
	if pos == nil then return end
	if ang == nil then return end

	zclib.Effect.ParticleEffect("zpn_pumbkin_shot", pos, ang, ent)
	ent:EmitSound("zpn_partypopper")
end)

zclib.NetEvent.AddDefinition("zpn_partypopper_special", {
	[1] = {
		type = "entity"
	},
	[2] = {
		type = "vector"
	},
	[3] = {
		type = "angle"
	},
}, function(received)
	local ent = received[1]
	local pos = received[2]
	local ang = received[3]
	if not IsValid(ent) then return end
	if pos == nil then return end
	if ang == nil then return end

	zclib.Effect.ParticleEffect(zpn.Theme.PartyPopper_Projectile.effect_burst, pos, ang, ent)
	ent:EmitSound("zpn_partypopper_heavy")
end)

zclib.NetEvent.AddDefinition("zpn_destructable_destroy", {
	[1] = {
		type = "entity"
	}
}, function(received)
	local ent = received[1]
	if not IsValid(ent) then return end

	if zpn.Theme.Destructibles.smash_effect then
		zclib.Effect.ParticleEffect(zpn.Theme.Destructibles.smash_effect, ent:GetPos(), ent:GetAngles(), ent)
	end

	if zpn.Theme.Destructibles.smash_sound then
		ent:EmitSound(zpn.Theme.Destructibles.smash_sound)
	end

	ent:GibBreakClient(Vector( math.Rand(0,1), math.Rand(0,1), 1) * 100)

	if ent:GetClass() == "zpn_minion" then
		ent:StopParticlesNamed(zpn.Theme.Minions.effects["zpn_minion"])
		ent:StopParticlesNamed(zpn.Theme.Minions.effects["zpn_minion_eye"])
	end
end)

zclib.NetEvent.AddDefinition("zpn_slapper_open", {
	[1] = {
		type = "entity"
	}
}, function(received)
	local ent = received[1]
	if not IsValid(ent) then return end

	zclib.Animation.PlayTransition(ent,"open", 1,"open_idle",1)
	ent:EmitSound("zpn_slapper_open")
end)

zclib.NetEvent.AddDefinition("zpn_slapper_trigger", {
	[1] = {
		type = "entity"
	}
}, function(received)
	local ent = received[1]
	if not IsValid(ent) then return end

	zclib.Animation.Play(ent,"trigger", 1)

	timer.Simple(0.1,function()
		if IsValid(ent) then
			ent:EmitSound("zpn_slapper_trigger")
		end
	end)
	if ent.MakeBounch then ent:EmitSound("zpn_slapper_bounce") end

	if ent.OnTrigger then ent:OnTrigger() end

end)
