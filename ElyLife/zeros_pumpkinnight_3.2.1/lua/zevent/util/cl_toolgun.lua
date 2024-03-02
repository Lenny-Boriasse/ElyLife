if SERVER then return end
zpn = zpn or {}
local ply = LocalPlayer()

local function HasToolActive()
	if IsValid(ply) and ply:Alive() and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "gmod_tool" then
		return true
	else
		return false
	end
end

local zpn_PumpkinSpawn_Hints = {}

net.Receive("zpn_PumpkinSpawner_showall", function(len)
	local dataLength = net.ReadUInt(16)
	local d_Decompressed = util.Decompress(net.ReadData(dataLength))
	local positions = util.JSONToTable(d_Decompressed)

	ply = LocalPlayer()

	if positions then
		zpn_PumpkinSpawn_Hints = positions

		zclib.Hook.Remove("PostDrawTranslucentRenderables", "zpn_ToolGun")
		zclib.Hook.Add("PostDrawTranslucentRenderables", "zpn_ToolGun", function()
			if HasToolActive() then
				local tr = ply:GetEyeTrace()

				if tr.Hit and not IsValid(tr.Entity) and zclib.util.InDistance(tr.HitPos, ply:GetPos(), 300) then
					render.SetColorMaterial()
					render.DrawWireframeSphere(tr.HitPos, 1, 4, 4, zpn.Theme.Design.color01, false)
				end
			else
				zclib.Hook.Remove("PostDrawTranslucentRenderables", "zpn_ToolGun")
			end
		end)

		zclib.Hook.Remove("HUDPaint", "zpn_PumpkinSpawnHints")
		zclib.Hook.Add("HUDPaint", "zpn_PumpkinSpawnHints", function()
			if HasToolActive() and zpn_PumpkinSpawn_Hints and table.Count(zpn_PumpkinSpawn_Hints) > 0 then
				for k, v in pairs(zpn_PumpkinSpawn_Hints) do
					if v then
						local pos = v:ToScreen()
						local size = 10
						surface.SetDrawColor(zpn.Theme.Design.color01)
						surface.DrawRect(pos.x - (size * zclib.wM) / 2, pos.y - (size * zclib.hM) / 2, size * zclib.wM, size * zclib.hM)
					end
				end
			else
				zclib.Hook.Remove("HUDPaint", "zpn_PumpkinSpawnHints")
			end
		end)
	end
end)

net.Receive("zpn_PumpkinSpawner_hideall", function(len)
	zpn_PumpkinSpawn_Hints = {}
	zclib.Hook.Remove("PostDrawTranslucentRenderables", "zpn_ToolGun")
	zclib.Hook.Remove("HUDPaint", "zpn_PumpkinSpawnHints")
end)
