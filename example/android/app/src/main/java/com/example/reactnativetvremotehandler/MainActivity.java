package com.example.reactnativetvremotehandler;

import android.view.KeyEvent;

import com.facebook.react.ReactActivity;
import com.reactnativetvremotehandler.TvRemoteHandlerModule;

public class MainActivity extends ReactActivity {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "TvRemoteHandlerExample";
  }

  @Override
  public boolean onKeyDown(int keyCode, KeyEvent event) {
      TvRemoteHandlerModule.getInstance().onKeyDownEvent(keyCode, event);
      return super.onKeyDown(keyCode, event);
  }
}
