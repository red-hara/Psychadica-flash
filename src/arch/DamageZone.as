package arch
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
			ignore = new Vector.<Snark>();
		}
		
		public function apply(Target:Snark):Boolean {
			var hit:Boolean = false;
			for each( var subsubTarget:Snark in Target.members ) {
				if( subsubTarget is Snark ) {
					if( ignore.indexOf(subsubTarget ) > -1 ) {
						hit = apply(subsubTarget);
					}
				}
				if( hit ) {
					return true;
				}
			}
			
			if( Target is Creature) {
				if( inZone(Target as Creature)) {
					(Target as Creature).hurt(this);
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
