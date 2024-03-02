zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "pl") then
    zmlab2.language["YouDontOwnThis"] = "Nie jesteś właścicielem tego!"
    zmlab2.language["Minutes"] = "Minuty"
    zmlab2.language["Seconds"] = "Sekundy"
    zmlab2.language["CratePickupFail"] = "Skrzynia jest pusta!"
    zmlab2.language["CratePickupSuccess"] = "Zebrano $MethAmount $MethName, Jakość: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Nie masz odpowiedniej pracy, aby to zrobić!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Ten punkt odbioru nie jest przypisany do Ciebie!"
    zmlab2.language["Dropoff_assinged"] = "Przypisano punkt odbioru!"
    zmlab2.language["Dropoff_cooldown"] = "Poczekaj chwilę zanim to zrobisz!"
    zmlab2.language["Equipment"] = "Wyposażenie"
    zmlab2.language["Equipment_Build"] = "Buduj"
    zmlab2.language["Equipment_Move"] = "Przenieś"
    zmlab2.language["Equipment_Repair"] = "Napraw"
    zmlab2.language["Equipment_Remove"] = "Usuń"
    zmlab2.language["NotEnoughMoney"] = "Nie masz wystarczająco pieniędzy!"
    zmlab2.language["ExtinguisherFail"] = "Ten obiek się nie pali!"
    zmlab2.language["Start"] = "Start"
    zmlab2.language["Drop"] = "Wyrzuć"
    zmlab2.language["Move Liquid"] = "Przenieś ciecz"
    zmlab2.language["Frezzer_NeedTray"] = "Nie znaleziono tacy z niezamrożoną metą!"
    zmlab2.language["ERROR"] = "ERROR"
    zmlab2.language["SPACE"] = "Naciśnij SPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Nie robię interesów z nieznajomymi! [Zła Praca]"
    zmlab2.language["NPC_InteractionFail02"] = "Nie masz żadnej mety!"
    zmlab2.language["NPC_InteractionFail03"] = "Nie mam wolnego punktu odbioru, wróć później."
    zmlab2.language["PoliceWanted"] = "Sprzedano Metę"
    zmlab2.language["MissingCrate"] = "Brakuje skrzynki"
    zmlab2.language["Storage"] = "MAGAZYN"
    zmlab2.language["ItemLimit"] = "Osiągnąłeś limit: $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Jesteś pewnien, że chcesz usunąć ten namiot?"
    zmlab2.language["TentFoldInfo02"] = "Wszystko w środku również zostanie usunięte!"
    zmlab2.language["TentFoldAction"] = "ZAGIĘCIE"
    zmlab2.language["TentType_None"] = "NONE"
    zmlab2.language["TentAction_Build"] = "BUDUJ"
    zmlab2.language["TentBuild_Info"] = "Proszę wyczyścić teren!"
    zmlab2.language["TentBuild_Abort"] = "Coś jest na przeszkodzie!"
    zmlab2.language["Enabled"] = "Aktywowane"
    zmlab2.language["Disabled"] = "Dezaktywowane"
    zmlab2.language["MethTypeRestricted"] = "Nie możesz robić tego typi mety!"
    zmlab2.language["SelectMethType"] = "Wybierz Typ Mety"
    zmlab2.language["SelectTentType"] = "Wybierz Rodzaj Namiotu"
    zmlab2.language["LightColor"] = "Kolor Świateł"
    zmlab2.language["Cancel"] = "Anuluj"
    zmlab2.language["Deconstruct"] = "Dekonstruuj"
    zmlab2.language["Construct"] = "Konstruuj"
    zmlab2.language["Choosepostion"] = "Wybierz nową pozycję"
    zmlab2.language["ChooseMachine"] = "Wybierz maszynę"
    zmlab2.language["Extinguish"] = "Ugaś"
    zmlab2.language["PumpTo"] = "Pompuj do"
    zmlab2.language["ConstructionCompleted"] = "Budowa zakończona!"
    zmlab2.language["Duration"] = "Czas Trwania"
    zmlab2.language["Amount"] = "Wydajność"
    zmlab2.language["Difficulty"] = "Poziom Trudności"
    zmlab2.language["Money"] = "Pieniądze"
    zmlab2.language["Difficulty_Easy"] = "Łatwy"
    zmlab2.language["Difficulty_Medium"] = "Średni"
    zmlab2.language["Difficulty_Hard"] = "Trudny"
    zmlab2.language["Difficulty_Expert"] = "Ekspert"
    zmlab2.language["Connected"] = "Połączono!"
    zmlab2.language["Missed"] = "Nie trafiono!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Vamonos Pest Tent - Mały"
    zmlab2.language["tent01_desc"] = "Ten mały namiot ma miejsce na 6 urządzeń."
    zmlab2.language["tent02_title"] = "Vamonos Pest Tent - Średni"
    zmlab2.language["tent02_desc"] = "Ten średni namiot ma miejsce na 9 urządzeń."
    zmlab2.language["tent03_title"] = "Vamonos Pest Tent - Wielki"
    zmlab2.language["tent03_desc"] = "Ten wielki namiot ma miejsce na 16 urządzeń."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "Ten namiot cyrkowy ma miejsce na 24 urządzenia."

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Wentylacja"
    zmlab2.language["ventilation_desc"] = "Oczyszcza okolicę z zanieczyszczeń."
    zmlab2.language["storage_title"] = "Przechowywanie"
    zmlab2.language["storage_desc"] = "Zapewnia środki chemiczne i sprzęt."
    zmlab2.language["furnace_title"] = "Piec do toru"
    zmlab2.language["furnace_desc"] = "Używany do podgrzania kwasu."
    zmlab2.language["mixer_title"] = "Mikser"
    zmlab2.language["mixer_desc"] = "Używany jako główne naczynie reakcyjne do łączenia związków."
    zmlab2.language["filter_title"] = "Filtr"
    zmlab2.language["filter_desc"] = "Służy do uszlachetniania gotowej mieszanki w celu podniesienia jej jakości."
    zmlab2.language["filler_title"] = "Podsadzkarz"
    zmlab2.language["filler_desc"] = "Służy do napełniania gotowej mieszanki na tacach zamrażarki."
    zmlab2.language["frezzer_title"] = "Lodówka"
    zmlab2.language["frezzer_desc"] = "Służy do powstrzymywania dalszej reakcji końcowego roztworu metamfetaminy."
    zmlab2.language["packingtable_title"] = "Stół do Pakowania"
    zmlab2.language["packingtable_desc"] = "Zapewnia szybki sposób na kruszenie / spakowanie mety. Może pomieścić do 12 tac do zamrażania. Można ulepszyć za pomocą automatycznego łamacza lodu."

    // Storage Config
    zmlab2.language["acid_title"] = "Kwas fluorowodorowy"
    zmlab2.language["acid_desc"] = "Katalizator zwiększający szybkość reakcji."
    zmlab2.language["methylamine_title"] = "Metyloamina"
    zmlab2.language["methylamine_desc"] = "Metyloamina (CH3NH2) jest związkiem organicznym i jednym z głównych składników do produkcji metamfetaminy."
    zmlab2.language["aluminum_title"] = "Aluminum"
    zmlab2.language["aluminum_desc"] = "Amalgamat glinu jest stosowany jako odczynnik chemiczny do redukcji związków minimalnych."
    zmlab2.language["lox_title"] = "Ciekły tlen"
    zmlab2.language["lox_desc"] = "Ciekły tlen jest używany w zamrażarce, aby zatrzymać dalszą reakcję końcowego roztworu metamfetaminy."
    zmlab2.language["crate_title"] = "Skrzynia Transportowa"
    zmlab2.language["crate_desc"] = "Używany do transportu większej ilości mety."
    zmlab2.language["palette_title"] = "Paleta"
    zmlab2.language["palette_desc"] = "Używana do transportu ogromnej ilości mety."
    zmlab2.language["crusher_title"] = "Automatyczny Łamacz Lodu"
    zmlab2.language["crusher_desc"] = "Automatycznie łamie i pakuje metę po położeniu jej na stole do pakowania."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Meth"
    zmlab2.language["meth_desc"] = "Normalna uliczna meta."
    zmlab2.language["bluemeth_title"] = "Crystal Blue"
    zmlab2.language["bluemeth_desc"] = "Oryginalna formuła Heisenberga."
    zmlab2.language["kalaxi_title"] = "Kalaxian Crystal"
    zmlab2.language["kalaxi_desc"] = "Kryształy Kalaxian są bardzo podobne do wielu narkotyków, ponieważ dają dobre wrażenie."
    zmlab2.language["glitter_title"] = "Glitter"
    zmlab2.language["glitter_desc"] = "Glitter to silnie psychodeliczny narkotyk, który pojawił się niedawno na ulicach Night City. To naprawdę mocna rzecz, nawet dla nasyconych dopalaczem mieszkańców Night City."
    zmlab2.language["kronole_title"] = "Kronole"
    zmlab2.language["kronole_desc"] = "Kronole to uliczny narkotyk sprzedawany na pokładzie Snowpiercera na czarnym rynku. Lek ma zdolność blokowania receptorów bólu, Kronole jest tak silny, że blokuje wszystkie uczucia, nie tylko ból."
    zmlab2.language["melange_title"] = "Melange"
    zmlab2.language["melange_desc"] = "Melange (przyprawa) to narkotyk, który może przedłużyć życie, nadać zwiększoną witalność i świadomość oraz odblokować przewidywanie u niektórych ludzi."
    zmlab2.language["mdma_title"] = "MDMA"
    zmlab2.language["mdma_desc"] = "MDMA został po raz pierwszy opracowany w 1912 roku przez firmę Merck. Był używany jako środek wspomagający psychoterapię na początku lat 70. XX wieku i stał się popularny jako uliczny narkotyk w latach 80."
end
