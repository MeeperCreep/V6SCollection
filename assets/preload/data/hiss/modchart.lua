local hissedHP = 0

function start (song)
	if difficulty == 1 then hissedHP = 0.69
	else hissedHP = 0.46
	end
	print("Hell yeah, it's angwy cat time >:3 -- Hiss Rate: " .. hissedHP .. " per hisssss")
end

function stepHit (step)
-- HISS MECHANIC SHIT
	-- btw these will not work in other mods, it's exclusive to this mod alone, check hiss-modchart-doc.txt for more info!
	if step == 120 then
		healthDrain(0.77, 0.56) -- first drain always set to drain until bf's struggle sprite
	elseif step == 184 or step == 248 or step == 316 or step == 332 or step == 348 or step == 364
		or step == 380 or step == 716 or step == 732 or step == 748 or step == 764 or step == 780
		or step == 844 or step == 860 or step == 876 or step == 892 then
			healthDrain (hissedHP, 0.56)
	elseif step == 908 then
			healthDrain(1.3, 0.56, true) -- troll
	end
end

-- dont fucking know how to modchart the camera zooms so they're still hardcoded in... i should REALLY learn to accept my limits sometimes QwQ
-- seriously though, i have a problem...