ENT.Type = "anim"

ENT.PrintName = "Wheel Grabber"
ENT.Author = "SGM"
ENT.Category = "SGM Misc"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true
ENT.AdminSpawnable = true 

--don't change these models unless you really know what you're doing
ENT.Model = "models/sentry/props/wheelgrabber.mdl"
ENT.WheelWrapModel = "models/sentry/props/wheelwrap.mdl"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Hit")
	self:NetworkVar("Bool", 1, "Deployed")
end