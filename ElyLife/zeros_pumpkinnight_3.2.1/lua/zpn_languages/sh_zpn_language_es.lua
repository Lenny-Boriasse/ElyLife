zpn = zpn or {}
zpn.language = zpn.language or {}
zpn.language.General = zpn.language.General or {}

if (zpn.config.SelectedLanguage == "es") then
    zpn.language.General["PurchaseSucess"] = "Compraste $itemamount $itemname con éxito!"
    zpn.language.General["PurchaseFail01"] = "Ya tienes $itemname!"
    zpn.language.General["PurchaseFail02"] = "Tienes el rango incorrecto!"
    zpn.language.General["NotEnoughCandy"] = "No tienes suficiente dulces!"
    zpn.language.General["PumpkinSmashers"] = "Destructor de calabaza" // Title for the Pumpkin Smasher Scoreboard
    zpn.language.General["CandyShop"] = "Negocio" // Shop Title
    zpn.language.General["Buy"] = "Comprar"
    zpn.language.General["Owned"] = "Comprado"
    zpn.language.General["Permanent"] = "Permanente"

    // Update 2.0.9
    zpn.language.General["cmd_candy"] = "Tells you your current CandyPoints."
    zpn.language.General["cmd_dropcandy"] = "Drops the defined amount of candy."
    zpn.language.General["cmd_sellcandy"] = "Sells the specified amount of candy. [Amount / $SellValue]"
    zpn.language.General["sellcandy_denied"] = "Selling candy is disabled!"
    zpn.language.General["easyskin_invalidgun"] = "Your active weapon cant be used for this skin!"
    zpn.language.General["inv_itemadd"] = "$ItemName has been added to your Inventory!"
    zpn.language.General["InvalidDropPosition"] = "Invalid drop position!"

	// Update 3.2.0
	zpn.language.General["MaskGhostAttackPrevented"] = "Ghost attack prevented!"
	zpn.language.General["Maskbroke"] = "Mask broke!"
end
