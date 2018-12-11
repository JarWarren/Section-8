//
//  UIButton+Extensions.swift
//  Section 8
//
//  Created by Arkin Hill on 12/10/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = UIColor(named: "highlightColor")
            } else {
                self.backgroundColor = UIColor(named: "mainColor")
            }
        }
    }
}
