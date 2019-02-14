//
//  NotificationItem.swift
//  FancyNotificatonCenter
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import Foundation


/**
 Struct holding notification payload.
 
 Create instance of `NotificationItem` with Your own payload
 */
public struct NotificationItem<T: NotificationPayload>{
    let payload: T
    
    public init(_ payload: T) {
        self.payload = payload
    }
    var name: Notification.Name {
        return T.name
    }
}
