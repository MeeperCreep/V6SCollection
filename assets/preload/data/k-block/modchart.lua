--function update (elapsed)
	--print("THE FUCKING Y COORDINATE IS " .. _G['defaultStrum0Y'])
--end


function beatHit (beat)
	-- if beat == 64 or beat == 96 or beat == 192 or beat == 256 or beat == 288 then
		-- if difficulty == 1 then healthDrain(4, 11.64)
		-- else healthDrain(2.5, 11.64)
		-- end
	-- end
	
	-- GUYS IM SORRY I FORGOT TO ADD DOWNSCROLL SUPPORT ON RELEASE AUHSDWHDDEYGDSGG QwQ
	
	if (beat > 159 and beat < 220) or (beat > 255 and beat < 320) then
			if difficulty == 1 then
				if beat - math.floor(beat/4)*4 == 1 then -- simply beat % 4 == 1
					for i = 0, 7 do
						tweenPos(i, _G['defaultStrum'..i..'X'] - 20, _G['defaultStrum'..i..'Y'] + 10, 0.1)
					end
				end
				if beat - math.floor(beat/4)*4 == 3 then -- simply beat % 4 == 3
					for i = 0, 7 do
						tweenPos(i, _G['defaultStrum'..i..'X'] + 20, _G['defaultStrum'..i..'Y'] + 10, 0.1)
					end
				end
			else
				if beat - math.floor(beat/4)*4 == 1 then -- simply beat % 4 == 1
					for i = 0, 7 do
						tweenPos(i, _G['defaultStrum'..i..'X'] - 7, _G['defaultStrum'..i..'Y'] + 10, 0.1)
					end
				end
				if beat - math.floor(beat/4)*4 == 3 then -- simply beat % 4 == 3
					for i = 0, 7 do
						tweenPos(i, _G['defaultStrum'..i..'X'] + 7, _G['defaultStrum'..i..'Y'] + 10, 0.1)
					end
				end
			end
	end
end