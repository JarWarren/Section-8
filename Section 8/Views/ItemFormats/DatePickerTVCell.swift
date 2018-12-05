//
//  DatePickerTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/30/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DatePickerTVCell: UITableViewCell {
    
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
        delegate?.datePickerButtonTapped(self, datePicker)
        print("\n\nSet Time Button Tapped in: DatePickerTVCell\n")
//        buttonPropertiesToggled()
    }
    
    
}



protocol DatePickerTVCellDelegate: class {
    func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker)
}
