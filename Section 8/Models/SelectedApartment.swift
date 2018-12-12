//
//  SelectedApartment.swift
//  Section 8
//
//  Created by Jared Warren on 12/5/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class SelectedApartment: Codable {
    
    var name: String
    var address: String
    
    // Address split into two strings
    var address1Split: String
    var address2Split: String
    
    var phone: String
    var photoRef: String?
    
    init(name: String, address: String, address1Split: String, address2Split: String, phone: String, photoRef: String? = "noApartmentImage") {
    
        self.name = name
        self.address = address
        self.address1Split = address1Split
        self.address2Split = address2Split
        self.phone = phone
        self.photoRef = photoRef
    }
}
