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
    
    typealias PhotoReference = String
    
    // Each of our offline apartments has a Google Place ID. This method takes the Place ID and returns references for everey associated photo.
    static func fetchPlaceDetails(placeID: String, completion: @escaping ([PhotoReference]) -> Void) {
        
        guard let mainURL = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE&placeid=\(placeID)&fields=photo") else { completion([""]); return }
        
        let dataTask = URLSession.shared.dataTask(with: mainURL) { (data, _, error) in
            if let error = error { print("Responded with error: \(error)."); completion([""]); return }
            guard let data = data else { print("No data."); completion([""]); return }
            do {
                let decodedData = try JSONDecoder().decode(TopLevelPhoneBook.self, from: data)
                let photoBook = decodedData.result.photos
                var photoReferences = [PhotoReference]()
                for reference in photoBook {
                    print("Image")
                    let newReference = reference.photo_reference
                    photoReferences.append(newReference)
                }
                print("\n👾\(placeID)👾\n")
                completion(photoReferences)
            } catch {
                print("Non-image result.")
            }
        }
        dataTask.resume()
    }
    
    // Takes in one photo reference and returns a photo from Google.
    static func fetchPlaceImage(photoReference: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let mainURL = URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=\(photoReference)&key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE") else { completion(nil); return }
        
        let dataTask = URLSession.shared.dataTask(with: mainURL) { (data, _, error) in
            if let error = error { print("IMAGE ERROR: \(error)"); completion(nil); return }
            guard let data = data else { completion(nil); return }
            
            let apartmentImage = UIImage(data: data)
            completion(apartmentImage)
        }
        dataTask.resume()
    }
}

//TODO: Embed APIkey in propertyList.
