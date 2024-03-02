AddCSLuaFile()
DEFINE_BASECLASS("zpn_slapper_base")
ENT.Type                    = "anim"
ENT.Base                    = "zpn_slapper_base"
ENT.Model                   = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl"
ENT.Spawnable               = true
ENT.AdminSpawnable          = false
ENT.PrintName               = "Slapper - Candy"
ENT.Category                = "Zeros PumpkinNight"

ENT.MakeBounch = true
ENT.StealCandy = {
    min = 25,
    max = 150,
}
ENT.SkinValue = 1
ENT.OnTrigger = function(ent,ply)
    if CLIENT then
        zclib.Effect.ParticleEffect("zpn_candycorn_shot", ent:GetPos(), ent:GetAngles(), ent)
    end
end
