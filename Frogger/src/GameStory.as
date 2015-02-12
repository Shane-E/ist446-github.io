package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class GameStory extends World 
	{
		[Embed(source = "../assets/GameStory.png")] private const STORY:Class;
		[Embed(source = "../assets/sounds/bg_music1.mp3")] private const MUSIC:Class;
		private var story:Image = new Image(STORY);
		public var music:Sfx = new Sfx(MUSIC);
		private var sound:SoundOn;
		
		public function GameStory(menuSound:SoundOn) 
		{
			super();
			addGraphic(story);
			sound = menuSound;
			
			if (sound.action) {
				music.loop();
			}else if (!sound.action) {
				music.stop();
			}
		}
		
		override public function update():void{
			super.update();
			if (Input.pressed(Key.SPACE)) {
				music.stop();
				FP.screen.scale = 1.5;
				FP.world = new GameWorld(sound);
				//FP.world = new Credits();
			}
		}
		
	}

}