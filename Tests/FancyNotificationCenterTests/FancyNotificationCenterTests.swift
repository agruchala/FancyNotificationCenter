import XCTest
@testable import FancyNotificationCenter

class FancyNotificatonCenterTests: XCTestCase {
    override func setUp() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func testSendingNotification() {
        let notificationExp = expectation(description: "sending notification")
        let payload = NotificationItem(TestPayload(expectation: notificationExp))
        NotificationCenter.default.addObserver(self, selector: #selector(recieve(notification:)), for: TestPayload.self)
        
        NotificationCenter.default <- payload
        
        wait(for: [notificationExp], timeout: 0.5)
    }
    
    func recieve(notification: Notification){
        let payload: TestPayload? = <<notification
        
        payload?.expectation.fulfill()
    }
    
    func testRecievingOnCallback() {
        let notificationExp = expectation(description: "sending notification")
        let payload = NotificationItem(TestPayload(expectation: notificationExp))
        let token = NotificationCenter.default.addObserver(object: nil, queue: nil) { (payload: TestPayload?) -> Void in
            payload?.expectation.fulfill()
        }
        
        NotificationCenter.default <- payload
        
        wait(for: [notificationExp], timeout: 0.5)
        
        NotificationCenter.default.removeObserver(token)
    }
    
}
