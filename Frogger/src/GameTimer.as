package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class GameTimer extends Entity 
	{
		public var timer:Timer;
		public var minute:int;
		public var second:Number;
		public var gameTime:Text;
		public var tlcounter:int;
		public var respawnCounter:int;
		
		public function GameTimer(x:Number=0, y:Number=0) 
		{
			super(x, y);
			tlcounter = 0;
			respawnCounter = 0;
			timer = new Timer(1000);
			minute = 2;
			second = 0;
			//minute = 0;
			//second = 10;
			timer.addEventListener(TimerEvent.TIMER, clock);
			gameTime = new Text("Time: " + minute.toString() + ":0" + second.toString());
			gameTime.color = 0x0000FF;
			graphic = gameTime;
		}
		
		public function clock(evt:TimerEvent):void {
			tlcounter++;
			respawnCounter++;
			
			if(minute > 0) {
				if (second <= 0) {
					second = 60;
					minute--;
				}
			}
			second -= 1;
			Text(graphic).text = "Time: " + minute.toString() + ":" + second.toString();
			if (second < 10) {
				Text(graphic).text = "Time: " + minute.toString() + ":0" + second.toString();
			}
			if (minute <= 0 && second <= 0) {
				stopTimer();
				GameWorld(world).music.stop();
				//END GAME
				FP.world = new EndMenu(GameWorld(world).score, GameWorld(world).player);
				FP.screen.scale = 1;
			}
			
			if (tlcounter >= 20) {
				tlcounter = 0;
			}
			
			if (respawnCounter > 2) {
				respawnCounter = 0;
			}
			gameTime.color = 0x0000FF;
		}
		
		public function startTimer():void {
			timer.start();
		}
		
		public function stopTimer():void {
			timer.stop();
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}