﻿package com.fastframework.view {
	final public class NavBtn extends FASTEventDispatcher implements IButtonClip{
		public static var FILEPREFIX:String = 'FILEPREFIX';

		public function NavBtn(mc:InteractiveObject,navId:String="",targetContainer:String=""){
			var para:Array = n.split("$");
			base = new NavButton(hitArea,
		}

		public function addElement(element : IButtonElement) : IButtonClip {
			base.addElement(element);
		}
	
		public function select() : IButtonClip {
			base.select();
		}
	}