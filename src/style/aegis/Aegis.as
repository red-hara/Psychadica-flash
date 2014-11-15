package style.aegis 
{
	import arch.Snark;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Aegis extends PlatformerCreature {
		public var aegisBody:FlxSprite;
		
		public var punchDamageZone:PunchDamageZone;
		
		[Embed(source = './data/Aegis.png')]
		public var aegisBodyImg:Class;
		
		public function Aegis( Parent:Snark ) 
		{
			super(Parent);
			
			runVelocity = 24;
			
			aegisBody = new FlxSprite();
			aegisBody.loadGraphic(aegisBodyImg, true, false, 48, 48 );
			aegisBody.addAnimation("run right", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], runVelocity*4/12);
			aegisBody.addAnimation("run left", [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23], runVelocity*4/12);
			aegisBody.play("run right");
			aegisBody.facing = FlxObject.LEFT;
			aegisBody.velocity.x = runVelocity;
			add(aegisBody);
		}
		
		override public function create():void {
			super.create();
			aegisBody.y = 12;
		}
	}
}
