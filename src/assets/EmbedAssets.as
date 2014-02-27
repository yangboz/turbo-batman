
package assets
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * EmbedAssets.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 26, 2014 11:59:25 AM
	 * @history 12/30/13,
	 */ 
	public class EmbedAssets
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		//Floor
		[Embed(source="/images/Grass Block.png")]
		public static var FLOOR_BLOCK_GRASS:Class;
		//Chacter
		[Embed(source="/images/Character.png")]
		public static var CHARACTER:Class;
		//
		[Embed(source="/images/Character_NPC.png")]
		public static var CHARACTER_NPC:Class;
		//
		[Embed(source="/images/Character Boy.png")]
		public static var CHARACTER_BOY:Class;
		//Tools
		[Embed(source="/images/Rock.png")]
		public static var TOOLS_ROCK:Class;
		//Map-FlxTileMap
		// Loading the map.
		[Embed(source = "/data/Map_world.txt", mimeType = "application/octet-stream")] 
		public static var MAP_TXT:Class;
		// Loading the map spritesheet.
		[Embed(source = "/images/World.png")] 
		public static var MAP_WORLD:Class;
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