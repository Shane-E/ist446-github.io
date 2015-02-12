package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class HTrafficLight extends Entity 
	{
		[Embed(source = "../assets/TrafficLightHoriz.png")] private const HLIGHT:Class;
		private var sprite:Spritemap;
		
		public function HTrafficLight(x:Number=0, y:Number=0) 
		{
			super(x, y);
			sprite = new Spritemap(HLIGHT, 43, 8);
			sprite.scale = 0.5;
			sprite.add("horiz_green", [0], 1, true);
			sprite.add("horiz_red", [1], 1, true);
			graphic = sprite;
			sprite.play("horiz_red");
		}
		
		override public function update():void {
			super.update();
			
			if (GameWorld(world).HGreen) {
				sprite.play("horiz_green");
			}else {
				sprite.play("horiz_red");
			}
		}
	}

}