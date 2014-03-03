
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	
	
	/**
	 * SkBatPlayState.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 3, 2014 10:05:16 AM
	 * @history 12/30/13,
	 */ 
	public class SkBatPlayState extends FlxState
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		//Kind of character.
		private var _ship:SkBatShip;
		private var _aliens:FlxGroup;
		private var _bullets:FlxGroup;
		private var _spawnTimer:Number;
		private var _spawnInterval:Number = 2.5;
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
		public function SkBatPlayState()
		{
			super();
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function create():void
		{
			//
			this._ship = new SkBatShip();
			this.add(this._ship);
			//
			this._aliens = new FlxGroup();
			this.add(this._aliens);
			//
			this._bullets = new FlxGroup();
			this.add(this._bullets);
			//
			this.resetSpawnTimer();
			//
			super.create();
		}
		//
		override public function update():void
		{
			//
			if(SkyBattle.gamepad.fire2.isDown )
			{
				this.spawnBullets(this._ship.getBulletSpawnPosition())
			}
			//
			this._spawnTimer -= FlxG.elapsed;
			if(this._spawnTimer < 0)
			{
				this.spawnAlien();
				this.resetSpawnTimer();
			}
			//
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
		private function resetSpawnTimer():void
		{
			this._spawnTimer = this._spawnInterval;
			this._spawnInterval *= 0.95;
			if(this._spawnInterval<0.1)
			{
				this._spawnInterval = 0.1;
			}
		}
		//
		private function spawnAlien():void
		{
			var x:Number = FlxG.width;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			this._aliens.add(new SkBatAlien(x,y));
		}
		//
		private function spawnBullets(point:FlxPoint):void
		{
			var x:Number = FlxG.width;
			var y:Number = FlxG.height;
			this._bullets.add(new SkBatBullet(point.x,point.y));
		}
	}
	
}