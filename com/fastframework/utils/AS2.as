package com.fastframework.utils{
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import com.fastframework.core.SingletonError;
	import flash.display.DisplayObjectContainer;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;


	/**
	 * @author colin
 */
	final public class AS2 {
		private static var ins:AS2;
		public static function instance():AS2 {
			return ins || new AS2();
		}

		private var _roots:Array;

		public function AS2() {
			if(ins!=null){throw new SingletonError(this);}
			ins = this;
			_roots = [];
		}
		
		public function setRoot(sprite:DisplayObjectContainer,url:String="default"):void{
			_roots[url] = sprite;
		}
		
		public function getRoot(url:String="default"):DisplayObjectContainer{
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