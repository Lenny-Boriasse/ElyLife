if SERVER then return end


local style_font = "Jolly Lodger"
local font_size_mul = 1
if zpn.config.SelectedLanguage == "ru" then
	font_size_mul = 0.9
	style_font = "Vampire95"
end

zclib.AddFont("zpn_candy",{
	font = "Arial",
	extended = true,
	size = 100,
	weight = 1000,
	antialias = true
})

zclib.AddFont("zpn_candy_shadow",{
	font = "Arial",
	extended = true,
	size = 100,
	weight = 1000,
	blursize = 5,
	antialias = true,
})

////////////////////////////////////////////
///////////////// VGUI /////////////////////
////////////////////////////////////////////
zclib.AddFont("zpn_notify_font01",{
	font = "Arial",
	extended = true,
	size = ScreenScale( 25 ),
	weight = ScreenScale( 3000 ),
	antialias = true
})

zclib.AddFont("zpn_interface_font01",{
	font = style_font,
	extended = true,
	size = ScreenScale( 15 * font_size_mul ),
	weight = ScreenScale( 100 ),
	antialias = true
})

zclib.AddFont("zpn_interface_font01_small",{
	font = style_font,
	extended = true,
	size = ScreenScale( 12 * font_size_mul ),
	weight = ScreenScale( 100 ),
	antialias = true
})

zclib.AddFont("zpn_interface_font02",{
	font = style_font,
	extended = true,
	size = ScreenScale( 12 * font_size_mul ),
	weight = ScreenScale( 300 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_shopitem_candy",{
	font = style_font,
	extended = true,
	size = ScreenScale( 10 * font_size_mul ),
	weight = ScreenScale( 100 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_shopitem_owned",{
	font = style_font,
	extended = true,
	size = ScreenScale( 9 * font_size_mul ),
	weight = ScreenScale( 100 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_font03",{
	font = style_font,
	extended = true,
	size = ScreenScale( 25 * font_size_mul ),
	weight = ScreenScale( 100 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_font03_small",{
	font = style_font,
	extended = true,
	size = ScreenScale( 15 * font_size_mul ),
	weight = ScreenScale( 100 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_item_title",{
	font = style_font,
	extended = true,
	size = ScreenScale( 12 * font_size_mul ),
	weight = ScreenScale( 100 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_item_desc",{
	font = "Arial",
	extended = true,
	size = ScreenScale( 5 ),
	weight = ScreenScale( 1000 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_npc_title",{
	font = style_font,
	extended = true,
	size = 150 * font_size_mul,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_scoreboard_font01",{
	font = style_font,
	extended = true,
	size = 65 * font_size_mul,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_scoreboard_font01_small",{
	font = style_font,
	extended = true,
	size = 45 * font_size_mul,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_scoreboard_item_font01",{
	font = style_font,
	extended = true,
	size = 35 * font_size_mul,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_scoreboard_item_font02",{
	font = style_font,
	extended = true,
	size = 30 * font_size_mul,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

zclib.AddFont("zpn_interface_cmd",{
	font = "Arial",
	extended = true,
	size = ScreenScale( 7 ),
	weight = ScreenScale( 1000 ),
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})
