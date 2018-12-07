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
    //        func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker) {
    
    
   func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker) {
        print("\n\n🚀Set Time Button Tapped in: DatePickerTVCell\n")
        guard let unwrappedStep = selectedStep else {return}
        let fireDate = picker.date
        
        
        if unwrappedStep.stepNumber == "STEP 4" {
            
            let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, alarm: unwrappedStep.stepNumber, isOn: alarmIsOn)
            //
                            AlarmController.shared.scheduleDatePickerUserNotifications(for: alarm, scheduleDissmissDateNotifId: "DissMissID", dissmissActionTitle: "Dissmiss", scheduleEditNotifId: "EditNotifID", editDateActionTitle: "Edit Schedule", editDateOption: [.authenticationRequired, .foreground], categoryID: datePCategoryId, contentTitle: "Content Title", contentSubtitle: "Content Subtitle", contentBody: "Content Body", contentBadge: 1, contentSound: .default, contentLuanchImage: "", resourceName: "supermarioghost_1_copy", extenstionType: "png")
            // ID the Alarm
            // - Create  Schedule the Alarm
            //-   Update Schedule the Alarm
            print("Step 4 tapped")
            
        } else if unwrappedStep.stepNumber == "STEP 3" {
            print("Step 3 Button Tapped")
        } else if unwrappedStep.stepNumber == "STEP 10" {
            print("Step 10 button Tapped")
        } else if unwrappedStep.stepNumber == "STEP 12" {
            print("Step 12 button tapped")
        } else {
            print("The button selected is not linked up correclty ")
        }
    }
}


//



