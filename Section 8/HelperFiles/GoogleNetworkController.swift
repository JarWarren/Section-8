//
//  GoogleNetworkController.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation // UIKit

class GoogleNetworkController {
    
//    private var urlSessionDataTask: URLSessionDataTask?
//    private var urlSession: URLSession {
//        return URLSession.shared }
    
    static func fetchNearbyComplexes(completion: @escaping ([ApartmentLocation]) -> Void) {
        
        guard let mainURL = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=apartment&location=40.0966,-111.5707&radius=50000&key=AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE") else { completion([]); return }
        
        //TODO: &language=en || &language=es || &language=pt
        
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
}

// SEARCH COMPLEXES
// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.0966,-111.5707&radius=1000&rankby=prominence&sensor=true&key=AIzaSyBb8WDOGylLfL6-texYep4nyzz_FzgzMHQ&types=food


// FIND PHOTO FROM REFERENCE
// https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=\(reference)&key=AIzaSyBb8WDOGylLfL6-texYep4nyzz_FzgzMHQ
