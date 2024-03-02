player_manager.AddValidModel( "Dauge",                     "models/spike/Dauge.mdl" )
list.Set( "PlayerOptionsModel",  "Dauge",                     "models/spike/Dauge.mdl" ) 

--Add NPC
local Category = "Spike's NPCs"

local NPC = { 	Name = "Dauge", 
				Class = "npc_citizen",
				Model = "models/spike/Dauge.mdl",
				Health = "300",
				KeyValues = { citizentype = 4 },
                                Category = Category    }

list.Set( "NPC", "Dauge", NPC )