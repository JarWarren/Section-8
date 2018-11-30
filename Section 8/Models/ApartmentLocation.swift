//
//  ApartmentLocation.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation // UIKit
import CoreLocation

struct ApartmentLocation: Decodable {
    
    let name: String
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
