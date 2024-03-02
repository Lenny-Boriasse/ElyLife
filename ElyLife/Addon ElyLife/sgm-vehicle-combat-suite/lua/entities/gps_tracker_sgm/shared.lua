ENT.Type = "anim"

ENT.PrintName = "GPS Tracker"
ENT.Author = "SGM"
ENT.Category = "SGM Misc"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true
ENT.AdminSpawnable = true 

--don't change these models unless you really know what you're doing
ENT.Model = "models/props_combine/combine_mine01.mdl"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Hit")
	self:NetworkVar("Bool", 1, "CopNearby")
	self:NetworkVar("String", 0, "TargetName")
end