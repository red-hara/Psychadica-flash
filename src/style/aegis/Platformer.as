package style.aegis 
{
	import arch.Snark;
	import arch.WorldState;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Platformer extends WorldState
	{
		public var g:Number = 9.8;
		
		public var collide:FlxTilemap;
		public var background:FlxSprite;
		
		public function Platformer(Parent:Snark) 
		{
			super(Parent);
		}
		
	}

}
