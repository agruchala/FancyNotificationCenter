//
//  TestPayload.swift
//  FancyNotificatonCenterTests
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import Foundation
import FancyNotificatonCenter
import XCTest

extension Notification.Name {
    static let testNotificationName = Notification.Name("testNotificationName_shhsh")
}

struct TestPayload: NotificationPayload {
    static let name = Notification.Name.testNotificationName
    let expectation: XCTestExpectation
}
