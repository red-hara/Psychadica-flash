package arch 
{
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
		}
		
		override public function create():void {
			super.create();
			add( new TestLevel(null) );
		}
		
	}

}
