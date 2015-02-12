package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class VehicleDown extends Entity 
	{
		[Embed(source = "../assets/VehiclesDOWN.png")] private const VEHICLE_DOWN:Class;
		private var vehicles:Spritemap = new Spritemap(VEHICLE_DOWN, 16, 32);
		private var n:Number = int(Math.random() * (6 - 1) + 1);
		public var speed:Number;
		
		public function VehicleDown(x:Number=0, y:Number=0) 
		{
			super(x, y);
			speed = 0;
			setHitbox(16, 16);
			type = "vehicle";
			
			vehicles.add("v1_down", [0], 20, true);
			vehicles.add("v2_down", [1], 20, true);
			vehicles.add("v3_down", [2], 20, true);
			vehicles.add("v4_down", [3], 20, true);
			vehicles.add("v5_down", [4], 20, true);
			graphic = vehicles;
			
			vehicles.play("v" + n + "_down");
		}
		
		public override function update():void
		{
			super.update();
			
			n = int(Math.random() * (6 - 1) + 1);
			if (y >= 380) {
				y = 0;
				//Random number Math.random() * (max - min) + min
				x = FP.choose(214, 254);
				
				if (collide("vehicle", x, y)) {
					//respawn(this);
				}
				if (x == 214) {
					speed = 4;
				}
				if (x == 254) {
					speed = 6
				}
				vehicles.play("v" + n + "_down");
				//trace(n);
			}
			y += speed;
			
			if(collide("minifrog", x, y))
			{
				GameWorld(world).car1.beep1.play();
				this.y += speed;
				GameWorld(world).score.subtractScore();
				GameWorld(world).frog1.respawn();
			}
			//trace(GameWorld(world).timer.respawnCounter);
		}
		
	}

}