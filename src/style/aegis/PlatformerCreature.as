package style.aegis 
{
	import arch.Creature;
	import arch.Snark;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author red__hara
	 */
	public class PlatformerCreature extends Creature
	{
		public var runVelocity:Number;
		public var jumpVelocity:Number;
		public var collideTargets:Vector.<FlxBasic> = new Vector.<FlxBasic>;
		
		public function PlatformerCreature(Parent:Snark) 
		{
			super(Parent);
		}
		
		override public function update():void {
			super.update();
			for each( var basic:FlxBasic in collideTargets ) {
				FlxG.collide(basic, this);
			}
		}
		
	}

}
