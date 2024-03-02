if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID( "vgui/hud/machetehud" )
SWEP.DrawWeaponInfoBox	= false
SWEP.BounceWeaponIcon = false
end

SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA Left 4 Dead 2"
SWEP.PrintName = "Machete"
SWEP.ViewModel = "models/weapons/melee/v_machete.mdl"
SWEP.ViewModelFOV = 60
SWEP.VMPos = Vector(0, 0, -1.5)
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/melee/w_machete.mdl"
SWEP.HoldType = "melee"


SWEP.Offset = {
	Pos = {
		Up = 1,
		Right = 2,
		Forward = 3
	},
	Ang = {
		Up = -1,
		Right = 20,
		Forward = 178
	},
	Scale = 1.2
} -- Procedural world model animation, defaulted for CS:S purposes.


SWEP.Spawnable = TFA_BASE_VERSION and TFA_BASE_VERSION >= 4
SWEP.AdminOnly = false

SWEP.InspectPos = Vector(9, -10, 0)
SWEP.InspectAng = Vector(65, 40, 60)

SWEP.DisableIdleAnimations = false
SWEP.Primary.Sound = Sound("TFA_L4D2.MACHETE.Swing")
SWEP.Primary.Sound_HitFlesh = Sound("TFA_L4D2.MACHETE.HitFlesh")
SWEP.Primary.Sound_HitWorld = Sound("TFA_L4D2.MACHETE.HitWorld")
SWEP.Secondary.Sound_BashHit = Sound("TFA_L4D2.MACHETE.BashHit")
SWEP.Secondary.Sound_BashWorld = Sound("TFA_L4D2.MACHETE.BashWorld")
SWEP.Secondary.Sound_BashMiss = Sound("TFA_L4D2.MACHETE.BashMiss")
SWEP.Primary.Directional = true
SWEP.Primary.Damage = 60
SWEP.Primary.Attacks = {
	{
		["act"] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 20 * 4.5, -- Trace distance
		["dir"] = Vector(-75, 20, -5), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.2, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = SWEP.Primary.Sound, -- Sound ID
		["snd_delay"] = 0.10,
		["viewpunch"] = Angle(10, 0.2, 0), --viewpunch angle
		["end"] = 0.9, --time before next attack
		["hull"] = 10, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = SWEP.Primary.Sound_HitFlesh,
		["hitworld"] = SWEP.Primary.Sound_HitWorld,
		["combotime"] = 0.1
	},
	{
		["act"] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 20 * 4.5, -- Trace distance
		["dir"] = Vector(80, 20, -50), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.2, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = SWEP.Primary.Sound, -- Sound ID
		["snd_delay"] = 0.10,
		["viewpunch"] = Angle(10, 1, 0), --viewpunch angle
		["end"] = 0.9, --time before next attack
		["hull"] = 10, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = SWEP.Primary.Sound_HitFlesh,
		["hitworld"] = SWEP.Primary.Sound_HitWorld,
		["combotime"] = 0.1
	}
}

SWEP.Secondary.Damage = 20

SWEP.Secondary.Attacks = {
	{
		["act"] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 20 * 4.5, -- Trace distance
		["dir"] = Vector(0, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Secondary.Damage, --Damage
		["dmgtype"] = DMG_CRUSH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.1, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = SWEP.Secondary.Sound_BashMiss, -- Sound ID
		["snd_delay"] = 0,
		["viewpunch"] = Angle(5, 0.5, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 10, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = SWEP.Secondary.Sound_BashHit,
		["hitworld"] = SWEP.Secondary.Sound_BashWorld,
		["combotime"] = 0.1
	}
}


SWEP.AllowSprintAttack = true

function SWEP:AltAttack()
	hook.Run("TFA_Bash", self)

	if self:GetOwner().Vox and IsFirstTimePredicted() then
		self:GetOwner():Vox("bash", 0)
	end
end





