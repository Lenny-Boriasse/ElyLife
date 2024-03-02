/*
    1 = Entity Class
    2 = Weapon Class
    3 = Health
    4 = Armor
    5 = Accessory HatID
    6 = Pointshop01 Points
    7 = Pointshop02 StandardPoints
    8 = Pointshop02 PremiumPoints
    9 = Blues Unboxing 3
    10 = Underdone
    11 = EasySkins https://www.gmodstore.com/market/view/easy-skins
    12 = MTokens https://www.gmodstore.com/market/view/6712
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
*/

zpn.PurchaseType = {}
local function AddPrizeType(data) table.insert(zpn.PurchaseType,data) end

// Entity
AddPrizeType(function(ply, itemData)
    if SERVER then
        local ent = ents.Create(itemData.class)
        ent:SetModel(itemData.model)
        ent:SetPos(ply:GetPos() + (ply:GetUp() * 40))
        ent:Spawn()
        zclib.Player.SetOwner(ent, ply)

        if zclib.Inventory.Pickup(ply,ent,itemData.class) then
            zclib.Notify(ply, string.Replace(zpn.language.General["inv_itemadd"],"$ItemName",itemData.name), 0)
        end
    end
    return true
end)

// Weapon
AddPrizeType(function(ply, itemData)
    if not ply:HasWeapon(itemData.class) then
        if SERVER then
            ply:Give(itemData.class)
            ply:SelectWeapon(itemData.class)
        end
        return true
    else
        if CLIENT then
            notification.AddLegacy(string.Replace(zpn.language.General["PurchaseFail01"],"$itemname",itemData.name), NOTIFY_ERROR, 3)
            surface.PlaySound( "common/warning.wav" )
        end
        return false
    end
end)

// Health
AddPrizeType(function(ply, itemData)
    if SERVER then ply:SetHealth( math.Clamp( ply:Health() + (itemData.amount or 100), 0, ply:GetMaxHealth())) end
    return true
end)

// Armor
AddPrizeType(function(ply, itemData)
    if SERVER then ply:SetArmor(math.Clamp(ply:Armor() + (itemData.amount or 100),0,100)) end
    return true
end)

// SH Accessory
AddPrizeType(function(ply, itemData)
    if ply:SH_HasAccessory(itemData.class) == false then
        if SERVER then ply:SH_AddAccessory(itemData.class) end
        return true
    else
        if CLIENT then
            notification.AddLegacy(string.Replace(zpn.language.General["PurchaseFail01"],"$itemname",itemData.name), NOTIFY_ERROR, 3)
            surface.PlaySound( "common/warning.wav" )
        end
        return false
    end
end)

// Pointshop 1 - Points
AddPrizeType(function(ply, itemData)
    if SERVER then ply:PS_GivePoints(itemData.amount) end
    return true
end)

// Pointshop 2 - StandardPoints
AddPrizeType(function(ply, itemData)
    if SERVER then ply:PS2_AddStandardPoints(itemData.amount) end
    return true
end)

// Pointshop 2 - PremiumPoints
AddPrizeType(function(ply, itemData)
    if SERVER then ply:PS2_AddPremiumPoints(itemData.amount) end
    return true
end)

// Blues Unboxing 3
AddPrizeType(function(ply, itemData)
    if SERVER then ply:UB3AddItem(itemData.class, itemData.amount) end
    return true
end)

// Underdone
AddPrizeType(function(ply, itemData)
    if SERVER then ply:AddItem(itemData.class, itemData.amount) end
    return true
end)

// EasySkins
AddPrizeType(function(ply, itemData)
    local _, skin_id = SH_EASYSKINS.GetSkinByName(itemData.skin_name)
    local skin = SH_EASYSKINS.GetSkin(skin_id)

    if not IsValid(ply:GetActiveWeapon()) or table.HasValue(skin.weaponTbl, ply:GetActiveWeapon():GetClass()) == false then
        if CLIENT then
            notification.AddLegacy(table.concat(skin.weaponTbl, ",", 1, #skin.weaponTbl), NOTIFY_HINT, 3)
            notification.AddLegacy(zpn.language.General["easyskin_invalidgun"], NOTIFY_ERROR, 3)
            CL_EASYSKINS.PlaySound("deny")
        end

        return false
    end

    local _weaponclass = ply:GetActiveWeapon():GetClass()
    local _canbuy, _reason = SH_EASYSKINS.CanBuySkin(ply, skin_id, _weaponclass)

    if _canbuy == false then
        if CLIENT then
            notification.AddLegacy(_reason, NOTIFY_ERROR, 3)
            CL_EASYSKINS.PlaySound("deny")
        end

        return false
    end

    if SERVER then
        SV_EASYSKINS.GiveSkinToPlayer(ply:SteamID64(), skin_id, {_weaponclass})
    end

    return true
end)

// Mtokens
AddPrizeType(function(ply, itemData)
    if SERVER then mTokens.AddPlayerTokens(ply, itemData.amount) end
    return true
end)

// ASS
AddPrizeType(function(ply, itemData)
    if SERVER then
        if ply:AASIsBought(itemData.class) == false then
            AAS.GiveItem(ply:SteamID64(),itemData.class, 0)
            return true
        else
            zclib.Notify(ply, string.Replace(zpn.language.General["PurchaseFail01"],"$itemname",itemData.name), 1)
            return false
        end
    else
        return true
    end
end)

// SantosRP - GiveItem
AddPrizeType(function(ply, itemData)
    if SERVER then
        if not GAMEMODE.Inv:ValidItem(itemData.class) then return end
        GAMEMODE.Inv:GivePlayerItem(ply, itemData.class,itemData.amount)
    end
    return true
end)

// WOS - Item
AddPrizeType(function(ply, itemData)
    if SERVER and wOS and wOS.HandleItemPickup then
        wOS:HandleItemPickup( ply, itemData.class)
    end
    return true
end)

// WOS - Points
AddPrizeType(function(ply, itemData)
    if SERVER then
        if not isfunction(ply.SetSkillPoints) then return end
        local oldPoints = ply:GetSkillPoints()
        ply:SetSkillPoints(oldPoints + itemData.amount)
    end

    return true
end)

// WOS - XP
AddPrizeType(function(ply, itemData)
    if SERVER then
        if not isfunction(ply.SetSkillXP) then return end
        local oldXP = ply:GetSkillXP()
        ply:SetSkillXP(oldXP + itemData.amount)
    end
    return true
end)

// WOS - Level
AddPrizeType(function(ply, itemData)
    if SERVER then
        if not isfunction(ply.SetSkillLevel) then return end
        local oldLevel = ply:GetSkillLevel()
        ply:SetSkillLevel(oldLevel + itemData.amount)
    end

    return true
end)

// Vrondakis - XP
AddPrizeType(function(ply, itemData)
    if SERVER then
        ply:addXP(itemData.amount)
    end

    return true
end)

// Vrondakis - Level
AddPrizeType(function(ply, itemData)
    if SERVER then
        ply:addLevels(itemData.amount)
    end

    return true
end)

// Glorified - XP
AddPrizeType(function(ply, itemData)
    if SERVER then
        GlorifiedLeveling.AddPlayerXP(ply, itemData.amount)
    end

    return true
end)

// Glorified - Level
AddPrizeType(function(ply, itemData)
    if SERVER then
        GlorifiedLeveling.AddPlayerLevels(ply, itemData.amount)
    end

    return true
end)

// Essentials - XP
AddPrizeType(function(ply, itemData)
    if SERVER then
        ply:AddExperience(itemData.amount,"")
    end

    return true
end)

// Essentials - Level
AddPrizeType(function(ply, itemData)
    if SERVER then
        ply:AddLevel(itemData.amount,"")
    end

    return true
end)

// Elite - XP
AddPrizeType(function(ply, itemData)
    if SERVER then
        EliteXP.CheckXP(ply, itemData.amount)
    end

    return true
end)

// sReward - Tokens
AddPrizeType(function(ply, itemData)
    if SERVER then
        sReward.GiveTokens(ply,itemData.amount)
    end

    return true
end)

// ZerosPyrocrafter 2 - PyroCoins
AddPrizeType(function(ply, itemData)
    if SERVER then
		zpc2.data.Give_PyroCoins(ply,itemData.amount)
    end

    return true
end)

// LUA
AddPrizeType(function(ply, itemData)
	if SERVER and itemData and itemData.lua then
		itemData.lua(ply)
	end

    return true
end)
