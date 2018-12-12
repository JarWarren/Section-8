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
    @IBOutlet weak var dataInputTitle2Label: UILabel!
    @IBOutlet weak var dataInputText2Label: UILabel!
    @IBOutlet weak var dataInputText2Field: UITextField!
    @IBOutlet weak var dataInputButtonTextLabel: UIButton!
    
    static let shared = DataInputTVCell()
    weak var stepDetailVC: StepDetailTVC?
    
    // MARK: - SET DELEGATE
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    
    weak var delegate: DataInputTVCellDelegate? {
        didSet {
            dataInputText1Field.delegate = self
            dataInputText2Field.delegate = self
        }
    }
    // MARK: - Life Cyle
    override func awakeFromNib() {
        print("\nDataInputTVCell Awake from nib\n")
        
        //Listening for certain events related to the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificatin:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificatin:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificatin:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //Stop listening for certain events reltated to the keybaord such as hide/show
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
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
    
    
    // Keyboard
    @objc func keyboardWillChange(notificatin: Notification) {
        print("\n ✈️ Keyboard will show: \(notificatin.name.rawValue)\n")
        
        print("🎢 Before the Change: \(String(describing: stepDetailVC?.view.frame.origin.y))")
        
        
        self.stepDetailVC?.view.frame.origin.y = -3000
        
        
        print("🚧 View's Frame Origin: \(stepDetailVC?.view.frame.origin as Any)")
        
        print("🚢 After the change: \(String(describing: stepDetailVC?.view.frame.origin.y))")
    }
    
    
    // keyboard does not pop up all the way
//        @objc func keyboardWillShow(notification: NSNotification) {
    //        //The key for an NSValue object containing a CGRect that identifies the starting frame rectangle of the keyboard in screen coordinates. The frame rectangle reflects the current orientation of the device.
//            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//                UIView.animate(withDuration: 1) {
//
//                    self.stepDetailVC?.view.bounds.origin.y += keyboardSize.height
//                }
//
//            }
//        }
}


