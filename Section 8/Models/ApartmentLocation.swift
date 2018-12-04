//
//  ApartmentLocation.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation // UIKit
import CoreLocation
import GoogleMaps

struct ApartmentLocation: Decodable {
    
    let name: String
    let place_id: String
    let geometry: GeometryDictionary
}

struct TopLevelDictionary: Decodable {
    let results: [ApartmentLocation]
}

struct GeometryDictionary: Decodable {
    let location: LocationDictionary
}

struct LocationDictionary: Decodable {
    let lat: Double
    let lng: Double
}

struct TopLevelPhoneBook: Decodable {
    let result: PlaceDetail
}

struct PlaceDetail: Decodable {
    let phoneNumber: String
    let address: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "formatted_phone_number"
        case address = "formatted_address"
        case name = "name"
    }
}
