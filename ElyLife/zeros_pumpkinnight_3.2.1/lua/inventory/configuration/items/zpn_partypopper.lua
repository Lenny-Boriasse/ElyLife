local ITEM = XeninInventory:CreateItemV2()
ITEM:SetMaxStack(10)
ITEM:SetModel("models/zerochain/props_pumpkinnight/zpn_partypopper.mdl")
ITEM:SetDescription("Perfect for celebrating Halloween!")
ITEM:AddDrop(function(self, ply, ent, tbl, tr)
end)


function ITEM:GetCameraModifiers(tbl)
	return {
		FOV = 17,
		X = 0,
		Y = -22,
		Z = 25,
		Angles = Angle(0, 0, 0),
		Pos = Vector(0, 0, -1)
	}
end

function ITEM:GetDisplayName(item)
	return self:GetName(item)
end

function ITEM:GetName(item)
	local name = "Partypopper"

	return name
end


ITEM:Register("zpn_partypopper")
