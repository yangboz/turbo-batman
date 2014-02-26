
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.iainlobb.gamepad.Gamepad;
	import com.iainlobb.gamepad.GamepadView;
	
	import flash.events.Event;
	
	import org.flixel.FlxGame;

 //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	/**
	 * Main.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 25, 2014 7:53:29 PM
	 * @history 12/30/13,
	 */ 
	public class Main extends FlxGame
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
		public function Main()
		{
			super(640,480,PlayState,1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
			//
//			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
			
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
		private function addToStageHandler(event:Event):void
		{
			//GamePad
			var gamepad:Gamepad = new Gamepad(this.stage,false);
			//GamePadView
			var gamepadView:GamepadView = new GamepadView();
			gamepadView.init(gamepad,0xffffff);
			this.addChild(gamepadView);
		}
	}
	
}