function start (song)
	print("Yep.. loaded")
end

function stepHit (step)
	-- down time
	if step == 128 or step == 144 or step == 160 or step == 176 or step == 192 or step == 208 or step == 224
	or step == 784 or step == 800 or step == 816 or step == 832 or step == 848 or step == 864 or step == 880 then
		setHealth(0.2)
	elseif step == 130 or step == 146 or step == 162 or step == 178 or step == 194 or step == 210 or step == 226
	or step == 786 or step == 802 or step == 818 or step == 834 or step == 850 or step == 866 or step == 882 then
		setHealth(0.15)
	elseif step == 132 or step == 148 or step == 164 or step == 180 or step == 196 or step == 212 or step == 228
	or step == 788 or step == 804 or step == 820 or step == 836 or step == 852 or step == 868 or step == 884 then
		setHealth(0.1)
	elseif step == 150 or step == 182 or step == 214
	or step == 806 or step == 838 or step == 870 then
		setHealth(0.05)
	-- up time
	elseif step == 136 or step == 152 or step == 168 or step == 184 or step == 200 or step == 216 or step == 232
	or step == 792 or step == 808 or step == 824 or step == 840 or step == 856 or step == 872 or step == 888 then
		setHealth(1.8)
	-- mid time
	elseif step == 240 or step == 896 then
		setHealth(0.8)
	end
end