//
//  AlarmController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/4/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class AlarmController {
    
    static let shared = AlarmController()
    
    func buttonPropertiesToggled(comparisonBool: Bool, trueCaseButton: UIButton, trueCaseButtonTitle: String, falseCaseButton: UIButton, falseCaseButtonTitle: String){
        switch comparisonBool {
        case true:
            trueCaseButton.setTitle(trueCaseButtonTitle, for: .normal)
        case false:
            falseCaseButton.setTitle(falseCaseButtonTitle, for: .normal)
        }
    }
}
