package com.fastframework.io {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public interface ISaveText {
		function save(fileName : String, value:String) : void;
		function append(fileName:String,value:String):void;
		function load(fileName : String) : String;
	}
}