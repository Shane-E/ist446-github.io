package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class EndMenu extends World 
	{
		[Embed(source = "../assets/EndMenu2.png")] private const BACKGROUND:Class;
		private var bg:Image = new Image(BACKGROUND);
		private var title:Text;
		private var rescued:Text;
		private var deaths:Text;
		private var restart:Text;
		
		public function EndMenu(score:Score, p:Player) 
		{
			super();
			title = new Text("Game Over", 250, 50);
			title.size = 60;
			title.color = 0xff0000;
			
			//rescued = new Text("You managed to save " + score.score.toString() + " frogs before waking up!", 200, 150);
			rescued = new Text(score.score.toString(), 580, 205);
			rescued.color = 0x00FF00;
			//deaths = new Text("You died " + p.deaths.toString() + " times.", 200, 200);
			deaths = new Text(p.deaths.toString(), 430, 265);
			deaths.color = 0xff0000;
			restart = new Text("Press Space To Restart", 175, 550);
			restart.size = 40;
			rescued.size = 36;
			deaths.size = 36;
			
			//addGraphic(title);
			addGraphic(bg);
			addGraphic(rescued);
			addGraphic(deaths);
			//addGraphic(restart);
		}
		
		override public function update():void {
			super.update();
			if(Input.pressed(Key.SPACE)){
				FP.world = new Menu();
				FP.screen.scale = 1;
			}
		}
		
	}

}