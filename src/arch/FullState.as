package arch 
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxState;
	import style.aegis.levels.TestLevel;
	/**
	 * ...
	 * @author red__hara
	 */
	public class FullState extends FlxState
	{
		
		public function FullState()
		{
			super();
			add( new TestLevel(null) );
		}
		
		override public function create():void {
			super.create();
			for each( var basic:FlxBasic in members ) {
				if ( basic is Snark ) {
					( basic as Snark ).create();
				}
			}
		}
		
	}

}
