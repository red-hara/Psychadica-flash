package style.aegis 
{
	import arch.Creature;
	import arch.DamageZone;
	import arch.Snark;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author red__hara
	 */
	public class PunchDamageZone extends DamageZone	{
		
		public var applyZone:FlxObject;
		public var offset:FlxPoint = new FlxPoint();
		public var force:FlxPoint = new FlxPoint();
		
		public function PunchDamageZone( Parent:Snark, Target:Snark ) {
			super(Parent, Target);
		}
		
		override public function create():void {
			add(applyZone);
		}
		
		override public function inZone( Target:Creature ):Boolean {
			if ( applyZone != null ) {
				return FlxG.overlap( applyZone, Target.sprite );
			}
			return false;
		}
		
		override public function update():void {
			super.update();
			if ( applyZone != null && parent is PlatformerCreature ) {
				applyZone.y = (parent as PlatformerCreature).sprite.y + offset.y;
				if (( parent as PlatformerCreature).sprite.facing == FlxObject.LEFT ) {
					applyZone.x = (parent as PlatformerCreature).sprite.x - applyZone.width - offset.x;
				} else {
					applyZone.x = (parent as PlatformerCreature).sprite.x + (parent as PlatformerCreature).sprite.width + offset.x;
				}
			}
		}
				
		override public function deliverHit( Target:Creature ):void {
			if ( parent is PlatformerCreature ) {
				if ( (parent as PlatformerCreature).sprite.facing == FlxObject.LEFT ) {
					if ( -Target.sprite.velocity.x < force.x ) {
						Target.sprite.velocity.x = -force.x;
						Target.sprite.velocity.y = -force.y;
					}
				} else {
					if ( -Target.sprite.velocity.x < force.x ) {
						Target.sprite.velocity.x = force.x;
						Target.sprite.velocity.y = -force.y;
					}
				}
			}
		}
	}

}
