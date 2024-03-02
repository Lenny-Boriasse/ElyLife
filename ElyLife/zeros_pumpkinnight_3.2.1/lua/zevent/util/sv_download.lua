if CLIENT then return end
zpn = zpn or {}
zpn.force = zpn.force or {}
if zpn.config.FastDl then

	function zpn.force.AddDir(path)

		local files, folders = file.Find(path .. "/*", "GAME")

		for k, v in pairs(files) do
			resource.AddFile(path .. "/" .. v)
		end

		for k, v in pairs(folders) do

			zpn.force.AddDir(path .. "/" .. v)
		end
	end

	zpn.force.AddDir("sound/zpn/")

	zpn.force.AddDir("models/zerochain/props_pumpkinnight/")
	zpn.force.AddDir("materials/zerochain/props_pumpkinnight/")

	zpn.force.AddDir("models/zerochain/props_christmas/")
	zpn.force.AddDir("materials/zerochain/props_christmas/")

	zpn.force.AddDir("materials/zerochain/zpn/")

	resource.AddSingleFile("materials/entities/zpn_candy.png")
	resource.AddSingleFile("materials/entities/zpn_ghost.png")
	resource.AddSingleFile("materials/entities/zpn_npc.png")
	resource.AddSingleFile("materials/entities/zpn_destructable.png")
	resource.AddSingleFile("materials/entities/zpn_bomb.png")
	resource.AddSingleFile("materials/entities/zpn_boss.png")
	resource.AddSingleFile("materials/entities/zpn_minion.png")
	resource.AddSingleFile("materials/entities/zpn_scoreboard.png")
	resource.AddSingleFile("materials/entities/zpn_sign.png")

	resource.AddSingleFile("particles/zpn_candle_vfx.pcf")
	resource.AddSingleFile("particles/zpn_candy_vfx.pcf")
	resource.AddSingleFile("particles/zpn_fire_vfx.pcf")
	resource.AddSingleFile("particles/zpn_fuse_vfx.pcf")
	resource.AddSingleFile("particles/zpn_ghost_vfx.pcf")
	resource.AddSingleFile("particles/zpn_leafstorm.pcf")
	resource.AddSingleFile("particles/zpn_minion_vfx.pcf")
	resource.AddSingleFile("particles/zpn_partypopper_projectile.pcf")
	resource.AddSingleFile("particles/zpn_partypopper_vfx.pcf")
	resource.AddSingleFile("particles/zpn_pumpkin_vfx.pcf")
	resource.AddSingleFile("particles/zpn_pumpkinboss_vfx.pcf")


	resource.AddSingleFile("materials/vgui/entities/zpn_partypopper.vmt")
	resource.AddSingleFile("materials/vgui/entities/zpn_partypopper.vtf")

	resource.AddSingleFile("materials/vgui/entities/zpn_partypopper01.vmt")
	resource.AddSingleFile("materials/vgui/entities/zpn_partypopper01.vtf")

	resource.AddSingleFile("resource/fonts/JollyLodger-Regular.ttf")
	resource.AddSingleFile("resource/fonts/Vampire95.ttf")

else
	resource.AddWorkshop( "1890110902" ) // Zeros PumpkinNight Contentpack
	//https://steamcommunity.com/sharedfiles/filedetails/?id=1890110902
end

for k, v in pairs(zpn.config.Boss.MusicPaths) do
	resource.AddSingleFile("sound/" .. v)
end
