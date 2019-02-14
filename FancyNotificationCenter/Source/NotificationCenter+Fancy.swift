//
//  NotificationCenter+Fancy.swift
//  FancyNotificatonCenter
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import Foundation

let payloadKey = "FancyNotificatonCenter_payload_userInfo_key"

public extension NotificationCenter {
    /// Creates a notification with a given item and posts it to the notification center.
    ///
    /// - Parameter notificationItem: `NotificationItem` to be posted
    public func post<T: NotificationPayload>(_ notificationItem: NotificationItem<T>) {
        post(name: notificationItem.name,
             object: nil,
             userInfo: [payloadKey : notificationItem.payload])
    }
    
    public func addObserver(_ observer: NSObject, selector aSelector: Selector, for payload: NotificationPayload.Type ) {
        addObserver(observer, selector: aSelector, name: payload.name, object: nil)
    }
}

infix operator <-

/// Convinient operator for `post(notificationItem)`
public func <-<T: NotificationPayload>(lhs: NotificationCenter, rhs: NotificationItem<T>) {
    lhs.post(rhs)
}
