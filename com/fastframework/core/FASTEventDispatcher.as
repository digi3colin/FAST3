package com.fastframework.core {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author colin
	 */
	public class FASTEventDispatcher extends EventDispatcher implements IFASTEventDispatcher {
//		private var dict:Dictionary = new Dictionary();
		public function when(eventType : String, callback : Function) : * {
			this.addEventListener(eventType, callback,false,0,true);
			return this;
		}

		public function once(eventType:String, callback:Function):*{
//522
			var f:Function= function(e:Event):void{
				callback(e);
				removeEventListener(eventType, f);
			};
			this.addEventListener(eventType, f);

/*			if(dict[eventType]==null){
				dict[eventType] = [];
				addEventListener(eventType, runonce,false,0,true);
			}

			(dict[eventType] as Array).push(callback);*/
			return this;
		}

/*
		private function runonce(e:Event):void{
			var callbacks:Array = dict[e.type];
			for(var i:int=0;i<callbacks.length;i++){
//				callbacks[i](e);
			}

			callbacks.splice(0, callbacks.length);
		}*/
	}
}
