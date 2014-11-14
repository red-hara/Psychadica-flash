package  
{
	/**
	 * ...
	 * @author red__hara
	 */
	public class DamageZone extends Snark
	{
		public var damage:Number;
		public var target:Snark;
		public var ignore:Vector.<Snark>;
		
		public function DamageZone( Parent:Snark, Target:Snark ) 
		{
			super(Parent);
			target = Target;
		}
		
		public function apply(Target:Snark):Boolean {
			var hit:Boolean = false;
			for( var subsubTarget:Snark in Target.members ) {
				if( subsubTarget instanceof Snark ) {
					if( !ignore.contains((Snark)subsubTarget)) {
						hit = apply((Snark) subsubTarget);
					}
				}
				if( hit ) {
					return true;
				}
			}
			
			if( Target instanceof Creature) {
				if( inZone((Creature)Target)) {
					((Creature)Target).hurt(this);
				}
			}
			
			return hit;
		}
		
		public function deliverHit( Target:Creature ):void {
		}
		
		public function inZone( Target:Creature ):Boolean {
			return true;
		}
	}

}
