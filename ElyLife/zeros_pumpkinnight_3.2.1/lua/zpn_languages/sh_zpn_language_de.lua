zpn = zpn or {}
zpn.language = zpn.language or {}
zpn.language.General = zpn.language.General or {}

if (zpn.config.SelectedLanguage == "de") then
    zpn.language.General["PurchaseSucess"] = "Du hast $itemamount $itemname gekauft!"
    zpn.language.General["PurchaseFail01"] = "Du besitzt bereits $itemname!"
    zpn.language.General["PurchaseFail02"] = "Du hast nicht den korrekten rang um das zu kaufen!"
    zpn.language.General["NotEnoughCandy"] = "Du hast nicht genug Süßigkeiten!"
    zpn.language.General["PumpkinSmashers"] = "Kürbis-Smashers"
    zpn.language.General["CandyShop"] = "Candy Shop"
    zpn.language.General["Buy"] = "Kaufen"
    zpn.language.General["Owned"] = "Gekauft"
    zpn.language.General["Permanent"] = "Permanent"

    // Update 2.0.9
    zpn.language.General["cmd_candy"] = "Zeigt dir deine aktuellen candy punkte."
    zpn.language.General["cmd_dropcandy"] = "Lässt die definierte Menge an Süßigkeiten fallen."
    zpn.language.General["cmd_sellcandy"] = "Verkauft die angegebene Menge an Süßigkeiten. [Menge / $SellValue]"
    zpn.language.General["sellcandy_denied"] = "Der Verkauf von Süßigkeiten ist deaktiviert!"
    zpn.language.General["easyskin_invalidgun"] = "Deine aktive Waffe kann für diesen Skin nicht verwendet werden!"
    zpn.language.General["inv_itemadd"] = "$ItemName wurde Ihrem Inventar hinzugefügt!"
    zpn.language.General["InvalidDropPosition"] = "Ungültige Ablageposition!"

	// Update 3.2.0
	zpn.language.General["MaskGhostAttackPrevented"] = "Ghost attack prevented!"
	zpn.language.General["Maskbroke"] = "Mask broke!"
end
