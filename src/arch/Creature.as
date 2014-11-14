package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Creature extends Snark
	{
		public var sprite:FlxSprite;
		public var health:Number;
		
		public function Creature( Parent:Snark ) 
		{
			super(Parent);
		}
		
		override public function create():void {
			super.create()
		}
		
		public function hurt(Damager:DamageZone) {
			Damager.deliverHit(this);
		}
	}
}
