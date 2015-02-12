package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class Score extends Entity
	{
		public var score:Number;
		private var text:Text;
		
		public function Score(x:Number=0, y:Number=0)
		{
			super(x, y);
			score = 0;
			name = "score";
			text = new Text("Score: 0");
			text.color = 0x0000FF;
			this.x = x;
			this.y = y;
			graphic = text;
		}
		
		public function addScore():void
		{
			score += 1;
			Text(graphic).text = "Score: " + score.toString();
		}
		
		public function subtractScore():void
		{
			score -= 1;
			Text(graphic).text = "Score: " + score.toString();
		}
	}
}