package
{
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Menu extends World
	{
		[Embed(source = "../assets/sounds/bg_music1.mp3")] public const MUSIC:Class;
		[Embed(source = "../assets/FroggerMainMenu.png")] private const BACKGROUND:Class;
		private var title:Text = new Text("Frogger's Nightmare", 210, 50);
		private var instructions:Text = new Text("After Conquering the highway and defeating the river, Frogger gets some rest " +
		"\nbut has a terrible nightmare and needs to rescue his fellow frogs in his dream. \n\nUse the Arrow Keys to move and stay clear of vehicles. Rescue frogs by pushing " + 
		"\nthem safely back to the swamps before time runs out and you wake up! \n\n" + 
		"Use caution, you may wake up earlier if you are killed too many times!", 50, 100);
		private var play:Text = new Text("Press Space To Start", 225, 525);
		private var button:CreditsButton = new CreditsButton(725, 5);
		private var bg:Image = new Image(BACKGROUND);
		private var sound:SoundOn;
		public var bgMusic:Sfx;
		
		public function Menu()
		{
			super();
			sound = new SoundOn(800, 5);
			bgMusic = new Sfx(MUSIC);
			FP.volume = 0.75;
			bgMusic.loop();
			title.size = 40;
			title.color = 0x00FF00;
			
			play.size = 30;
			addGraphic(bg);
			//addGraphic(title);
			//addGraphic(instructions);
			//addGraphic(play);
			add(button);
			add(sound);
		}
		
		override public function update():void{
			super.update();
			if(Input.pressed(Key.SPACE)){
				bgMusic.stop();
				//FP.screen.scale = 1.5;
				FP.world = new GameStory(sound);
			}
		}
	}
}