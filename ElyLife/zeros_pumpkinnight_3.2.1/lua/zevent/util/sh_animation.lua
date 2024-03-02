zpn = zpn or {}
zpn.Animation = zpn.Animation or {}

if SERVER then
    util.AddNetworkString("zpn_anim_net")
    function zpn.Animation.Play(ent, anim, speed,force)

        zclib.Animation.Play(ent,anim, speed)

        net.Start("zpn_anim_net")
        net.WriteUInt(ent:LookupSequence(anim),16)
        net.WriteUInt(speed,6)
        net.WriteEntity(ent)
		net.WriteBool(force == true)
        net.Broadcast()
    end
end

if CLIENT then
    net.Receive("zpn_anim_net", function(len, ply)

        local anim = net.ReadUInt(16)
        local speed = net.ReadUInt(6)
        local ent = net.ReadEntity()
		local force = net.ReadBool()

        if not IsValid(ent) then return end
        if anim == nil then return end
        if speed == nil then return end

        // If this animation is currently playing then stop
        local index = ent:GetSequence()
        if not force and index == anim then
            return
        end

        zclib.Animation.Play(ent,ent:GetSequenceName(anim), speed)
    end)
end
