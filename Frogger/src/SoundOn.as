package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class SoundOn extends Entity 
	{
		[Embed(source = "../assets/soundSprite.png")] private const SOUND:Class;
		private var soundSprite:Spritemap;
		public var action:Boolean;
		
		public function SoundOn(x:Number=0, y:Number=0) 
		{
			super(x, y);
			soundSprite = new Spritemap(SOUND, 20, 19);
			action = true;
			
			soundSprite.add("on", [0], 10, true);
			soundSprite.add("off", [1], 10, true);
			
			graphic = soundSprite
			setHitbox(20, 19);
			soundSprite.play("on");
		}
		
		override public function update():void {
			if (collidePoint(x, y, world.mouseX, world.mouseY)) {
				if (Input.mouseReleased) {
					if (action) {
						action = false;
						soundSprite.play("off");
						Menu(world).bgMusic.stop();
					}else if (!action) {
						action = true;
						soundSprite.play("on");
						Menu(world).bgMusic.loop();
					}
				}
			}
		}
		
	}

}