//
//  Constants.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/10/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

struct Constants {
    
    // NOTE: - 604800 seconds is 7 days
    // NOTE: - 1800 seconds is 30 minutes
    static let sevenDays = 1800
    //    var boolValueToTestTimer = true
    static let sevenDayTimerID = "sevenDays"
    static let categorySevenNotificationID = "dismisActionKey"
    static let datePActionId = "datePickerNotifID"
    static let datePCategoryId = "dateCatergoryID"
    static var alarmIsOn: Bool = false
    
    // seven day interval constants for notif func
    static let dismissActionSdId = "SevenDayDismissActionID"
    static let categorySdID = "sevenDayCatergoryID"
    static let requestSdId = "sevenDayRequestID"
    static let resourceSdID = "sevenDayResourceID"
    static let typePng = "png"
    static let categorySDKey = "sevenDayCategoryID"
    
    
    // Date Picker Constants
    static let dismissButtonDatePickerID = "dismissID"
    
    // Seven Day Notification Localization Banners
    static let sevenDayNotifBanner = NSString.localizedUserNotificationString(forKey: "notificationBanner", arguments: [])
    
    // Seven Day Notification Localization Strings
    static let sevenDayDismissTitle = NSString.localizedUserNotificationString(forKey: "7DayDismiss", arguments: [])
    static let sevenDayContentTitle = NSString.localizedUserNotificationString(forKey: "7DayContentTitle", arguments: [])
    static let sevenDayContentSubtitle = NSString.localizedUserNotificationString(forKey: "7DayContentSubtitle", arguments: [])
    static let sevenDayContentBody = NSString.localizedUserNotificationString(forKey: "7DayContentBody", arguments: [])
    
    // MARK - Banner Images
    // Date Picker Notification Localization Banners
    static let datePickerNotifBanner = NSString.localizedUserNotificationString(forKey: "datePickerBanner", arguments: [])
    
    // Seven Day Notification Localization Strings
    
    
    // Step 3 - Intial Appointment Date
    static let s3DatePickerDismissTitle = NSString.localizedUserNotificationString(forKey: "s3DatePickerDismissTitle", arguments: [])
    
    static let s3DatePickerContentTitle = NSString.localizedUserNotificationString(forKey: "s3DatePickerContentTitle", arguments: [])
    
    static let s3DatePickerContentSubtitle = NSString.localizedUserNotificationString(forKey: "s3DatePickercontentSubtitle", arguments: [])
    
    static let s3DatePickerContentBody = NSString.localizedUserNotificationString(forKey: "s3DatePickerContentBody", arguments: [])
    
    
    // Step 4 - Intial Appointment Date
    static let s4DatePickerDismissTitle = NSString.localizedUserNotificationString(forKey: "s4DatePickerDismissTitle", arguments: [])
    
    static let s4DatePickerContentTitle = NSString.localizedUserNotificationString(forKey: "s4DatePickerContentTitle", arguments: [])
    
    static let s4DatePickerContentSubtitle = NSString.localizedUserNotificationString(forKey: "s4DatePickercontentSubtitle", arguments: [])
    
    static let s4DatePickerContentBody = NSString.localizedUserNotificationString(forKey: "s4DatePickerContentBody", arguments: [])
    
    
    // Step 10 - Schedule Inspection
    static let s10DatePickerDismissTitle = NSString.localizedUserNotificationString(forKey: "s10DatePickerDismissTitle", arguments: [])
    
    static let s10DatePickerContentTitle = NSString.localizedUserNotificationString(forKey: "s10DatePickerContentTitle", arguments: [])
    
    static let s10DatePickerContentSubtitle = NSString.localizedUserNotificationString(forKey: "s10DatePickercontentSubtitle", arguments: [])
    
    static let s10DatePickerContentBody = NSString.localizedUserNotificationString(forKey: "s10DatePickerContentBody", arguments: [])
    
    
    // Step 12 - Final HAUC Appointment
    static let s12DatePickerDismissTitle = NSString.localizedUserNotificationString(forKey: "s12DatePickerDismissTitle", arguments: [])
    
    static let s12DatePickerContentTitle = NSString.localizedUserNotificationString(forKey: "s12DatePickerContentTitle", arguments: [])
    
    static let s12DatePickerContentSubtitle = NSString.localizedUserNotificationString(forKey: "s12DatePickercontentSubtitle", arguments: [])
    
    static let s12DatePickerContentBody = NSString.localizedUserNotificationString(forKey: "s12DatePickerContentBody", arguments: [])
}
