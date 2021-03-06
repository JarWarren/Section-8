//
//  Step.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class Step: Codable {
    
    let name: String
    let stepNumber: String
    var stepCompleted: Bool
    let homeImageName: String
    let stepImageName: String
    
    var items: [Item] = []
    
    init(name: String, stepNumber: String, stepCompleted: Bool, homeImageName: String, stepImageName: String) {
        self.name = name
        self.stepNumber = stepNumber
        self.stepCompleted = stepCompleted
        self.homeImageName = homeImageName.lowercased()
        self.stepImageName = stepImageName.lowercased()
    }
}
