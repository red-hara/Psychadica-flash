package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Snark extends FlxGroup
	{
		public var parent:Snark = null;
		
		public function Snark(Parent:Snark) 
		{
			parent = Parent;
		}
		
		public function getRoot():Snark {
			if ( parent == null ) {
				return this;
			} else {
				return parent.getRoot();
			}
		}
		
		public function create():void {
			
		}
		
	}

}
