//
//  stepDetailExtension.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/6/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import UserNotifications

// MARK: - DATE PICKER CELL DELEGATE EXTENSION

// Conforming to delegate set above -
// (Step 4 of 5 - 3 steps in child, 2 in parent(this file))

extension StepDetailTVC: DatePickerTVCellDelegate {
    
    
   
    
    func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker) {
        print("\n\n🚀Set Time Button Tapped in: DatePickerTVCell\n")
        
        guard let unwrappedStep = selectedStep else {return}
        
        let fireDate = picker.date
        
        switch unwrappedStep.stepNumber {
            
        case AlarmName.step3.rawValue:
            print(unwrappedStep.stepNumber)
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmName.step3.rawValue } ).first
            //Test Print
            guard let alarmTime = alarm?.fireDateString else {return}
            print(alarmTime)
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(name: AlarmName.step3.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, name: AlarmName.step3.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmName.step3.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
            }
        case AlarmName.step4.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmName.step4.rawValue } ).first
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(name: AlarmName.step4.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, name: AlarmName.step4.rawValue, isOn: alarmIsOn)
                
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmName.step4.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
            }
        case AlarmName.step10.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmName.step10.rawValue } ).first
            
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(name: AlarmName.step10.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, name: AlarmName.step10.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmName.step10.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
            }
        case AlarmName.step12.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmName.step12.rawValue } ).first
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(name: AlarmName.step12.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, name: AlarmName.step12.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmName.step12.rawValue, isOn: alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: NotificationIDKey.dissmissButtonDateP.rawValue, dissmissActionTitle: "Localize: Dissmiss", scheduleEditNotifId: NotificationIDKey.editButtonDateP.rawValue, editDateActionTitle: "Localize: Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: NotificationIDKey.categorySDKey.rawValue, contentTitle: "Localize: Content Title \(unwrappedStep.stepNumber)", contentSubtitle: "Localize:Content Subtitle\(alarm.fireDateString)", contentBody: "Localize: Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
            }
            
        default: print("Unkown Button Tapped"); break
        }
    }
}




