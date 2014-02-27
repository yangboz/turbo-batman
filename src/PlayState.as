
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	
	import assets.EmbedAssets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	
	/**
	 * PlayState.as class. The first thing Box2D needs to work is a world (the b2World class). Let's start by creating a world global variable:
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 25, 2014 7:55:10 PM
	 * @history 12/30/13,
	 */ 
	public class PlayState extends FlxState
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		public var _world:b2World;
		//variables,Box2D based
		private var floor_b2:B2FlxTileBlock;
		private var charactor_b2:B2FlxSprite;
		private var tool_ball_b2:B2FlxSprite;
		//Flx based.
		private var charactor:FlxCharacter;
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
		public function PlayState()
		{
			super();
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Customize creating Box2D body and worlds.
		 */		
		override public function create():void
		{
			this.add(new FlxText(0,0,100,"Hello,World!"));//adds a 100px wide text field at position 0,0 (top left)
			//Set up the Box2d world
			setupBox2dWorld();
			//Add Box2d floor
			this.floor_b2 = new B2FlxTileBlock(0,300,202,131,this._world);
			this.floor_b2.createBody();
			this.floor_b2.loadGraphic(EmbedAssets.FLOOR_BLOCK_GRASS);
			this.add(floor_b2);
			//Add FlxSprite-Character
//			this.charactor_b2 = new B2FlxSprite(20,0,67, 87, _world);
//			this.charactor_b2.angle = 30;
//			this.charactor_b2.createBody();
//			this.charactor_b2.loadGraphic(EmbedAssets.CHARACTER_BOY, false, false);
//			this.add(charactor_b2);
			this.charactor = new FlxCharacter(5,5,EmbedAssets.CHARACTER);
			this.add(this.charactor);
			//Another FlxSprite-Tools
			this.tool_ball_b2 = new B2FlxSprite(100, 10, 97, 98, _world);
			this.tool_ball_b2.angle = 30;
			this.tool_ball_b2.createBody();
			this.tool_ball_b2.loadGraphic(EmbedAssets.TOOLS_ROCK, false, false);
			this.add(tool_ball_b2);
			//
		}
		/**
		 * Tell Box2D to update the world when Flixel runs its update.
		 */		
		override public function update():void
		{
			this._world.Step(FlxG.elapsed,10,10);
			super.update();
			//Update the charactor
//			this.charactor.x += Main.gamepad.x * 50;
//			this.charactor.y += Main.gamepad.y * 50;
			// If down arrow key is pressed.
			if (Main.gamepad.down.isDown)
			{
				this.charactor.move("DOWN");
			}
			// Else if up arrow key is pressed.
			else if (Main.gamepad.up.isDown)
			{
				this.charactor.move("UP");
			}
			// Else if left arrow key is pressed.
			else if (Main.gamepad.left.isDown)
			{
				this.charactor.move("LEFT");
			}
			// Else if right arrow key is pressed.
			else if (Main.gamepad.right.isDown)
			{
				this.charactor.move("RIGHT");
			}
			//Camera follow
			FlxG.camera.follow(this.charactor);
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
		private function setupBox2dWorld():void
		{
			var gravity:b2Vec2 = new b2Vec2(0,9.8);
			this._world = new b2World(gravity,true);
		}
	}
	
}