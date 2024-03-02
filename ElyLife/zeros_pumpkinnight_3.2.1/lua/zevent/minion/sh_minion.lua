zpn = zpn or {}
zpn.Minion = zpn.Minion or {}

if SERVER then

	// Displays all the Minion spawns to the user
	util.AddNetworkString("zpn_Minion_ShowSpawns_net")
	function zpn.Minion.ShowSpawnHints(ply)
	    if not IsValid(ply) then return end

		local positions = {}

		for k,v in pairs(zpn.MinionPositions) do
			if v and v.pos then
				table.insert(positions,v.pos)
			end
		end

	    local dataString = util.TableToJSON(positions)
	    local dataCompressed = util.Compress(dataString)

	    net.Start("zpn_Minion_ShowSpawns_net")
	    net.WriteUInt(#dataCompressed, 16)
	    net.WriteData(dataCompressed, #dataCompressed)
	    net.Send(ply)
	end
else

	local zpn_MinionSpawn_Hints = {}

	net.Receive("zpn_Minion_ShowSpawns_net", function(len, ply)
		zclib.Debug("zpn_Minion_ShowSpawns_net Len: " .. len)

		local dataLength = net.ReadUInt(16)
		local d_Decompressed = util.Decompress(net.ReadData(dataLength))
		local positions = util.JSONToTable(d_Decompressed)

		zpn_MinionSpawn_Hints = {}

		for k,v in pairs(positions) do
			table.insert(zpn_MinionSpawn_Hints,{time = CurTime(),pos = v})
		end
	end)

	function zpn.Minion.DrawSpawnHints()
		if zpn_MinionSpawn_Hints and table.Count(zpn_MinionSpawn_Hints) > 0 then
			for k, v in pairs(zpn_MinionSpawn_Hints) do
				if v then

					if (v.time + 10) < CurTime() then
						table.remove(zpn_MinionSpawn_Hints,k)
						continue
					end

					local pos = v.pos:ToScreen()
					local size = 25
					surface.SetDrawColor(zpn.Theme.Design.color02)
					surface.DrawRect(pos.x - (size * zclib.wM) / 2, pos.y - (size * zclib.hM) / 2, size * zclib.wM, size * zclib.hM)
				end
			end
		end
	end

	zclib.Hook.Add("HUDPaint", "zpn_MinionSpawnHints", zpn.Minion.DrawSpawnHints)
end