--[[
    Detect if the player is a cop
--]]
function SGM_VCS.IsPlayerCop(ply)
    if next(SGM_VCS.Config.AllowedRanks) ~= nil then 
        if !SGM_VCS.Config.AllowedRanks[ply:GetUserGroup()] then 
            return false
        end
    end
    if next(SGM_VCS.Config.AllowedJobs) ~= nil then
        if SGM_VCS.Config.AllowedJobs[team.GetName(ply:Team())] then
            return true
        else
            return false
        end
    else
        return true -- if the list is empty just return true
    end
end