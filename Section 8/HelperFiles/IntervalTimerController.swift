//
//  IntervalTimerController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/13/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import UserNotifications

class IntervalTimerController {
    
    func cancelLocalNotificationWith(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    // MARK: - Notification Interval Timer
    func scheduleLocalNotifInterval(dismissActionID: String, actionTitle: String, categoryID: String, contentTitle: String, contentSubtitle: String, contentBody: String, contentBadge: NSNumber, contentSound: UNNotificationSound, contentLaunchImage: String, desiredTimeInterval: Int, resourceName: String, extenstionType: String, resourceID: String, requestID: String, doesItRepeat: Bool) {
        
        // The Alert Button options
        let dismissAction = UNNotificationAction(identifier: dismissActionID, title: actionTitle, options: [])
        
        let category = UNNotificationCategory(identifier: categoryID, actions: [dismissAction], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //Payload
        let content = UNMutableNotificationContent()
        content.title = contentTitle
        content.subtitle = contentSubtitle
        content.body = contentBody
        content.badge = contentBadge
        content.sound = contentSound
        content.launchImageName = contentLaunchImage
        content.categoryIdentifier = categoryID
        
        //Image
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: extenstionType) else {return}
        do {
            let attachments =  try UNNotificationAttachment(identifier: resourceID, url: url, options: [:])
            
            content.attachments = [attachments]
        } catch {
            print("\n\nThere was an error with the attachment in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription)\n\n")
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(desiredTimeInterval), repeats: doesItRepeat)
        
        let request = UNNotificationRequest(identifier: requestID, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("There was an error in \(#function) ; (error) ; \(error.localizedDescription)")
            }
        }
    }
}
