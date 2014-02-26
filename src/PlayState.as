
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
			var floor:B2FlxTileBlock = new B2FlxTileBlock(0,310,101,131,this._world);
			floor.createBody();
			floor.loadGraphic(EmbedAssets.FLOOR_BLOCK_GRASS);
			this.add(floor);
			//Add FlxSprite-Character
			var cube:B2FlxSprite = new B2FlxSprite(20,0,67, 87, _world);
			cube.angle = 30;
			cube.createBody();
			cube.loadGraphic(EmbedAssets.CHARACTER_BOY, false, false);
			this.add(cube);
			//Another FlxSprite-Tools
			var circle:B2FlxSprite = new B2FlxSprite(100, 10, 97, 98, _world);
			circle.angle = 30;
			circle.createBody();
			circle.loadGraphic(EmbedAssets.TOOLS_ROCK, false, false);
			this.add(circle);
		}
		/**
		 * Tell Box2D to update the world when Flixel runs its update.
		 */		
		override public function update():void
		{
			this._world.Step(FlxG.elapsed,10,10);
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
		private function setupBox2dWorld():void
		{
			var gravity:b2Vec2 = new b2Vec2(0,9.8);
			this._world = new b2World(gravity,true);
		}
	}
	
}