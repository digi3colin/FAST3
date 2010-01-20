package {
	import com.fastframework.event.EventDispatcherUtils;

	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;

	/**
	 * @author colin
	 */
	final public class JS extends EventDispatcher implements IFASTEventDispatcher{
		private static var ins:JS;
		public static function instance():JS {
			ins ||=new JS(new SingletonBlocker());
			return ins;
		}

		public function JS(p_key:SingletonBlocker) {
			ExternalInterface.addCallback("sendToActionScript", jscall);
			p_key;
		}

		public function call(functionName:String,...args:*):*{
			if(args['length']==0)return ExternalInterface.call(functionName);
			return ExternalInterface.call(functionName+"("+args+")");
		}
		
		private function jscall(str:String):void{
			dispatchEvent(new JSEvent(JSEvent.CALLBACK,str));
		}
		
		public function when(eventType : String, whichObject : Object, callFunction : Function) : * {
			EventDispatcherUtils.when(this, eventType, whichObject, callFunction);
			return this;
		}
	}
}

internal class SingletonBlocker {}