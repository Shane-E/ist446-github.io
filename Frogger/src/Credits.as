package 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Shane
	 */
	public class Credits extends World
	{
		private var title:Text = new Text("Credits", 350, 5);
		private var created:Text = new Text("Game Created By Shane Eckenrode", 210, 50);
		private var soundsTitle:Text = new Text("Sounds", 50, 300);
		private var imagesTitle:Text = new Text("Images", 50, 130);
		private var imagesEntities:Text = new Text("http://www.spriters-resource.com/arcade/frogger/sheet/11067\n"
												+ "http://zeldawiki.org/images/0/07/SwampPalace.png\n"
												+ "http://testdeconnaissances.saaq.gouv.qc.ca/en/driving-and-road-safety-automobile/3045\n"
												+ "http://www.easyvectors.com/assets/images/vectors/afbig/pill-button-green-clip-art.jpg\n"
												+ "http://www.ducksters.com/science/sound.png\n"
												+ "Custom menu images made by Brendon Andrews -- Twitter: @BrendonAndrews1", 50, 150);
		private var sounds:Text = new Text("http://www.sounds-resource.com/playstation/frogger3d/sound/1536", 50, 320);
		private var backButton:BackButton = new BackButton(400, 550);
		
		public function Credits() 
		{
			super();
			title.size = 40;
			created.size = 25;
			soundsTitle.size = 20;
			imagesTitle.size = 20;
			
			title.color = 0x00FF00;
			imagesTitle.color = 0xffffff;
			soundsTitle.color = 0xffffff;
			
			addGraphic(title);
			addGraphic(created);
			addGraphic(soundsTitle);
			addGraphic(imagesTitle);
			addGraphic(imagesEntities);
			addGraphic(sounds);
			add(backButton);
		}
	}
}