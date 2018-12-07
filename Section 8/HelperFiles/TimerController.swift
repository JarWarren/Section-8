//
//  TimerController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/1/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import UserNotifications

//this window is going to be our child

///#1. Delegate Step: Define the protocol (list out th erequirments to be the boss)

protocol TimerControllerDelegete: class { // the following code is waht it takes to be the boss/or the delegate of this child
    // the boss/delegate needs to have these three things
    func timerSecondTick()
    func timerCompleted()
    func timerStopped()
}

class TimerController {
    
    let identifier1 = "NotificationID"
    let outOfAppNotifIdentifer = "NotificationID2"
    
    // its our only child, kinda like our Source of Truth
    
    var timeRemaining: TimeInterval?
    var timer: Timer?
    
    var isOn: Bool { // let us know if its on or off
        if timeRemaining != nil { // if theres any time remaining
            return true
        } else {
            return false
        }
    }
    
    ///#2 Delegate Step: Define Weak Var Delegate. (The child recognazing a place in its heart where it eneds a boss: a hook. because the parent is going to grab hold of the child)
    weak var delegate: TimerControllerDelegete?
    
    // write out your skeleton
    
    //#1 func
    func secondTick() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            
            self.timeRemaining = timeRemaining - 1 // taking time remaining thats an optional from the top of the code and substracting 1
            print(timeRemaining)
            ///#3 Delegate Step:
            delegate?.timerSecondTick()
            
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
            ///Step 3
            delegate?.timerCompleted()
            
            // Restart Time
//            startTimer(time: 5)
        }
    }
    
    func startTimer(time: TimeInterval) { // start timer with numbers in it
        
        if timeRemaining == nil {// check for safety
            timeRemaining = time // our reaminign time is what ever we put in it
            scheduleLocalNotificationFor(identifier: identifier1)
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                    self.secondTick()
                })
            }
        }
    }
    
    func stopTimer() { // doesnt need perameters for it to start
        
        timer?.invalidate() // stops the timer
        timeRemaining = nil // when th timer is stopped, you dont have a timer
        /// delegate 3
        delegate?.timerCompleted()
        cancelLocalNotificationWith(identifier: identifier1) // our notification func call name we created way below in this window
        
    }
    
    func timeAsString() -> String { // make it into a readable time
        let timeRemaining = Int(self.timeRemaining ?? 20*60) // 2o minutes (12,000 second). want and Int in order to avoid 12:00:21 seconds
        let mintues = timeRemaining / 60
        let seconds = timeRemaining - (mintues * 60) // remainder will give you the seconds
        
        return String(format: "%02d : %02d", arguments: [mintues, seconds]) // the % will get replaced by the argumetns you put in the line of code
    }
    
    func scheduleLocalNotificationFor(identifier: String) {
        
        // The Alert Button options
        let action = UNNotificationAction(identifier: identifier, title: "Dismiss", options: [])
        let category = UNNotificationCategory(identifier: outOfAppNotifIdentifer, actions: [action], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // MARK: - The notification payload
        let content = UNMutableNotificationContent()
        content.title = "We Havent Heard From You In A While?"
        content.body = "Come back to the App to get assistance"
        content.badge = 1
        content.sound = UNNotificationSound.default
        content.launchImageName = "step14"
        //This is the String ID for what we want to prseent to the user
        content.categoryIdentifier = outOfAppNotifIdentifer
        
        guard let timeRemaining = timeRemaining else {return}
        let date = Date(timeInterval: timeRemaining, since: Date()) // Date() the time right now. ugly date
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: date) // pretty calendar based on the users
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false) // date component based on the date composition of the user's device. you can chop up the date cmpoonents to get what you want
        
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; (error) ; \(error.localizedDescription) 💩")
            }
        }
    }
    
    func cancelLocalNotificationWith(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    

    // This is a reUsable schedul Notifc alert however it needs to be worked on
    func scheduleLocalNotificationOnTimer(identifier: String, actionTitle: String, categoryID: String, contentTitle: String, contentSubtitle: String, contentBody: String, contentBadge: NSNumber, contentSound: UNNotificationSound, contentLaunchImage: String, desiredTimeInterval: Int, resourceName: String, extenstionType: String) {
        
        // The Alert Button options
        let action = UNNotificationAction(identifier: identifier, title: actionTitle, options: [])
        let category = UNNotificationCategory(identifier: categoryID, actions: [action], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // MARK: - The notification payload
        let content = UNMutableNotificationContent()
        content.title = contentTitle
        content.subtitle = contentSubtitle
        content.body = contentBody
        content.badge = contentBadge
        content.sound = contentSound
        content.launchImageName = contentLaunchImage
        //This is the String ID for what we want to prseent to the user
        content.categoryIdentifier = categoryID
         /*When you schedule a notification request containing the attachment, the attachment’s file is moved to a new location to facilitate access by the appropriate processes. After the move, the only way to access the file is using the methods of the UNUserNotificationCenter object.*/
//        guard let url = Bundle.main.url(forResource: "homeFound", withExtension: "jpeg") else {return}
         guard let url = Bundle.main.url(forResource: resourceName, withExtension: extenstionType) else {return}
        do {
            let attachments =  try UNNotificationAttachment(identifier: categoryID, url: url, options: [:])
            
            content.attachments = [attachments]
        } catch {
            print("\n\n🚀 There was an error with the attachment in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n")
        }
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(desiredTimeInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; (error) ; \(error.localizedDescription) 💩")
            }
        }
    }
    
    
    func scheduleLocalNotificationOnTimerUpdatedbyIvan(dissMissActionID: String, actionTitle: String, categoryID: String, contentTitle: String, contentSubtitle: String, contentBody: String, contentBadge: NSNumber, contentSound: UNNotificationSound, contentLaunchImage: String, desiredTimeInterval: Int, resourceName: String, extenstionType: String) {
        
        // The Alert Button options
        let dissMissAction = UNNotificationAction(identifier: dissMissActionID, title: actionTitle, options: [])
        let category = UNNotificationCategory(identifier: categoryID, actions: [dissMissAction], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // MARK: - The notification payload
        let content = UNMutableNotificationContent()
        content.title = contentTitle
        content.subtitle = contentSubtitle
        content.body = contentBody
        content.badge = contentBadge
        content.sound = contentSound
        content.launchImageName = contentLaunchImage
        //This is the String ID for what we want to prseent to the user
        content.categoryIdentifier = categoryID
        /*When you schedule a notification request containing the attachment, the attachment’s file is moved to a new location to facilitate access by the appropriate processes. After the move, the only way to access the file is using the methods of the UNUserNotificationCenter object.*/
        //        guard let url = Bundle.main.url(forResource: "homeFound", withExtension: "jpeg") else {return}
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: extenstionType) else {return}
        do {
            let attachments =  try UNNotificationAttachment(identifier: categoryID, url: url, options: [:])
            
            content.attachments = [attachments]
        } catch {
            print("\n\n🚀 There was an error with the attachment in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n")
        }
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(desiredTimeInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: dissMissActionID, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; (error) ; \(error.localizedDescription) 💩")
            }
        }
    }
    
    // MARK: - Calendar Notification
    func scheduleLocalNotificationOnDate(schedulateDateNotifId: String, dissmissActionTitle: String, editDateActionTitle: String, editDateOption: UNNotificationActionOptions,  categoryID: String, contentTitle: String, contentSubtitle: String, contentBody: String, contentBadge: NSNumber, contentSound: UNNotificationSound, contentLuanchImage: String, desiredTimeInterval: Int, resourceName: String, extenstionType: String, alrmComponent: Date) {
        
        // The Alert Button options
        let dissmissAction = UNNotificationAction(identifier: schedulateDateNotifId, title: dissmissActionTitle, options: [])
        let editDateAction = UNNotificationAction(identifier: schedulateDateNotifId, title: editDateActionTitle, options: [editDateOption])
        let category = UNNotificationCategory(identifier: categoryID, actions: [dissmissAction, editDateAction], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // MARK: - The notification payload
        let content = UNMutableNotificationContent()
        content.title = contentTitle
        content.subtitle = contentSubtitle
        content.body = contentBody
        content.badge = contentBadge
        content.sound = contentSound
        content.launchImageName = contentLuanchImage
        //This is the String ID for what we want to prseent to the user
        content.categoryIdentifier = categoryID
        /*When you schedule a notification request containing the attachment, the attachment’s file is moved to a new location to facilitate access by the appropriate processes. After the move, the only way to access the file is using the methods of the UNUserNotificationCenter object.*/
        //        guard let url = Bundle.main.url(forResource: "homeFound", withExtension: "jpeg") else {return}
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: extenstionType) else {return}
        do {
            let attachments =  try UNNotificationAttachment(identifier: categoryID, url: url, options: [:])
            
            content.attachments = [attachments]
        } catch {
            print("\n\n🚀 There was an error with the attachment in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n")
        }
        
        let componets = Calendar.current.dateComponents([.hour, .minute], from: alrmComponent)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: componets, repeats: false)
        
        let request = UNNotificationRequest(identifier: schedulateDateNotifId, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; (error) ; \(error.localizedDescription) 💩")
            }
        }
    }
}
