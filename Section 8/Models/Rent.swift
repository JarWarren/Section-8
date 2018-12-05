//
//  Rent.swift
//  Section 8
//
//  Created by Arkin Hill on 12/5/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class Rent: Codable {
    
    var householdIncome: Int
    var voucherAmount: Int
    
    init(householdIncome: Int, voucherAmount: Int) {
        self.householdIncome = householdIncome
        self.voucherAmount = voucherAmount
    }
    
    // Computed property
    var maxRent: Int {
        let utilityAllowance: Int = 200
        let percenthouseholdIncome = householdIncome * 4 / 10
        let maxRent = percenthouseholdIncome + voucherAmount - utilityAllowance
        
        return maxRent
    }
}
