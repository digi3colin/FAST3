package com.fastframework.core {
	import flash.events.Event;
	/**
	 * @author colin
	 */
	final public class EventDispatcherUtils{
		private static var ins:EventDispatcherUtils;
		public static function instance():EventDispatcherUtils {
			return ins ||new EventDispatcherUtils();

		}

		public function EventDispatcherUtils() {
			if(ins!=null)return;
			ins = this;
		}

		public function once(ins:IFASTEventDispatcher, eventType:String, callback:Function):*{
			ins.addEventListener(eventType,onceHandler(callback));
			return this;
		}

		private function onceHandler(callback:Function):Function{
	        return function (event:Event):void
	        {
	            var eventDispatcher:IFASTEventDispatcher = IFASTEventDispatcher(event.target);
	            eventDispatcher.removeEventListener(event.type, arguments['callee']);
	            callback(event);
	        };
		}
	}
}