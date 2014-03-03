
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import org.flixel.FlxGame;
	
	[SWF(width="640", height="480", backgroundColor="#ABCC7D")]
	[Frame(factoryClass="Preloader")]
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
		public function SkyBattle(GameSizeX:uint, GameSizeY:uint, InitialState:Class, Zoom:Number=1, GameFramerate:uint=60, FlashFramerate:uint=30, UseSystemCursor:Boolean=false)
		{
//			super(GameSizeX, GameSizeY, InitialState, Zoom, GameFramerate, FlashFramerate, UseSystemCursor);
			super(GameSizeX, GameSizeY, SkBatPlayState, Zoom, GameFramerate, FlashFramerate, UseSystemCursor);
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
	}
	
}