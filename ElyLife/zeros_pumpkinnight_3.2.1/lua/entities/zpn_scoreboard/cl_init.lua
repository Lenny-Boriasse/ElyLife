include("shared.lua")

function ENT:Initialize()
	if zpn and zpn.Scoreboard then
		zpn.Scoreboard.Initialize(self)
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	if zpn and zpn.Scoreboard then
		zpn.Scoreboard.OnDraw(self)
	end
end

function ENT:Think()
	if zpn and zpn.Theme and zpn.Theme.Scoreboard then
		zpn.Theme.Scoreboard.onthink(self)
	end
end

function ENT:OnRemove()
	self:StopParticles()
end
