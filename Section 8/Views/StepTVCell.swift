//
//  StepTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class StepTVCell: UITableViewCell {
    
    // MARK: - LANDING PAD
    
    var step: Step?
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var checkBoxView: UIImageView!
    
}
