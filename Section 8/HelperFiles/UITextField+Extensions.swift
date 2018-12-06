//
//  UITextField+Extensions.swift
//  Section 8
//
//  Created by Arkin Hill on 12/5/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

import UIKit

// Allows you to select any UITextField in the storyboard editor, there will be a new item under the ‘Attributes Inspector’ for that UITextField, where you can set ‘Done Access…’ On, Off or default. Choose ‘On’ if you want the ‘Done’ button to show up.

extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
