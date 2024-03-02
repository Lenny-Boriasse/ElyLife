perfectVault.Translation.Vault = {}
perfectVault.Translation.Vault.Title = "Vault Info"
-- Bag count
perfectVault.Translation.Vault.Bags = "Moneybags"
-- Locked
perfectVault.Translation.Vault.Locked = "Locked"
perfectVault.Translation.Vault.LockedYes = "Yes"
perfectVault.Translation.Vault.LockedNo = "No"
-- Government
perfectVault.Translation.Vault.Government = "Police"
perfectVault.Translation.Vault.GovernmentEnough = "Enough"
perfectVault.Translation.Vault.GovernmentNotEnough = "Not enough"
-- Alarm
perfectVault.Translation.Vault.Alarm = "Alarm"
perfectVault.Translation.Vault.AlarmOn = "On"
perfectVault.Translation.Vault.AlarmOff = "Off"
-- Cooldown
perfectVault.Translation.Vault.CooldownEnds = "Cooldown ends in %s seconds"
perfectVault.Translation.Vault.VaultCloseTimer = "Vault closes in %s seconds"
perfectVault.Translation.Vault.NoPlayers = "Not enough players"
perfectVault.Translation.Vault.VaultAlarmActive = "The alarm is active"
-- Derma
perfectVault.Translation.Vault.DermaUnlock = "Unlock Pin"
perfectVault.Translation.Vault.DermaClose = "Cancel"

-- Banker NPC Stuff
perfectVault.Translation.NPC = {}
--Overhead text
perfectVault.Translation.NPC.Overhead = "Corrupt Banker"
--Derma
perfectVault.Translation.NPC.InfoHeader = "I'll clean your dirty heist money for a cut."
perfectVault.Translation.NPC.InfoHeader2 = "Although if you try and rip me off you'll regret it."
perfectVault.Translation.NPC.CurrentlyHolding = "I'm currently holding:"
perfectVault.Translation.NPC.BankerCut = "Banker's cut"
perfectVault.Translation.NPC.YourCut = "Your cut"
perfectVault.Translation.NPC.MakeOffer = "Make offer"
perfectVault.Translation.NPC.Cancel = "Cancel"
perfectVault.Translation.NPC.CutTooSmall = "If you're wanting to do business with me I'm going to need a bigger cut than that..."
perfectVault.Translation.NPC.FairOffer = "This offer seems fair to me. Let's do business!"
perfectVault.Translation.NPC.BusinessDone = "Here's your cut, %s in clean money!"

-- Hud related stuff
perfectVault.Translation.HUD = {}
perfectVault.Translation.HUD.Holding = "Holding %s/%s bags"
perfectVault.Translation.HUD.Throw = "Press %s to throw"

-- Mask stuff
perfectVault.Translation.Mask = {}
perfectVault.Translation.Mask.Overhead = "Wearable Mask"
perfectVault.Translation.Mask.HoldingUnequipped = "Mask unequipped"
perfectVault.Translation.Mask.HoldingEquipped = "Mask equipped"
perfectVault.Translation.Mask.Equip = "Press %s to equip"
perfectVault.Translation.Mask.Unequip = "Press %s to unequip"
perfectVault.Translation.Mask.Drop = "Press %s to drop"
perfectVault.Translation.Mask.MaskName = "Masked person"

--Chat messages
perfectVault.Translation.Chat = {}
perfectVault.Translation.Chat.Locked = "The vault is locked. You need to find a way to unlock it first!"
perfectVault.Translation.Chat.NotEnoughCops = "Seems like there's not enough government to fend off your attack. Atleast keep it fair..."
perfectVault.Translation.Chat.WrongJob = "You are not the right job to rob this!"
perfectVault.Translation.Chat.TooFarAway = "You are not close enough to the vault."
perfectVault.Translation.Chat.CarryingMax = "You are carrying the max amount of bags."
perfectVault.Translation.Chat.PotentialExploiting = "Hmm, you must have super fast reaction time! Seems you unlocked the vault quicker than we expected and we weren't ready. Why not try again, but give us a chance to keep up this time!"
perfectVault.Translation.Chat.NPCOfficer = "What seems to be the problem officer?"
perfectVault.Translation.Chat.NPCCiv = "Get out of here before I have you killed!"
perfectVault.Translation.Chat.NPCNoMoney = "Bring me some money to clean or get the hell outa here!"
perfectVault.Translation.Chat.NoGovernment = "There is not enough government to raid the vault!"
perfectVault.Translation.Chat.NoBags = "There are no bags to steal..."
perfectVault.Translation.Chat.NotifyGoverment = "The vault is currently being raided!"
perfectVault.Translation.Chat.AlarmTriggered = "Someone has tripped the alarm at the vault!"
perfectVault.Translation.Chat.UndercutNegative = "Trying to rip me off? We'll see what the police have to say about this!"
perfectVault.Translation.Chat.RobbingTheBankReason = "Trying to sell stolen moneybags!"
perfectVault.Translation.Chat.AlreadyHasAMask = "You're already carrying a mask"
perfectVault.Translation.Chat.PickedUpMask = "You've picked up a mask"



perfectVault.Translation.ToolGun = {}
perfectVault.Translation.ToolGun.NoEntity = "Please configure an entity with Right Click first"
perfectVault.Translation.ToolGun.DeletePermissions = "FPP BLOCKS YOUR PVAULT TOOLGUN PERMISSIONS"
perfectVault.Translation.ToolGun.FPPCheck = "Check you can toolgun this entity with FPP!"

perfectVault.Translation.Config = {}
perfectVault.Translation.Config.EntitySetup = "Entity Setup"
perfectVault.Translation.Config.EntitySetupDesc = "Here you can configure the entity you're about to place"
perfectVault.Translation.Config.EntitySpawn = "Entity to Setup"
perfectVault.Translation.Config.EntitySpawnDesc = "This is the entity you want to setup"
perfectVault.Translation.Config.ApplyChanges = "Apply Changes"

perfectVault.Translation.Config.Requires = " (Requires %s)"

perfectVault.Translation.Config.EntityClassNames = {}
perfectVault.Translation.Config.EntityClassNames["pvault_door"] = "Big Vault Door"
perfectVault.Translation.Config.EntityClassNames["pvault_floordoor"] = "Floor Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_standalone_small"] = "Small Standalone Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_standalone_large"] = "Large Standalone Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_standalone_tall"] = "Tall Standalone Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_wall_small"] = "Small Wall Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_wall_large"] = "Large Wall Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_wall_tall"] = "Tall Wall Vault"
perfectVault.Translation.Config.EntityClassNames["pvault_stack_gold"] = "Gold Bar"
perfectVault.Translation.Config.EntityClassNames["pvault_stack_money"] = "Money Stack"
perfectVault.Translation.Config.EntityClassNames["pvault_npc"] = perfectVault.Translation.NPC.Overhead 


perfectVault.Translation.Config.RegisteredConfigs = {}
perfectVault.Translation.Config.RegisteredConfigs['general'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].title = "General"
perfectVault.Translation.Config.RegisteredConfigs['general'].desc = "General entity config"
perfectVault.Translation.Config.RegisteredConfigs['general'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagCount'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagCount'].title = "Bag Count"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagCount'].desc = "Max amount of money bags"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagStart'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagStart'].title = "Bag Start"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['bagStart'].desc = "Starting bag count"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['newBagTimer'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['newBagTimer'].title = "Bag Timer"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['newBagTimer'].desc = "How long till a new bag is added (seconds)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['minBags'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['minBags'].title = "Minimum Bags"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['minBags'].desc = "Minimum amount of bags needed to crack the vault"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['openTime'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['openTime'].title = "Open Time"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['openTime'].desc = "How long the vault is open once cracked (seconds)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['cooldown'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['cooldown'].title = "Cooldown"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['cooldown'].desc = "Cooldown after cracking the vault (seconds)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['plyNeeded'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['plyNeeded'].title = "Players Needed"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['plyNeeded'].desc = "Amount of players needed to crack the vault (%)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['neededCops'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['neededCops'].title = "Needed Government"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['neededCops'].desc = "Amount of government needed to crack the vault (%)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['lockpick'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['lockpick'].title = "Lockpick"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['lockpick'].desc = "Use DarkRP lockpicks over UI (Not suggested)"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['value'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['value'].title = "Value"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['value'].desc = "The amount of money given when picked up"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['respawn'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['respawn'].title = "Respawn"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['respawn'].desc = "How long before it respawns (seconds)"

perfectVault.Translation.Config.RegisteredConfigs['general'].options['model'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['model'].title = "Model"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['model'].desc = "The model of the NPC"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['negotiate'] = {}
perfectVault.Translation.Config.RegisteredConfigs['general'].options['negotiate'].title = "Negotiate"
perfectVault.Translation.Config.RegisteredConfigs['general'].options['negotiate'].desc = "Should the NPC negotiate a cut?"

perfectVault.Translation.Config.RegisteredConfigs['alarm'] = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].title = "Alarm"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].desc = "General alarm config"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['failTrigger'] = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['failTrigger'].title = "Fail Trigger"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['failTrigger'].desc = "Trigger alarm on crack fail"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['lasts'] = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['lasts'].title = "Alarm timer"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['lasts'].desc = "How long the alarm lasts (seconds)"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['alert'] = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['alert'].title = "Alert Government"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['alert'].desc = "Broadcast to government on alarm trigger"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['triggerOnCrack'] = {}
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['triggerOnCrack'].title = "Trigger on Crack"
perfectVault.Translation.Config.RegisteredConfigs['alarm'].options['triggerOnCrack'].desc = "Trigger the alarm on vault cracking"

perfectVault.Translation.Config.RegisteredConfigs['bag'] = {}
perfectVault.Translation.Config.RegisteredConfigs['bag'].title = "Bag"
perfectVault.Translation.Config.RegisteredConfigs['bag'].desc = "General bag config"
perfectVault.Translation.Config.RegisteredConfigs['bag'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['minOutput'] = {}
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['minOutput'].title = "Minimum Output"
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['minOutput'].desc = "The minimum output of the bag"
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['maxOutput'] = {}
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['maxOutput'].title = "Maximum Output"
perfectVault.Translation.Config.RegisteredConfigs['bag'].options['maxOutput'].desc = "The maximum output of the bag"

perfectVault.Translation.Config.RegisteredConfigs['other'] = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].title = "Other"
perfectVault.Translation.Config.RegisteredConfigs['other'].desc = "Other entity related config"
perfectVault.Translation.Config.RegisteredConfigs['other'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].options['failCooldown'] = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].options['failCooldown'].title = "Fail Cooldown"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['failCooldown'].desc = "Cooldown for vault crack failure"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wanted'] = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wanted'].title = "Wanted"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wanted'].desc = "Trigger wanted on robbery"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wantedReason'] = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wantedReason'].title = "Wanted Reason"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['wantedReason'].desc = "Reason for being wanted on failure"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['smartWant'] = {}
perfectVault.Translation.Config.RegisteredConfigs['other'].options['smartWant'].title = "Smart Want"
perfectVault.Translation.Config.RegisteredConfigs['other'].options['smartWant'].desc = "Use the smart want system"



perfectVault.Translation.Config.RegisteredConfigs['cut'] = {}
perfectVault.Translation.Config.RegisteredConfigs['cut'].title = "Cut"
perfectVault.Translation.Config.RegisteredConfigs['cut'].desc = "The bankers cut config"
perfectVault.Translation.Config.RegisteredConfigs['cut'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['minCut'] = {}
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['minCut'].title = "Minimum Cut"
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['minCut'].desc = "The minimum % cut he takes"
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['maxCut'] = {}
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['maxCut'].title = "Maximum Cut"
perfectVault.Translation.Config.RegisteredConfigs['cut'].options['maxCut'].desc = "The maximum % cut he takes"



perfectVault.Translation.Config.RegisteredConfigs['snitch'] = {}
perfectVault.Translation.Config.RegisteredConfigs['snitch'].title = "Snitch"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].desc = "The banker snitch config"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options = {}
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['snitch'] = {}
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['snitch'].title = "Snitch"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['snitch'].desc = "If the banker is given a bad deal, should he snitch?"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['minChance'] = {}
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['minChance'].title = "Minimum Chance"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['minChance'].desc = "The minimum % chance he will snitch"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['maxChance'] = {}
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['maxChance'].title = "Maximum Chance"
perfectVault.Translation.Config.RegisteredConfigs['snitch'].options['maxChance'].desc = "The maximum % chance he will snitch"