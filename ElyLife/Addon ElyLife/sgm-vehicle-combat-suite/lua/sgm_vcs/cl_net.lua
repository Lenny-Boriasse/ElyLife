--tracker
net.Receive("sgm_vcs.gpstracker_add", function(len, ply)
	if !SGM_VCS.IsPlayerCop(LocalPlayer()) then return end
	local ent = net.ReadEntity()
	table.insert(SGM_VCS.GPSTrackers, ent)
	ent:CallOnRemove("RemoveFromClientTables", function()
		table.RemoveByValue(SGM_VCS.GPSTrackers, ent)
	end)
end)

net.Receive("sgm_vcs.gpstracker_clear", function(len, ply)
	table.Empty(SGM_VCS.GPSTrackers)
	table.Empty(SGM_VCS.GPSTrackerPositions)
end)

net.Receive("sgm_vcs.gpstracker_remove", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].GPSTrackerRemoved, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button19.wav")
end)

net.Receive("sgm_vcs.gpstracker_hit", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].GPSTrackerHit, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button9.wav")
end)

net.Receive("sgm_vcs.gpstracker_cooldown", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].GPSTrackerCooldown, NOTIFY_UNDO, 5)
	surface.PlaySound("buttons/button8.wav")
end)

net.Receive("sgm_vcs.gpstracker_alreadyactive", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].GPSTrackerActive, NOTIFY_UNDO, 5)
	surface.PlaySound("buttons/button10.wav")
end)

--spikes
net.Receive("sgm_vcs.spikes_removed", function(len)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].SpikesRemoved, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button19.wav")
end)

net.Receive("sgm_vcs.spikes_successful", function(len)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].SpikesHit, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button19.wav")
	surface.PlaySound("npc/roller/blade_out.wav")
	surface.PlaySound("npc/manhack/mh_blade_snick1.wav")
end)

net.Receive("sgm_vcs.spikes_successful_remove", function(len)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].SpikesHitRemove, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button19.wav")
	surface.PlaySound("npc/roller/blade_out.wav")
	surface.PlaySound("npc/manhack/mh_blade_snick1.wav")
end)

--wheel grabber
net.Receive("sgm_vcs.wheelgrabber_hit", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].WheelGrabberHit, NOTIFY_UNDO, 5)
	surface.PlaySound("buttons/button14.wav")
end)

net.Receive("sgm_vcs.wheelgrabber_remove", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].WheelGrabberRemove, NOTIFY_CLEANUP, 5)
	surface.PlaySound("buttons/button19.wav")
end)

net.Receive("sgm_vcs.wheelgrabber_cooldown", function(len, ply)
	notification.AddLegacy(SGM_VCS.Languages[SGM_VCS.Config.Language].WheelGrabberCooldown, NOTIFY_UNDO, 5)
	surface.PlaySound("buttons/button8.wav")
end)