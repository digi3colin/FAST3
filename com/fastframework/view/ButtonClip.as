package com.fastframework.view {
	import flash.utils.Dictionary;
	import com.fastframework.core.FASTEventDispatcher;
	import com.fastframework.core.utils.MovieClipTools;
	import com.fastframework.view.events.ButtonClipEvent;

	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	/**
	 * @author Colin
 */
	final public class ButtonClip extends FASTEventDispatcher implements IButtonClip{
		private var base:ButtonEvt;
		private var count:int;
		private var _enabled : Boolean = true;
		private var baseIsDown:Boolean = false;
		private var view:DisplayObjectContainer;

        public var repeatPerFrame:int = 0;

		public function ButtonClip(view:DisplayObjectContainer) {
			this.view = view;

		    base = new ButtonEvt(MovieClipTools.findButton(view));
		    base.when(ButtonClipEvent.MOUSE_DOWN,	down);
		    base.when(ButtonClipEvent.MOUSE_UP,		up);
		    view.addEventListener(Event.ENTER_FRAME,loop);

			//fix the event in target
			base.when(ButtonClipEvent.MOUSE_OVER,	forwardEvent);
			base.when(ButtonClipEvent.MOUSE_OUT, 	forwardEvent);
			base.when(ButtonClipEvent.ROLL_OVER, 	forwardEvent);
			base.when(ButtonClipEvent.ROLL_OUT, 	forwardEvent);
			base.when(ButtonClipEvent.MOUSE_DOWN, 	forwardEvent);
			base.when(ButtonClipEvent.MOUSE_UP, 	forwardEvent);
			base.when(ButtonClipEvent.RESET, 		forwardEvent);
			base.when(ButtonClipEvent.CLICK, 		forwardEvent);
			base.when(ButtonClipEvent.SELECT, 		forwardEvent);
		}

		private function forwardEvent(e:Event):void{
			//flash will change the ButtonClipEvent to MouseEvent.. :(
			this.dispatchEvent(e);
//			this.dispatchEvent(new ButtonClipEvent(e.type,e.highlight,e.mouseX,e.mouseY,e.bubbles,e.cancelable));
		}

		public function addElement(element : IButtonElement) : IButtonClip {
	        base.addElement(element);
	        return this;
		}
		
		
		public function select(bln:Boolean=true) : IButtonClip {
	        base.select(bln);
	        return this;
		}
		
		public function setMouseOverDelay(miniSecond : int) : IButtonClip {
	        base.setMouseOverDelay(miniSecond);
	        return this;
		}
		
		public function setMouseOutDelay(miniSecond : int) : IButtonClip {
	        base.setMouseOutDelay(miniSecond);
	        return this;
		}
		
		public function clearMouseOver() : IButtonClip {
	        base.clearMouseOver();
	        return this;
		}

		public function clearMouseOut() : IButtonClip {
	        base.clearMouseOut();
	        return this;
		}

		public function setEnabled(value:Boolean):void{
			view.visible = value;
			_enabled = value;
		}
		
		public function getEnabled():Boolean{
	        return _enabled;
		}

		private function loop(e:Event):void{
			if(baseIsDown == false)return;
			if(repeatPerFrame<=0)return;
			if(count==0){
				//trace('up');
				if(_enabled==true){
					count = repeatPerFrame;
					//trace('down');
				}
			}
			count--;
		}
		
		private function down(e:Event):void{
		    baseIsDown = true;
		    count=repeatPerFrame;
		}
		
		private function up(e:Event):void{
		    baseIsDown = false;
		}

		public function focus(bln : Boolean = true) : IButtonClip {
			base.focus(bln);
			return this;
		}

		public function getSelect() : Boolean {
			return base.getSelect();
		}

		public function getFocus() : Boolean {
			return base.getFocus();
		}

		public function getElements() : Dictionary {
			return base.getElements();
		}
	}
}