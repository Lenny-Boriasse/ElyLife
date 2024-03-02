zpn = zpn or {}
zpn.config = zpn.config or {}
zpn.config.Shop = {}
local function AddItem(data) return table.insert(zpn.config.Shop,data) end

AddItem({

    /*
        1 = Entity
        2 = Weapon
        3 = Health
        4 = Armor
        5 = SH Accessory HatID https://www.gmodstore.com/market/view/3781
        6 = Pointshop01 Points https://github.com/adamdburton/pointshop
        7 = Pointshop02 StandardPoints https://github.com/Kamshak/Pointshop2
        8 = Pointshop02 PremiumPoints https://github.com/Kamshak/Pointshop2
        9 = Blues Unboxing 3 https://www.gmodstore.com/market/view/5306
        10 = Underdone https://www.gmodstore.com/market/view/750
        11 = EasySkins
        12 = mTokens
        13 = ASS https://www.gmodstore.com/market/view/advanced-accessory-the-most-advanced-accessory-system

        14 = SantosRP - GiveItem (.class,.amount)
        15 = WOS - Item
        16 = WOS - Points
        17 = WOS - XP
        18 = WOS - Level
        19 = Vrondakis - XP
        20 = Vrondakis - Level
        21 = Glorified - XP
        22 = Glorified - Level
        23 = Essentials - XP
        24 = Essentials - Level
        25 = Elite - XP
        26 = sReward - Tokens
		27 = ZerosPyrocrafter 2 - PyroCoins
		28 = LUA
    */

    // What kind of item is this?
    type = 1,

    // The Entity / Weapon Class / HatID / UB3ID / ItemID
    class = "item_ammo_pistol",

    // The Item name
    name = "Munition de pistolet",

    // Some info about this item
    desc = "Quelques munitions de pistolet.",

    // The path to Model
    model = "models/Items/BoxSRounds.mdl",

    // The Field of view for displaying the model (Usefull if the model is very small)
    model_fov = 25,

    // The Skin for the Model
    model_skin = 0,

    // The path to the png icon, set to nil to use the model instead
    icon = nil,

    // The Price
    price = 15,

    // How much should we give the player? (Used for stuff like Health, Armor, Points)
    amount = 1,

    // Can be used to overwrite the item color
    color = zpn.Theme.Shop.itm_bg_color,

    // What ranks are allowed to buy this item? Leave empty to allowe everyone to buy it.
    ranks = {},

    // Should the item be free after he purchased it once?
    permanent = false,
})


AddItem({
    type = 3,
    name = "Vie",
    desc = "+100 de vie.",
    icon = zpn.Theme.Design.icon_health,
    price = 100,
    amount = 100,
    ranks = {},
})

AddItem({
    type = 4,
    name = "Armure",
    desc = "+100 d'armure.",
    icon = zpn.Theme.Design.icon_armor,
    price = 200,
    amount = 200,
    ranks = {},
})

/*    
AddItem({
    type = 2,
    class = "fortnite_chugjug",
    name = "Gourde du Brave",
    desc = "Un gourde qui vous fera du bien !",
    model = "models/fortnite/w_fbr_chugjug.mdl",
    model_skin = 0,
    model_fov = 23,
    icon = nil,
    price = 800,
    amount = 1,
})

    AddItem({
    type = 2,
    class = "mm_axe",
    name = "Hache d'Halloween",
    desc = "La hache de la mort !",
    model = "models/weapons/monstermash/w_axe_left.mdl",
    model_skin = 0,
    model_fov = 23,
    icon = nil,
    price = 600,
    amount = 1,
            permanent = true,
})
    
        AddItem({
    type = 2,
    class = "mm_fencepost",
    name = "Poteau de clotûre",
    desc = "Un poteau de clotûre capable de tuer des gens !",
    model = "models/weapons/monstermash/w_fencepost_left.mdl",
    model_skin = 0,
    model_fov = 23,
    icon = nil,
    price = 600,
    amount = 1,
    permanent = true,
})
    
AddItem({
    type = 2,
    class = "mm_scythe",
    name = "Faux d'Halloween",
    desc = "La faux de la mort !",
    model = "models/weapons/monstermash/w_scythe.mdl",
    model_skin = 0,
    model_fov = 23,
    icon = nil,
    price = 800,
    amount = 1,
            permanent = true,
})
    
    AddItem({
    type = 2,
    class = "mm_pumpkinnade",
    name = "Grenade d'Halloween",
    desc = "BOUM !",
    model = "models/weapons/monstermash/w_pumpkin_nade.mdl",
    model_skin = 0,
    model_fov = 23,
    icon = nil,
    price = 800,
    amount = 1,
            permanent = true,
})
    
    AddItem({
		type = 28,
		name = "Caisse Survivant",
		desc = "Une caisse remplie d'armes permanentes !",
		icon = Material("materials/zerochain/zerolib/ui/icon_hot.png", "smooth"),
		price = 2500,
		lua = function(ply)
			RunConsoleCommand("ely_cases.give", ply:SteamID64(),"case_uranium", "1")
		end,
	})
*/
/* 
    AddItem({
    type = 2,
    class = "zpn_partypopper",
    name = "Pumpkin Popper",
    desc = "Perfect for celebrating Halloween!",
    model = "models/zerochain/props_pumpkinnight/zpn_partypopper.mdl",
    model_skin = 0,
    model_fov = 13,
    icon = nil,
    price = 50,
    amount = 1,
    permanent = true,
})
    
*/    

/*
AddItem({
    type = 2,
    class = "zpn_partypopper01",
    name = "Pumpkin Slayer",
    desc = "A powerfull weapon against pumpkins!",
    model = "models/zerochain/props_pumpkinnight/zpn_partypopper.mdl",
    model_skin = 1,
    model_fov = 13,
    price = 200,
    amount = 1,
    ranks = {
        ["superadmin"] = true,
        ["VIP"] = true,
    },
    permanent = true,
})
*/
    /*
AddItem({
    type = 1,
    class = "zpn_slapper_default",
    name = "Slapper - Bounce",
    desc = "Makes the victim bounce!",
    model = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl",
    model_fov = 15,
    model_skin = 0,
    price = 25,
    permanent = false,
})

AddItem({
    type = 1,
    class = "zpn_slapper_fire",
    name = "Slapper - Fire",
    desc = "Sets the victim on fire!",
    model = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl",
    model_fov = 15,
    model_skin = 2,
    price = 100,
    permanent = false,
})
    */
/*
AddItem({
    type = 1,
    class = "zpn_slapper_candy",
    name = "Slapper - Candy",
    desc = "Slaps the candy out of the victim!",
    model = "models/zerochain/props_pumpkinnight/zpn_slapper.mdl",
    model_fov = 15,
    model_skin = 1,
    price = 150,
    permanent = false,
})
    */

    
           AddItem({
		type = 28,
		name = "Masque de Vampire",
		desc = "Un masque exclusif pour Halloween ! (Mythique)",
		model = "models/gtav_halloween_mask_pack/berd012/halloween_berd012_b.mdl",
		price = 7500,
		lua = function(ply)
			ply:AddInventoryItemSimple("vampire_halloween", 1)
		end,
	})
    
            AddItem({
		type = 28,
		name = "Masque de Sorciere",
		desc = "Un masque exclusif pour Halloween ! (Mythique)",
		model = "models/gtav_halloween_mask_pack/berd011/halloween_berd011_a.mdl",
		price = 5000,
		lua = function(ply)
			ply:AddInventoryItemSimple("witch_halloween", 1)
		end,
	})
    
    AddItem({
		type = 28,
		name = "Masque de Loup Garou",
		desc = "Un masque exclusif pour Halloween ! (Mythique)",
		model = "models/gtav_halloween_mask_pack/berd005/halloween_berd005_a.mdl",
		price = 7500,
		lua = function(ply)
			ply:AddInventoryItemSimple("werewolf_halloween", 1)
		end,
	})
    
    
   AddItem({
		type = 28,
		name = "Masque de Citrouille",
		desc = "Un sac exclusif pour Halloween ! (Mythique)",
		model = "models/gtav_halloween_mask_pack/berd000/halloween_berd000_a.mdl",
		price = 5000,
		lua = function(ply)
			ply:AddInventoryItemSimple("pumpkin_halloween", 1)
		end,
	})


    
for k,v in pairs(zpn.config.Masks) do
	AddItem({
		type = 28,
		name = v.name,
		desc = v.desc,
		model = v.mdl,
		model_angle = Angle(0,0,0),
		model_fov = 18,
		price = v.price,
		lua = function(ply)
			zpn.Mask.Equipt(ply,k, true)
		end,
		// permanent = true,
	})
end


/*
    //////////////////////
    //Shop Item Exambles//
    //////////////////////

    ASS https://www.gmodstore.com/market/view/advanced-accessory-the-most-advanced-accessory-system
    AddItem({
        type = 13,
        class = 1, // UniqueID
        name = "Pumpkin Hat",
        desc = "A nice hat!",
        model = "models/props/pumpkin_z.mdl",
        price = 25,
        amount = 1,
        model_skin = 1,
        model_fov = 13,
        permanent = true,
    })


    SH Accessory HatID https://www.gmodstore.com/market/view/3781
    AddItem({
        type = 5,
        class = "pumpkinhat",
        name = "Pumpkin Hat",
        desc = "A nice hat!",
        model = "models/props/pumpkin_z.mdl",
        price = 25,
        amount = 1,
        model_skin = 1,
        model_fov = 13,
        permanent = true,
    })


    Pointshop01 Points https://github.com/adamdburton/pointshop
    AddItem({
        type = 6,
        name = "PS1 Points",
        desc = "Some Pointshop points!",
        icon = Material("materials/zerochain/zpn/ui/zpn_p01_icon.png", "smooth"),
        price = 10,
        amount = 5,
    })


    Pointshop02 StandardPoints https://github.com/Kamshak/Pointshop2
    AddItem({
        type = 7,
        name = "PS2 StandardPoints",
        desc = "Some Pointshop2 points!",
        icon = Material("materials/zerochain/zpn/ui/zpn_p02_icon.png", "smooth"),
        price = 10,
        amount = 5,
    })

    Pointshop02 PremiumPoints https://github.com/Kamshak/Pointshop2
    AddItem({
        type = 8,
        name = "PS2 PremiumPoints",
        desc = "Some Pointshop2 PremiumPoints!",
        icon = Material("materials/zerochain/zpn/ui/zpn_p02+_icon.png", "smooth"),
        price = 50,
        amount = 5,
    })

    BluesUnboxing3 https://www.gmodstore.com/market/view/5306
    AddItem({
        type = 9,
        class = "weaponid",
        name = "Butterflyknife",
        desc = "Cool Knife!",
        model = "models/props/butterflyknife.mdl",
        price = 150,
        amount = 1,
        model_skin = 1,
        model_fov = 13,
        permanent = true,
    })

    EasySkins https://www.gmodstore.com/market/view/easy-skins
    AddItem({
        type = 11,
        skin_name = "Graffiti",
        name = "Graffiti",
        price = 25,
        amount = 1,
        ranks = {
            ["superadmin"] = true,
            ["VIP"] = true,
        },
    })


    mTokens https://www.gmodstore.com/market/view/6712
    AddItem({
        type = 12,
        name = "mTokens",
        desc = "Some mTokens!",
        icon = Material("materials/zerochain/zpn/ui/zpn_p01_icon.png", "smooth"),
        price = 25,
        amount = 1,
    })

	ZerosPyrocrafter 2 - PyroCoins https://www.gmodstore.com/market/view/zero-s-pyrocrafter-2-firework-script
    AddItem({
        type = 27,
        name = "PyroCoins",
        desc = "Those coins can be used to unbox new effects!",
        icon = Material("materials/zerochain/zpc2/ui/zpc2_pyrocoin.png", "smooth"),
        price = 10,
        amount = 1,
    })

	Lua Examble
	AddItem({
		type = 28,
		name = "Fire",
		desc = "Its just fire.",
		icon = Material("materials/zerochain/zerolib/ui/icon_hot.png", "smooth"),
		price = 1,
		lua = function(ply)
			ply:Ignite(3,1)
		end,
	})

    //////////////////////
    //////////////////////
*/
