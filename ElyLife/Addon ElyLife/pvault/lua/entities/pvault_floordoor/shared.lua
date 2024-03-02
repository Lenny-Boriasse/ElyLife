ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Floor Vault"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pVault"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Moneybags")
	self:NetworkVar("Bool", 0, "Robable")
	self:NetworkVar("Bool", 1, "Locked")
	self:NetworkVar("Bool", 2, "Alarm")
	self:NetworkVar("Int", 1, "CooldownEnd")
	self:NetworkVar("Int", 2, "OpenTimeLeft")
end


perfectVault.Core.RegisterEntity("pvault_floordoor", {
	-- General data
	general = {
		bagCount = {d = 8, t = "num"}, -- Max amount of money bags
		bagStart = {d = 3, t = "num"}, -- Starting moneybags
		newBagTimer = {d = 120, t = "num"}, -- Timer for a new bag to be added (seconds)
		minBags = {d = 1, t = "num"}, -- Minimum bags needed to raid
		openTime = {d = 60, t = "num"}, -- How long the vault stays open for after being cracked (seconds)
		cooldown = {d = 1200, t = "num"}, -- The cool after cracking the vault (seconds)
		plyNeeded = {d = 3, t = "num"}, -- Minimum amount of people needed
		neededCops = {d = 0.1, t = "num"}, -- % of cops needed
		lockpick = {d = false, t = "bool"} -- Use the lockpick over the UI?
	},
	-- Alarm
	alarm = {
		failTrigger = {d = true, t = "bool"}, -- Trigger an alarm on fail
			lasts = {d = 60, t = "num", r = "failTrigger"}, -- How long that alarm lasts
			alert = {d = true, t = "bool", r = "failTrigger"}, -- If it informs government in chat
		triggerOnCrack = {d = true, t = "bool"} -- If the vault is cracked, should it trigger the alarm?
	},
	-- Moneybad
	bag = {
		minOutput = {d = 150000, t = "num"}, -- The minimum bag amount
		maxOutput = {d = 200000, t = "num"}, -- The minimum bag amount
	},
	--Other
	other = {
		failCooldown = {d = false, t = "bool"}, -- If the vault cracking fails, should it trigger the cooldown?
		wanted = {d = true, t = "bool"}, -- Should the raider get wanted on cracking? 
			wantedReason = {d = "Robbing the bank", t = "string", r = "wanted"}, -- The wanted reason
		smartWant = {d = false, t = "bool"} -- Should the server try and predict the people assisting and want them too?
	}
},
"models/freeman/vault/floor_safe_door.mdl")