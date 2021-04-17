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
        recognizer.allowedPressTypes = [UIPress.PressType.rightArrow.rawValue as NSNumber]
        rootViewController?.view.addGestureRecognizer(recognizer)
    }
    
    @objc func swipedLeft(r: UISwipeGestureRecognizer) {
        sendAppleTVEvent(eventType: "swipedLeft", viewTag: 0)
    }
    
    @objc func swipedRight(r: UISwipeGestureRecognizer) {
        sendAppleTVEvent(eventType: "swipedRight", viewTag: 0)
    }

    @objc func tapedLeft(r: UITapGestureRecognizer) {
        sendAppleTVEvent(eventType: "left", viewTag: 0)
    }
    
    @objc func tapedRight(r: UITapGestureRecognizer) {
        sendAppleTVEvent(eventType: "right", viewTag: 0)
    }
    
    @objc func sendAppleTVEvent(eventType: String, viewTag: Int) {
        self.sendEvent(withName:"onKeyDown", body:["eventType": eventType, "viewTag": viewTag ]);
    }
    
    @objc
    override func supportedEvents() -> [String]! {
      return ["onKeyDown"];
    }
}
