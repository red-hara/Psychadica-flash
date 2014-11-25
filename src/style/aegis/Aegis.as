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
		public var frontArm:FlxSprite;
		public var backArm:FlxSprite;
		public var head:FlxSprite;
		public var punchDamageZone:PunchDamageZone;
		[Embed(source = './data/Aegis.png')]
		public var aegisBodyImg:Class;
		[Embed(source = './data/AegisHandFront.png')]
		public var aegisHandFrontImg:Class;
		[Embed(source = './data/AegisHandBack.png')]
		public var aegisHandBackImg:Class;
		
		
		public function Aegis( Parent:Snark ) 
		{
			super(Parent);
			
			runVelocity = 100;
			jumpVelocity = 64;
			
			aegisBody = new FlxSprite();
			aegisBody.loadGraphic(aegisBodyImg, true, false, 48, 48 );
			aegisBody.addAnimation("run right", [4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3], runVelocity / 8);
			aegisBody.addAnimation("run left", [17, 18, 19, 20, 21, 22, 23, 12, 13, 14, 15, 16], runVelocity/8);
			aegisBody.addAnimation("stay right", [24]);
			aegisBody.addAnimation("stay left", [25]);
			aegisBody.play("stay right");
			aegisBody.facing = FlxObject.RIGHT;
			aegisBody.maxVelocity.x = runVelocity;
			aegisBody.drag.x = runVelocity * 4;
			
			frontArm = new FlxSprite();
			frontArm.loadGraphic(aegisHandFrontImg, true, false, 48, 48 );
			frontArm.addAnimation("run right", [4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3], runVelocity / 8);
			frontArm.addAnimation("run left", [17, 18, 19, 20, 21, 22, 23, 12, 13, 14, 15, 16], runVelocity / 8);
			frontArm.addAnimation("stay right", [24]);
			frontArm.addAnimation("stay left", [25]);
			frontArm.play("stay right");
			
			
			backArm = new FlxSprite();
			backArm.loadGraphic(aegisHandBackImg, true, false, 48, 48 );
			backArm.addAnimation("run right", [4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3], runVelocity / 8);
			backArm.addAnimation("run left", [17, 18, 19, 20, 21, 22, 23, 12, 13, 14, 15, 16], runVelocity / 8);
			backArm.addAnimation("stay right", [24]);
			backArm.addAnimation("stay left", [25]);
			backArm.play("stay right");
			
			var root:Snark = getRoot();
			if ( root is Platformer ) {
				aegisBody.acceleration.y = (root as Platformer).g * Global._PROPORTION;
			}
			
			add(backArm);
			add(aegisBody);
			add(frontArm);
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
				frontArm.play("run right");
				backArm.play("run right");
				aegisBody.facing = FlxObject.RIGHT;
			} else if ( FlxG.keys.pressed(Global.KEY_LEFT ) && !FlxG.keys.pressed(Global.KEY_RIGHT)) {
				aegisBody.velocity.x = -runVelocity;
				aegisBody.play("run left");
				frontArm.play("run left");
				backArm.play("run left");
				aegisBody.facing = FlxObject.LEFT;
			} else if ( aegisBody.facing == FlxObject.RIGHT ) {
				aegisBody.play("stay right");
				frontArm.play("stay right");
				backArm.play("stay right");
			} else {
				aegisBody.play("stay left");
				frontArm.play("stay left");
				backArm.play("stay left");
			}
			
			if ( aegisBody.isTouching(FlxObject.FLOOR) && FlxG.keys.justPressed(Global.KEY_UP) ) {
				aegisBody.velocity.y = -jumpVelocity;
			}
		}
		
			
		override public function postUpdate():void {
			super.postUpdate();
			backArm.x = frontArm.x = aegisBody.x;
			backArm.y = frontArm.y = aegisBody.y;
		}
	}
}
