package style.aegis 
{
	import arch.Creature;
	import arch.Snark;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author red__hara
	 */
	public class PlatformerCreature extends Creature
	{
		public var runVelocity:Number;
		public var jumpVelocity:Number;
		public var collideTargets:FlxGroup = new FlxGroup();
		
		public function PlatformerCreature(Parent:Snark) 
		{
			super(Parent);
		}
		
		override public function update():void {
			super.update();
			FlxG.collide(this, collideTargets);
		}
		
	}

}
