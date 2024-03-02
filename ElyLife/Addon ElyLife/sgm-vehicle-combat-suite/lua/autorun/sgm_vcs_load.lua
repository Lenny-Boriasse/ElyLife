SGM_VCS = SGM_VCS or {}
SGM_VCS.Config = SGM_VCS.Config or {}
SGM_VCS.GPSTrackers = SGM_VCS.GPSTrackers or {}
SGM_VCS.GPSTrackerPositions = SGM_VCS.GPSTrackerPositions or {}

SGM_VCS.UserId = "76561198109871279"
SGM_VCS.Version = "4add47d2-ee0e-4312-a987-ee2861fd005f"

function SGM_VCS.LoadConfig()
    if SERVER then
        print("[SGM VCS] Loading Server Files...")
        include("sgm_vcs/sh_config.lua")
        include("sgm_vcs/sv_functions.lua")
        include("sgm_vcs/sv_hooks.lua")
        include("sgm_vcs/sh_functions.lua")
        AddCSLuaFile("sgm_vcs/sh_config.lua")
        AddCSLuaFile("sgm_vcs/sh_functions.lua")
        AddCSLuaFile("sgm_vcs/cl_net.lua")
        AddCSLuaFile("sgm_vcs/cl_hooks.lua")
        AddCSLuaFile("sgm_vcs/cl_lang.lua")
    else
        print("[SGM VCS] Loading Client Files...")
        include("sgm_vcs/sh_config.lua")
        include("sgm_vcs/sh_functions.lua")
        include("sgm_vcs/cl_net.lua")
        include("sgm_vcs/cl_hooks.lua")
        include("sgm_vcs/cl_lang.lua")
    end
end

if SERVER then
	hook.Add("PostGamemodeLoaded", "SGM_VCS.LoadServer", function() SGM_VCS.LoadConfig() end)
else
	hook.Add("InitPostEntity", "SGM_VCS.LoadClient", function() SGM_VCS.LoadConfig() end)
end

if SERVER then
    resource.AddWorkshop("2872645091")
end