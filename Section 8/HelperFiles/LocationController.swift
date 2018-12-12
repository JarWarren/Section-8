//
//  locationController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/10/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications


class LocationController {
    
    private let utahCountyHousingID = "uCountyHousinginProvo"
    private let utahCountyHousingRequestID = "uCountyHousinginProvoRequestID"
    private let utahCountyHousingLatitude = 51.50998
    //40.233250
    private let utahCountyHousingLongitude = -0.1337
        //-111.654472
    private let desiredRadius = 60.96
    private let locationManger = CLLocationManager()
    //
    
//    let locationNotification = UNLo
    
    func utahCountyLocationNotification() {
        
        
        
        print("🚀🚀🚀utahCountyLocationNotification was called")
        // NOTE: - Not sure if the 2 lines of code belong here
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        
        let content = UNMutableNotificationContent()
        content.title = "You Got This"
        content.body = "Dont Froget to ask questions at today's visit"
        content.sound = UNNotificationSound.default
        
        let center = CLLocationCoordinate2D(latitude: utahCountyHousingLatitude, longitude: utahCountyHousingLongitude)
        
        let region = CLCircularRegion(center: center, radius: desiredRadius, identifier: utahCountyHousingID)
        
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(identifier: utahCountyHousingRequestID, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("There was an error in \(#function) ; (error) ; \(error.localizedDescription)")
            }
        }
    }
}
