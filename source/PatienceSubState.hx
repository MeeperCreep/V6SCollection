package;

import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class PatienceSubState extends MusicBeatState
{
	var music:FlxSound;
	
	override function create()
	{
		super.create();
		FlxG.sound.music.fadeIn(0.5, 0.1, 0.7);
		var timely:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('creepertown/slowly-but-surely', 'weekseub'));
		add(timely);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.switchState(new StoryMenuState());
		}
		super.update(elapsed);
	}
}