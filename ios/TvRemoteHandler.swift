@objc(TvRemoteHandler)
class TvRemoteHandler: UIViewController {

//    @objc(multiply:withB:withResolver:withRejecter:)
////    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
////        resolve(a*b)
////    }
    
    func getViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return keyWindow?.rootViewController ?? nil
    }
    
    @objc(onKeyDownListener:)
    func onKeyDownListener(callback:RCTResponseSenderBlock) -> Void {
        print("LOG_SOME_SHIT_handleGestureLeft")
        let rootViewController = getViewController()
        let swipeRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGestureLeft))
        rootViewController?.view.addGestureRecognizer(swipeRecognizerLeft)
    }
    
    @objc func handleGestureLeft() {
        print("LOG_SOME_SHIT_handleGestureLeft")
    }
}
