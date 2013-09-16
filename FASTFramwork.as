package {
	import com.fastframework.core.AS2;
	import com.fastframework.core.FASTEventDispatcher;
	import com.fastframework.core.FASTSpriteEventDispatcher;
	import com.fastframework.core.IFASTEventDispatcher;
	import com.fastframework.core.SingletonError;
	import com.fastframework.log.FASTLog;
	import com.fastframework.log.ILog;
	import com.fastframework.navigation.NavStackRequest;
	import com.fastframework.navigation.Navigation;
	import com.fastframework.navigation.NavigationEvent;
	import com.fastframework.net.ILoadParser;
	import com.fastframework.net.ILoader;

	/**
	 * @author colin
	 */
	final public class FASTFramwork {
		public static const VERSION:String = '4.1';
		public function FASTFramwork(){
			AS2;
			//EventDispatcherUtils;
			FASTEventDispatcher;
			FASTSpriteEventDispatcher;			
			IFASTEventDispatcher;
			SingletonError;
			FASTLog;
			ILog;
			Navigation;
			NavigationEvent;
			NavStackRequest;
			ILoader;
			ILoadParser;
		}
	}
}