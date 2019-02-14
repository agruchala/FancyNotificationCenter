//
//  FancyNotificatonCenterTests.swift
//  FancyNotificatonCenterTests
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import XCTest
@testable import FancyNotificatonCenter

class FancyNotificatonCenterTests: XCTestCase {

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

}
