import flixel.FlxG;

class Ratings
{
    public static function GenerateLetterRank(accuracy:Float) // generate a letter ranking
    {
        var ranking:String = "N/A";
		if(FlxG.save.data.botplay)
			ranking = "Beep Boop";

        if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods == 0) // Pure Perfect, godlike timing all SICKS
            ranking = "(Pure Perfect)";
        else if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods >= 1) // Perfect, pseudo-godlike timing no BADS or SHITS
            ranking = "(Perfect)";
        else if (PlayState.misses == 0) // No miss -- Full Combo
            ranking = "(Full Combo)";
		else if (PlayState.misses == 1) // When you choke and only miss one
            ranking = "(Choked-FC)";
        else if (PlayState.misses <= 5) // 5 misses max
            ranking = "(Sub-FC)";
	    else if (PlayState.misses < 10) // Single Digit Combo Breaks
            ranking = "(SDCB)";
        else
            ranking = "(Clear)"; // Pass

        // WIFE TIME :)))) (based on Wife3)
		// Shut up Kade, we don't need a billion accuracy checks for 99.75 or 99.9999

        var wifeConditions:Array<Bool> = [
            accuracy == 100, // SS
			accuracy >= 99, // S++
            accuracy >= 97, // S+
            accuracy >= 95, // S
            accuracy >= 93, // A+
            accuracy >= 90, // A
            accuracy >= 88, // A-
            accuracy >= 85, // B+
            accuracy >= 83, // B
            accuracy >= 80, // B-
            accuracy >= 77, // C+
            accuracy >= 75, // C
            accuracy >= 73, // C-
            accuracy >= 70, // D+
            accuracy >= 67, // D
            accuracy >= 65, // E
            accuracy < 63 // F bro you actually suck :(
        ];

        for(i in 0...wifeConditions.length)
        {
            var b = wifeConditions[i];
            if (b)
            {
                switch(i)
                {
				// Tbh, the AAAA ranking doesn't make that much sense to me so I changed it to be more traditional
                    case 0:
                        ranking += " SS";
					case 1:
                        ranking += " S++";
                    case 2:
                        ranking += " S+";
                    case 3:
                        ranking += " S";
                    case 4:
                        ranking += " A+";
                    case 5:
                        ranking += " A";
                    case 6:
                        ranking += " A-";
                    case 7:
                        ranking += " B+";
                    case 8:
                        ranking += " B";
                    case 9:
                        ranking += " B-";
                    case 10:
                        ranking += " C+";
                    case 11:
                        ranking += " C";
                    case 12:
                        ranking += " C-";
                    case 13:
                        ranking += " D+";
                    case 14:
                        ranking += " D";
                    case 15:
                        ranking += " E";
                    case 16:
                        ranking += " F";
                }
                break;
            }
        }

        if (accuracy == 0)
            ranking = "N/A";
		else if(FlxG.save.data.botplay)
			ranking = "Beep Boop";

        return ranking;
    }
    
    public static function CalculateRating(noteDiff:Float, ?customSafeZone:Float):String // Generate a judgement through some timing shit
    {

        var customTimeScale = Conductor.timeScale;

        if (customSafeZone != null)
            customTimeScale = customSafeZone / 166;

        // trace(customTimeScale + ' vs ' + Conductor.timeScale);

        // I HATE THIS IF CONDITION
        // IF LEMON SEES THIS I'M SORRY :(

        // trace('Hit Info\nDifference: ' + noteDiff + '\nZone: ' + Conductor.safeZoneOffset * 1.5 + "\nTS: " + customTimeScale + "\nLate: " + 155 * customTimeScale);

	if (FlxG.save.data.botplay)
	    return "good"; // FUNNY
	    
        if (noteDiff > 166 * customTimeScale) // so god damn early its a miss
            return "miss";
        if (noteDiff > 135 * customTimeScale) // way early
            return "shit";
        else if (noteDiff > 90 * customTimeScale) // early
            return "bad";
        else if (noteDiff > 45 * customTimeScale) // your kinda there
            return "good";
        else if (noteDiff < -45 * customTimeScale) // little late
            return "good";
        else if (noteDiff < -90 * customTimeScale) // late
            return "bad";
        else if (noteDiff < -135 * customTimeScale) // late as fuck
            return "shit";
        else if (noteDiff < -166 * customTimeScale) // so god damn late its a miss
            return "miss";
        return "sick";
    }

   public static function CalculateRanking(score:Int,scoreDef:Int,nps:Int,maxNPS:Int,accuracy:Float):String
    {
        return 
        (FlxG.save.data.npsDisplay ? "NPS: " + nps + " (Max " + maxNPS + ")" + (!FlxG.save.data.botplay ? " | " : "") : "") + (!FlxG.save.data.botplay ?	// NPS Toggle
        "Score: " + (Conductor.safeFrames != 10 ? score + " (" + scoreDef + ")" : "" + score) + 								// Score
        " | Misses: " + PlayState.misses + 																						// Misses/Combo Breaks
        " | Accuracy: " + (FlxG.save.data.botplay ? "N/A" : HelperFunctions.truncateFloat(accuracy, 2) + " %") +  				// Accuracy
        " | " + GenerateLetterRank(accuracy) : ""); 																			// Letter Rank
    }
}
