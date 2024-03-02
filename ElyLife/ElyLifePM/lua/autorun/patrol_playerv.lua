local function AddPlayerModel( name, model, arms )

	list.Set( "PlayerOptionsModel", name, model )
	player_manager.AddValidModel( name, model )
	player_manager.AddValidHands(name, arms, 0, "0100000")
	
end




AddPlayerModel( "patrol_02", "models/portal2/patrol_02.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_04", "models/portal2/patrol_04.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_05", "models/portal2/patrol_05.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_06", "models/portal2/patrol_06.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_07", "models/portal2/patrol_07.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_08", "models/portal2/patrol_08.mdl", "models/weapons/c_arms_dod.mdl" )

AddPlayerModel( "patrol_09", "models/portal2/patrol_09.mdl", "models/weapons/c_arms_dod.mdl" )



