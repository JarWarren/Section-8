//
//  ApartmentComplexMarker.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ApartmentComplexMarker: GMSMarker {
    
    let apartmentLocation: ApartmentLocation
    let phoneNumber: String?
    init(apartmentLocation: ApartmentLocation, phoneNumber: String? = nil) {
        
        self.apartmentLocation = apartmentLocation
        self.phoneNumber = phoneNumber
        
        super.init()
        
        self.tracksInfoWindowChanges = true
        self.position = CLLocationCoordinate2D(latitude: apartmentLocation.geometry.location.lat, longitude: apartmentLocation.geometry.location.lng)
        self.title = apartmentLocation.name
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
        //        icon = UIImage(named: "")
    }
}

//TODO: Pass info from tapped marker into another file.
