﻿package {
	import com.fastframework.core.EventDispatcherUtils;
	import com.fastframework.core.FASTLog;
	import com.fastframework.core.IFASTEventDispatcher;
	import com.fastframework.core.ISave;
	import com.fastframework.core.SingletonError;
	import com.fastframework.core.navigation.Navigation;
	import com.fastframework.easing.Back;
	import com.fastframework.easing.Bounce;
	import com.fastframework.easing.Elastic;
	import com.fastframework.easing.None;
	import com.fastframework.easing.Regular;
	import com.fastframework.easing.Strong;
	import com.fastframework.facebook.FBConnect;
	import com.fastframework.facebook.FBConnectEvent;
	import com.fastframework.facebook.FBFeedStatus;
	import com.fastframework.facebook.FBUser;
	import com.fastframework.locale.Language;
	import com.fastframework.motion.MotionTween;
	import com.fastframework.net.ILoader;
	import com.fastframework.net.LoaderEvent;
	import com.fastframework.net.ParseCSS;
	import com.fastframework.net.ParseFLV;
	import com.fastframework.net.ParseIMG;
	import com.fastframework.net.ParseSWF;
	import com.fastframework.net.ParseVAR;
	import com.fastframework.net.ProgressLoader;
	import com.fastframework.net.ResolveLink;
	import com.fastframework.utils.AS2;
	import com.fastframework.utils.ArrayUtils;
	import com.fastframework.utils.CSSColor;
	import com.fastframework.utils.Conversion;
	import com.fastframework.utils.JS;
	import com.fastframework.utils.JSEvent;
	import com.fastframework.utils.MovieClipTools;
	import com.fastframework.utils.Queue;
	import com.fastframework.utils.StringUtils;
	import com.fastframework.utils.SystemUtils;
	import com.fastframework.utils.Validate;
	import com.fastframework.view.BitmapText;
	import com.fastframework.view.ButtonClip;
	import com.fastframework.view.ButtonEvt;
	import com.fastframework.view.ButtonIcon;
	import com.fastframework.view.Content;
	import com.fastframework.view.FASTRadioButton;
	import com.fastframework.view.IButtonClip;
	import com.fastframework.view.IButtonElement;
	import com.fastframework.view.NavBtn;
	import com.fastframework.view.NavButton;
	import com.fastframework.view.SmartTextField;
	import com.fastframework.view.ToolTips;
	import com.fastframework.view.events.ButtonClipEvent;



	/**
	 * @author colin
	 */
	public class All {
		public function All(){
		AS2;
			ButtonClip;
			ButtonIcon;
			Content;
			FASTRadioButton;
			JS;
			JSEvent;

			NavBtn;
			SmartTextField;
			IButtonClip;
			IButtonElement;
			IFASTEventDispatcher;
			ILoader;
			ISave;

			FASTLog;
			SingletonError;
			
			EventDispatcherUtils;
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

			ProgressLoader;

			ResolveLink;
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