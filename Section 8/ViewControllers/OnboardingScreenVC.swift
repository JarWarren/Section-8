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


//homeTVC
class OnboardingScreenVC: UIViewController, CLLocationManagerDelegate, UNUserNotificationCenterDelegate {
    
    private let locationManger = CLLocationManager()
    private let geocoder = CLGeocoder()
    private let center = UNUserNotificationCenter.current()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManger.delegate = self
        
        // Notification Permission
        // User Notifcation
        // NOTE: - Ben from class suggested we educate the user and ask them to allow notifications before they are given the option to grant/deny permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted {
                print("Permission for notificationw as granted by the user")
                UNUserNotificationCenter.current().delegate = self
                
                
            }
            // Access granted
            if let error = error {
                print("There was an error in \(#function) ; (error) ; \(error.localizedDescription)")
            }
            // Access to use notification was denied
            if !granted {
                print("Notification Access Denied")
            }
        }
        
        // Location Permission
        //Initial checking, the first time they load the app. CHeck than it will break to the default
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            
            locationManger.requestAlwaysAuthorization()
            
        default:
            presentMainView()
        }
        locationManger.startUpdatingLocation()
    }
    
    
    // delegate
    
    // This is one is responding to the "yes"/ "No"s that the user taps on
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            let restrictedAlert = AlertControllerManager.presentAlertControllerWith(title: "Location Services Disabled", message: "This device is not alllowed to use location services.")
            present(restrictedAlert, animated: true) {
                self.presentMainView()
            }
            print("Users location is restricted")
            
        case .denied:
            let deniedAlert = AlertControllerManager.presentAlertControllerWith(title: "Location Services Denied", message: " Section 8 app needs your location in order to properly display notification. If you wish to later change this it can be done in your phones settings.")
            present(deniedAlert, animated:  true) {
                self.presentMainView()
            }
            print("User denied access to use their location")
            
        case .authorizedWhenInUse:
            print("user granted authorizedWhenInUse")
            presentMainView()
        case .authorizedAlways:
            print("user selected authorizedAlways")
            presentMainView()
        default: presentMainView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // Ivan - Not sure what this does just yet
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Test: \(response.notification.request.identifier)")
        
        defer {
            completionHandler()
        }
        
        switch response.actionIdentifier {
            //The action that indicates the user explicitly dismissed the notification interface.
        //This action is delivered only if the notification’s category object was configured with the customDismissAction option.
        case UNNotificationDismissActionIdentifier:
            print( "User tapped dismissed the notification")
        //An action that indicates the user opened the app from the notification interface.
        case UNNotificationDefaultActionIdentifier:
            print("user segued into the app")
        default:
            break
        }
    }
    
    func presentMainView() {
        let homeTVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        present(homeTVC, animated: true, completion: nil)
    }
}
