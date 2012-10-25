package com.fastframework.core {
	import flash.utils.getQualifiedClassName;			/**	 * @author colin	 */	final public class SingletonError extends Error {		public function SingletonError(singletonClass:Object) {			super(getQualifiedClassName(singletonClass)+' is Singleton', 0);		}
	}}