local hissedHP = 0.45
local takedown = 0.11
local creepIsShaking = false

function start (song)
	if difficulty == 1 then
		hissedHP = 0.63
		takedown = 0
	end
	print("Heww yeh, is angwy cat time >:3 -- Hiss Rate: " .. hissedHP .. " per hisssss")
end

function update (elapsed)
	local currentBeat = (songPos / 1000) * (bpm / 60)
	
	if creepIsShaking then
	-- last minute addition courtesy of the retrospecter mod. i did thought of it, just dont know how to do it, so thanks retro... yoink!
		if difficulty == 1 then
			for i=4,7 do
				setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat * 10 + i * 0.25) * math.pi), i)
				setActorY(_G['defaultStrum'..i..'Y'] + 2 * math.cos((currentBeat * 10 + i * 0.25) * math.pi) + 10.93, i)
			end
	-- it actually offsets the note locations a little bit, dunno how to fix it and i feel like people are gonna point it out, i tried my best :(
		else
			for i=4,7 do
				setActorX(_G['defaultStrum'..i..'X'] + 2 * math.sin((currentBeat * 10 + i * 0.25) * math.pi), i)
				setActorY(_G['defaultStrum'..i..'Y'] + 1 * math.cos((currentBeat * 10 + i * 0.25) * math.pi) + 10.93, i)
			end
		end
	end
end

function beatHit (beat)
-- HISS MECHANIC & SHIT
	-- btw the health drain will not work in other mods, it's exclusive to this mod alone
	if beat == 30 then
		healthDrain(0.77, 0.56) -- first drain always set to drain until bf's struggle sprite
		creepIsShaking = true
	elseif beat == 46 or beat == 62 or beat == 79 or beat == 83 or beat == 87 or beat == 91
	or beat == 95 or beat == 179 or beat == 183 or beat == 187 or beat == 191 or beat == 195
	or beat == 211 or beat == 215 or beat == 219 or beat == 223 then
		healthDrain(hissedHP, 0.56)
		creepIsShaking = true
	elseif beat == 227 then
		healthDrain(takedown, 0.56, true) -- troll [°͜ʖ°]
		-- also the reason its set to take you down to 0 hp on hard is because health gained by hitting notes during the drain is considered
		-- i could also set it to negative but i feel like thats too brutal, 0 is enough...
		creepIsShaking = true
	elseif creepIsShaking then
		creepIsShaking = false
	end
end

-- dont fucking know how to modchart the camera zooms so they're still hardcoded in... i should REALLY learn to accept my limits sometimes QwQ
-- seriously though, i have a problem...
-- *sigh* i could really use a warm hug right now oof