package com.fastframework.core {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author colin
	 */
	public class FASTEventDispatcher extends EventDispatcher implements IFASTEventDispatcher {
		private var onceCallbacks:Object = {};

		public function when(eventType : String, callback : Function) : * {
			this.addEventListener(eventType, callback,false,0,true);
			return this;
		}

		public function once(eventType:String, callback:Function):*{
			if(onceCallbacks[eventType]==null){
				onceCallbacks[eventType] = [];//this array<function> cannot release until gc;
				addEventListener(eventType, runonce,false,0,true);
			}

			(onceCallbacks[eventType] as Array).push(callback);

			return this;
		}

		private function runonce(e:Event):void{
			removeEventListener(e.type, runonce);
			//the callback may call once() again
			//then the dict[e.type] will increase;
			//prevent this by clone the array;
			var oArray:Array = onceCallbacks[e.type];
			var callbacks:Array = oArray.splice(0);
			var count:int = callbacks.length;
			for(var i:int=0;i<count;i++){
				callbacks[i](e);
			}
		}
	}
}
