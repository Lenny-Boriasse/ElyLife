if CLIENT then return end

// Gets called when a player collects candy
hook.Add("zpn_OnCandyCollect", "zpn_OnCandyCollect_Test", function(ply, candy_amount)
	/*
	print("--------------------------")
	print("zpn_OnCandyCollect")
	print(tostring(ply))
	print("Candy: " .. candy_amount)
	print("--------------------------")
	*/
end)

// Called when a player buys a item from the candyshop npc
hook.Add("zpn_OnShopItemBought", "zpn_OnShopItemBought_Test", function(ply, npc,ItemID,ItemData)
	/*
	print("--------------------------")
	print("zpn_OnShopItemBought")
	print(tostring(ply))
	print(tostring(npc))
	PrintTable(ItemData)
	print("--------------------------")
	*/
end)

// Gets called when a player destroys a destructable (Pumpkin)
hook.Add("zpn_OnDestructableSmashed", "zpn_OnDestructableSmashed_Test", function(ply, pumpkin)
	/*
	print("--------------------------")
	print("zpn_OnDestructableSmashed")
	print(tostring(ply))
	print(tostring(pumpkin))
	print("--------------------------")
	*/
end)

// Gets called when a Boss enemy got killed
hook.Add("zpn_OnBossKilled", "zpn_OnBossKilled_Test", function(Boss,DamageReport)
	/*
	print("--------------------------")
	print("zpn_OnBossKilled")
	print("Boss Enemy: " .. tostring(Boss))
	print("A list of which player caused how much damage")
	PrintTable(DamageReport)
	// DamageReport[SteamID64] = Inflicted Damage

	// Lets calculate which player caused the most amount of damage
	local MVP,MostDMG = nil,0
	for steamid,damage in pairs(DamageReport) do
		if damage > MostDMG then
			MostDMG = damage
			MVP = steamid
		end
	end
	print("--------------------------")
	if MVP then
		MVP = player.GetBySteamID64(MVP)
		if IsValid(MVP) then
			print("MVP: " .. MVP:Nick() .. " | Damage: " .. MostDMG)
		end
	end
	print("--------------------------")
	*/
end)

hook.Add("zpn_OnGhostKilled", "zpn_OnGhostKilled_Test", function(Ghost,ply)
	/*
	print("--------------------------")
	print("zpn_OnGhostKilled")
	print(tostring(Ghost))
	print("GhostKiller: " .. tostring(ply))
	print("--------------------------")
	*/
end)

hook.Add("zpn_OnMinionKilled", "zpn_OnMinionKilled_Test", function(Minion,ply)
	/*
	print("--------------------------")
	print("zpn_OnMinionKilled")
	print(tostring(Minion))
	print("MinionKiller: " .. tostring(ply))
	print("--------------------------")
	*/
end)

hook.Add("zpn_OnMaskEquipped", "zpn_OnMaskEquipped_Test", function(ply,MaskID)

end)

hook.Add("zpn_OnMaskDropped", "zpn_OnMaskDropped_Test", function(ply,MaskID)

end)
