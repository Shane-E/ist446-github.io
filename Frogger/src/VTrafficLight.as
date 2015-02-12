package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class VTrafficLight extends Entity 
	{
		[Embed(source = "../assets/TrafficLightVert2.png")] private const VLIGHT:Class;
		private var sprite:Spritemap;
		public function VTrafficLight(x:Number=0, y:Number=0) 
		{
			super(x, y);
			sprite = new Spritemap(VLIGHT, 8, 47);
			sprite.scale = 0.5;
			sprite.add("vert_green", [0], 1, true);
			sprite.add("vert_red", [1], 1, true);
			graphic = sprite;
			sprite.play("vert_red");
		}
		
		override public function update():void {
			super.update();
			
			if (GameWorld(world).VGreen) {
				sprite.play("vert_green");
			}else {
				sprite.play("vert_red");
			}
		}
		
	}

}