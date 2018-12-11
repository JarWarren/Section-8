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
    var phone: String
//    var apartmentPhoto: String
    
/*
     var rating: Int
     var open_hours: String
     var etc: OtherFieldsWeFindUseful
*/
    
    init(name: String, address: String, phone: String) { //ADD: apartmentPhoto: String,
    
        self.name = name
        self.address = address
        self.phone = phone
//        self.apartmentPhoto = apartmentPhoto
    }
}
