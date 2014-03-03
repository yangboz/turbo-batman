
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
	
	[SWF(width="640", height="480", backgroundColor="#ABCC7D")]
//	[Frame(factoryClass="Preloader")]
	/**
	 * SkyBattle.as class.
	 * @see http://www.creativeapplications.net/flash/flixel-2-tutorial-flash-tutorials-games/
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 1, 2014 12:30:40 AM
	 * @history 12/30/13,
	 */ 
	public class SkyBattle extends FlxGame
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
		public function SkyBattle()
		{
//			super(GameSizeX, GameSizeY, InitialState, Zoom, GameFramerate, FlashFramerate, UseSystemCursor);
//			super(0, 0, SkBatPlayState, Zoom, GameFramerate, FlashFramerate, UseSystemCursor);
			super(640,380,SkBatPlayState,1);
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
			SkyBattle.gamepad = new Gamepad(this.stage,true,0.5,true);
//			SkyBattle.gamepad.useWASD(true);
			//GamePadView
			SkyBattle.gamepadView = new GamepadView();
			SkyBattle.gamepadView.init(gamepad,0xffffff);
			this.addChild(SkyBattle.gamepadView);
			SkyBattle.gamepadView.x = this.stage.stageWidth-SkyBattle.gamepadView.width/2;
			SkyBattle.gamepadView.y = this.stage.stageHeight-SkyBattle.gamepadView.height/2;
		}
	}
	
}