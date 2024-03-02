include("sh_zpn_config_main.lua")

SWEP.PrintName = "Partypopper" // The name of your SWEP
SWEP.Author = "ZeroChain" // Your name
SWEP.Instructions = "Hold LMB: Fire" // How do people use your SWEP?
SWEP.Contact = "https://www.gmodstore.com/users/ZeroChain" // How people should contact you if they find bugs, errors, etc
SWEP.Purpose = "Awesome way to celebrate Halloween" // What is the purpose of the SWEP?
SWEP.IconLetter	= "V"

SWEP.AutomaticFrameAdvance = true

SWEP.AdminSpawnable = false // Is the SWEP spawnable for admins?
SWEP.Spawnable = true // Can everybody spawn this SWEP? - If you want only admins to spawn it, keep this false and admin spawnable true.

SWEP.ViewModelFOV = 90 // How much of the weapon do you see?
SWEP.UseHands = true
SWEP.ViewModel = "models/zerochain/props_pumpkinnight/zpn_partypopper_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_pumpkinnight/zpn_partypopper.mdl"


SWEP.AutoSwitchTo = true // When someone picks up the SWEP, should it automatically change to your SWEP?
SWEP.AutoSwitchFrom = false // Should the weapon change to the a different SWEP if another SWEP is picked up?
SWEP.Slot = 2 // Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 1 // Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.HoldType = "crossbow" // How is the SWEP held? (Pistol SMG Grenade Melee)
SWEP.FiresUnderwater = false // Does your SWEP fire under water?
SWEP.Weight = 5 // Set the weight of your SWEP.
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?
SWEP.Category = "Zeros PumpkinNight"
SWEP.DrawAmmo = false // Does the ammo show up when you are using it? True / False
SWEP.base = "weapon_base" //What your weapon is based on.

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Recoil = 1
SWEP.Primary.Delay = 1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Recoil = 1
SWEP.Secondary.Delay = 1

SWEP.PartyPopperID = 1

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zpn/vgui/zpn_swep_partypopper")
    SWEP.BounceWeaponIcon = false
end


function SWEP:Debug(action_name)
    zclib.Debug(self:GetClass() .. ":" .. action_name)
end

function SWEP:GetPopperClass()
    if self.PartyPopperID == 1 then
        return "zpn_partypopper"
    elseif self.PartyPopperID == 2 then
        return "zpn_partypopper01"
    end
end

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "Busy")
    if SERVER then
        self:SetBusy(false)
    end
end
