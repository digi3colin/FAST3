package com.fastframework.core {
	import flash.display.Sprite;

	import com.fastframework.core.IFASTEventDispatcher;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class FASTSpriteEventDispatcher extends Sprite implements IFASTEventDispatcher {
		public function FASTSpriteEventDispatcher() {
		}

		public function when(eventType : String, callback : Function) : * {
			this.addEventListener(eventType, callback, false,0,true);
			return this;
		}

		public function once(eventType : String, callback : Function) : * {
			EventDispatcherUtils.instance().once(this, eventType, callback);
			return this;
		}
	}
}
