
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import assets.EmbedAssets;
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	
	/**
	 * MenuState.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 27, 2014 4:30:01 PM
	 * @history 12/30/13,
	 */ 
	public class MenuState extends FlxState
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Protected properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function MenuState()
		{
			super();
			//
			var title:FlxText = new FlxText((FlxG.width-100)/2, 100, FlxG.width, "丢傻包",false);
			title.size = 24;
			add(title);
			//
			var startButton:FlxButton = new FlxButton((FlxG.width-100)/2, 150, "开始冒险",startGame);
//			startButton.label = new FlxText(20,3,100,"Start Game");
//			startButton.loadText(new FlxText(20,3,100,"Start Game"));
			startButton.height = 40;
			add(startButton);
			
			add(new FlxText((FlxG.width-100)/2, 200, 300, 
				"移动: 方向键 \n" +
				"动作: 空格键 \n" + 
				"道具: X键",false));
			
			// Show mouse.
			FlxG.mouse.show();
			// Play music
			FlxG.playMusic(EmbedAssets.SFX_MUSIC);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Protected methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function startGame():void
		{
			FlxG.switchState(new PlayState());
//			FlxG.state = new PlayState();
			// Play sound
			FlxG.play(EmbedAssets.SFX_BEEP);
			//
			FlxG.mouse.hide();
		}
	}
	
}