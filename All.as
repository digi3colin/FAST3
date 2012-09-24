package {
	import com.fastframework.core.AS2;
	import com.fastframework.core.IFASTEventDispatcher;
	import com.fastframework.core.SingletonError;
	import com.fastframework.log.FASTLog;
	import com.fastframework.navigation.Navigation;
	import com.fastframework.net.ILoader;
	import doot.collection.ArrayUtils;
	import doot.collection.Queue;
	import doot.easing.Back;
	import doot.easing.Bounce;
	import doot.easing.Elastic;
	import doot.easing.None;
	import doot.easing.Regular;
	import doot.easing.Strong;
	import doot.encoder.ISave;
	import doot.geom.Conversion;
	import doot.javascript.JS;
	import doot.javascript.JSEvent;
	import doot.javascript.facebook.FBConnect;
	import doot.javascript.facebook.FBConnectEvent;
	import doot.javascript.facebook.FBFeedStatus;
	import doot.javascript.facebook.FBUser;
	import doot.locale.Language;
	import doot.motion.MotionTween;
	import doot.net.LoaderEvent;
	import doot.net.ParseCSS;
	import doot.net.ParseFLV;
	import doot.net.ParseIMG;
	import doot.net.ParseSWF;
	import doot.net.ParseVAR;
	import doot.pixel.CSSColor;
	import doot.string.StringUtils;
	import doot.string.Validate;
	import doot.utils.SystemUtils;
	import doot.view.BitmapText;
	import doot.view.ButtonClip;
	import doot.view.ButtonEvt;
	import doot.view.ButtonIcon;
	import doot.view.FASTRadioButton;
	import doot.view.IButtonClip;
	import doot.view.IButtonElement;
	import doot.view.MovieClipTools;
	import doot.view.NavButton;
	import doot.view.NavButtonClip;
	import doot.view.SmartTextField;
	import doot.view.ToolTips;
	import doot.view.events.ButtonClipEvent;

	/**
	 * @author colin
	 */
	public class All {
		public function All(){
			AS2;
			ButtonClip;
			ButtonIcon;
			FASTRadioButton;
			JS;
			JSEvent;
			NavButtonClip;
			SmartTextField;
			IButtonClip;
			IButtonElement;
			IFASTEventDispatcher;
			ILoader;
			ISave;
			FASTLog;
			SingletonError;
			FBConnect;
			FBConnectEvent;
			FBFeedStatus;
			FBUser;
			Language;
			MotionTween;
			Navigation;
			LoaderEvent;
			ParseCSS;
			ParseFLV;
			ParseIMG;
			ParseSWF;
			ParseVAR;
			ArrayUtils;
			Conversion;
			CSSColor;
			MovieClipTools;
			Queue;
			StringUtils;
			SystemUtils;
			Validate;
			BitmapText;
			ButtonEvt;
			NavButton;
			ToolTips;
			ButtonClipEvent;
			Back;
			Bounce;
			Elastic;
			None;
			Regular;
			Strong;
		}
	}
}
