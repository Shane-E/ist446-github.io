package 
{
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class GameWorld extends World 
	{
		[Embed(source = "../assets/TrafficLightMap.png")] private const WORLDMAP:Class;
		[Embed(source = "../assets/sounds/bg_music1.mp3")] private const MUSIC:Class;
		
		public var player:Player;
		public var music:Sfx;
		public var car1:Vehicle;
		public var car2:Vehicle;
		public var car3:Vehicle;
		public var car4:Vehicle;
		public var carLeft1:VehicleLeft;
		public var carLeft2:VehicleLeft;
		public var carLeft3:VehicleLeft;
		public var carLeft4:VehicleLeft;
		public var carUp1:VehicleUp;
		public var carUp2:VehicleUp;
		public var carUp3:VehicleUp;
		public var carUp4:VehicleUp;
		public var carDown1:VehicleDown;
		public var carDown2:VehicleDown;
		public var carDown3:VehicleDown;
		public var carDown4:VehicleDown;
		public var frog1:MiniFrog;
		public var score:Score;
		public var swamp:Swamp;
		public var bg:Image;
		public var timer:GameTimer;
		public var htl1:HTrafficLight;
		public var htl2:HTrafficLight;
		public var vtl1:VTrafficLight;
		public var vtl2:VTrafficLight;
		public var HGreen:Boolean;
		public var VGreen:Boolean;
		public var soundMusic:SoundOn;
		
		public function GameWorld(sound:SoundOn) 
		{
			super();
			player = new Player(50, 300);
			score = new Score(470, 375);
			music = new Sfx(MUSIC);
			soundMusic = sound;
			
			if (soundMusic.action) {
				music.loop();
			}else if (!soundMusic.action) {
				music.stop();
			}
			
			swamp = new Swamp(0, 348);
			bg = new Image(WORLDMAP);
			bg.scale = 0.54;
			
			timer = new GameTimer(470, 0);
			timer.startTimer();
			
			//Horizontal Lane Travel Right, y = 215;
			//Horizontal Lane 2 Travel Right, y = 250;
			car1 = new Vehicle(0, 215);
			car1.speed = 4;
			car2 = new Vehicle(0, 250);
			car2.speed = 6;
			car3 = new Vehicle(100, 215);
			car3.speed = 4;
			car4 = new Vehicle(100, 250);
			car4.speed = 6;
			
			//Horizontal Lane Travel Left, y = 140;
			//Horizontal Lane 2 Travel Left, y = 180;
			carLeft1 = new VehicleLeft(500, 140);
			carLeft1.speed = 4;
			carLeft2 = new VehicleLeft(500, 180);
			carLeft2.speed = 6;
			carLeft3 = new VehicleLeft(400, 140);
			carLeft3.speed = 4;
			carLeft4 = new VehicleLeft(400, 180);
			carLeft4.speed = 6;
			
			//Vertical Lane Travel Up, x = 295;
			//Vertical Lane 2 Travel Up, x = 370;
			carUp1 = new VehicleUp(295, 370);
			carUp1.speed = 4;
			carUp2 = new VehicleUp(295, 320);
			carUp2.speed = 6;
			carUp3 = new VehicleUp(330, 370);
			carUp3.speed = 4;
			carUp4 = new VehicleUp(330, 320);
			carUp4.speed = 6;
			
			//Vertical Lane Travel Down, x = 214;
			//Vertical Lane 2 Travel Down, x = 254;
			carDown1 = new VehicleDown(214, 0);
			carDown1.speed = 4;
			carDown2 = new VehicleDown(214, 50);
			carDown2.speed = 6;
			carDown3 = new VehicleDown(254, 0);
			carDown3.speed = 4;
			carDown4 = new VehicleDown(254, 50);
			carDown4.speed = 6;
			
			HGreen = false;
			VGreen = true;
			
			htl1 = new HTrafficLight(318.5, 121);
			htl2 = new HTrafficLight(224.5, 282);
			vtl1 = new VTrafficLight(197, 145);
			vtl2 = new VTrafficLight(360, 241);
			
			frog1 = new MiniFrog(0, 0);
			frog1.respawn();
		}
		
		override public function begin():void {
			super.begin();
			
			addGraphic(bg);
			add(player);
			add(score);
			add(timer);
			add(frog1);
			
			add(car1);
			add(car2);
			add(car3);
			add(car4);
			
			add(carLeft1);
			add(carLeft2);
			add(carLeft3);
			add(carLeft4);
			
			add(carUp1);
			add(carUp2);
			add(carUp3);
			add(carUp4);
			
			add(carDown1);
			add(carDown2);
			add(carDown3);
			add(carDown4);
			
			add(htl1);
			add(htl2);
			add(vtl1);
			add(vtl2);
			add(swamp);
		}
		override public function update():void {
			super.update();
			
			if (timer.tlcounter <= 10) {
				HGreen = false;
				VGreen = true;
			}
			if (timer.tlcounter > 10) {
				if (timer.tlcounter <= 20) {
					HGreen = true;
					VGreen = false;
				}
			}
			
			//Boundaries for player in game world
			if (player.x < 0) {
				player.x = 0;
			}else if (player.x > 530) {
				player.x = 530;
			}else if (player.y < 0) {
				player.y = 0;
			}else if (player.y > 380) {
				player.y = 380;
			}
			
			//Boundaries for minifrog in game world
			if (frog1.x < 10) {
				frog1.x = 10;
			}else if (frog1.x > 520) {
				frog1.x = 520;
			}else if (frog1.y < 10) {
				frog1.y = 10;
			}else if (frog1.y > 370) {
				frog1.y = 370;
			}
			
			if (HGreen) {
				//vvvvvvvvvv Horizontal Lane Traveling Right
				if (car1.x > vtl1.x) {
					//donothing;
				}else{
					car1.speed = 0;
				}
				if (car2.x > vtl1.x) {
					//donothing;
				}else{
					car2.speed = 0;
				}
				if (car3.x > vtl1.x) {
					//donothing;
				}else{
					car3.speed = 0;
				}
				if (car4.x > vtl1.x) {
					//donothing;
				}else{
					car4.speed = 0;
				}
				//^^^^^^^^^^ Horizontal Lane Traveling Right
				//vvvvvvvvvv Horizontal Lane Traveling Left
				if (carLeft1.x < vtl2.x) {
					//donothing;
				}else{
					carLeft1.speed = 0;
				}
				if (carLeft2.x < vtl2.x) {
					//donothing;
				}else{
					carLeft2.speed = 0;
				}
				if (carLeft3.x < vtl2.x) {
					//donothing;
				}else{
					carLeft3.speed = 0;
				}
				if (carLeft4.x < vtl2.x) {
					//donothing;
				}else{
					carLeft4.speed = 0;
				}
				//^^^^^^^^^^ Horizontal Lane Traveling Left
			}else if (!HGreen) {
				//********** Horizontal Lane Traveling Right
				if (car1.y == 215) {
					car1.speed = 4
				}
				if (car2.y == 215) {
					car2.speed = 4
				}
				if (car3.y == 215) {
					car3.speed = 4
				}
				if (car4.y == 215) {
					car4.speed = 4
				}
				if (car1.y == 250) {
					car1.speed = 6
				}
				if (car2.y == 250) {
					car2.speed = 6
				}
				if (car3.y == 250) {
					car3.speed = 6
				}
				if (car4.y == 250) {
					car4.speed = 6
				}
				//********** Horizontal Lane Traveling Right
				//********** Horizontal Lane Traveling Left
				if (carLeft1.y == 140) {
					carLeft1.speed = 4
				}
				if (carLeft2.y == 140) {
					carLeft2.speed = 4
				}
				if (carLeft3.y == 140) {
					carLeft3.speed = 4
				}
				if (carLeft4.y == 140) {
					carLeft4.speed = 4
				}
				if (carLeft1.y == 180) {
					carLeft1.speed = 6
				}
				if (carLeft2.y == 180) {
					carLeft2.speed = 6
				}
				if (carLeft3.y == 180) {
					carLeft3.speed = 6
				}
				if (carLeft4.y == 180) {
					carLeft4.speed = 6
				}
				//********** Horizontal Lane Traveling Left
			}
			
			if (VGreen) {
				//vvvvvvvvvv Vertical Lane Traveling Up
				if (carUp1.y < htl2.y) {
					//donothing;
				}else{
					carUp1.speed = 0;
				}
				if (carUp2.y < htl2.y) {
					//donothing;
				}else{
					carUp2.speed = 0;
				}
				if (carUp3.y < htl2.y) {
					//donothing;
				}else{
					carUp3.speed = 0;
				}
				if (carUp4.y < htl2.y) {
					//donothing;
				}else{
					carUp4.speed = 0;
				}
				//^^^^^^^^^^ Vertical Lane Traveling Up
				//vvvvvvvvvv Vertical Lane Traveling Down
				if (carDown1.y > htl1.y) {
					//donothing;
				}else{
					carDown1.speed = 0;
				}
				if (carDown2.y > htl1.y) {
					//donothing;
				}else{
					carDown2.speed = 0;
				}
				if (carDown3.y > htl1.y) {
					//donothing;
				}else{
					carDown3.speed = 0;
				}
				if (carDown4.y > htl1.y) {
					//donothing;
				}else{
					carDown4.speed = 0;
				}
				//^^^^^^^^^^ Vertical Lane Traveling Down
			}else if (!VGreen) {
				//vvvvvvvvvv Vertical Lane Traveling Up
				if (carUp1.x == 295) {
					carUp1.speed = 4
				}
				if (carUp2.x == 295) {
					carUp2.speed = 4
				}
				if (carUp3.x == 295) {
					carUp3.speed = 4
				}
				if (carUp4.x == 295) {
					carUp4.speed = 4
				}
				if (carUp1.x == 330) {
					carUp1.speed = 6
				}
				if (carUp2.x == 330) {
					carUp2.speed = 6
				}
				if (carUp3.x == 330) {
					carUp3.speed = 6
				}
				if (carUp4.x == 330) {
					carUp4.speed = 6
				}
				//^^^^^^^^^^ Vertical Lane Traveling Up
				//vvvvvvvvvv Vertical Lane Traveling Down
				if (carDown1.x == 214) {
					carDown1.speed = 4
				}
				if (carDown2.x == 214) {
					carDown2.speed = 4
				}
				if (carDown3.x == 214) {
					carDown3.speed = 4
				}
				if (carDown4.x == 214) {
					carDown4.speed = 4
				}
				if (carDown1.x == 254) {
					carDown1.speed = 6
				}
				if (carDown2.x == 254) {
					carDown2.speed = 6
				}
				if (carDown3.x == 254) {
					carDown3.speed = 6
				}
				if (carDown4.x == 254) {
					carDown4.speed = 6
				}
				//^^^^^^^^^^ Vertical Lane Traveling Down
			}
		}
		public function get scr():Score
		{
			return score;
		}
		
		public function get death():Number
		{
			return player.deaths;
		}
	}

}