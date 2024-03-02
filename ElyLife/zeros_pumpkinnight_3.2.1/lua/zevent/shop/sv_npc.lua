if CLIENT then return end
zpn = zpn or {}
zpn.NPC = zpn.NPC or {}
zpn.PurchaseType = zpn.PurchaseType or {}

function zpn.NPC.USE(ply, npc)
    zpn.Shop.Open(ply, npc)
end

// Sets up the saving / loading and removing of the entity for the map
zclib.STM.Setup("zpn_npc","zpn/" .. string.lower(game.GetMap()) .. "_shopnpc" .. ".txt",function()
    local data = {}

    for u, j in pairs(ents.FindByClass("zpn_npc")) do
        if IsValid(j) then
            table.insert(data, {
                pos = j:GetPos(),
                ang = j:GetAngles()
            })
        end
    end

    return data
end,function(data)

    for k, v in pairs(data) do
        local ent = ents.Create("zpn_npc")
        ent:SetPos(v.pos)
        ent:SetAngles(v.ang)
        ent:Spawn()
        ent:Activate()

        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then
            phys:Wake()
            phys:EnableMotion(false)
        end
    end

    zpn.Print("Finished loading Shop NPC Entities.")
end,function()
    for k, v in pairs(ents.FindByClass("zpn_npc")) do
        if IsValid(v) then
            v:Remove()
        end
    end
end)

concommand.Add("zpn_save_npc", function(ply, cmd, args)
    if zclib.Player.IsAdmin(ply) and zclib.STM.Save("zpn_npc") then
        zclib.Notify(ply, "Shop NPC entities have been saved for the map " .. game.GetMap() .. "!", 0)
    end
end)

concommand.Add("zpn_remove_npc", function(ply, cmd, args)
    if zclib.Player.IsAdmin(ply) then
        zclib.Notify(ply, "Shop NPC entities have been removed for the map " .. game.GetMap() .. "!", 0)
        zclib.STM.Remove("zpn_npc")
    end
end)
