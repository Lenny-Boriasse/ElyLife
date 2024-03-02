zpn = zpn or {}
zpn.language = zpn.language or {}
zpn.language.General = zpn.language.General or {}

if (zpn.config.SelectedLanguage == "tr") then
    zpn.language.General["PurchaseSucess"] = "Basariyla $itemamount tane $itemname satin aldin!"
    zpn.language.General["PurchaseFail01"] = "Zaten $itemname esyasina sahipsin!"
    zpn.language.General["PurchaseFail02"] = "Dogru rutbeye sahip degilsin!"
    zpn.language.General["NotEnoughCandy"] = "Yeterli sekerin yok!"
    zpn.language.General["PumpkinSmashers"] = "Balkabagi Parcalayicilari" // Title for the Pumpkin Smasher Scoreboard
    zpn.language.General["CandyShop"] = "Seker Magazasi" // Shop Title
    zpn.language.General["Buy"] = "Satin Al"
    zpn.language.General["Owned"] = "Sahipli"
    zpn.language.General["Permanent"] = "Kalici"

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