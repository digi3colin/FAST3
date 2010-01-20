﻿package com.fastframework.utils {
	import flash.geom.ColorTransform;	
	
	/**
	 * @author colin
	 */
	final public class CSSColor {
		private var _color : uint = 0;
		private var _alpha : Number = 1;

		public const aqua : String = "#00FFFF";
		public const black : String = "#000000";
		public const blue : String = "#0000FF";
		public const fuchsia : String = "#FF00FF";
		public const gray : String = "#808080";
		public const green : String = "#008000";
		public const lime : String = "#00FF00";
		public const maroon : String = "#800000";
		public const navy : String = "#000080";
		public const olive : String = "#808000";
		public const purple : String = "#800080";
		public const red : String = "#FF0000";
		public const silver : String = "#C0C0C0";
		public const teal : String = "#008080";
		public const white : String = "#FFFFFF";
		public const yellow : String = "#FFFF00";

		public function CSSColor(str : String) {
			//rgb(255,221,0), rgba(255,255,255,1), #FFFFFF
			
			if(str.indexOf('#') != -1) {
				_color = parseInt("0x" + str.substr(1, 6));
				_alpha = 1;
			}else if(str.indexOf('rgb(') != -1) {
				_color = decStrToHexColor(str.substring(4, str.length - 1).split(","));
				_alpha = 1;
			}else if(str.indexOf('rgba(') != -1) {
				var components : Array = str.substring(5, str.length - 1).split(",");
				_color = decStrToHexColor(components);
				_alpha = components[3];
			}else {
				str = str.toLowerCase();
				try {
					_color = parseInt("0x" + String(this[str]).substr(1, 6));
					_alpha = 1;
				}catch(e : Error) {
					_color = 0x000000;
					_alpha = 1;
				}
			}
		}

		private function decStrToHexColor(components : Array) : Number {
			//255,255,0
			var cr : Number = Number(components[0]) << 16;
			var cg : Number = Number(components[1]) << 8;
			var cb : Number = Number(components[2]);
			return cr + cg + cb;
		}

		public function get color() : uint {
			return _color;
		}

		public function get alpha() : Number {
			return _alpha;
		}

		public function get rgba() : Number {
			return _color << 8 + Math.round(_alpha * 255);
		}
		
		public function get colorTransform():ColorTransform{
			var result:ColorTransform = new ColorTransform();
			result.color        = _color;
			result.redMultiplier  = 1;
			result.greenMultiplier= 1;
			result.blueMultiplier = 1;
			return result;
		}

		public static function toColorTransform(colorNum:Number,alphaNum:Number=1):ColorTransform{
			if(alphaNum>1)alphaNum/=100;
			
			var result:ColorTransform = new ColorTransform();
			result.alphaMultiplier= alphaNum;
			if(colorNum == -1)return result;

			result.color          = colorNum;
			result.redMultiplier  = 0;
			result.greenMultiplier= 0;
			result.blueMultiplier = 0;
			return result;
		}
	}
}
