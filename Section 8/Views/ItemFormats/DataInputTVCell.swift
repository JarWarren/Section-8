//
//  DataInputTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 12/3/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DataInputTVCell: UITableViewCell {
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    weak var delegate: DataInputTVCellDelegate?

    // MARK: - OUTLETS
    
    @IBOutlet weak var dataInputTitle1Label: UILabel!
    @IBOutlet weak var dataInputText1Label: UILabel!
    @IBOutlet weak var dataInputText1Field: UITextField!
    @IBOutlet weak var dataInputTitle2Label: UILabel!
    @IBOutlet weak var dataInputText2Label: UILabel!
    @IBOutlet weak var dataInputText2Field: UITextField!
    @IBOutlet weak var dataInputButtonTextLabel: UIButton!
    
    // MARK: - ACTIONS
    
    @IBAction func dataInputButtonTapped(_ sender: Any) {
        
        // Call the delegate function
        // (Step 3 of 5 - 3 steps in child (this file), 2 in parent)
        delegate?.dataInputButtonTapped(self, dataInputText1Field, dataInputText2Field)
    }
}

// Create custom protocol for delegate so we can collect data in custom view and pass it to view controller
// (Step 1 of 5 - 3 steps in child (this file), 2 in parent)
protocol DataInputTVCellDelegate: class {
    func dataInputButtonTapped(_ sender: DataInputTVCell, _ textField1: UITextField, _ textField2: UITextField)
}
