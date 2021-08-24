package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		antialiasing = true;

		switch (curCharacter)
		{
			// GIRLFRIEND CODE
			case 'gf':
				frames = Paths.getSparrowAtlas('characters/GF_assets');
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-christmas':
				frames = Paths.getSparrowAtlas('characters/gfChristmas');
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
				
			case 'gf-blockhead':
				frames = Paths.getSparrowAtlas('characters/GorlFriend_Block_Assets');
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer', 0, -4);
				addOffset('sad', -2, -34);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				playAnim('danceRight');

			// BOYFRIEND CODE
			case 'bf':
				frames = Paths.getSparrowAtlas('characters/BOYFRIEND');
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('hey-slow', 'BF HEY', 12, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, false);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset("hey-slow", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-christmas':
				frames = Paths.getSparrowAtlas('characters/bfChristmas');
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('hey-slow', 'BF HEY', 12, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset("hey-slow", 7, 4);

				playAnim('idle');

				flipX = true;

			case 'bf-blockhead':
				frames = Paths.getSparrowAtlas('characters/BoyFriend_Block_Assets');
				animation.addByPrefix('idle', 'Block idle bob', 24, false);
				
				animation.addByPrefix('singUP', 'Block NOTE UP', 24, false);
				animation.addByPrefix('singLEFT', 'Block NOTE LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Block NOTE RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Block NOTE DOWN', 24, false);
				animation.addByPrefix('singUPmiss', 'Block NOTE UMISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Block NOTE LMISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Block NOTE RMISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Block NOTE DMISS', 24, false);
				
				animation.addByPrefix('hey', 'Block HEY', 24, false);
				// slow version for songs with high bpm because it only plays the og hey animation for a split second
				animation.addByPrefix('hey-slow', 'Block HEY', 12, false);

				animation.addByPrefix('firstDeath', "Block breaks", 24, false);
				animation.addByPrefix('deathLoop', "Block Dead Loop", 24, false);
				animation.addByPrefix('deathConfirm', "Block Dead confirm", 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset("hey-slow", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);

				playAnim('idle');

				flipX = true;
				
			case 'bf-withcreeper':
				frames = Paths.getSparrowAtlas('characters/BoyFriend_CreeperFried');
				animation.addByPrefix('idle', 'BF and Creep shakenbob', 24, false);
				
				animation.addByPrefix('singUP', 'BF UP', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UMISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LMISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RMISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DMISS', 24, false);
				
				animation.addByPrefix('singUP-alt', 'Creep UP', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Creep LEFT', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Creep RIGHT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Creep DOWN', 24, false);
				animation.addByPrefix('singUPmiss-alt', 'Creep UMISS', 24, false);
				animation.addByPrefix('singLEFTmiss-alt', 'Creep LMISS', 24, false);
				animation.addByPrefix('singRIGHTmiss-alt', 'Creep RMISS', 24, false);
				animation.addByPrefix('singDOWNmiss-alt', 'Creep DMISS', 24, false);
				
				animation.addByPrefix('singUP-duo', 'BF and Creep UP', 24, false);
				animation.addByPrefix('singLEFT-duo', 'BF and Creep LEFT', 24, false);
				animation.addByPrefix('singRIGHT-duo', 'BF and Creep RIGHT', 24, false);
				animation.addByPrefix('singDOWN-duo', 'BF and Creep DOWN', 24, false);
				animation.addByPrefix('singUPmiss-duo', 'BF and Creep UMISS', 24, false);
				animation.addByPrefix('singLEFTmiss-duo', 'BF and Creep LMISS', 24, false);
				animation.addByPrefix('singRIGHTmiss-duo', 'BF and Creep RMISS', 24, false);
				animation.addByPrefix('singDOWNmiss-duo', 'BF and Creep DMISS', 24, false);
				
				animation.addByPrefix('hey', 'BF and Creep cheer up', 24, false);
				animation.addByPrefix('hey-slow', 'BF and Creep cheer up', 12, false);
				
				animation.addByPrefix('scared', 'BF and Creep afraid', 24);
				
				animation.addByPrefix('firstDeath', "Creeper explodes", 24, false);
				animation.addByPrefix('deathLoop', "YOU DIED loop", 24, false);
				animation.addByPrefix('deathConfirm', "Respawning", 24, false);
				
				addOffset('idle', -5);
				addOffset("singUP", -37, -52);
				addOffset("singRIGHT", -38, -60);
				addOffset("singLEFT", 12, -85);
				addOffset("singDOWN", -10, -76);
				addOffset("singUPmiss", -32, -58);
				addOffset("singRIGHTmiss", -32, -63);
				addOffset("singLEFTmiss", 10, -85);
				addOffset("singDOWNmiss", -11, -78);
				addOffset("singUP-alt", 61, -41);
				addOffset("singRIGHT-alt", -38, -122);
				addOffset("singLEFT-alt", 87, -73);
				addOffset("singDOWN-alt", 32, -128);
				addOffset("singUPmiss-alt", 61, -41);
				addOffset("singRIGHTmiss-alt", -41, -121);
				addOffset("singLEFTmiss-alt", 87, -73);
				addOffset("singDOWNmiss-alt", 32, -127);
				addOffset("singUP-duo", 9, -57);
				addOffset("singRIGHT-duo", -38, -116);
				addOffset("singLEFT-duo", 75, -80);
				addOffset("singDOWN-duo", -10, -133);
				addOffset("singUPmiss-duo", 9, -58);
				addOffset("singRIGHTmiss-duo", -32, -91);
				addOffset("singLEFTmiss-duo", 71, -91);
				addOffset("singDOWNmiss-duo", -11, -133);
				addOffset('hey', 33, -104);
				addOffset('hey-slow', 33, -104);
				addOffset('scared', -6, -82);
				addOffset('firstDeath', 78, 37);
				addOffset('deathLoop', 4, -174);
				addOffset('deathConfirm', 4, -186);
				
				playAnim('idle');
				
				flipX = true;
				
			// DAD ANIMATION LOADING CODE
			case 'dad':
				frames = Paths.getSparrowAtlas('characters/DADDY_DEAREST');
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

			case 'catsoup':
				frames = Paths.getSparrowAtlas('characters/CatSoup');
				animation.addByPrefix('idle', 'catsoup idle', 24);
				
				animation.addByPrefix('singUP', 'catsoup up', 24);
				animation.addByPrefix('singRIGHT', 'catsoup right', 24);
				animation.addByPrefix('singDOWN', 'catsoup down', 24);
				animation.addByPrefix('singLEFT', 'catsoup left', 24);
				
				addOffset('idle');
				addOffset("singUP", 4, 19);
				addOffset("singRIGHT", 4, -62);
				addOffset("singLEFT", 39, 6);
				addOffset("singDOWN", 59, -84);

				playAnim('idle');
			
			
			case 'catsoup-hissed':
				frames = Paths.getSparrowAtlas('characters/CatSoup-Angwy');
				animation.addByPrefix('idle', 'angwy catsoup idle', 24);
				animation.addByPrefix('singUP', 'angwy catsoup up', 24);
				animation.addByPrefix('singRIGHT', 'angwy catsoup right', 24);
				animation.addByPrefix('singDOWN', 'angwy catsoup down', 24);
				animation.addByPrefix('singLEFT', 'angwy catsoup left', 24);
				animation.addByPrefix('shoot', 'unamused', 24);
				
				addOffset('idle');
				addOffset("singUP", -79, -29);
				addOffset("singRIGHT", -56, -61);
				addOffset("singLEFT", 34, -22);
				addOffset("singDOWN", 6, -101);
				addOffset("shoot", 21, -61);

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					
				case 'gf-blockhead':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');

				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter.startsWith('gf'))
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
