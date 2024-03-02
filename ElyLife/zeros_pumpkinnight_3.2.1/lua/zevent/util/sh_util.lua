zpn = zpn or {}

function zpn.Print(msg)
	print("[Zeros PumpkinNight] " .. msg)
end

if (CLIENT) then
	// Returns the correct Icon depending on Candy Amount
	function zpn.CandyIcon(candy,max)
		if candy >= max then
			return "zpn_candy_large"
		elseif candy >= max / 2 then
			return "zpn_candy_medium"
		else
			return "zpn_candy_small"
		end
	end
end
