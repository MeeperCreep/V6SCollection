package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var camFollow:FlxObject;

	private var stageSuffix:String = '';
	private var path:String = '';
	private var daBf:String = '';

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.curStage;
		switch (PlayState.SONG.player1)
		{
			case 'bf-blockhead':
				stageSuffix = '_noteblock';
				daBf = 'bf-blockhead';
				path = 'weekseub';
			case 'bf-withcreeper':
				stageSuffix = '_explodie';
				daBf = 'bf-withcreeper';
				path = 'weekseub';
			default:
				daBf = 'bf';
				path = 'shared';
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);

		camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));
		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		bf.playAnim('firstDeath');
	}
	
	var ballSwolen:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
			endBullshit();

		if (controls.BACK)
		{
			FlxG.sound.music.stop();
			
			remove(camFollow);
			remove(bf);

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
			
			PlayState.loadRep = false;
			
			#if windows
			// found a bug where the tutorial modchart will still playout to songs without modcharts if you back out on death, fixed
			if (PlayState.luaModchart != null)
			{
				PlayState.luaModchart.die();
				PlayState.luaModchart = null;
			}
			#end
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		
		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 27 && daBf == 'bf-withcreeper')
			FlxG.camera.flash(FlxColor.WHITE, 1.3); // makes the creeper explosion spicy!

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix, path));
			ballSwolen = true;
		}

		if (FlxG.sound.music.playing)
			Conductor.songPosition = FlxG.sound.music.time;
	}

	override function beatHit()
	{
		super.beatHit();
		
		if (ballSwolen && !isEnding)
			bf.playAnim('deathLoop', true);

		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music('gameOverEnd' + stageSuffix, path));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					remove(camFollow);
					remove(bf);

					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
