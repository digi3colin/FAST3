﻿package com.fastframework.view{
	import com.fastframework.motion.MotionTween;
	import com.fastframework.view.events.ButtonClipEvent;

	import flash.display.DisplayObject;

	/**
 * @author colin
 */
	final public class ButtonIcon implements IButtonElement{
		private var motion : MotionTween;
		private var overHProp : Object;
	
			this.overProp    = overProp==null   ?{}:overProp;
			this.normalHProp = normalHProp==null?{}:normalHProp;
			this.normalProp  = normalProp==null ?{}:normalProp;
			
			if(button!=null)button.addElement(this);
		}
	
		public function buttonOver(e : ButtonClipEvent) : void {
		}
		
		public function buttonOut(e : ButtonClipEvent) : void {
			motion.startTween(e.highlight?normalHProp:normalProp);
		}
		
		public function buttonDown(e : ButtonClipEvent) : void {
		}
		
		public function buttonReset(e : ButtonClipEvent) : void {
			buttonOut(e);
		}
	}
}