
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import flash.geom.Point;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	
	
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
		public var move_dir:String = "DOWN";
		// Distance already moved.
		private var move_dis:uint = 0;
		// 
		private var map:FlxTilemap;
		// Array holding doors entry and exit points.
		public static var doors:Array = new Array(33, 6, 13, 24);
		// Variable holding text for talking.
		public var dialog:Array = new Array();
		//
		public var dialogLine:int = 0;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		public static const WIDTH_DEFAULT:Number = 16;
		public static const HEIGHT_DEFAULT:Number = 16;
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
		 * @param X the B2Character position of X.
		 * @param Y the B2Character position of Y.
		 * @param SimpleGraphic the B2Character image texture.
		 * @param Map the FlxTileMap reference
		 */		
		public function FlxCharacter(X:Number, Y:Number, SimpleGraphic:Class,Map:FlxTilemap)
		{
			super(X, Y, SimpleGraphic);
			//Set position
			this.x = X * 16;
			this.y = Y * 16;
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
			//
			this.map = Map;
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
				if (checkWall(dir) && checkNPC(dir))
				{
				// Setting variables.
				move_dir = dir;
				moving = true;
				move_dis = WIDTH_DEFAULT;
				
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
			
			if (checkDoor(dir))
			{
				for (var i:int = 0; i < doors.length; i += 4)
				{
					if (getNextTile(dir).x / 16 == doors[i] &&
						getNextTile(dir).y / 16 == doors[i + 1])
					{
						x = doors[i + 2] * 16;
						y = doors[i + 3] * 16;
					}
					else if (getNextTile(dir).x / 16 == doors[i + 2] &&
						getNextTile(dir).y / 16 == doors[i + 3])
					{
						x = doors[i] * 16;
						y = doors[i + 1] * 16;
					}
				}
			}
			else
			{
				look(dir);
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
	
	// Returns false if there is an NPC
	public function checkNPC(dir:String):Boolean
	{
		for (var i:int = 0; i < PlayState.characterList.length; i++)
		{
			if (getNextTile(dir).x == PlayState.characterList[i].x &&
				getNextTile(dir).y == PlayState.characterList[i].y)
				return false;
		}
		
		return true;
	}
	
	// Returns npc in front of char.
	public function getCheckNPC(dir:String):FlxCharacter
	{
		for (var i:int = 0; i < PlayState.characterList.length; i++)
		{
			if (getNextTile(dir).x == PlayState.characterList[i].x &&
				getNextTile(dir).y == PlayState.characterList[i].y)
				return PlayState.characterList[i];
		}
		
		return null;
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
	// Function returns false if there is a wall.
	private function checkWall(dir:String):Boolean
	{
		// To 'close' the interior, black needs to be wall too, index 0.
		if (map.getTile(getNextTile(dir).x / 16, getNextTile(dir).y / 16) > 6 ||
			map.getTile(getNextTile(dir).x / 16, getNextTile(dir).y / 16) == 3 ||
			map.getTile(getNextTile(dir).x / 16, getNextTile(dir).y / 16) == 0)
			return false;
		
		return true;
	}
	//
	private function getNextTile(dir:String):Point
	{
		// Setting up the point.
		var next:Point = new Point();
		next.x = x;
		next.y = y;
		
		// Getting position of next step.
		switch(dir)
		{
			case "UP":
				next.y -= 16;
				break;
			case "DOWN":
				next.y += 16;
				break;
			case "LEFT":
				next.x -= 16;
				break;
			case "RIGHT":
				next.x += 16;
				break;
		}
		return next;
	}
	
	// Function returns true if there is a door.
	private function checkDoor(dir:String):Boolean
	{
		if (map.getTile(getNextTile(dir).x / 16, getNextTile(dir).y / 16) == 6 ||
			map.getTile(getNextTile(dir).x / 16, getNextTile(dir).y / 16) == 5)
			return true;
		
		return false;
	}
}

}