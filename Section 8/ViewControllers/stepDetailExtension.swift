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
        
        switch unwrappedStep.stepImageName {
            
        case AlarmImageName.step3.rawValue:
            print(unwrappedStep.stepNumber)
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmImageName.step3.rawValue } ).first
            //Test Print

            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(imageName: AlarmImageName.step3.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, imageName: AlarmImageName.step3.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s3DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s3DatePickerContentTitle, contentSubtitle: Constants.s3DatePickerContentSubtitle, contentBody: Constants.s3DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmImageName.step3.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s3DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s3DatePickerContentTitle, contentSubtitle: Constants.s3DatePickerContentSubtitle, contentBody: Constants.s3DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
            }
        case AlarmImageName.step4.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmImageName.step4.rawValue } ).first
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(imageName: AlarmImageName.step4.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, imageName: AlarmImageName.step4.rawValue, isOn: Constants.alarmIsOn)
                
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s4DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s4DatePickerContentTitle, contentSubtitle: Constants.s4DatePickerContentSubtitle, contentBody: Constants.s4DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmImageName.step4.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s4DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s4DatePickerContentTitle, contentSubtitle: Constants.s4DatePickerContentSubtitle, contentBody: Constants.s4DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
            }
        case AlarmImageName.step10.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmImageName.step10.rawValue } ).first
            
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(imageName: AlarmImageName.step10.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, imageName: AlarmImageName.step10.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s10DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s10DatePickerContentTitle, contentSubtitle: Constants.s10DatePickerContentSubtitle, contentBody: Constants.s10DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmImageName.step10.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s10DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s10DatePickerContentTitle, contentSubtitle: Constants.s10DatePickerContentSubtitle, contentBody: Constants.s10DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
            }
        case AlarmImageName.step12.rawValue:
            print(unwrappedStep.stepNumber)
            
            let alarm = AlarmController.shared.alarms.filter( { return $0.name == AlarmImageName.step12.rawValue } ).first
            
            if let alarm = alarm  {
                
                AlarmController.shared.cancelUserNotificationsForAlarmWith(imageName: AlarmImageName.step12.rawValue)
                
                AlarmController.shared.updateAlarm(alarm: alarm, fireDate: fireDate, imageName: AlarmImageName.step12.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s12DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s12DatePickerContentTitle, contentSubtitle: Constants.s12DatePickerContentSubtitle, contentBody: Constants.s12DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
                
            } else  {
                
                let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: AlarmImageName.step12.rawValue, isOn: Constants.alarmIsOn)
                
                AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDismissDateNotifId: Constants.dismissButtonDatePickerID, dismissActionTitle: Constants.s12DatePickerDismissTitle, categoryID: Constants.categorySDKey, contentTitle: Constants.s12DatePickerContentTitle, contentSubtitle: Constants.s12DatePickerContentSubtitle, contentBody: Constants.s12DatePickerContentBody, contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: Constants.datePickerNotifBanner, extenstionType: Constants.typePng)
            }
            
        default: print("Unkown Button Tapped"); break
        }
    }
}




