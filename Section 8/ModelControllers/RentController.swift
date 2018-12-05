//
//  RentController.swift
//  Section 8
//
//  Created by Arkin Hill on 12/5/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class RentController {
    
    // Shared instance
    static let shared = RentController()
    
    // Source of truth
    var rent: Rent?
    
    // MARK: MAX RENT FUNCTION
    
    // Maxiumum rent = 40% of householdIncome + voucher amount - utility allowance
    
    func createMaxRent(householdIncome: Int, voucherAmount: Int) {
        rent = Rent(householdIncome: householdIncome, voucherAmount: voucherAmount)
        saveToPersistentStorage()
    }
    
    // MARK: - PERSISTENCE
    
    // URL
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "rent.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    // Fetch from URL
    func loadFromPersistentStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let rent = try decoder.decode(Rent.self, from: data)
            self.rent = rent
        } catch let error {
            print(error)
        }
    }
    
    // Save to URL
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(rent)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
}


