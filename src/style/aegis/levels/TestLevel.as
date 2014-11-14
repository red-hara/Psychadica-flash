package style.aegis.levels 
{
	import arch.Snark;
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
			add(new PlatformerCreature(this) );
		}
		
	}

}
