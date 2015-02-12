package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class CreditsButton extends Entity 
	{
		[Embed(source = "../assets/buttonGreen1.png")] private const BUTTON:Class;
		private var label:Text = new Text("Credits", 0, 0);
		private var stamp:Stamp;
		private var glist:Graphiclist;
		
		public function CreditsButton(x:Number=0, y:Number=0) 
		{
			super(x, y);
			stamp = new Stamp(BUTTON);
			glist = new Graphiclist(stamp, label);
			label.size = 12;
			label.color = 0x000000;
			label.width = stamp.width
			label.align = "center";
			
			label.y = (stamp.height - label.textHeight) * 0.5
			
			graphic = glist;
			setHitboxTo(stamp);
		}
		
		override public function update():void {
			super.update();
			
			if (collidePoint(x, y, world.mouseX, world.mouseY)) {
				if (Input.mouseReleased) {
					Menu(world).bgMusic.stop();
					FP.world = new Credits();
				}
			}
		}
		
	}

}