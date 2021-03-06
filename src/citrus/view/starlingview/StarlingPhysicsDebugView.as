package citrus.view.starlingview {

	import citrus.core.CitrusEngine;
	import citrus.physics.APhysicsEngine;
	import citrus.physics.IDebugView;
	import flash.display.Sprite;
	import starling.core.Starling;
	import starling.display.Sprite;


	
	/**
	 * A wrapper for Starling to display the debug view of the different physics engine.
	 */
	public class StarlingPhysicsDebugView extends starling.display.Sprite {
		
		private var _physicsEngine:APhysicsEngine;
		private var _debugView:IDebugView;
		
		public function StarlingPhysicsDebugView() {
			
			_physicsEngine = CitrusEngine.getInstance().state.getFirstObjectByType(APhysicsEngine) as APhysicsEngine;
			_debugView = new _physicsEngine.realDebugView();
			(_debugView as flash.display.Sprite).name = "debug view";
			Starling.current.nativeStage.addChild(_debugView as flash.display.Sprite);
		}
		
		public function update():void {
			_debugView.update();
		}
		
		public function debugMode(flags:uint):void {
			_debugView.debugMode(flags);
		}

		public function get debugView():IDebugView {
			return _debugView;
		}
		
		override public function dispose():void
		{
			Starling.current.nativeStage.removeChild(_debugView as flash.display.Sprite);
			_physicsEngine = null;
			_debugView = null;
			super.dispose();
		}
		
	}
}
