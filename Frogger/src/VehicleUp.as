package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class VehicleUp extends Entity 
	{
		[Embed(source = "../assets/VehiclesUP.png")] private const VEHICLE_UP:Class;
		private var vehicles:Spritemap = new Spritemap(VEHICLE_UP, 16, 32);
		private var n:Number = int(Math.random() * (6 - 1) + 1);
		public var speed:Number;
		
		public function VehicleUp(x:Number=0, y:Number=0) 
		{
			super(x, y);
			speed = 0;
			setHitbox(16, 16);
			type = "vehicle";
			
			vehicles.add("v1_up", [0], 20, true);
			vehicles.add("v2_up", [1], 20, true);
			vehicles.add("v3_up", [2], 20, true);
			vehicles.add("v4_up", [3], 20, true);
			vehicles.add("v5_up", [4], 20, true);
			graphic = vehicles;
			
			vehicles.play("v" + n + "_up");
		}
		
		public override function update():void
		{
			super.update();
			
			n = int(Math.random() * (6 - 1) + 1);
			if (y <= 0) {
				y = 380;
				//Random number Math.random() * (max - min) + min
				x = FP.choose(295, 330);
				
				if (collide("vehicle", x, y)) {
					//respawn(this);
				}
				if (x == 295) {
					speed = 4;
				}
				if (x == 330) {
					speed = 6
				}
				vehicles.play("v" + n + "_up");
				//trace(n);
			}
			y -= speed;
			
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