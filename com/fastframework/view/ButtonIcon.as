﻿package com.fastframework.view {
	import com.fastframework.motion.MotionTween;

	import flash.display.DisplayObject;
	import flash.events.Event;

	/**
 * @author colin
 */
	final public class ButtonIcon implements IButtonElement{
		private var motion : MotionTween;
		private var overHProp : Object;		private var overProp : Object;		private var normalHProp : Object;		private var normalProp : Object;
			public function ButtonIcon(base:DisplayObject,button:IButtonClip=null,overHProp:Object=null,overProp:Object=null,normalHProp:Object=null,normalProp:Object=null){			this.overHProp   = overHProp==null  ?{}:overHProp;
			this.overProp    = overProp==null   ?{}:overProp;
			this.normalHProp = normalHProp==null?{}:normalHProp;
			this.normalProp  = normalProp==null ?{}:normalProp;
						motion = new MotionTween(base);
			if(button!=null)button.addElement(this);
		}
	
		public function buttonOver(e : Event) : void {
			motion.startTween(IButtonClip(e.target).getSelect()?overHProp:overProp);
		}
		
		public function buttonOut(e : Event) : void {
			motion.startTween(IButtonClip(e.target).getSelect()?normalHProp:normalProp);
		}
		
		public function buttonDown(e : Event) : void {
		}
		
		public function buttonReset(e : Event) : void {
			buttonOut(e);
		}
	}
}