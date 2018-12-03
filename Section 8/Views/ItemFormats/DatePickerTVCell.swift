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
    @IBOutlet weak var datePickerButtonTextLabel: UIButton!
    
    override func awakeFromNib() {
        
        // Set datePicker background
        datePicker.backgroundColor = UIColor.white
    }
    
    // MARK: - ACTIONS
   
    @IBAction func datePickerButtonTapped(_ sender: Any) {
        delegate?.datePickerButtonTapped(self, datePicker)
    }
}

protocol DatePickerTVCellDelegate: class {
    func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker)
}
