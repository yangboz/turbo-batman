
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	
	/**
	 * CreditState.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 27, 2014 4:27:31 PM
	 * @history 12/30/13,
	 */ 
	public class CreditState extends FlxState
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var text:FlxText;
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
		public function CreditState()
		{
			super();
			//
			text = new FlxText(24, 24, FlxG.width,
				"Adventure Game \n \n" +
				"Programming by: me \n" +
				"Graphics by: kcnh (www.kcnhgames.com) \n" +
				"Based on a tutorial by: kcnh (www.kcnhgames.com) \n" +
				"\n \n Press SPACE to continue.");
			
			add(text);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function update():void
		{
			
			if (Main.gamepad.fire2.isPressed)//FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MenuState());
//				FlxG.state = new MenuState();
			}
			super.update();
		}
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
	}
	
}