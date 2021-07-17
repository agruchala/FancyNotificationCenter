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
    func post<T: NotificationPayload>(_ notificationItem: NotificationItem<T>) {
        post(name: notificationItem.name,
             object: nil,
             userInfo: [payloadKey : notificationItem.payload])
    }
    
    /// Adds an entry to the notification center to receive notifications that passed to the provided block.
    /// - Parameters:
    ///   - obj: The object that sends notifications to the observer block. Specify a sender to deliver only notifications from this sender.
    ///   When nil, the notification center doesn’t use the sender as criteria for the delivery.
    ///   - queue: The operation queue where the block runs.
    ///   When nil, the block runs synchronously on the posting thread.
    ///   - block: The block that executes when receiving a notification.
    ///   The notification center copies the block. The notification center strongly holds the copied block until you remove the observer registration.
    ///   The block takes one argument: the notification.
    func addObserver<T: NotificationPayload>(
                     object obj: Any?,
                      queue: OperationQueue?,
                      using block: @escaping (T?) -> Void) -> NSObjectProtocol {
        addObserver(forName: T.name, object: obj, queue: queue) { notification in
            let payload: T? = <<notification
            block(payload)
        }
        
    }
    
    func addObserver(_ observer: NSObject, selector aSelector: Selector, for payload: NotificationPayload.Type ) {
        addObserver(observer, selector: aSelector, name: payload.name, object: nil)
    }
}

infix operator <-

/// Convinient operator for `post(notificationItem)`
public func <-<T: NotificationPayload>(lhs: NotificationCenter, rhs: NotificationItem<T>) {
    lhs.post(rhs)
}
