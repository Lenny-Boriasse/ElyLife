if CLIENT then return end
zpn = zpn or {}
zpn.Candy = zpn.Candy or {}

////////////////////////////////////////////
////////////// Candy Points //////////////////
////////////////////////////////////////////

// This System keeps track on how many Candy Points the player currently has
zpn.CandyPoints = zpn.CandyPoints or {}

function zpn.Candy.SetPoints(ply, points)
    if not IsValid(ply) then return end
    zclib.Debug("zpn.Candy.SetPoints: " .. points .. " for " .. ply:Nick())
    local plyID = zclib.Player.GetID(ply)

    zpn.CandyPoints[plyID] = points

    zpn.data.DataChanged(ply)
end

function zpn.Candy.AddPoints(ply, points)
    if not IsValid(ply) then return end
    zclib.Debug("zpn.Candy.AddPoints: " .. points .. " to " .. ply:Nick())
    local plyID = zclib.Player.GetID(ply)

    zpn.Candy.Notify(ply,points)
    zpn.CandyPoints[plyID] = zpn.Candy.ReturnPoints(ply) + points

    hook.Run("zpn_OnCandyCollect", ply, points)

    zpn.data.DataChanged(ply)
end

// Returns the players CandyPoints
function zpn.Candy.ReturnPoints(ply)
    return zpn.CandyPoints[zclib.Player.GetID(ply)] or 0
end

// Checks if the player has a certain amount of candy points
function zpn.Candy.HasPoints(ply,amount)
    return zpn.Candy.ReturnPoints(ply) >= amount
end

// Takes CandyPoints from a Player
function zpn.Candy.TakePoints(ply,amount)
    if not IsValid(ply) then return end
    zclib.Debug("zpn.Candy.TakePoints: " .. amount .. " to " .. ply:Nick())
    local plyID = zclib.Player.GetID(ply)

    zpn.CandyPoints[plyID] = math.Clamp(zpn.Candy.ReturnPoints(ply) - amount,0,9999999999)

    zpn.data.DataChanged(ply)
end
////////////////////////////////////////////
////////////////////////////////////////////
