package arch
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Snark extends FlxState
	{
		public var parent:Snark = null;
		
		public function Snark(Parent:Snark) 
		{
			super();
			parent = Parent;
		}
		
		public function getRoot():Snark {
			if ( parent == null ) {
				return this;
			} else {
				return parent.getRoot();
			}
		}
		
		override public function create():void {
			for each( var basic:FlxBasic in members ) {
				if ( basic is Snark ) {
					(basic as Snark).create();
				}
			}
		}
	}

}
