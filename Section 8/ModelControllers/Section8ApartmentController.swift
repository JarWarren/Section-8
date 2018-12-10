//
//  Section8ApartmentController.swift
//  Section 8
//
//  Created by Arkin Hill on 12/7/18.
//  Copyright © 2018 Warren. All rights reserved.
//

class Section8ApartmentController{

    // Shared instance
    static let shared = Section8ApartmentController()
    
    // Source of truth
    let section8Apartments: [Section8Apartment] = {
        
       var section8array = [Section8Apartment]()
        
        section8array.append(Section8Apartment(name: "Maple Village Apartments", address: "445 E 500 S, American Fork, UT", phone: "801-756-5568", lat: 40.367714, lng: -111.786957, apartmentPhoto: "MapleVillage"))
        section8array.append(Section8Apartment(name: "Pioneer Villa Senior Community", address: "1495 S 1400 E, Spanish Fork, UT", phone: "801-798-7300", lat: 40.092098, lng: -111.630714, apartmentPhoto: "PioneerVillage"))
        section8array.append(Section8Apartment(name: "Canyon Breeze Senior Living", address: "380 E 240 N, Orem, UT", phone: "801-226-8338", lat: 40.301651, lng: -111.687088, apartmentPhoto: "CanyonBreeze"))
        section8array.append(Section8Apartment(name: "Orem HAUC", address: "596 N 1200, Orem, UT", phone: "no number available", lat: 40.319454, lng: -111.709869))
        section8array.append(Section8Apartment(name: "Mountain View East Apartments", address: "273 N 1000 E, Payson, UT", phone: "801-465-3885", lat: 40.046314, lng: -111.716469, apartmentPhoto: "MountainViewEast"))
        section8array.append(Section8Apartment(name: "Grand Vista Senior Apartments", address: "620 E 100 N, Payson, UT", phone: "801-465-4973", lat: 40.044422, lng: -111.722282, apartmentPhoto: "GrandVista"))
        section8array.append(Section8Apartment(name: "Greenwood Manor", address: "215 N Center St, Lehi, UT", phone: "909-367-3887", lat: 40.390457, lng: -111.849358, apartmentPhoto: "GreenwoodManor"))
        section8array.append(Section8Apartment(name: "Diamond Fork Apartments", address: "312 N Diamond Fork Loop, Spanish Fork, UT", phone: "801-798-6066", lat: 40.113869, lng: -111.634071, apartmentPhoto: "DiamondFork"))
        section8array.append(Section8Apartment(name: "Mayflower Harbor", address: "4125 N 3250 W, Lehi, UT", phone: "801-768-0300", lat: 40.438168, lng: -111.901726, apartmentPhoto: "MayflowerHarbor"))
        section8array.append(Section8Apartment(name: "Spanish Fork HACU", address: "200 E 285 S, Spanish Fork, UT", phone: "no number available", lat: 40.112701, lng: -111.649986))
        section8array.append(Section8Apartment(name: "Carillon Court", address: "24 E 1200 S, Orem, UT", phone: "no number available", lat: 40.275127, lng: -111.694595))
        section8array.append(Section8Apartment(name: "Mountain View Apartments", address: "252 N 900 E, Payson, UT", phone: "801-465-3885", lat: 40.045910, lng: -111.716881, apartmentPhoto: "MountainView"))
        section8array.append(Section8Apartment(name: "Green Grove Apartments", address: "170 S Pleasant Grove Blvd, Pleasant Grove, UT", phone: "801-769-7000", lat: 40.362015, lng: -111.755592, apartmentPhoto: "GreenGrove"))
        section8array.append(Section8Apartment(name: "Springville 9 Plex", address: "210 E 300 S, Springville, UT", phone: "(no number available)", lat: 40.049660, lng: -111.669456))
        
        return section8array
    }()
}
