package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class Player extends Entity
	{
		[Embed(source = "../assets/froggerModel2.png")] private const PLAYER:Class;
		[Embed(source = "../assets/sounds/death.mp3")] private const DEATH:Class;
		private var player:Spritemap = new Spritemap(PLAYER, 24, 16);
		public var speed:Number;
		public var deaths:Number;
		public var die:Sfx;
		
		public function Player(x:Number=0, y:Number=0) 
		{
			super(x, y);
			setHitbox(16, 14);
			type = "player";
			speed = 3;
			deaths = 0;
			die = new Sfx(DEATH);
			
			player.add("stand_up", [2], 20, true);
			player.add("stand_left", [5], 20, true);
			player.add("stand_right", [9], 20, true);
			player.add("stand_down", [8], 20, true);
			player.add("jump_up", [2, 1, 0], 10, true);
			player.add("jump_left", [5, 4, 3], 10, true);
			player.add("jump_right", [9, 10, 11], 10, true);
			player.add("jump_down", [8, 7, 6], 10, true);
			graphic = player;
			player.play("stand");
		}
		
		public override function update():void
		{
			super.update();
			
			if (Input.check(Key.LEFT)) {
				x -= speed;
				player.play("jump_left");
			}
			if (Input.check(Key.RIGHT)) {
				x += speed;
				player.play("jump_right");
			}
			if (Input.check(Key.UP)) {
				y -= speed;
				player.play("jump_up");
			}
			if (Input.check(Key.DOWN)) {
				y += speed;
				player.play("jump_down");
			}
			/*if (Input.check(Key.SHIFT)) {
				speed = 3;
			}
			if (Input.released(Key.SHIFT)) {
				speed = 1;
			}*/
			if (Input.released(Key.LEFT)) {
				player.play("stand_left");
			}
			if (Input.released(Key.RIGHT)) {
				player.play("stand_right");
			}
			if (Input.released(Key.UP)) {
				player.play("stand_up");
			}
			if (Input.released(Key.DOWN)) {
				player.play("stand_down");
			}
			
			if (collide("vehicle", x, y)) {
				trace("Vehicle Collision!");
				die.play();
				deaths++;
				GameWorld(world).timer.second -= 10;
				GameWorld(world).timer.gameTime.color = 0xff0000;
				x = 50;
				y = 300;
			}
		}
	}
}