include("shared.lua")
include("sh_zpn_config_main.lua")
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true -- Do you want the SWEP to have a crosshair?
SWEP.RenderGroup		= RENDERGROUP_OPAQUE

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)

end

function SWEP:PrimaryAttack()

end


function SWEP:SecondaryAttack()

end
