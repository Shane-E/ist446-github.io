package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class Vehicle extends Entity 
	{
		[Embed(source = "../assets/Vehicles.png")] private const VEHICLE:Class;
		[Embed(source = "../assets/sounds/horn1.mp3")] private const HORN1:Class;
		private var vehicles:Spritemap = new Spritemap(VEHICLE, 32, 16);
		private var n:Number = int(Math.random() * (6 - 1) + 1);
		public var speed:Number;
		public var beep1:Sfx;
		
		public function Vehicle(x:Number=0, y:Number=0) 
		{
			super(x, y);
			speed = 0;
			setHitbox(16, 16);
			type = "vehicle";
			beep1 = new Sfx(HORN1);
			
			vehicles.add("v1_right", [0], 20, true);
			vehicles.add("v2_right", [1], 20, true);
			vehicles.add("v3_right", [2], 20, true);
			vehicles.add("v4_right", [3], 20, true);
			vehicles.add("v5_right", [4], 20, true);
			graphic = vehicles;
			
			vehicles.play("v" + n + "_right");
		}
		
		public override function update():void
		{
			super.update();
			
			n = int(Math.random() * (6 - 1) + 1);
			if (x >= 530) {
				x = 0;
				//Random number Math.random() * (max - min) + min
				y = FP.choose(215, 250);
				
				if (collide("vehicle", x, y)) {
					//respawn(this);
				}
				if (y == 215) {
					speed = 4;
				}
				if (y == 250) {
					speed = 6
				}
				vehicles.play("v" + n + "_right");
				// trace(n);
			}
			x += speed;
			
			if(collide("minifrog", x, y))
			{
				beep1.play();
				this.x -= speed;
				GameWorld(world).score.subtractScore();
				GameWorld(world).frog1.respawn();
			}
			/*
			if (GameWorld(world).player.x == this.x - 4 || GameWorld(world).player.y == this.y - 4 || GameWorld(world).player.x == this.x + 4 || GameWorld(world).player.y == this.y + 4) {
				beep1.play();
				trace("Vehicle: " + this.x +"," + this.y);
				trace("Player: " + GameWorld(world).player.x +"," + GameWorld(world).player.y);
			}*/
		}
		/*
		public function respawn(v:Vehicle):void {
			v.x = 0;
			//Random number Math.random() * (max - min) + min
			v.y = FP.choose(215, 250);
		}*/
	}

}