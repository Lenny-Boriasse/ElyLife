zpn = zpn or {}
zpn.config = zpn.config or {}
zpn.config.Masks = {}
local function AddItem(data) return table.insert(zpn.config.Masks,data) end
/*
AddItem({
    name = "Masque de Gael",

    desc = "Augmente la quantité de bonbons collectés de 300%",

	// The model of the mask
	mdl = "models/zerochain/props_pumpkinnight/zpn_mask01.mdl",

	// How much more candy will the player collect while wearing this mask
	// 1 = 100% (NoChange)
	// 2 = 200% (Double)
	candy_mul = 3,

	// How often can the mask protect the player against the ghost before it breaks?
	ghost_protect = 1,

	// How much more damage will the wearer inflict on his enemies (Pumpkins,Ghosts,Boss,Minions)
	// 1 = 100% (NoChange)
	// 2 = 200% (Double)
	//attack_mul = 1,

	// How much damage will be reflected back when the wearer is attacked by enemies (Ghosts,Boss,Minions)
	// NOTE Only applys to the the script enemies
	// 1 = 100% (No Damage to the wearer and 100% of the damage goes back to the inflictor)
	// 0.5 = 50% (Half)
	// reflect_mul = 0.5,

	// If set then monsters will ignore the wearer of the mask but he also cant inflict damage to them anymore
	// monster_friend = true,

	// How many candy points does the mask costs in the shop?
	price = 600,
})

AddItem({
    name = "Masque de Shay",
    desc = "Vous êtes immunisé contre les monstres mais vous ne pouvez pas les blesser non plus",
	mdl = "models/gtav_halloween_mask_pack/berd002/halloween_berd002_c.mdl",
	candy_mul = 1.25,
	monster_friend = true,
	price = 600,
})

AddItem({
    name = "Masque de Ulik",
    desc = "Retourne 50% des dégâts reçus sur le monstre.",
	mdl = "models/zerochain/props_pumpkinnight/zpn_mask03.mdl",
	candy_mul = 1.25,
	ghost_protect = 1,
	reflect_mul = 0.5,
	price = 600,
})

AddItem({
    name = "Masque de Ceallach",
    desc = "Augmente les dégâts infligés aux monstres de 200%",
	mdl = "models/zerochain/props_pumpkinnight/zpn_mask04.mdl",
	candy_mul = 1.25,
	ghost_protect = 1,
	attack_mul = 2,
	price = 600,
})
    
    */
