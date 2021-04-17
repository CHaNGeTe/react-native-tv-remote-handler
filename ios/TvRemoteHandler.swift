import UIKit

@objc(TvRemoteHandler)
class TvRemoteHandler: RCTEventEmitter {
    var hasListener: Bool = false
    var rootViewController: UIViewController?;
    
    override init() {
        super.init()
        rootViewController = getViewController()
        addSwipeLeftGestureRecognizer()
        addSwipeRightGestureRecognizer()
        addTapLeftGestureRecognizer()
        addTapRightGestureRecognizer()
    }
    
    override func startObserving() {
      hasListener = true
    }

    override func stopObserving() {
      hasListener = false
    }
    
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
    
    func addSwipeLeftGestureRecognizer() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        recognizer.direction = .left
        rootViewController?.view.addGestureRecognizer(recognizer)
    }
    
    func addSwipeRightGestureRecognizer() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        recognizer.direction = .right
        rootViewController?.view.addGestureRecognizer(recognizer)
    }
    
    func addTapLeftGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapedLeft))
        recognizer.allowedPressTypes = [UIPress.PressType.leftArrow.rawValue as NSNumber]
        rootViewController?.view.addGestureRecognizer(recognizer)
    }
    
    func addTapRightGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapedRight))
        recognizer.allowedPressTypes = [UIPress.PressType.leftArrow.rawValue as NSNumber]
        rootViewController?.view.addGestureRecognizer(recognizer)
    }
    
    @objc func swipedLeft(r: UISwipeGestureRecognizer) {

    }
    
    @objc func swipedRight(r: UISwipeGestureRecognizer) {

    }

    @objc func tapedLeft(r: UITapGestureRecognizer) {

    }
    
    @objc func tapedRight(r: UITapGestureRecognizer) {

    }
    
    @objc func sendAppleTVEvent(eventType: String, viewTag: Int) {
        self.sendEvent(withName:"MyEvent", body:["eventType": eventType, "viewTag": viewTag ]);
    }

    
//    @objc
//    func onKeyDownListener() -> Void {
//        print("LOG_SOME_SHIT_handleGestureLeft")
//        let rootViewController = getViewController()
//        let swipeRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGestureLeft))
//        swipeRecognizerLeft.direction = .left;
//        rootViewController?.view.addGestureRecognizer(swipeRecognizerLeft)
//
//        let tapRecognizerLeft = UITapGestureRecognizer(target: self, action: #selector(handleGestureTapLeft(_:)));
//        let allowedPressTypes: [NSNumber] =  [UIPress.PressType.leftArrow.rawValue as NSNumber, UIPress.PressType.rightArrow.rawValue as NSNumber];
//        tapRecognizerLeft.allowedPressTypes = allowedPressTypes
//        rootViewController?.view.addGestureRecognizer(tapRecognizerLeft)
////        tapRecognizerLeft.allowedPressTypes
////        tapRecognizerLeft.direction = .left;
//    }
//
//    @objc func handleGestureLeft() {
//        print("LOG_SOME_SHIT_handleGestureLeft111")
//        let focusedView = UIScreen.main.focusedView
//
//        self.sendEvent(withName:"MyEvent", body:["name": "some name", "nativeId": focusedView?.nativeID ]);
//    }
//
//    @objc func handleGestureTapLeft(_ r: UITapGestureRecognizer) {
//        print("LOG_SOME_SHIT_handleGestureLeft111")
//
//        self.sendEvent(withName:"MyEvent", body:["name": "tapped some name", "view": UIScreen.main.focusedView?.tag]);
//    }
    
    @objc
    override func supportedEvents() -> [String]! {
      return ["MyEvent","MyEvent2"];
    }
}
