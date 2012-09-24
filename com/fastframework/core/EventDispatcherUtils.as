package com.fastframework.core {
	import flash.events.Event;
	import flash.utils.Dictionary;
	/**
	 * @author colin
	 */
	internal class EventDispatcherUtils{
		private var dict:Dictionary;
		private static var ins:EventDispatcherUtils;
		public static function instance():EventDispatcherUtils {
			return ins ||new EventDispatcherUtils();
		}

		public function EventDispatcherUtils() {
			if(ins!=null){throw new SingletonError(this);}
			ins = this;
			dict = new Dictionary(true);
		}

		public function when(ins:IFASTEventDispatcher, eventType:String, callback:Function):void{
			ins.addEventListener(eventType, callback, false, 0, true);
		}

		//the dictionary may have not release. need to check;
		public function once(ins:IFASTEventDispatcher, eventType:String, callback:Function):void{
			dict[ins] = dict[ins] || {};

			if(dict[ins][eventType]==null){
				dict[ins][eventType] = [];
				ins.addEventListener(eventType, runonce,false,0,true);
			}

			(dict[ins][eventType] as Array).push(callback);
		}

		private function runonce(e:Event):void{
			IFASTEventDispatcher(e.target).removeEventListener(e.type, runonce);

			var oArray:Array = (dict[e.target][e.type] as Array);
			//make a copy of the array. 
			//to prevent unexpected result of client add event during dispatch
			var callbacks:Array = oArray.splice(0);
			var count:int = callbacks.length;

			for(var i:int=0;i<count;i++){
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