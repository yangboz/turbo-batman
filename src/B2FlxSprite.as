
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
	
	import org.flixel.FlxSprite;
	
	
	/**
	 * B2FlxSprite.as class. Adding a FlxSprite is almost the same thing as adding a FlxTileblock.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 26, 2014 1:11:35 PM
	 * @history 12/30/13,
	 */ 
	public class B2FlxSprite extends FlxSprite
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var ratio:Number = 30;
		
		public var _fixDef:b2FixtureDef;
		public var _bodyDef:b2BodyDef
		public var _obj:b2Body;
		
		private var _world:b2World;
		
		//Physics params default value
		public var _friction:Number = 0.8;
		public var _restitution:Number = 0.3;
		public var _density:Number = 0.7;
		
		//Default angle
		public var _angle:Number = 0;
		//Default body type
		public var _type:uint = b2Body.b2_dynamicBody;
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
		public function B2FlxSprite(X:Number, Y:Number, Width:Number, Height:Number, w:b2World)
		{
			super(X,Y);
			
			width = Width;
			height = Height;
			_world = w;
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function update():void
		{
			x = (_obj.GetPosition().x * ratio) - width/2 ;
			y = (_obj.GetPosition().y * ratio) - height/2;
			angle = _obj.GetAngle() * (180 / Math.PI);
			super.update();
		}
		//
		public function createBody():void
		{            
			var boxShape:b2PolygonShape = new b2PolygonShape();
			boxShape.SetAsBox((width/2) / ratio, (height/2) /ratio);
			
			_fixDef = new b2FixtureDef();
			_fixDef.density = _density;
			_fixDef.restitution = _restitution;
			_fixDef.friction = _friction;                        
			_fixDef.shape = boxShape;
			
			_bodyDef = new b2BodyDef();
			_bodyDef.position.Set((x + (width/2)) / ratio, (y + (height/2)) / ratio);
			_bodyDef.angle = _angle * (Math.PI / 180);
			_bodyDef.type = _type;
			
			_obj = _world.CreateBody(_bodyDef);
			_obj.CreateFixture(_fixDef);
		}
		/**
		 *When you kill one of your sprites, you also want to kill the box2D body, otherwise you might see collisions with invisible objects. 
		 */		
		override public function kill():void
		{
			this._world.DestroyBody(this._obj);
			super.kill();
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