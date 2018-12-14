//
//  AlarmController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/4/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import UserNotifications

class AlarmController {
    
    // MARK: - Constants and Vairables
    
    static let shared = AlarmController()
    
    var alarms: [Alarm] = []
    
    init(){
        loadFromPersistentStore()
    }
    
    func addAlarm(fireDate: Date, alarm: String, isOn: Bool) -> Alarm {
        let newAlarm = Alarm(fireDate: fireDate, name: alarm)
        newAlarm.isOn = isOn
        alarms.append(newAlarm)
        saveToPersistentStorage()
        // scheduleAlarm -> this is called seperatly but alongside the addAlarm in the stepDetailVC
        return newAlarm
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, imageName: String, isOn: Bool) {
        //cancel notif -> this is called seperatly but alongside the addAlarm in the stepDetailVC
        alarm.fireDate = fireDate
        alarm.name = imageName
        //schedule alarm/ create alarm -> this is called seperatly but alongside the addAlarm in the stepDetailVC
        saveToPersistentStorage()
    }
    
    
    // MARK: - Funcs
    func buttonPropertiesToggled(comparisonBool: Bool, trueCaseButton: UIButton, trueCaseButtonTitle: String, falseCaseButton: UIButton, falseCaseButtonTitle: String){
        switch comparisonBool {
        case true:
            trueCaseButton.setTitle(trueCaseButtonTitle, for: .normal)
        case false:
            falseCaseButton.setTitle(falseCaseButtonTitle, for: .normal)
        }
    }
}

extension AlarmController {
    

    // MARK: - Calendar Notification
    func scheduleDatePickerUserNotifications(for alarm: Alarm, scheduleDismissDateNotifId: String, dismissActionTitle: String,  categoryID: String, contentTitle: String, contentSubtitle: String, contentBody: String, contentBadge: NSNumber, contentSound: UNNotificationSound, contentLuanchImage: String, resourceName: String, extenstionType: String) {
        
        // The Alert Button options
        let dismissAction = UNNotificationAction(identifier: scheduleDismissDateNotifId, title: dismissActionTitle, options: [])
        
        
        let category = UNNotificationCategory(identifier: categoryID, actions: [dismissAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        
        let content = UNMutableNotificationContent()
        content.title = contentTitle
        content.subtitle = contentSubtitle
        content.body = contentBody
        content.badge = contentBadge
        content.sound = contentSound
        content.launchImageName = contentLuanchImage
        
        content.categoryIdentifier = categoryID
        
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: extenstionType) else {return}
        do {
            let attachments =  try UNNotificationAttachment(identifier: categoryID, url: url, options: [:])
            
            content.attachments = [attachments]
        } catch {
            print("\n\nThere was an error with the attachment in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription)\n\n")
        }
        
        let componets = Calendar.current.dateComponents([.hour, .minute], from: alarm.fireDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: componets, repeats: false)
        
        let request = UNNotificationRequest(identifier: alarm.name, content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("There was an error in \(#function) ; (error) ; \(error.localizedDescription)")
            }
        }
    }
    
    func cancelUserNotificationsForAlarmWith(imageName: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [imageName])
    }
}

extension AlarmController {
    
    // MARK: Persistence
    
    private static func filePath() -> URL {
        let fileManger = FileManager.default
        let paths = fileManger.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else {fatalError("BadPath")}
        let url = path.appendingPathComponent("alarm.json")
        return url
    }
    
    // Save Persistent
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(alarms)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            // it said i had to put alarmController.filePath() due to it being static
            try data.write(to: AlarmController.filePath())
        } catch let error {
            print("\nThere was an error in \(#function); \(error); \(error.localizedDescription)\n")
        }
    }
    
    // Load Persistent
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do { // added Alarmcontroller.filePath. could be wrong
            let data = try Data(contentsOf: AlarmController.filePath())
            let alarms = try decoder.decode([Alarm].self, from: data)
            self.alarms = alarms
        } catch let error {
            print("\nThere was an error in \(#function); \(error); \(error.localizedDescription)\n")
        }
    }
}
