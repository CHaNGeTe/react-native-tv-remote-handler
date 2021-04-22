import { useEffect } from 'react';
import {
  // NativeModules,
  // NativeEventEmitter,
  TVEventHandler,
} from 'react-native';

const useTVRemoteHandler = (callback: any, filterEvents = ['focus']) => {
  let tvEventHandler: any = null;

  const enableEventHandler = () => {
    if (!tvEventHandler) {
      tvEventHandler = new TVEventHandler();
      tvEventHandler.enable(null, (_: any, evt: any) => {
        if (filterEvents.length) {
          if (filterEvents.includes(evt.eventType)) {
            callback(evt);
          }
        } else {
          callback(evt);
        }
      });
    }
  };

  const disableEventHandler = () => {
    if (tvEventHandler) {
      tvEventHandler.disable();
      tvEventHandler = null;
    }
  };

  useEffect(() => {
    enableEventHandler();

    return () => disableEventHandler();
  });

  return {};
};

// const useTVRemoteHandler = (callback) => {
//   useEffect(() => {
//     const { TvRemoteHandler } = NativeModules;
//     const event = new NativeEventEmitter(TvRemoteHandler);
//     event.addListener('onKeyDown', (res) => {
//       console.log('MyEvent', res);
//     });
//   });

//   return {};
// };

export { useTVRemoteHandler };
