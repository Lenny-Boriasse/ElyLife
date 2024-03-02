if CLIENT then return end
zpn = zpn or {}
zpn.Partypopper = zpn.Partypopper or {}

function zpn.Partypopper.ProjectileExplosion(pos, dist, ply)
    for k, v in pairs(ents.FindInSphere(pos, dist)) do

        if IsValid(v) and zpn.config.PartyPopper.Damage[v:GetClass()] then

            if v:GetClass() == "zpn_destructable" and v.Smashed == true then continue end

            local d = DamageInfo()
            d:SetDamage(zpn.config.PartyPopper.Damage[v:GetClass()])
            d:SetAttacker(ply)
            d:SetDamageType(DMG_SONIC)
            v:TakeDamageInfo(d)
        end
    end
end

// If the player allready has a pumpkin popper then we stop
zclib.Hook.Add("PlayerCanPickupWeapon", "zpn_PartyPopper", function(ply, wep)
    if (wep:GetClass() == "zpn_partypopper" or wep:GetClass() == "zpn_partypopper01") and ply:HasWeapon(wep:GetClass()) then return false end
end)
