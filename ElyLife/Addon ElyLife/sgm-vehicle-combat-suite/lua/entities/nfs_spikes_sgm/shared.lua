ENT.Type = "anim"

ENT.PrintName = "NFS Spikes"
ENT.Author = "SGM"
ENT.Category = "SGM Misc"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true
ENT.AdminSpawnable = true 

--don't change these models unless you really know what you're doing
ENT.CollapsedModel = "models/sentry/props/nfs_spikes.mdl"
ENT.ExpandedModel = "models/sentry/props/nfs_spikes_extended.mdl"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Hit")
	self:NetworkVar("Bool", 1, "Deployed")
    self:NetworkVar("Bool", 2, "Collapsing")
end