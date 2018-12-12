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
        
        section8array.append(Section8Apartment(name: "Maple Village Apartments", address: "445 E 500 S, American Fork, UT", address1Split: "445 E 500 S", address2Split: "American Fork, UT", phone: "801-756-5568", lat: 40.367714, lng: -111.786957, apartmentPhoto: "MapleVillage", googlePlaceID: "ChIJ6-OJBWCBTYcRf84PYNCO2YU"))
        
        section8array.append(Section8Apartment(name: "Pioneer Village Senior Community", address: "1495 S 1400 E, Spanish Fork, UT", address1Split: "1495 S 1400 E", address2Split: "Spanish Fork, UT", phone: "801-798-7300", lat: 40.092098, lng: -111.630714, apartmentPhoto: "PioneerVillage", googlePlaceID: "ChIJq0naMZu8TYcRk8pVKHixnUw"))
        
        section8array.append(Section8Apartment(name: "Canyon Breeze Senior Living", address: "380 E 240 N, Orem, UT", address1Split: "380 E 240 N", address2Split: "Orem, UT", phone: "801-226-8338", lat: 40.301651, lng: -111.687088, apartmentPhoto: "CanyonBreeze", googlePlaceID: "ChIJuzN-WLaaTYcRJ5CWKfi2KWc"))
        
        section8array.append(Section8Apartment(name: "Orem HAUC", address: "596 N 1200, Orem, UT", address1Split: "596 N 1200", address2Split: "Orem, UT", phone: "no number available", lat: 40.319454, lng: -111.709869, googlePlaceID: "Eh81OTYgMTIwMCBXLCBPcmVtLCBVVCA4NDA1NywgVVNBIhsSGQoUChIJqSs6y9GETYcRdmD4IK5mwe4Q1AQ"))
        
        section8array.append(Section8Apartment(name: "Mountain View East Apartments", address: "273 N 1000 E, Payson, UT", address1Split: "273 N 1000 E", address2Split: "Payson, UT", phone: "801-465-3885", lat: 40.046314, lng: -111.716469, apartmentPhoto: "MountainViewEast", googlePlaceID: "ChIJ33foUF6kTYcRc0hhzPsgdBA"))
        
        section8array.append(Section8Apartment(name: "Grand Vista Senior Apartments", address: "620 E 100 N, Payson, UT", address1Split: "620 E 100 N", address2Split: "Payson, UT", phone: "801-465-4973", lat: 40.044422, lng: -111.722282, apartmentPhoto: "GrandVista", googlePlaceID: "ChIJx-0vV1ykTYcRr9IL8gW4r7k"))
        
        section8array.append(Section8Apartment(name: "Greenwood Manor", address: "215 N Center St, Lehi, UT", address1Split: "215 N Center St", address2Split: "Lehi, UT", phone: "909-367-3887", lat: 40.390457, lng: -111.849358, apartmentPhoto: "GreenwoodManor", googlePlaceID: "ChIJbQBcdtOBTYcR5p5ZolLmnkg"))
        
        section8array.append(Section8Apartment(name: "Diamond Fork Apartments", address: "312 N Diamond Fork Loop, Spanish Fork, UT", address1Split: "312 N Diamond Fork Loop", address2Split: "Spanish Fork, UT", phone: "801-798-6066", lat: 40.113869, lng: -111.634071, apartmentPhoto: "DiamondFork", googlePlaceID: "ChIJgbUwWwa4TYcRfYzxPSdUUhc"))
        
        section8array.append(Section8Apartment(name: "Mayflower Harbor", address: "4125 N 3250 W, Lehi, UT", address1Split: "4125 N 3250 W", address2Split: "Lehi, UT", phone: "801-768-0300", lat: 40.438168, lng: -111.901726, apartmentPhoto: "MayflowerHarbor", googlePlaceID: "ChIJwWeG-zSAUocRl03mqWHorIM"))
        
        section8array.append(Section8Apartment(name: "Spanish Fork HAUC", address: "200 E 285 S, Spanish Fork, UT", address1Split: "200 E 285 S", address2Split: "Spanish Fork, UT", phone: "no number available", lat: 40.112701, lng: -111.649986, googlePlaceID: "ChIJkfiBxju9TYcRfyymAo-W5Lc"))
        
        section8array.append(Section8Apartment(name: "Carillon Court", address: "24 E 1200 S, Orem, UT", address1Split: "24 E 1200 S", address2Split: "Orem, UT", phone: "no number available", lat: 40.275127, lng: -111.694595, googlePlaceID: "ChIJ_8NKy_OaTYcRPU7eejLS548"))
        
        section8array.append(Section8Apartment(name: "Mountain View Apartments", address: "252 N 900 E, Payson, UT", address1Split: "252 N 900 E", address2Split: "Payson, UT", phone: "801-465-3885", lat: 40.045910, lng: -111.716881, apartmentPhoto: "MountainView", googlePlaceID: "ChIJ33foUF6kTYcRc0hhzPsgdBA"))
        
        section8array.append(Section8Apartment(name: "Green Grove Apartments", address: "170 S Pleasant Grove Blvd, Pleasant Grove, UT", address1Split: "170 S Pleasant Grove Blvd", address2Split: "Pleasant Grove, UT", phone: "801-769-7000", lat: 40.362015, lng: -111.755592, apartmentPhoto: "GreenGrove", googlePlaceID: "ChIJ3bloCAaETYcRLxJTCRVQhf0"))
        
        section8array.append(Section8Apartment(name: "Springville 9 Plex", address: "210 E 300 S, Springville, UT", address1Split: "210 E 300 S", address2Split: "Springville, UT", phone: "no number available", lat: 40.049660, lng: -111.669456, googlePlaceID: "EicyMTAgRSAzMDAgUywgU3ByaW5ndmlsbGUsIFVUIDg0NjYzLCBVU0EiGxIZChQKEglXi6lQj71NhxGgftpEL-byrBDSAQ"))
        
        return section8array
    }()
}
