package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class MiniFrog extends Entity 
	{
		[Embed(source = "../assets/minifrog.png")] private const GOAL:Class;
		[Embed(source = "../assets/sounds/chirp.mp3")] private const CHIRP:Class;
		private var minfrog:Spritemap = new Spritemap(GOAL, 16, 16);
		private var chrp:Sfx;
		
		public function MiniFrog(x:Number=0, y:Number=0) 
		{
			super(x, y);
			setHitbox(6, 7);
			type = "minifrog";
			chrp = new Sfx(CHIRP);
			
			minfrog.add("sit_blink", [0, 1], 2, true);
			
			graphic = minfrog;
			minfrog.play("sit_blink");
		}
		
		public function respawn():void
		{
			//Random number Math.random() * (max - min) + min
			var x1:int = Math.random() * (150 - 10) + 10;
			var x2:int = Math.random() * (500 - 375) + 375;
			var y1:int = Math.random() * (340 - 300) + 300;
			var y2:int = Math.random() * (100 - 40) + 40;
			
			this.x = FP.choose(x1, x2);
			this.y = FP.choose(y1, y2);
		}
		
		public override function update():void
		{
			super.update();
			
			if(collide("player", x, top)){
				this.y+= GameWorld(world).player.speed;
			}
			if(collide("player", x, bottom)){
				this.y-= GameWorld(world).player.speed;
			}
			if(collide("player", left, y)){
				this.x+= GameWorld(world).player.speed;
			}
			if(collide("player", right, y)){
				this.x-= GameWorld(world).player.speed;
			}
			if (collide("swamp", x, y)) {
				chrp.play();
				GameWorld(world).score.addScore();
				GameWorld(world).frog1.respawn();
			}
		}
	}
}