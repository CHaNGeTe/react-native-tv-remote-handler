package com.reactnativetvremotehandler;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.WritableNativeMap;
import com.facebook.react.bridge.WritableMap;

import android.os.Handler;
import android.os.Looper;
import android.view.KeyEvent;

@ReactModule(name = TvRemoteHandlerModule.NAME)
public class TvRemoteHandlerModule extends ReactContextBaseJavaModule {
    public static final String NAME = "TVRemoteHandler";
    private ReactContext mReactContext;
    private DeviceEventManagerModule.RCTDeviceEventEmitter mJSModule = null;
    private static TvRemoteHandlerModule instance = null;

    public TvRemoteHandlerModule(ReactApplicationContext reactContext) {
        super(reactContext);
        instance = this;
        mReactContext = reactContext;
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    public static TvRemoteHandlerModule getInstance() {
        return instance;
    }

    public void onKeyDownEvent(final int keyCode, final KeyEvent keyEvent) {
        if (!mReactContext.hasActiveCatalystInstance()) {
          return;
        }

        if (mJSModule == null) {
          mJSModule = mReactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class);
        }


        new Handler(Looper.getMainLooper()).post(new Runnable() {
          @Override
          public void run() {
            mJSModule.emit("onKeyDown", getJsEventParams(keyCode, keyEvent, null));
          }
        });
    };

    private WritableMap getJsEventParams(int keyCode, KeyEvent keyEvent) {
        WritableMap params = new WritableNativeMap();
        int action = keyEvent.getAction();

        params.putInt("keyCode", keyCode);
        params.putInt("action", action);
        params.putString("focusedViewId", String.valueOf(this.getCurrentActivity().getCurrentFocus().getId()));

        return params;
    }
}
