package com.fastframework.log{
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public interface ILog {
		function log(str:String,debugLevel:int=0):void;
		function setLogger(logger:ILog):void;
	}
}
