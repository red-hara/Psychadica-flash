package arch
{
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
	}

}
