
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import assets.EmbedAssets;
	import assets.SkBatEmbedAssets;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	
	
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
		//texts
		private var _scoreText:FlxText;
		private var _gameOverText:FlxText;
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
			// In overlapAlienShip()
			FlxG.play(SkBatEmbedAssets.SFX_BACKGROUND,0.5,true);
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
			FlxG.score = 0;
			_scoreText = new FlxText(10, 8, 200, "0");
			_scoreText.setFormat(null, 32, 0xFF597137, "left");
			add(_scoreText);
			//
			super.create();
		}
		//
		override public function update():void
		{
			//Collision detection
			FlxG.overlap(this._aliens,this._bullets,overlapAlienBulletHandler);
			FlxG.overlap(this._aliens,this._ship,overlapAlienShipHandler);
			//
			if(SkyBattle.gamepad.fire2.isDown && this._ship.alive )
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
			//Restart
			if(FlxG.keys.ENTER && !this._ship.alive )
			{
				FlxG.switchState( new SkBatPlayState() );
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
			// In spawnBullet()
			FlxG.play(SkBatEmbedAssets.SFX_BULLET);
		}
		//Collision detection callback functions.
		//
		private function overlapAlienBulletHandler(alien:SkBatAlien, bullet:SkBatBullet):void
		{
			alien.kill();
			bullet.kill();
			FlxG.score += 1;
			_scoreText.text = FlxG.score.toString();
			// In overlapAlienBulletHandler()
			var emitter:FlxEmitter = createEmitter();
			emitter.at(alien);
			// In overlapAlienBullet()
			FlxG.play(SkBatEmbedAssets.SFX_EXPLOSION_ALIEN);
		}
		//
		private function overlapAlienShipHandler(alien:SkBatAlien, ship:SkBatShip):void
		{
			ship.kill();
			alien.kill();
//			FlxG.quake.start(0.02);
			
			_gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width,
				"GAME OVER\nPRESS ENTER TO PLAY AGAIN");
			_gameOverText.setFormat(null, 16, 0xFF597137, "center");
			add(_gameOverText);
			// In overlapAlienShipHandler()
			var emitter:FlxEmitter = createEmitter();
			emitter.at(ship);
			// In overlapAlienShip()
			FlxG.play(SkBatEmbedAssets.SFX_EXPLOSION_SHIP);
		}
		//Explosions
		private function createEmitter():FlxEmitter
		{
			var emitter:FlxEmitter = new FlxEmitter();
//			emitter.delay = 1;
			emitter.gravity = 0;
			emitter.minRotation = 0;
			emitter.setXSpeed(-500,500);
			emitter.setYSpeed(-500,500);
			var particles:int = 10;
			for(var i:int=0;i<particles;i++)
			{
				var particle:FlxSprite = new FlxSprite();
				particle.makeGraphic(2, 2, 0xFF597137);
				particle.exists = false;
				emitter.add(particle);
			}
			emitter.start();
			this.add(emitter);
			return emitter;
		}
	}
	
}