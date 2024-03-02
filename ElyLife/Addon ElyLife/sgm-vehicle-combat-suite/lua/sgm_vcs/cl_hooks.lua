local function drawCircle( x, y, radius, seg )

	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )

end

--[[
    Draw GPS trackers on the HUD
--]]

--cache new colors so we can modify them later 
local color_whitea = Color(255,255,255,255)
local color_blacka = Color(0,0,0,255)

hook.Add("PreDrawEffects", "SGM_VCS.GPSTrackers.Draw", function()

    local tbl = SGM_VCS.GPSTrackers
    local angle = EyeAngles()
	angle:RotateAroundAxis( angle:Up(), -90 )
	angle:RotateAroundAxis( angle:Forward(), 90 )
    --make sure table isn't empty
    if next(tbl) ~= nil then

        for _,v in ipairs(tbl) do
            local pos = v.Position or vector_origin
            local name = v.TargetName or ""
            local distance = LocalPlayer():GetPos():Distance(pos)
            --distance check for optimization
            if distance <= 10000 then

                local scale = 0.00125 -- default scale
                local scaleMult = math.Clamp( scale * distance, 0.3, 4) -- multiplier to increase the scale as you get further away to keep the text readable
                local textAlpha = 255 - (scaleMult * 50) -- fade out the text as you get farther away

                color_whitea.a = textAlpha
                color_blacka.a = textAlpha

                cam.Start3D2D(pos, angle, scaleMult ) -- begin rendering the effects

                    cam.IgnoreZ(true) -- this allows it to be seen through walls

                    surface.SetDrawColor( 0, 255, 0, (scaleMult * 125) )
	                draw.NoTexture()
                    drawCircle(0, 0, 5, 20)

                    draw.SimpleTextOutlined("GPS LOCK", "DermaLarge", 10, 0, color_whitea, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 0.75, color_blacka )
                    draw.SimpleTextOutlined(name, "DermaDefault", 12, 15, color_whitea, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 0.75, color_blacka )

                    cam.IgnoreZ(false) -- disable rendering through walls just in case (it might get done automatically anyway, but this prevents any potential bugs)

                cam.End3D2D() -- finish rendering the effects

            end

        end

    end

end)