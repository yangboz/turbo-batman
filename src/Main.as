
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
		public static var gamepad:Gamepad;
		private static var gamepadView:GamepadView;
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
			super(640,380,PlayState,1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
			//
			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
			
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
			Main.gamepad = new Gamepad(this.stage,true,0.5,true);
			Main.gamepad.useWASD(true);
			//GamePadView
			Main.gamepadView = new GamepadView();
			Main.gamepadView.init(gamepad,0xffffff);
			this.addChild(Main.gamepadView);
			Main.gamepadView.x = this.stage.stageWidth-Main.gamepadView.width/2;
			Main.gamepadView.y = this.stage.stageHeight-Main.gamepadView.height/2;
		}
	}
	
}