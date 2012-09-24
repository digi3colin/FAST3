package com.fastframework.core{
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;


	/**
	 * @author colin
 */
	final public class AS2 {
		public static const DEFAULT:String = "DEFAULT";
		private static var ins:AS2;
		public static var root:Stage;

		public static function instance():AS2 {
			return ins || new AS2();
		}

		private var _roots:Array;

		public function AS2() {
			if(ins!=null){throw new SingletonError(this);}
			ins = this;
			_roots = [];
		}

		public function setRoot(view:DisplayObjectContainer,url:String=AS2.DEFAULT):void{
			_roots[url] = view;
			if(url==AS2.DEFAULT && view is Stage){
				AS2.root = Stage(view);
			}
		}

		public function getRoot(url:String=AS2.DEFAULT):DisplayObjectContainer{
			return _roots[url];
		}

		public function getURL(url:String,window:String=null,postData:URLVariables=null):void{
			var req:URLRequest = new URLRequest(url);
			if(postData!=null){
				req.method = URLRequestMethod.POST;
				req.data = postData;
			}

			navigateToURL(req,window);
		}
	}
}