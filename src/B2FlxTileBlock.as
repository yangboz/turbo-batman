
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import org.flixel.FlxTileblock;
	
	
	/**
	 * B2FlxTileBlock.as class. To create a floor, we will simply create a FlxTileblock with a Box2d body attached to it.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 26, 2014 10:36:25 AM
	 * @history 12/30/13,
	 */ 
	public class B2FlxTileBlock extends FlxTileblock
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		//Since Box2D is using meters instead of pixels, we need to define a ratio of meters to pixels. That's what the ratio var is for.
		private var ratio:Number = 30;
		public var _fixDef:b2FixtureDef;
		public var _bodyDef:b2BodyDef;
		public var _obj:b2Body;
		//Reference
		private var _world:b2World;
		//Physics params default values.
		public var _friction:Number = 0.8;
		public var _restitution:Number = 0.3;
		public var _density:Number = 0.7;
		//Default angle
		public var _angle:Number = 0;
		//Default body type
		public var _type:uint = b2Body.b2_staticBody;
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
		public function B2FlxTileBlock(X:int, Y:int, Width:uint, Height:uint,world:b2World)
		{
			super(X, Y, Width, Height);
			//
			this._world = world;
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function createBody():void
		{
			var boxShape:b2PolygonShape = new b2PolygonShape();
			boxShape.SetAsBox(this.width/2/this.ratio,this.height/2/this.ratio);
			//
			this._fixDef = new b2FixtureDef();
			this._fixDef.density = this._density;
			this._fixDef.restitution = this._restitution;
			this._fixDef.friction = this._friction;
			this._fixDef.shape = boxShape;
			//
			this._bodyDef = new b2BodyDef();
			this._bodyDef.position.Set((x+this.width/2)/this.ratio,(y+this.height/2)/this.ratio);
			this._bodyDef.angle = this._angle * (Math.PI/180);
			this._bodyDef.type = this._type;
			//
			this._obj = this._world.CreateBody(this._bodyDef);
			this._obj.CreateFixture(this._fixDef);
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