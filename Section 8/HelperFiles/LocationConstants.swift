//
//  LocationConstants.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/11/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

struct LocationConstants {
    
    static let categoryKey = "categoryKey"
    static let dissmissActionKey = "dissmissActionKey"
    static let requestKey = "request Key"
    static let pngType = "png"
    static let resourceKey = "resourceKey"
    
    // MARK: - Localization Strings
    static let locationDismissButtonTitle = NSString.localizedUserNotificationString(forKey: "7DayDismiss", arguments: [])
    
    static let locationContentTitle = NSString.localizedUserNotificationString(forKey: "locationContentTitle", arguments: [])
    
    static let locationConentBody = NSString.localizedUserNotificationString(forKey: "locationConentBody", arguments: [])
    
    static let locationResourceName = NSString.localizedUserNotificationString(forKey: "notificationBanner", arguments: [])
}
