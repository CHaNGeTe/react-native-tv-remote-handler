import { useEffect } from 'react';
import { TVEventHandler } from 'react-native';

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

export { useTVRemoteHandler };
