AddCSLuaFile()
DEFINE_BASECLASS("zpn_slapper_base")
ENT.Type                    = "anim"
ENT.Base                    = "zpn_slapper_base"
ENT.Model                   = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl"
ENT.Spawnable               = true
ENT.AdminSpawnable          = false
ENT.PrintName               = "Slapper - Fire"
ENT.Category                = "Zeros PumpkinNight"

ENT.OnTrigger = function(ent,ply)
    if SERVER then
        local firearea = ents.Create("zpn_firearea")
        firearea:SetPos(ent:GetPos())
        firearea:Spawn()
        firearea:Activate()

        ply:Ignite(1.5,1)
    else
        zclib.Effect.ParticleEffect("zpn_fireexplosion", ent:GetPos(), ent:GetAngles(), ent)
    end
end
ENT.SkinValue = 2
ENT.MakeBounch = true
