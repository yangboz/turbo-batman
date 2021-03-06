
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	
	/**
	 * CreditState.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 27, 2014 4:27:31 PM
	 * @history 12/30/13,
	 */ 
	public class CreditState extends FlxState
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var text:FlxText;
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
		public function CreditState()
		{
			super();
			//
			text = new FlxText((FlxG.width-24)/2, 24, FlxG.width,
				"丢傻包 \n \n" +
				"程序: 科比 \n" +
				"图片素材: kcnh (www.kcnhgames.com) \n" +
				"剧情脚本: 杨总 \n" +
				"友情出演: 单车队 灰太郎球队 \n" +
				"赞助商: 颜氏土鸡蛋 \n" +
				"\n \n 请按 ENTER 重玩.",false);
			
			add(text);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function update():void
		{
			
			if (FlxG.keys.ENTER)//FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MenuState());
//				FlxG.state = new MenuState();
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