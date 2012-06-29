package com.fastframework.core {
	import flash.events.Event;
	import flash.utils.Dictionary;
	/**
	 * @author colin
	 */
	final public class EventDispatcherUtils{
		private var dict:Dictionary;
		private static var ins:EventDispatcherUtils;
		public static function instance():EventDispatcherUtils {
			return ins ||new EventDispatcherUtils();
		}

		public function EventDispatcherUtils() {
			if(ins!=null)return;
			ins = this;
			dict = new Dictionary(true);
		}

		public function when(ins:IFASTEventDispatcher, eventType:String, callback:Function):void{
			ins.addEventListener(eventType, callback, false, 0, true);
		}

		//the dictionary may have not release. need to check;
		public function once(ins:IFASTEventDispatcher, eventType:String, callback:Function):void{
			dict[ins] ||= {};

			if(dict[ins][eventType]==null){
				dict[ins][eventType] = [];
				ins.addEventListener(eventType, runonce,false,0,true);
			}

			(dict[ins][eventType] as Array).push(callback);

//			ins.addEventListener(eventType,onceHandler(callback));
		}

		private function runonce(e:Event):void{
			var oArray:Array = (dict[e.target][e.type] as Array);
			var callbacks:Array = oArray.splice(0, oArray.length);

			for(var i:int=0;i<callbacks.length;i++){
				callbacks[i](e);
			}
		}

/*		private function onceHandler(callback:Function):Function{
	        return function (event:Event):void
	        {
	            var eventDispatcher:IFASTEventDispatcher = IFASTEventDispatcher(event.target);
	            eventDispatcher.removeEventListener(event.type, arguments['callee']);
	            callback(event);
	        };
		}*/
	}
}