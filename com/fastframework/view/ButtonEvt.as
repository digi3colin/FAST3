package com.fastframework.view {
	import com.fastframework.core.FASTEventDispatcher;
	import com.fastframework.core.FASTLog;
	import com.fastframework.core.utils.MovieClipTools;
	import com.fastframework.view.events.ButtonClipEvent;

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Colin
	 */
	final public class ButtonEvt extends FASTEventDispatcher implements IButtonClip{
		private var mouseX:Number;
		private var mouseY:Number;

		private var isHighlight:Boolean = false;
		private var overDelay 	:Number=0;
		private var outDelay	:Number=0;
		private var timerOver	:Timer;
		private var timerOut	:Timer;
		private var elements 	:Array;

		private var hitarea:SimpleButton;

		public function ButtonEvt(hitarea:SimpleButton){
			elements=[];
			this.hitarea = hitarea;
			hitarea.addEventListener(MouseEvent.ROLL_OVER,  over,	false,0,true);
			hitarea.addEventListener(MouseEvent.ROLL_OUT,   out,	false,0,true);
			hitarea.addEventListener(MouseEvent.CLICK,		click,	false,0,true);
			hitarea.addEventListener(MouseEvent.MOUSE_DOWN, down,	false,0,true);
			
			timerOver = new Timer(overDelay,1);
			timerOver.addEventListener(TimerEvent.TIMER, doOver, false, 0, true);

			timerOut = new Timer(overDelay,1);
			timerOut.addEventListener(TimerEvent.TIMER, doOut, false, 0, true);
		}

		private function onOverOut(e:MouseEvent):void{
			timerOut.reset();
			timerOver.reset();
			mouseX = e.stageX;
			mouseY = e.stageY;
		}

		private function over(e:MouseEvent):void{
			onOverOut(e);

			if(overDelay==0){
				doOver();
			}else{
				timerOver.start();
			}
		}
	
		private function doOver():void{
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.MOUSE_OVER, isHighlight,mouseX,mouseY));
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.ROLL_OVER , isHighlight,mouseX,mouseY));
		}

		private function out(e:MouseEvent):void{
			onOverOut(e);

			if(outDelay==0){
				doOut();
			}else{
				timerOut.start();
			}
		}
		
		private function doOut():void{
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.MOUSE_OUT , isHighlight,mouseX,mouseY));
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.ROLL_OUT  , isHighlight,mouseX,mouseY));
		}

		private function click(e:MouseEvent):void {
			FASTLog.instance().log("[ButtonEvt]:"+MovieClipTools.print(SimpleButton(e.target)) + ":click/mouseup",	FASTLog.LOG_LEVEL_DETAIL);
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.MOUSE_UP	, isHighlight,e.stageX,e.stageY));
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.CLICK		, isHighlight,e.stageX,e.stageY));
		}
	
		private function down(e:MouseEvent):void{
			FASTLog.instance().log("[ButtonEvt]:"+MovieClipTools.print(SimpleButton(e.target))+":mousedown",		FASTLog.LOG_LEVEL_DETAIL);
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.MOUSE_DOWN, isHighlight,e.stageX,e.stageY));
		}

		private function reset():void{
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.RESET     , isHighlight,0,0));
		}

		public function addElement(element:IButtonElement):IButtonClip{
			elements.push(element);
			this.when(ButtonClipEvent.MOUSE_OVER , element.buttonOver);
			this.when(ButtonClipEvent.MOUSE_OUT  , element.buttonOut);
			this.when(ButtonClipEvent.MOUSE_DOWN , element.buttonDown);
			this.when(ButtonClipEvent.RESET      , element.buttonReset);

			//immediate reset the element's status.
			element.buttonReset(new ButtonClipEvent(ButtonClipEvent.RESET,isHighlight,0,0));
			return this;
		}

		public function getElements():Array{
			return elements;
		}
	
		public function select(bln:Boolean = true) : IButtonClip {
			isHighlight = bln;
			reset();
			FASTLog.instance().log("[ButtonEvt]:"+MovieClipTools.print(SimpleButton(hitarea))+":select:"+bln,FASTLog.LOG_LEVEL_DETAIL);
			dispatchEvent(new ButtonClipEvent(ButtonClipEvent.SELECT, isHighlight,0,0));
			return this;
		}

		public function setMouseOverDelay(miniSecond : int) : IButtonClip {
			overDelay = miniSecond;
			return this;
		}
		
		public function setMouseOutDelay(miniSecond : int) : IButtonClip {
			outDelay = miniSecond;
			return this;
		}
	
		public function clearMouseOver() : IButtonClip {
			timerOver.reset();
			return this;
		}
	
		public function clearMouseOut() : IButtonClip {
			timerOut.reset();
			return this;
		}
	}
}