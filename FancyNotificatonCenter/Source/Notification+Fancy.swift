//
//  Notification+Fancy.swift
//  FancyNotificatonCenter
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import Foundation

public extension Notification {
    
    /// Decodes `Notification` to provide payload
    ///
    /// - Returns: retrieved `payload` or nil
    public func decode<T: NotificationPayload>() -> T? {
        return userInfo?[payloadKey] as? T
    }
}

prefix operator <<

/// Convinient operator for `decode`.
///
/// - Parameter lhs: `Notification` to decode
/// - Returns: decoded `NotificationPayload`
public prefix func <<<T: NotificationPayload>(lhs: Notification) -> T? {
    return lhs.decode()
}


