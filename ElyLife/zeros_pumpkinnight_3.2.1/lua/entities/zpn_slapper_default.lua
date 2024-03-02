AddCSLuaFile()
DEFINE_BASECLASS("zpn_slapper_base")
ENT.Type                    = "anim"
ENT.Base                    = "zpn_slapper_base"
ENT.Model                   = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl"
ENT.Spawnable               = true
ENT.AdminSpawnable          = false
ENT.PrintName               = "Slapper - Normal"
ENT.Category                = "Zeros PumpkinNight"

ENT.MakeBounch = true
ENT.SkinValue = 0

ENT.OnTrigger = function(ent,ply)
    if CLIENT then
        zclib.Effect.ParticleEffect("zpn_cloud_slapper", ent:GetPos(), ent:GetAngles(), ent)
    end
end
