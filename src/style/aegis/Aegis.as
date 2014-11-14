package style.aegis 
{
	import arch.Snark;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Aegis extends Snark{
		public var aegisBody:AegisBody;
		
		public function Aegis( Parent:Snark ) 
		{
			super(Parent);
			aegisBody = new AegisBody( this );
		}
	}
}	
import style.aegis.PlatformerCreature;
import arch.Snark;
class AegisBody extends PlatformerCreature {
	
	public function AegisBody( Parent:Snark ) {
		super(Parent);
	}
}
