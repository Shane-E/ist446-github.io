package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class VehicleLeft extends Entity 
	{
		[Embed(source = "../assets/VehiclesLEFT.png")] private const VEHICLE_LEFT:Class;
		private var vehicles:Spritemap = new Spritemap(VEHICLE_LEFT, 32, 16);
		private var n:Number = int(Math.random() * (6 - 1) + 1);
		public var speed:Number;
		
		public function VehicleLeft(x:Number=0, y:Number=0) 
		{
			super(x, y);
			speed = 0;
			setHitbox(16, 16);
			type = "vehicle";
			
			vehicles.add("v1_left", [0], 20, true);
			vehicles.add("v2_left", [1], 20, true);
			vehicles.add("v3_left", [2], 20, true);
			vehicles.add("v4_left", [3], 20, true);
			vehicles.add("v5_left", [4], 20, true);
			graphic = vehicles;
			
			vehicles.play("v" + n + "_left");
		}
		
		public override function update():void
		{
			super.update();
			
			n = int(Math.random() * (6 - 1) + 1);
			if (x <= 0) {
				x = 530;
				//Random number Math.random() * (max - min) + min
				y = FP.choose(140, 180);
				
				if (collide("vehicle", x, y)) {
					//respawn(this);
				}
				if (y == 140) {
					speed = 4;
				}
				if (y == 180) {
					speed = 6
				}
				vehicles.play("v" + n + "_left");
				//trace(n);
			}
			x -= speed;
			
			if(collide("minifrog", x, y))
			{
				GameWorld(world).car1.beep1.play();
				this.x += speed;
				GameWorld(world).score.subtractScore();
				GameWorld(world).frog1.respawn();
			}
			//trace(GameWorld(world).timer.respawnCounter);
		}

	}

}