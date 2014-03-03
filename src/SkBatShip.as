
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import flash.geom.Point;
	
	import assets.SkBatEmbedAssets;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	
	/**
	 * SkBatShip.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 3, 2014 10:07:02 AM
	 * @history 12/30/13,
	 */ 
	public class SkBatShip extends FlxSprite
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
		public function SkBatShip(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SkBatEmbedAssets.CHARACTER_SHIP);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		//
		override public function update():void
		{
			this.velocity.x = 0;
			this.velocity.y = 0;
			//
			if(SkyBattle.gamepad.left.isDown)
			{
				velocity.x = -250;
			}
			else if(SkyBattle.gamepad.right.isDown)
			{
				velocity.x = 250;
			}
			
			if(SkyBattle.gamepad.up.isDown)
			{
				velocity.y = -250;
			}
			else if(SkyBattle.gamepad.down.isDown)
			{
				velocity.y = 250;
			}
			//
			super.update();
		}
		//
		public function getBulletSpawnPosition():FlxPoint
		{
			var p:FlxPoint = new FlxPoint(x + 36,y + 12);
			return p;
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