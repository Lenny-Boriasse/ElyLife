print("[SGM VCS] Config Loaded")
SGM_VCS.Config.Spikes = {}
SGM_VCS.Config.WheelGrabber = {}
SGM_VCS.Config.GPSTracker = {}

SGM_VCS.Config.Language = "fr"

--options to disable certain features if you don't want them

SGM_VCS.Config.Spikes.Enabled = true
SGM_VCS.Config.WheelGrabber.Enabled = true
SGM_VCS.Config.GPSTracker.Enabled = true

--vehicle/job filtering methods

SGM_VCS.Config.DetectionMethod = "VC" --how should we detect what vehicles are considered cop cars? accepted values are: "BOTH", "VC", "PHOTON", or creating a list below

--[[
ADDING VEHICLES TO THE DETECTION LIST BELOW WILL OVERRIDE THE DETECTION METHOD SELECTED ABOVE
you can add a list of vehicles to consider cop cars below
you can get the class of a vehicle by right clicking it in the spawn menu and pressing 'copy to clipboard'
manually adding vehicles into this list is a good idea if you want to prevent possible abuse from vehicles that
are 'technically' emergency vehicles just because they have beacons on them e.g. tow trucks
--]]

SGM_VCS.Config.DetectionList = {
    ["riotgtav"] = true,
   	["charger12poltdm"] = true,
    ["chargersrt8poltdm"] = true,
   	["fortauruspoltdm"] = true,
    ["hsvw427poltdm"] = true,
    ["mitsuevoxpoltdm"] = true,
    ["airtugtdm"] = true,
    ["smc_mustang_lapd"] = true,
    ["crsk_honda_accord_200p"] = true,
    ["dodge_charger_2015_police_lw"] = true,
    ["forcrownvicpoltdm"] = true,
    ["sim_fphys_iveco_lmv"] = true,
    ["sim_fphys_iveco_mg1"] = true,
    ["sim_fphys_iveco_sf"] = true,
    ["sim_fphys_iveco_mg2"] = true,
	["sim_fphys_m_atv_nomg"] = true,
    ["sim_fphys_m_atv_mg"] = true,
    ["sim_fphys_mtvr1"] = true,
    ["sim_fphys_conscriptapc"] = true,
    ["forcrownvicpoltdm"] = true,
    
    
    -- ["sm16fpiu"] = true,
}

--below is a list of jobs allowed to use the vehicle combat systems, make sure to use full job names, IF YOU LEAVE THIS EMPTY WEAPONS AND GPS LOCATIONS WILL BE AVAILABLE TO EVERYONE ON YOUR SERVER

SGM_VCS.Config.AllowedJobs = {  
   	["*WL* Commissaire"] = true,
    ["HC de Commandement"] = true,
    ["GDLP - Officiers"] = true,
    ["Gardien de la Paix"] = true,
    ["*VIP* BAC"] = true,
    ["*WL* RAID"] = true,
    ["*WL* Chef RAID"] = true,
}

--restrict combat systems to certain ranks
SGM_VCS.Config.AllowedRanks = { 
    --["superadmin"] = true,
}

--config for the spike strips
SGM_VCS.Config.Spikes.KeyBind = KEY_A --valid keys are here: https:--wiki.facepunch.com/gmod/Enums/KEY
SGM_VCS.Config.Spikes.Cooldown = 15 --how often can spikes be deployed?
SGM_VCS.Config.Spikes.MaxDistance = 1500000 --distance from the car before the spikes are considered abandoned and will begin to automatically despawn, this distance is squared (e.g. for 10 units you should put 100 units² here)
SGM_VCS.Config.Spikes.DespawnAfterHit = true --should the spikes despawn after hitting a car?
SGM_VCS.Config.Spikes.SpikeTimer = 5 --how long it should take for the spikes to fully despawn once abandoned
SGM_VCS.Config.Spikes.DisableFriendlyFire = true --should the spike strip ignore cop cars? if the police force on your server has a habit of ramming eachother you should probably enable this

--[[damage types; disabling both of these will cause the spikes to do literally nothing to vehicles, so make sure to
keep at least one enabled--]]

SGM_VCS.Config.Spikes.EnableVCDamage = true --should the spikes pop the tires on the vehicle if VCMod is installed?
SGM_VCS.Config.Spikes.EnableSpinout = true --should the vehicle spin out of control after hitting the spikes? (if VCMod damage is enabled at least 3 of the vehicles tires need to be punctured to cause a spinout)
SGM_VCS.Config.Spikes.SpinoutForce = 10 --if enabled, how hard should the vehicle get spun out? 10 is a good value for a Need For Speed style spinout. USE CAUTION WHEN EDITING THIS VALUE, SUPER HIGH VALUES CAN CRASH YOUR GAME
SGM_VCS.Config.Spikes.SpinoutForceDisableBrakes = true --should the vehicles handbrake get forcibly disabled to make it harder to recover from a successful spike?
SGM_VCS.Config.Spikes.SpinoutVCThreshold = 3 --if VCMod damage is enabled, how many tires until the vehicle gets completely spun out? this allows partial hits to still be effective but not overpowered (e.g. spinning from only one wheel being hit)

--config for the wheel grabber
SGM_VCS.Config.WheelGrabber.KeyBind = KEY_X --valid keys are here: https:--wiki.facepunch.com/gmod/Enums/KEY
SGM_VCS.Config.WheelGrabber.Cooldown = 15 --how often can the grabber be deployed normally?
SGM_VCS.Config.WheelGrabber.ForceCloseTimer = 15 --how long can the grabber be deployed before it is automatically closed and put on cooldown? 0 = disabled
SGM_VCS.Config.WheelGrabber.SuccessfulHitTimer = 120 --how long should the wait period be after successfully grabbing a wheel
SGM_VCS.Config.WheelGrabber.DespawnTimer = 30 --how long should the car's wheel stay tied up? 0 = infinite, not recommended but still supported
SGM_VCS.Config.WheelGrabber.DisableHandbrake = true --should the handbrake be disabled after a successful grab? this prevents cops from being able to instantly stop people while in heavy vehicles

--[[
you can add a list of vehicles to give wheel grabbers below
you can get the class of a vehicle by right clicking it in the spawn menu and pressing 'copy to clipboard'
I tried to make sure that adding vehicles is pretty self explanatory, but if you still need any help
adding additional vehicles contact me on Discord: SGM#0420, or submit a ticket
--]]

SGM_VCS.Config.WheelGrabber.VehicleList = {
    ["riotgtav"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, 0),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    -- ["sm16fpiu"] = { --this vehicle can sometimes be used by civilians, so it's commented out by default
    --     pos = Vector(0, 121.5, 17.5),
    --     ang = Angle(0, 0, -10),
    --     scale = 0.82,
    --     style = 0, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    -- },
    ["charger12poltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["chargersrt8poltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["fortauruspoltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["hsvw427poltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["mitsuevoxpoltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["airtugtdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["smc_mustang_lapd"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["crsk_honda_accord_200p"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.66,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["dodge_charger_2015_police_lw"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["forcrownvicpoltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 1, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_iveco_lmv"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_iveco_mg1"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_iveco_sf"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_iveco_mg2"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_m_atv_nomg"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_m_atv_mg"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_mtvr1"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["sim_fphys_conscriptapc"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
    ["forcrownvicpoltdm"] = {
        pos = Vector(0, 110.15, 20.5),
        ang = Angle(0, 0, -7.5),
        scale = 0.72,
        style = 2, --various styles for different vehicles; 0 = slim, 1 = extended, 2 = full bumper
    },
}

--config for the gps tracker
SGM_VCS.Config.GPSTracker.KeyBind = KEY_M --valid keys are here: https:--wiki.facepunch.com/gmod/Enums/KEY
SGM_VCS.Config.GPSTracker.Cooldown = 15 --how often can the tracker be deployed normally?
SGM_VCS.Config.GPSTracker.PingTime = 5 --how often should the tracker update its location?
SGM_VCS.Config.GPSTracker.Duration = 60 --how long should the tracker stay attached?
SGM_VCS.Config.GPSTracker.SuccessfulHitTimer = 300 --how long should the wait period be after successfully attaching a tracker