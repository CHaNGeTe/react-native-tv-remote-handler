import { useEffect } from 'react';
import { NativeModules, NativeEventEmitter } from 'react-native';

const useTVRemoteHandler = (callback) => {
  useEffect(() => {
    const { TvRemoteHandler } = NativeModules;
    const event = new NativeEventEmitter(TvRemoteHandler);
    event.addListener('onKeyDown', (res) => {
      console.log('MyEvent', res);
    });
  });

  return {};
};

export { useTVRemoteHandler };
