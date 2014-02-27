
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import org.flixel.FlxSprite;
	
	
	/**
	 * FlxCharacter.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 27, 2014 10:06:24 AM
	 * @history 12/30/13,
	 */ 
	public class FlxCharacter extends FlxSprite
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		// Flag used to check if char is moving.
		public var moving:Boolean = false;
		// Var used to hold moving direction.
		private var move_dir:String = "DOWN";
		// Distance already moved.
		private var move_dis:uint = 0;
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
		/**
		 * 
		 * @param X the B2Character position of X.
		 * @param Y the B2Character position of Y.
		 * @param SimpleGraphic the B2Character image texture.
		 * 
		 */		
		public function FlxCharacter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			//Set position
			this.x = X * 1;
			this.y = Y * 1;
			//Load image
			this.loadGraphic(SimpleGraphic,true,false,16,16);
			//Set up the animation.
			addAnimation("DOWN_IDLE", [0]);
			addAnimation("UP_IDLE", [3]);
			addAnimation("LEFT_IDLE", [6]);
			addAnimation("RIGHT_IDLE", [9]);
			
			addAnimation("DOWN_WALK", [1,2], 6);
			addAnimation("UP_WALK", [4,5], 6);
			addAnimation("LEFT_WALK", [7,8], 6);
			addAnimation("RIGHT_WALK", [10,11], 6);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		/**
		 * @param dir the direction of movement.
		 */		
		public function move(dir:String):void
		{
			// Check if not already moving.
			if (!moving && move_dis <= 0)
			{
				// Setting variables.
				move_dir = dir;
				moving = true;
				move_dis = 16;
				
				// A switch statement works like a combination of else-if-statements.
				switch(dir)
				{
					case "UP":
						play("UP_WALK");
						break;
					case "DOWN":
						play("DOWN_WALK");
						break;
					case "LEFT":
						play("LEFT_WALK");
						break; 
					case "RIGHT":
						play("RIGHT_WALK");
						break;
				}
			}
		}
		/**
		 * @param dir the direction of look.
		 */		
		public function look(dir:String):void
		{
			move_dir = dir;
			
			switch(dir)
			{
				case "UP":
					play("UP_IDLE");
					break;
				case "DOWN":
					play("DOWN_IDLE");
					break;
				case "LEFT":
					play("LEFT_IDLE");
					break;
				case "RIGHT":
					play("RIGHT_IDLE");
					break;
			}
		}
		/**
		 *@inheritDoc 
		 */		
		override public function update():void
		{
			// If not moving, look at the direction of last movement.
			if (!moving)
			{
				look(move_dir);
			}
			else
			{
				// If the object is still allowed to move.
				if (move_dis > 0)
				{
					move_dis --;
					switch(move_dir)
					{
						case "UP":
							y--;
							break;
						case "DOWN":
							y++;
							break;
						case "LEFT":
							x--;
							break;
						case "RIGHT":
							x++;
							break;
					}
				}
				else // If the object has moved.
				{
					moving = false;
				}
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