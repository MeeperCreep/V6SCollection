package;

import flixel.FlxG;

using StringTools;

class Highscore
{
	#if (haxe >= "4.0.0")
	public static var songScores:Map<String, Int> = new Map();
	public static var songCombos:Map<String, String> = new Map();
	#else
	public static var songScores:Map<String, Int> = new Map<String, Int>();
	public static var songCombos:Map<String, Int> = new Map<String, String>();
	#end


	public static function saveScore(song:String, score:Int = 0, ?diff:Int = 0):Void
	{
		var daSong:String = formatSong(song, diff);


		#if !switch
		NGio.postScore(score, song);
		#end

		if(!FlxG.save.data.botplay)
		{
			if (songScores.exists(daSong))
			{
				if (songScores.get(daSong) < score)
					setScore(daSong, score);
			}
			else
				setScore(daSong, score);
		}
		else
			trace('Autoplay detected. Score saving is disabled.');
	}
	
	public static function saveCombo(song:String, combo:String, ?diff:Int = 0):Void
	{
		var daSong:String = formatSong(song, diff);
		var finalCombo:String = combo.split(')')[1].replace(' ', '');
		var ratingCheck:String = combo.split(')')[0].replace('(', '');
		
		// considerations for full combos!
		if (finalCombo.startsWith("S+") && ratingCheck == "Perfect") finalCombo = 'SFC+';
		else if (ratingCheck == "Perfect") finalCombo = 'SFC';
		else if (finalCombo.startsWith("S+") && ratingCheck == "Full Combo") finalCombo = 'FC+';
		else if (ratingCheck == "Full Combo") finalCombo = 'FC';
		else if (ratingCheck == "Choked-FC") finalCombo = 'ONE-MISS'; // just to rub it in your face :)

		if(!FlxG.save.data.botplay)
		{
			if (songCombos.exists(daSong))
			{
				if (getComboInt(songCombos.get(daSong)) < getComboInt(finalCombo))
					setCombo(daSong, finalCombo);
			}
			else
				setCombo(daSong, finalCombo);
		}
	}

	public static function saveWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0):Void
	{

		#if !switch
		NGio.postScore(score, "Week " + week);
		#end

		if(!FlxG.save.data.botplay)
		{
			var daWeek:String = formatSong('week' + week, diff);

			if (songScores.exists(daWeek))
			{
				if (songScores.get(daWeek) < score)
					setScore(daWeek, score);
			}
			else
				setScore(daWeek, score);
		}
		else
			trace('Autoplay detected. Score saving is disabled.');
	}

	/**
	 * YOU SHOULD FORMAT SONG WITH formatSong() BEFORE TOSSING IN SONG VARIABLE
	 */
	static function setScore(song:String, score:Int):Void
	{
		// Reminder that I don't need to format this song, it should come formatted!
		songScores.set(song, score);
		FlxG.save.data.songScores = songScores;
		FlxG.save.flush();
	}
	
	static function setCombo(song:String, combo:String):Void
	{
		songCombos.set(song, combo);
		FlxG.save.data.songCombos = songCombos;
		FlxG.save.flush();
	}

	public static function formatSong(song:String, diff:Int):String
	{
		var daSong:String = song;

		if (diff == 1)
			daSong += '-hard';

		return daSong;
	}
	
	static function getComboInt(combo:String):Int
	{
		switch(combo)
		{
			case 'F': return 1;
			case 'E': return 2;
			case 'D': return 3;
			case 'D+': return 4;
			case 'C-': return 5;
			case 'C': return 6;
			case 'C+': return 7;
			case 'B-': return 8;
			case 'B': return 9;
			case 'B+': return 10;
			case 'A-': return 11;
			case 'A': return 12;
			case 'A+': return 13;
			case 'S': return 14;
			case 'S+': return 15;
			case 'S++': return 16;
			case 'ONE-MISS': return 17;
			case 'FC': return 18;
			case 'FC+': return 19;
			case 'SFC': return 20;
			case 'SFC+': return 21;
			case 'SS': return 99; // you can't beat the perfect >:)
			default: return 0;
		}
	}

	public static function getScore(song:String, diff:Int):Int
	{
		if (!songScores.exists(formatSong(song, diff)))
			setScore(formatSong(song, diff), 0);

		return songScores.get(formatSong(song, diff));
	}
	
	public static function getCombo(song:String, diff:Int):String
	{
		if (!songCombos.exists(formatSong(song, diff)))
			setCombo(formatSong(song, diff), 'N/A');

		return songCombos.get(formatSong(song, diff));
	}

	public static function getWeekScore(week:Int, diff:Int):Int
	{
		if (!songScores.exists(formatSong('week' + week, diff)))
			setScore(formatSong('week' + week, diff), 0);

		return songScores.get(formatSong('week' + week, diff));
	}

	public static function load():Void
	{
		if (FlxG.save.data.songScores != null)
		{
			songScores = FlxG.save.data.songScores;
		}
		if (FlxG.save.data.songCombos != null)
		{
			songCombos = FlxG.save.data.songCombos;
		}
	}
}