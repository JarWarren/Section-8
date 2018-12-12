//
//  DataInputTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 12/3/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DataInputTVCell: UITableViewCell {
    
    static let shared = DataInputTVCell()
    
    // MARK: - SET DELEGATE
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    
    weak var delegate: DataInputTVCellDelegate? {
        didSet {
            dataInputText1Field.delegate = self
            dataInputText2Field.delegate = self
        }
    }
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var dataInputTitle1Label: UILabel!
    @IBOutlet weak var dataInputText1Label: UILabel!
    @IBOutlet weak var dataInputText1Field: UITextField!
    @IBOutlet weak var dataInputTitle2Label: UILabel!
    @IBOutlet weak var dataInputText2Label: UILabel!
    @IBOutlet weak var dataInputText2Field: UITextField!
    @IBOutlet weak var dataInputButtonTextLabel: UIButton!
    
    // MARK: - Life Cyle
    override func awakeFromNib() {
        print("\nAwake from nib\n")
    }
    
    
    // MARK: - ACTIONS
    
    
    // Keyboard
    @objc func keyboardWillChange(notificatin: Notification) {
        print("\nKeyboard will show: \(notificatin.name.rawValue)\n")
        
        
        
    }
    
    func random(){
        
    }
    
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
