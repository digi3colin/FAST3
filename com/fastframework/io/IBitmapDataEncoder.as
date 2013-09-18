package com.fastframework.io {
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	/**
	 * @author digi3colin
	 */
	public interface IBitmapDataEncoder {
		function encode(img:BitmapData, meta:Object = null):ByteArray;
		function getMetaData(png:ByteArray):Object;
	}
}
