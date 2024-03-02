if CLIENT then return end
zpn = zpn or {}
zpn.data = zpn.data or {}

function zpn.data.DataChanged(ply)
    if not ply.zpn_DataChanged then
        ply.zpn_DataChanged = true
    end
end

function zpn.data.PlayerDisconnect(ply)
    zclib.Debug("zpn.data.PlayerDisconnect")

    if ply.zpn_DataChanged then
        zpn.data.Save(ply)
    end
end

zclib.Hook.Add("PlayerDisconnected", "zpn_Data", zpn.data.PlayerDisconnect)

function zpn.data.Init(ply)
    zclib.Debug("zpn.data.Init: " .. ply:Nick())

    if not file.Exists("zpn", "DATA") then
        file.CreateDir("zpn")
    end

    if not file.Exists("zpn/data/", "DATA") then
        file.CreateDir("zpn/data/")
    end

    local plyID = ply:SteamID64()

    if file.Exists("zpn/data/" .. plyID .. ".txt", "DATA") then
        local data = file.Read("zpn/data/" .. plyID .. ".txt", "DATA")
        data = util.JSONToTable(data)
        zclib.Debug("Data loaded for " .. ply:Nick())
        zpn.Candy.SetPoints(ply, data.Points)
        zpn.Score.SetPoints(ply, data.Score)
        ply.zpn_OwnedItems = data.OwnedItems
    else
        zpn.Candy.SetPoints(ply, 0)
        zpn.Score.SetPoints(ply, 0)
        ply.zpn_OwnedItems = {}
        zclib.Debug("Data created for " .. ply:Nick())
    end

    zpn.data.DataChanged(ply)
end

function zpn.data.Save(ply)
    if zpn.config.Data.Save == false then return end
    if zpn.config.Data.Whitelist and table.Count(zpn.config.Data.Whitelist) > 0 and zpn.config.Data.Whitelist[zclib.Player.GetRank(ply)] == nil then return end
    zclib.Debug("zpn.data.Save")
    local plyID = ply:SteamID64()

    local data = {
        Points = zpn.Candy.ReturnPoints(ply),
        Score = zpn.Score.ReturnPoints(ply),
        OwnedItems = ply.zpn_OwnedItems or {}
    }

    local path = "zpn/data/" .. tostring(plyID) .. ".txt"

    if data and (data.Points > 0 or data.Score > 0 or table.Count(data.OwnedItems) > 0) then
        file.Write(path, util.TableToJSON(data))
    else
        if file.Exists(path, "DATA") then
            file.Delete(path)
        end
    end
end

function zpn.data.Save_All()
    for k, v in pairs(zclib.Player.List) do
        if (v.zpn_DataChanged) then
            zpn.data.Save(v)
        end
    end
end

local function Check_DataSaver_TimerExist()
    if zpn.config.Data.Save == false then return end
    if zpn.config.Data.Save_Interval == -1 then return end

    if timer.Exists("zpn_DataSaver_timer") then
        timer.Remove("zpn_DataSaver_timer")
    end

    timer.Create("zpn_DataSaver_timer", zpn.config.Data.Save_Interval, 0, zpn.data.Save_All)
end

timer.Simple(1,function()
    Check_DataSaver_TimerExist()
end)
