if CLIENT then return end
zpn = zpn or {}
zpn.Shop = zpn.Shop or {}

util.AddNetworkString("zpn_Shop_ForceClose_net")
function zpn.Shop.ForceClose(ply)

    if ply.zpn_InShop == false then return end
    net.Start("zpn_Shop_ForceClose_net")
    net.Send(ply)

    ply.zpn_InShop = false
end

util.AddNetworkString("zpn_Shop_Open_net")
function zpn.Shop.Open(ply, npc)
    // Tells the server player is using the shop now
    ply.zpn_InShop = true

    // Open Shop interface
    net.Start("zpn_Shop_Open_net")
    net.WriteEntity(npc)
    net.WriteInt(zpn.CandyPoints[zclib.Player.GetID(ply)] or 0,16)
    net.WriteTable(ply.zpn_OwnedItems or {})
    net.Send(ply)
end

util.AddNetworkString("zpn_Shop_BuyItem_net")
net.Receive("zpn_Shop_BuyItem_net", function(len, ply)
    if zclib.Player.Timeout(nil,ply) then return end
    zclib.Debug("zpn_Shop_BuyItem_net Len: " .. len)
    local npc = net.ReadEntity()
    local itemid = net.ReadInt(16)

    if IsValid(npc) and itemid and IsValid(ply) and ply:IsPlayer() and ply:Alive() and zclib.util.InDistance(npc:GetPos(), ply:GetPos(), 300) then
        // Tells the server that the player is not using the shop anymore
        ply.zpn_InShop = false

        zpn.Shop.BuyItem(ply, npc, itemid)
    end
end)

// Gets called when the player closes the shop interface
util.AddNetworkString("zpn_Shop_ClosedShop_net")
net.Receive("zpn_Shop_ClosedShop_net", function(len, ply)
    if zclib.Player.Timeout(nil,ply) then return end
    zclib.Debug("zpn_Shop_ClosedShop_net Len: " .. len)

    if IsValid(ply) and ply:IsPlayer() and ply:Alive() then
        ply.zpn_InShop = false
    end
end)



function zpn.Shop.BuyItem(ply, npc, itemid)
    zclib.Debug("zpn.Shop.BuyItem")
    local itemData = zpn.config.Shop[itemid]

    // Rank Check
    if itemData.ranks and table.Count(itemData.ranks) > 0 and itemData.ranks[zclib.Player.GetRank(ply)] == nil then
        zclib.Notify(ply, zclib.table.ToString(itemData.ranks), 1)
        zclib.Notify(ply, zpn.language.General["PurchaseFail02"], 1)
        return
    end


    // Is the item permanent?
    if itemData.permanent then


        // If the Owned Items table doesent exist for some reason then lets create it
        if ply.zpn_OwnedItems == nil then ply.zpn_OwnedItems = {} end

        if ply.zpn_OwnedItems[itemid] == nil then
            // Does he have enough money
            if zpn.Candy.HasPoints(ply,itemData.price) then

                // Give the Player the item he purchased
                if zpn.PurchaseType[itemData.type](ply, itemData) then

                    // Take money
                    zpn.Candy.TakePoints(ply,itemData.price)

                    zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseSucess"],itemData), 0)

                    ply.zpn_OwnedItems[itemid] = true

                    zpn.data.Save(ply)

                    hook.Run("zpn_OnShopItemBought", ply, npc, itemid,itemData)
                else
                    zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseFail01"],itemData), 1)
                end
            else
                zclib.Notify(ply, zpn.language.General["NotEnoughCandy"], 1)
            end
        else

            // Give the Player the item he purchased
            if zpn.PurchaseType[itemData.type](ply, itemData) then
                //zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseSucess"],itemData), 0)
            else
                zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseFail01"],itemData), 1)
            end
        end
    else

        if zpn.Candy.HasPoints(ply,itemData.price) then

            // Give the Player the item he purchased
            if zpn.PurchaseType[itemData.type](ply, itemData) then

                // Take money
                zpn.Candy.TakePoints(ply,itemData.price)

                zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseSucess"],itemData), 0)

                hook.Run("zpn_OnShopItemBought", ply, npc, itemid,itemData)
            else
                zclib.Notify(ply, zpn.Shop.NotifyReplace(zpn.language.General["PurchaseFail01"],itemData), 1)
            end
        else
            zclib.Notify(ply, zpn.language.General["NotEnoughCandy"], 1)
        end
    end
end

function zpn.Shop.NotifyReplace(text,itemData)

    local str = text
    str = string.Replace(str,"$itemname",itemData.name)
    str = string.Replace(str,"$itemamount",itemData.amount)

    return str
end
