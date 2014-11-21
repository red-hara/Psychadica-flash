package style.aegis 
{
	import arch.Creature;
	import arch.Snark;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author red__hara
	 */
	public class Aegis extends PlatformerCreature {
		public var aegisBody:FlxSprite;
		public var frontHand:FlxSprite;
		public var backHand:FlxSprite;
		public var head:FlxSprite;
		public var punchDamageZone:PunchDamageZone;
		[Embed(source = './data/Aegis.png')]
		public var aegisBodyImg:Class;
		
		public function Aegis( Parent:Snark ) 
		{
			super(Parent);
			
			runVelocity = 80;
			jumpVelocity = 64;
			
			aegisBody = new FlxSprite();
			aegisBody.loadGraphic(aegisBodyImg, true, false, 48, 48 );
			aegisBody.addAnimation("run right", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], runVelocity/12*2);
			aegisBody.addAnimation("run left", [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23], runVelocity/12*2);
			aegisBody.addAnimation("stay right", [24]);
			aegisBody.addAnimation("stay left", [25]);
			aegisBody.play("stay right");
			aegisBody.facing = FlxObject.RIGHT;
			aegisBody.maxVelocity.x = runVelocity;
			aegisBody.drag.x = runVelocity * 4;
			
			
			var root:Snark = getRoot();
			if ( root is Platformer ) {
				aegisBody.acceleration.y = (root as Platformer).g * Global._PROPORTION;
			}
			
			add(aegisBody);
		}
		
		override public function create():void {
			super.create();
			FlxG.camera.follow(aegisBody, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void {
			super.update();
			aegisBody.velocity.x = 0;
			if ( FlxG.keys.pressed(Global.KEY_RIGHT) && !FlxG.keys.pressed(Global.KEY_LEFT)) {
				aegisBody.velocity.x = runVelocity;
				aegisBody.play("run right");
				aegisBody.facing = FlxObject.RIGHT;
			} else if ( FlxG.keys.pressed(Global.KEY_LEFT ) && !FlxG.keys.pressed(Global.KEY_RIGHT)) {
				aegisBody.velocity.x = -runVelocity;
				aegisBody.play("run left");
				aegisBody.facing = FlxObject.LEFT;
			} else if ( aegisBody.facing == FlxObject.RIGHT ) {
				aegisBody.play("stay right");
			} else {
				aegisBody.play("stay left");
			}
			
			if ( aegisBody.isTouching(FlxObject.FLOOR) && FlxG.keys.justPressed(Global.KEY_UP) ) {
				aegisBody.velocity.y = -jumpVelocity;
			}
		}
	}
}
