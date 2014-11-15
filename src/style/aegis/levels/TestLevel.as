package style.aegis.levels 
{
	import arch.Snark;
	import org.flixel.FlxG;
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
			add(new Aegis(this) );
		}
		
		override public function create():void {
			super.create();
			FlxG.bgColor = 0xff80c0c0;
		}
		
	}

}
