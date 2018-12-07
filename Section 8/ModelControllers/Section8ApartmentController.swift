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
    var section8Apartments: [Section8Apartment] = {
        
        Section8ApartmentController.addNewApartment(name: "Maple Village Apartments", address: "445 E 500 S, American Fork, UT", phone: "801-756-5568", apartmentPhoto: "MapleVillage")
        Section8ApartmentController.addNewApartment(name: "Pioneer Villa Senior Community", address: "1495 S 1400 E, Spanish Fork, UT", phone: "801-798-7300", apartmentPhoto: "PioneerVillage")
        Section8ApartmentController.addNewApartment(name: "Canyon Breeze Senior Living", address: "380 E 240 N, Orem, UT", phone: "801-226-8338", apartmentPhoto: "CanyonBreeze")
        Section8ApartmentController.addNewApartment(name: "Orem HAUC", address: "596 N 1200, Orem, UT", phone: "(no number available)", apartmentPhoto: nil)
        Section8ApartmentController.addNewApartment(name: "Mountain View East Apartments", address: "273 N 1000 E, Payson, UT", phone: "801-465-3885", apartmentPhoto: "MountainViewEast")
        Section8ApartmentController.addNewApartment(name: "Grand Vista Senior Apartments", address: "620 E 100 N, Payson, UT", phone: "801-465-4973", apartmentPhoto: "GrandVista")
        Section8ApartmentController.addNewApartment(name: "Greenwood Manor", address: "215 N Center St, Lehi, UT", phone: "909-367-3887", apartmentPhoto: "GreenwoodManor")
        Section8ApartmentController.addNewApartment(name: "Diamond Fork Apartments", address: "312 N Diamond Fork Loop, Spanish Fork, UT", phone: "801-798-6066", apartmentPhoto: "DiamondFork")
        Section8ApartmentController.addNewApartment(name: "Mayflower Harbor", address: "4125 N 3250 W, Lehi, UT", phone: "801-768-0300", apartmentPhoto: "MayflowerHarbor")
        Section8ApartmentController.addNewApartment(name: "Spanish Fork HACU", address: "200 E 285 S, Spanish Fork, UT", phone: "(no number available)", apartmentPhoto: nil)
        Section8ApartmentController.addNewApartment(name: "Carillon Court", address: "24 E 1200 S, Orem, UT", phone: "(no number available)", apartmentPhoto: nil)
        Section8ApartmentController.addNewApartment(name: "Mountain View Apartments", address: "252 N 900 E, Payson, UT", phone: "801-465-3885", apartmentPhoto: "MountainView")
        Section8ApartmentController.addNewApartment(name: "Green Grove Apartments", address: "170 S Pleasant Grove Blvd, Pleasant Grove, UT", phone: "801-769-7000", apartmentPhoto: "GreenGrove")
        Section8ApartmentController.addNewApartment(name: "Springville 9 Plex", address: "210 E 300 S, Springville, UT", phone: "(no number available)", apartmentPhoto: nil)
    }
    
    // MARK: - ADD NEW APARTMENT FUNCTION
    
    static func addNewApartment(name: String, address: String, phone: String, apartmentPhoto: String) {
        let newApartment = Section8Apartment(name: name, address: address, phone: phone, apartmentPhoto: apartmentPhoto)
        self.section8Apartments.append(newApartment)
    }
}
