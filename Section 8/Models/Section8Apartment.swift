//
//  Section8Apartment.swift
//  Section 8
//
//  Created by Arkin Hill on 12/7/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class Section8Apartment {
    
    var name: String
    var address: String
    
    // Address split into two strings
    var address1Split: String
    var address2Split: String
    
    var phone: String
    var lat: Double
    var lng: Double
    var apartmentPhoto: String
    var googlePlaceID: String
    var googlePhotoReferences: [String]?
    var googleImagesArray: [UIImage]?
    
    init(name: String, address: String, address1Split: String, address2Split: String, phone: String, lat: Double, lng: Double, apartmentPhoto: String = "noApartmentImage", googlePlaceID: String) {
        self.name = name
        self.address = address
        self.address1Split = address1Split
        self.address2Split = address2Split
        self.phone = phone
        self.lat = lat
        self.lng = lng
        self.apartmentPhoto = apartmentPhoto
        self.googlePlaceID = googlePlaceID
    }
}
