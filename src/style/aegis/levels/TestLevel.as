package style.aegis.levels 
{
	import arch.Snark;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import style.aegis.Aegis;
	import style.aegis.Platformer;
	import style.aegis.PlatformerCreature;
	/**
	 * ...
	 * @author red__hara
	 */
	public class TestLevel extends Platformer
	{
		
		public function TestLevel( Parent:Snark ) 
		{
			super(Parent);
			FlxG.bgColor = 0xff808080;
		}
		
		override public function create():void {
			FlxG.bgColor = 0xff80c0c0;
			
			var platform:FlxSprite = new FlxSprite(0, Global._GAME_SIZE.y - 4);
			platform.makeGraphic(Global._GAME_SIZE.x, 4);
			platform.immovable = true;
			
			var aegis:Aegis = new Aegis(this);
			aegis.collideTargets.add(platform);
			
			add(platform);
			add(aegis);
			
			super.create();
		}
		
	}

}
