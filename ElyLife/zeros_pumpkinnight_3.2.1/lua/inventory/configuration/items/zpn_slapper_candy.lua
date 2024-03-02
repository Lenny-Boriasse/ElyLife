local ITEM = XeninInventory:CreateItemV2()
ITEM:SetMaxStack(1)
ITEM:SetModel("models/zerochain/props_pumpkinnight/zpn_slapper.mdl")
ITEM:SetDescription("Its a trap!")

ITEM:AddDrop(function(self, ply, ent, tbl, tr)
	zclib.Player.SetOwner(ent, ply)
end)

function ITEM:OnPickup(ply, ent)
	if (not IsValid(ent)) then return end
	if ent.GotPlaced == true then
		return
	end

	local info = {
		ent = self:GetEntityClass(ent),
		dropEnt = self:GetDropEntityClass(ent),
		amount = self:GetEntityAmount(ent),
		data = self:GetData(ent)
	}

	self:Pickup(ply, ent, info)

	return true
end

function ITEM:GetSkin(tbl)
	return 1
end

function ITEM:GetCameraModifiers(tbl)
	return {
		FOV = 30,
		X = 0,
		Y = 0,
		Z = 25,
		Angles = Angle(0, 0, 0),
		Pos = Vector(0, 0, 0)
	}
end

ITEM:Register("zpn_slapper_candy")
