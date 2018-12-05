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
    
    // TODO: CRUD or something? Need to make marverView info available for persistance and other uses throughout the app.
    
    func save(apartment name: String, phone: String, address: String) {
        
        let newApartment = SelectedApartment(name: name, address: address, phone: phone)
        persistSelectedApartment(asJSON: newApartment)
    }
    
    private func persistSelectedApartment(asJSON apartment: SelectedApartment) {
        
        do {
            let apartmentJSON = try JSONEncoder().encode(apartment)
            
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
}

