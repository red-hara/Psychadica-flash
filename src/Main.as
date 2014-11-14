package 
{
	import arch.FullState;
	import org.flixel.FlxGame;
	
	[ SWF( width = "640", height = "480", backgroundColor = "#000000" ) ]
	
	/**
	 * ...
	 * @author red__hara
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(Global._GAME_SIZE.x, Global._GAME_SIZE.y, FullState, 4);
		}
	}
	
}
