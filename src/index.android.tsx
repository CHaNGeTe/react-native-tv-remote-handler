import { DeviceEventEmitter } from 'react-native';
import { useEffect } from 'react';

function useTVRemoteHandler(callback: any) {
  let listener: any = null;

  useEffect(() => {
    listener = DeviceEventEmitter.addListener(
      'onKeyDown',
      ({ action, focusedViewId }) => {
        return callback({
          tag: focusedViewId,
          eventType: 'focus',
          eventKeyAction: action,
        });
      }
    );

    return () => {
      listener.remove();
    };
  });

  return {};
}

export { useTVRemoteHandler };

// function onKeyDownListener(cb: any) {
//   if (Platform.OS === 'ios') {
//     const keyEvent = new NativeEventEmitter(TvRemoteHandler);
//     console.log('keyEvent', keyEvent);
//     // keyEvent.onKeyDownListener(cb);
//     keyEvent.addListener('onKeyDownListener');
//     // const listerner = keyEvent.addListener('onKeyDown', cb);
//     // listeners.push(listerner);
//   } else {
//     const listener = DeviceEventEmitter.addListener('onKeyDown', cb);
//     listeners.push(listener);
//   }
// }

// function removeListeners() {
//   listeners.forEach((listener: any) => {
//     listener.remove();
//   });
// }

// // export default TVRemoteHandler as TvRemoteHandlerType;
// export default {
//   onKeyDownListener,
//   removeListeners,
// };
