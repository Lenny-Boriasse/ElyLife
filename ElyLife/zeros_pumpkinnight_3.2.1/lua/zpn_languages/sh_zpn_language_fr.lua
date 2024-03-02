zpn = zpn or {}
zpn.language = zpn.language or {}
zpn.language.General = zpn.language.General or {}

if (zpn.config.SelectedLanguage == "fr") then
    zpn.language.General["PurchaseSucess"] = "Vous avez acheté $itemamount $itemname!"
    zpn.language.General["PurchaseFail01"] = "Vous avez déjà un $itemname!"
    zpn.language.General["PurchaseFail02"] = "Vous n'avez pas le bon grade pour acheter ceci!"
    zpn.language.General["NotEnoughCandy"] = "Vous n'avez pas assez de bonbons!"
    zpn.language.General["PumpkinSmashers"] = "Destructeurs de citrouilles" // Title for the Pumpkin Smasher Scoreboard
    zpn.language.General["CandyShop"] = "Boutique de bonbons" // Shop Title
    zpn.language.General["Buy"] = "Acheter"
    zpn.language.General["Owned"] = "Acheté"
    zpn.language.General["Permanent"] = "Permanent"

    // Update 2.0.9
    zpn.language.General["cmd_discord"] = "Vous permet de rejoindre le discord"
    zpn.language.General["cmd_candy"] = "Vous permet de voir le nombre de bonbons possédés."
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
