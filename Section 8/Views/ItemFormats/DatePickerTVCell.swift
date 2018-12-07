//
//  DatePickerTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/30/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DatePickerTVCell: UITableViewCell {
    
    // MARK: - SET DELEGATE
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    
    weak var delegate: DatePickerTVCellDelegate?
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var datePickerTitleLabel: UILabel!
    @IBOutlet weak var datePickerTextLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerButton: UIButton!
    
    var alarmIsOn: Bool = false
    
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    override func awakeFromNib() {
        
        // Set datePicker background
        datePicker.backgroundColor = UIColor.white
        
    }
    
    // MARK: - Functions
    
    private func updateViews() {
        guard let alarm = alarm else {return}
        datePicker.date = alarm.fireDate
        alarmIsOn = alarm.isOn
        // NOTE: - Not sure if we need the buttonProToggeled in here
    }

    // MARK: - ACTIONS
    
    @IBAction func datePickerButtonTapped(_ sender: Any) {
        
        // Call the delegate function
        // (Step 3 of 5 - 3 steps in child (this file), 2 in parent)
        
        delegate?.datePickerButtonTapped(self, datePicker)
        print("\n\nSet Time Button Tapped in: DatePickerTVCell\n")
// when this gets tapped, the work thats in the parent Detail VC code for Date INput BUtton Tapped gets called 
    }
    
    
}

// MARK: - CUSTOM PROTOCOL FOR DELEGATE

// Create custom protocol for delegate so we can collect data in custom view and pass it to view controller
// (Step 1 of 5 - 3 steps in child (this file), 2 in parent)

protocol DatePickerTVCellDelegate: class {
    func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker)
}
