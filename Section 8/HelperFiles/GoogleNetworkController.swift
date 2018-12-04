//
//  GoogleNetworkController.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation // UIKit
import GoogleMaps

class GoogleNetworkController {
    
//    private var urlSessionDataTask: URLSessionDataTask?
//    private var urlSession: URLSession {
//        return URLSession.shared }
    
    typealias Name = String
    typealias Address = String
    typealias PhoneNumber = String
    
    static func fetchNearbyComplexes(completion: @escaping ([ApartmentLocation]) -> Void) {
        
        guard let mainURL = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=springville%20apartments&location=40.0966,-111.5707&radius=30000&key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE") else { completion([]); return }
        
        //TODO: &language=en || &language=es || &language=pt
        //TODO: Attempt placeSearch or nearbySearch rather than textSearch.
        
        let dataTask = URLSession.shared.dataTask(with: mainURL) { (data, _, error) in
            if let error = error { print("Responded with error: \(error)."); completion([]); return }
            guard let data = data else { print("No data."); completion([]); return }
            do {
                let decodedData = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                print(decodedData)
                completion(decodedData.results)
            } catch {
                print("BAD DECODE")
            }
        }
        dataTask.resume()
    }
    
    static func fetchPlaceDetails(placeID: String, completion: @escaping (Name, PhoneNumber, Address) -> Void) {
        
        guard let mainURL = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE&placeid=\(placeID)&fields=formatted_phone_number,formatted_address,name") else { completion("","",""); return }
        
        let dataTask = URLSession.shared.dataTask(with: mainURL) { (data, _, error) in
            if let error = error { print("Responded with error: \(error)."); completion("","",""); return }
            guard let data = data else { print("No data."); completion("","",""); return }
            do {
                let decodedData = try JSONDecoder().decode(TopLevelPhoneBook.self, from: data)
                let phone = decodedData.result.phoneNumber
                let address = decodedData.result.address
                let name = decodedData.result.name
                print("\n👾\(name)\n📞\(phone)\n📘\(address)")
                completion(name, phone, address)
            } catch {
                print("BAD DETAILS DECODE")
            }
        }
        dataTask.resume()
    }
}

//TODO: Embed APIkey in propertyList.

// SEARCH COMPLEXES
// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.0966,-111.5707&radius=1000&rankby=prominence&sensor=true&key=AIzaSyBb8WDOGylLfL6-texYep4nyzz_FzgzMHQ&types=food


// FIND PHOTO FROM REFERENCE
// https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=\(reference)&key=AIzaSyBb8WDOGylLfL6-texYep4nyzz_FzgzMHQ

//https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE&placeid=ChIJH5oAJvmDTYcRzb93-p3tQgk&fields=formatted_phone_number
