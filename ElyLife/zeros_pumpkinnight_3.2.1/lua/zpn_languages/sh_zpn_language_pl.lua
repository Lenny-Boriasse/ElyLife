zpn = zpn or {}
zpn.language = zpn.language or {}
zpn.language.General = zpn.language.General or {}

if (zpn.config.SelectedLanguage == "pl") then
    zpn.language.General["PurchaseSucess"] = "Pomyślnie zakupiłeś $itemamount $itemname!"
    zpn.language.General["PurchaseFail01"] = "Posiadasz już $itemname!"
    zpn.language.General["PurchaseFail02"] = "Nie posiadasz odpowiedniej rangi aby to zakupić!"
    zpn.language.General["NotEnoughCandy"] = "Nie posiadasz wystarczająco cukierków!"
    zpn.language.General["PumpkinSmashers"] = "Zgniatacze Dyń" // Title for the Pumpkin Smasher Scoreboard
    zpn.language.General["CandyShop"] = "Sklep z cukierkami" // Shop Title
    zpn.language.General["Buy"] = "Kup"
    zpn.language.General["Owned"] = "Posiadane"
    zpn.language.General["Permanent"] = "Stały"

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
