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
//			EventDispatcherUtils.instance().once(this,eventType,callback);

			if(onceCallbacks[eventType]==null){
				onceCallbacks[eventType] = [];//this array<function> cannot release until gc;
				addEventListener(eventType, runonce,false,0,true);
			}

			(onceCallbacks[eventType] as Array).push(callback);

//			imp1(eventType,callback);//379, 2 obj, 1 function, footprint require gc
//			imp2(eventType,callback);//383, 2 array, footprint remove instant*/
			return this;
		}

		private function runonce(e:Event):void{
			removeEventListener(e.type, runonce);
			//the callback may call once() again
			//then the dict[e.type] will increase;
			//prevent this by clone the array;
			var callbacks:Array = onceCallbacks[e.type];

			for(var i:int=0;i<callbacks.length;i++){
				callbacks[i](e);
			}
			onceCallbacks[e.type] = null;
		}

/*		private function imp1(eventType:String,callback:Function):void{
			var f:Function= function(e:Event):void{
				callback(e);
				removeEventListener(eventType, f);
			};
			this.addEventListener(eventType, f);
		}*/

/*		private function imp2(eventType:String,callback:Function):void{
			if(dict[eventType]==null){
				dict[eventType] = [];
				addEventListener(eventType, runonce,false,0,true);
			}

			(dict[eventType] as Array).push(callback);
		}*/
	}
}
