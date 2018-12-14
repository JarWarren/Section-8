//
//  DataInputTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 12/3/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DataInputTVCell: UITableViewCell {
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var dataInputTitle1Label: UILabel!
    @IBOutlet weak var dataInputText1Label: UILabel!
    @IBOutlet weak var dataInputText1Field: UITextField!
    //Enter total household income here
//    Helvetica Neue 17.0
    @IBOutlet weak var dataInputTitle2Label: UILabel!
    @IBOutlet weak var dataInputText2Label: UILabel!
    @IBOutlet weak var dataInputText2Field: UITextField!
    //Enter voucher amount here
    @IBOutlet weak var dataInputButtonTextLabel: UIButton!
    
    static let shared = DataInputTVCell()
    
    
     // MARK: - Delte this commented out code once textfields work properly
//    weak var stepDetailVC: StepDetailTVC?
    
    // MARK: - SET DELEGATE
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    
    weak var delegate: DataInputTVCellDelegate? {
        didSet {
            dataInputText1Field.delegate = self
            dataInputText2Field.delegate = self
        }
    }

    override func awakeFromNib() {
       super .awakeFromNib()
        //place hodler text
       dataInputText1Field.placeholder = "incomeAmount".localize
        dataInputText2Field.placeholder = "voucherAmount".localize
    
        //font
        dataInputText1Field.font = UIFont(name: "Helvetica Neue", size:  17.0)
        dataInputText2Field.font = UIFont(name: "Helvetica Neue", size:  17.0)
    }
    
    // MARK: - ACTIONS
    

    @IBAction func dataInputButtonTapped(_ sender: Any) {
        
        // Call the delegate function
        // (Step 3 of 5 - 3 steps in child (this file), 2 in parent)
        
        delegate?.dataInputButtonTapped(self, dataInputText1Field, dataInputText2Field)
        
        // Reload view after changing input data
        self.superview?.reloadInputViews()
    }
}


// MARK: - CUSTOM PROTOCOL FOR DELEGATE

// Create custom protocol for delegate so we can collect data in custom view and pass it to view controller
// (Step 1 of 5 - 3 steps in child (this file), 2 in parent)

protocol DataInputTVCellDelegate: class {
    
    func dataInputButtonTapped(_ sender: DataInputTVCell, _ textField1: UITextField, _ textField2: UITextField)
}

extension DataInputTVCell : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}


