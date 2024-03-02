AddCSLuaFile()

include("sh_zpn_config_main.lua")

DEFINE_BASECLASS("zpn_partypopper")

SWEP.Base = "zpn_partypopper"
SWEP.PrintName = "Pumpkin Slayer" // The name of your SWEP
SWEP.Category = "Zeros PumpkinNight"
SWEP.ViewModelFOV = 90
SWEP.ViewModel = "models/zerochain/props_pumpkinnight/zpn_partypopper_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_pumpkinnight/zpn_partypopper.mdl"
SWEP.AdminSpawnable = true
SWEP.Spawnable = true

SWEP.PartyPopperID = 2

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zpn/vgui/zpn_swep_partypopper01")
    SWEP.BounceWeaponIcon = false
end
