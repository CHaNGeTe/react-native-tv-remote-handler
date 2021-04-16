#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TvRemoteHandler, NSObject)

//RCT_EXTERN_METHOD(onKeyDownListener
//                 withResolver:(RCTPromiseResolveBlock)resolve
//                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(onKeyDownListener
                  (RCTResponseSenderBlock)callback)
@end
