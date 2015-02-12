package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width = "830", height = "600")]
	//[SWF(width = "550", height = "400")]
	/**
	 * ...
	 * @author Shane
	 */
	public class Main extends Engine
	{
		
		public function Main() 
		{
			super(830, 600, 60);
			//FP.console.enable();
		}
		
		override public function init():void
		{
			super.init();
			FP.world = new Menu();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}