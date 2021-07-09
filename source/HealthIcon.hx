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
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [10, 10], 0, false, isPlayer);
		animation.add('bf-blockhead', [0, 1], 0, false, isPlayer);
		animation.add('bf-withcreeper', [14, 15], 0, false, isPlayer);
		animation.add('bf-old', [2, 3], 0, false, isPlayer);
		animation.add('gf', [5], 0, false, isPlayer);
		animation.add('gf-christmas', [5], 0, false, isPlayer);
		animation.add('gf-pixel', [5], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('cringeface', [6, 7], 0, false, isPlayer);
		animation.add('dad', [4, 4], 0, false, isPlayer);
		animation.add('catsoup', [11, 12], 0, false, isPlayer);
		animation.add('catsoup-hissed', [13, 13], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
