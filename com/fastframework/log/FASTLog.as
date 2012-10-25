package com.fastframework.log {
	import com.fastframework.core.SingletonError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	final public class FASTLog implements ILog{
		private static var ins:FASTLog;
		public static var LOG_LEVEL_NONE:int = -1;
		public static var LOG_LEVEL_ERROR:int = 0;
		public static var LOG_LEVEL_ACTION:int = 10;
		public static var LOG_LEVEL_WARNING : int = 20;
		public static var LOG_LEVEL_DETAIL : int = 30;
		public static var LOG_LEVEL_RESULT : int = 40;
		public static var LOG_LEVEL_ALL : int = 1000;


		public var level:int=FASTLog.LOG_LEVEL_ACTION;

		private var logger:ILog;

		public static function instance():FASTLog {
			return ins || new FASTLog();
		}

		public function FASTLog() {
			if(ins!=null){throw new SingletonError(this);}
			ins = this;
		}

		public function addGlobalError(loaderInfo:*) : void {
			try{
				loaderInfo['uncaughtErrorEvents']['addEventListener']("uncaughtError",errorLog);
				log('uncaughErrorCaptured');
			}catch(e:Error){
				
			}
		}

		private function errorLog(e:Event):void{
			if (e['error'] is Error) {
				log("ER:"+(e['error'] as Error).message);
			}else if (e['error'] is ErrorEvent){
				log("ER:"+(e['error'] as ErrorEvent).text);
			}else{
				log(e.toString());
			}
		}

		public function log(str:String,debugLevel:int=0):void{
			if(debugLevel>level)return;
			trace(str);
			if(logger==null)return;
			logger.log(str,debugLevel);
		}

		public function setLogger(logger:ILog):ILog{
			this.logger = logger;
			return this;
		}
	}
}
