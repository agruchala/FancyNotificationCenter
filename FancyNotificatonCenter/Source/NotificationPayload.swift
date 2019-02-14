//
//  NotificationPayload.swift
//  FancyNotificatonCenter
//
//  Created by Artur Gruchała on 14/02/2019.
//  Copyright © 2019 Artur Gruchała. All rights reserved.
//

import Foundation


/// Protocol for payload. Provide unique `name`.
public protocol NotificationPayload{
    static var name: Notification.Name { get }
}
