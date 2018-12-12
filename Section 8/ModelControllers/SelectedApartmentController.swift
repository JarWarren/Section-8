//
//  SelectedApartmentController.swift
//  Section 8
//
//  Created by Jared Warren on 12/5/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class SelectedApartmentController {
    
    static let shared = SelectedApartmentController()
    private init() {}
    
    var selectedApartment: SelectedApartment?
    
    // Called on Step 6 when a user taps "Call Apartment" and segues to Step 7. Makes their selected apartment available through persistence.
    func saveApartment(named name: String, phone: String, address: String, addressPart1: String, addressPart2: String, photoRef: String) {
        
        let newApartment = SelectedApartment(name: name, address: address, address1Split: addressPart1, address2Split: addressPart2, phone: phone, photoRef: photoRef)
        selectedApartment = newApartment
        persistSelectedApartment(asJSON: newApartment)
    }
    
    
    private func persistSelectedApartment(asJSON apartment: SelectedApartment) {
        do {
            let apartmentJSON = try JSONEncoder().encode(apartment)
            try apartmentJSON.write(to: fileURL())
        } catch {
            print("FAILED TO PERSIST SELECTED APARTMENT")
        }
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "SelectedApartment.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func loadSelectedApartment() {
        
        var selectedApartment: SelectedApartment?
        do {
            let apartmentJSON = try Data(contentsOf: fileURL())
            selectedApartment = try JSONDecoder().decode(SelectedApartment.self, from: apartmentJSON)
        } catch {
            print("FAILED TO LOAD PREVIOUSLY SELECTED APARTMENT")
        }
        self.selectedApartment = selectedApartment
        if let unwrapped = selectedApartment {
            StepController.shared.steps[6].items[3].text = "\(unwrapped.name)\n\(unwrapped.address1Split)\n\(unwrapped.address2Split)\n\(unwrapped.phone)"
            StepController.shared.steps[7].items[3].text = "\(unwrapped.name)\n\(unwrapped.address1Split)\n\(unwrapped.address2Split)\n\(unwrapped.phone)"
            StepController.shared.steps[10].items[3].text = "\(unwrapped.name)\n\(unwrapped.address1Split)\n\(unwrapped.address2Split)\n\(unwrapped.phone)"
            StepController.shared.steps[13].items[3].text = "\(unwrapped.name)\n\(unwrapped.address1Split)\n\(unwrapped.address2Split)\n\(unwrapped.phone)"
        } else {
            StepController.shared.steps[6].items[3].text = NSLocalizedString("7bText", comment: "")
            StepController.shared.steps[7].items[3].text = NSLocalizedString("8bText", comment: "")
            StepController.shared.steps[10].items[3].text = NSLocalizedString("11bText", comment: "")
            StepController.shared.steps[13].items[3].text = NSLocalizedString("14bText", comment: "")
        }
    }
}
