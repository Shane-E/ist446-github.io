package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Swamp extends Entity
	{
		[Embed(source = "../assets/swamp.png")] private const SWAMP:Class;
		private var img:Image = new Image(SWAMP);
		
		public function Swamp(x:Number=0, y:Number=0)
		{
			super(x, y);
			type = "swamp";
			setHitbox(150,50);
			graphic = img;
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}