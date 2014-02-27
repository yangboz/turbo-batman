
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
	import org.flixel.FlxGroup;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	
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
		private var map_world:FlxTilemap;
		// Test character variable.
		public static var characterList:Array = new Array();
		private var dialogBG:FlxSprite;
		private var charactor_NPC:FlxCharacter;
		private var dialogIndex:uint = 0;
		public var freeze:Boolean = false;
		// Create a variable 'text' of class FlxText.
		private var text:FlxText;
		// FlxGroup 
		private var GUI:FlxGroup = new FlxGroup();
		private var foreground:FlxGroup = new FlxGroup();
		private var background:FlxGroup = new FlxGroup();
		private var Inv:FlxGroup = new FlxGroup();
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
			//FlxTileMap at first.
			this.map_world = new FlxTilemap();
			var map_txt:String = new EmbedAssets.MAP_TXT(); 
			this.map_world.loadMap(map_txt,EmbedAssets.MAP_WORLD,16,16);
//			this.add(this.map_world);
			//
			this.background.add(this.map_world);
			//Text
//			this.add(new FlxText(0,0,100,"Hello,World!"));//adds a 100px wide text field at position 0,0 (top left)
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
			//
			// Dialog background.
			dialogBG = new FlxSprite(0, 0);
			dialogBG.makeGraphic(FlxG.width, 42, 0xff333333);
			dialogBG.alpha = 0.75;
			dialogBG.scrollFactor.x = 0;
			dialogBG.scrollFactor.y = 0;
//			dialogBG.visible = false;
//			add(dialogBG);
			//
			GUI.add(dialogBG);
			// Instantiate 'text' with an x and y of 10, width of 100,
			// and the classic text of 'Hello World'.
			text = new FlxText(5, 5, FlxG.width - 10, "Hello World!");
			text.scrollFactor.x = 0;
			text.scrollFactor.y = 0;
//			text.visible = false;
			
			// Add the created variable to the gameloop,
			// so the Flixel engine will update it.
//			this.add(text);
			GUI.add(text);
			// Creating the character.
			this.charactor = new FlxCharacter(5,5,EmbedAssets.CHARACTER,this.map_world);
//			this.add(this.charactor);
			foreground.add(this.charactor);
			// NPC character
			this.charactor_NPC = new FlxCharacter(10, 5, EmbedAssets.CHARACTER_NPC, this.map_world);
			this.charactor_NPC.dialog = ["Richard: Hey how are you today!",
				"You: I'm ok, thank you.",
				"Richard: Do you want some candy?",
				"You: No."];
//			this.add(this.charactor_NPC);
			foreground.add(this.charactor_NPC);
			//Adding the FlxGroups
			GUI.visible = false;
			this.add(background);
			this.add(foreground);
			this.add(GUI);
			this.add(Inv);
			//
			characterList.push(this.charactor);
			characterList.push(this.charactor_NPC);
			//Another FlxSprite-Tools
			this.tool_ball_b2 = new B2FlxSprite(100, 10, 97, 98, _world);
			this.tool_ball_b2.angle = 30;
			this.tool_ball_b2.createBody();
			this.tool_ball_b2.loadGraphic(EmbedAssets.TOOLS_ROCK, false, false);
			this.add(tool_ball_b2);
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
			//Camera follow
			FlxG.camera.bounds = new FlxRect(0,0,9999,9999);
			FlxG.camera.follow(this.charactor);
			//
			if (!freeze)
			{
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
					// Else if space is pressed
				else if (Main.gamepad.fire2.isReleased)//FlxG.keys.justPressed("SPACE")
				{
					// If player is not moving and there is an npc in front
					if (!this.charactor.checkNPC(this.charactor.move_dir)) 
					{
						// Tempdir is inverse direction of player.
						var tempDir:String = "";
						switch(this.charactor.move_dir)
						{
							case "UP":
								tempDir = "DOWN";
								break;
							case "DOWN":
								tempDir = "UP";
								break;
							case "LEFT":
								tempDir = "RIGHT";
								break;
							case "RIGHT":
								tempDir = "LEFT";
								break;
						}
						this.charactor_NPC = this.charactor.getCheckNPC(this.charactor.move_dir);
						// Make npc look towards player
						this.charactor_NPC.move_dir = tempDir;
						// Change text to dialogtext.
						dialogIndex = 0;
						text.text = this.charactor_NPC.dialog[dialogIndex];
						
						// Freeze world
						freeze = true;
						
						// Show text & dialog
//						text.visible = true;
//						dialogBG.visible = true;
						GUI.visible = true;
					}
				}
			}
			else
			{
				if (Main.gamepad.fire2.isReleased)//FlxG.keys.justPressed("SPACE")
				{
					// increase dialog index
					dialogIndex++;
					// If last line, unfreeze
					if (dialogIndex >= this.charactor_NPC.dialog.length)
					{
						// Unfreeze
						freeze = false;
						
						// hide text & dialog
//						text.visible = false;
//						dialogBG.visible = false;
						GUI.visible = false;
					}
						// Else display next line
					else
						text.text = this.charactor_NPC.dialog[dialogIndex];
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
		private function setupBox2dWorld():void
		{
			var gravity:b2Vec2 = new b2Vec2(0,9.8);
			this._world = new b2World(gravity,true);
		}
	}
	
}