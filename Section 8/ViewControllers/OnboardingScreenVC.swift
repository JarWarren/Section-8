//
//  OnboardingScreenVC.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/10/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications



class OnboardingScreenVC: UIViewController, CLLocationManagerDelegate {
    
    private let locationManger = CLLocationManager()
    private let geocoder = CLGeocoder()
    private let center = UNUserNotificationCenter.current()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            
            locationManger.requestAlwaysAuthorization()
            
        case .restricted:
            let restrictedAlert = AlertControllerManager.presentAlertControllerWith(title: "Location Services Disabled", message: "This device is not alllowed to use location services.")
            present(restrictedAlert, animated:  true, completion: nil)
            print("Users location is restricted")
            
        case .denied:
            let deniedAlert = AlertControllerManager.presentAlertControllerWith(title: "Location Services Denied", message: " Section 8 app needs your location in order to properly display notification. If you wish to later change this it can be done in your phones settings.")
            present(deniedAlert, animated:  true, completion: nil)
            print("User denied access to use their location")
            
        case .authorizedWhenInUse:
            print("user granted authorizedWhenInUse")
            
        case .authorizedAlways:
            print("user selected authorizedAlways")

        default:
            break
        }
        locationManger.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
