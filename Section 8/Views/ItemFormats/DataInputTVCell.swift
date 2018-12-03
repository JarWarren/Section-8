//
//  DataInputTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 12/3/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class DataInputTVCell: UITableViewCell {
    
    var delegate: DataInputTVCellDelegate?

    // MARK: - OUTLETS
    
    @IBOutlet weak var dataInputTitleLabel: UILabel!
    @IBOutlet weak var dataInputTextLabel: UILabel!
    @IBOutlet weak var dataInputText1Field: UITextField!
    @IBOutlet weak var dataInputText2Field: UITextField!
    @IBOutlet weak var dataInputButtonTextLabel: UIButton!
    
    // MARK: - ACTIONS
    
    @IBAction func dataInputButtonTapped(_ sender: Any) {
        delegate?.dataInputButtonTapped(self, dataInputText1Field, dataInputText2Field)
    }
}

protocol DataInputTVCellDelegate: class {
    func dataInputButtonTapped(_ sender: DataInputTVCell, _ textField1: UITextField, _ textField2: UITextField)
}
