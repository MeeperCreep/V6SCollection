package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		antialiasing = true;
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-blockhead', [0, 1], 0, false, isPlayer);
		animation.add('bf-withcreeper', [14, 15], 0, false, isPlayer);
		animation.add('bf-old', [2, 3], 0, false, isPlayer);
		animation.add('gf', [5], 0, false, isPlayer);
		animation.add('gf-christmas', [5], 0, false, isPlayer);
		animation.add('gf-blockhead', [5], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('cringeface', [6, 7], 0, false, isPlayer);
		animation.add('dad', [4, 4], 0, false, isPlayer);
		animation.add('catsoup', [10, 11], 0, false, isPlayer);
		animation.add('catsoup-hissed', [12, 13], 0, false, isPlayer);
		animation.add('oreo-jinbap', [16, 17], 0, false, isPlayer);
		animation.add('dansoup', [18, 19], 0, false, isPlayer);
		animation.add('dansoup-deranged', [20, 21], 0, false, isPlayer);
		animation.add('meepster', [22, 23], 0, false, isPlayer);
		animation.add('willg', [24, 25], 0, false, isPlayer);
		animation.add('skookie', [26, 27], 0, false, isPlayer);
		// Freeplay Icons
		animation.add('milestoner', [50], 0, false, isPlayer);
		animation.add('catsouper', [51], 0, false, isPlayer);
		animation.add('catsouper-hiss', [52], 0, false, isPlayer);
		animation.add('nightcorer', [53], 0, false, isPlayer);
		
		animation.play(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
