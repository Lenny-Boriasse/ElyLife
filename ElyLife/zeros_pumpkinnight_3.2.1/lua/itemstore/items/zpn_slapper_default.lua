ITEM.Name = "Slapper - Normal"
ITEM.Description = "Its a Trap!"
ITEM.Model = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false
ITEM.Skin = 0

function ITEM:GetSkin()
	return 0
end

function ITEM:CanPickup(pl, ent)
	if ent.GotPlaced then
		return false
	else
		return true
	end
end
