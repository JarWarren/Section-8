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
    let photos: [PhotoDictionary]?
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

struct PhotoDictionary: Decodable {
    let photo_reference: String
}

struct PlaceDetail: Decodable {
    let photos: [PhotoDictionary]
}
