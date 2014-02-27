
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
			var title:FlxText = new FlxText(40, 10, FlxG.width, "Adventure Game");
			title.size = 24;
			add(title);
			//
			var startButton:FlxButton = new FlxButton(100, 100, "Start Game",startGame);
//			startButton.label = new FlxText(20,3,100,"Start Game");
//			startButton.loadText(new FlxText(20,3,100,"Start Game"));
			add(startButton);
			
			add(new FlxText(100, 130, 300, 
				"Moving: Arrow keys \n" +
				"Actions: Spacebar \n" + 
				"Inventory: X"));
			
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
		}
	}
	
}