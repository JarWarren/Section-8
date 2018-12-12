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
    
    var locationController: LocationController?
    
    private let locationManger = CLLocationManager()
    private let center = UNUserNotificationCenter.current()
    private let deniedBoolKey = "disabledDeniedAlertBool"
    private let restrictedBoolKey = "disabledRestrictedAlertBool"
    private var disableDeniedAlertBool = false
    private var disableRestrictedAlertBool = false
    private let utahCountyHousingLatitude = 51.50998
    private let utahCountyHousingLongitude = -0.1337
    private let desiredRadius = 60.96
    private let utahCountyHousingID = "uCountyHousinginProvo"
    private let utahCountyHousingRequestID = "uCountyHousinginProvoRequestID"
    // MARK: - Life cyles
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDefaults()
        
        locationManger.delegate = self
//        37.33477977 -122.03369603
        // NOTE: - The lines of code below, i put in in order to test the location tracking
        let center = CLLocationCoordinate2D(latitude: utahCountyHousingLatitude, longitude: utahCountyHousingLongitude)
        
        let utahHousingActualregion = CLCircularRegion(center: center, radius: desiredRadius, identifier: utahCountyHousingID)
        
        locationManger.startMonitoring(for: utahHousingActualregion)
     
                locationManger.desiredAccuracy = kCLLocationAccuracyBest
                locationManger.distanceFilter = 10
        
        // local notification
        // NOTE: - this needs to be called somehow, perhaps in a button 
         locationController?.utahCountyLocationNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Notification Permission
        // User Notifcation
        // NOTE: - Ben from class suggested we educate the user and ask them to allow notifications before they are given the option to grant/deny permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted {
                print("Permission for notification was granted by the user")
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
            switch CLLocationManager.authorizationStatus() {
                
            case .notDetermined:
                
                self.locationManger.requestAlwaysAuthorization()
                
            default:
                break
            }
            
        }
        locationManger.startUpdatingLocation()
    }
    //Delete this test comment
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            
            if disableRestrictedAlertBool == false {
                disableRestrictedAlertBool = true
                
                UserDefaults.standard.set(disableRestrictedAlertBool, forKey: restrictedBoolKey)
                
                let restrictedAlertController = UIAlertController(title: "Location Services Denied", message: "This device is not alllowed to use location services. Section 8 app needs your location in order to properly display notification. If you wish to later change this it can be done in your phones settings.", preferredStyle: .alert)
                
                let dismissAction = UIAlertAction(title: "OK", style: .cancel) { (alert) in
                    self.presentMainView()
                }
                
                [dismissAction].forEach { restrictedAlertController.addAction($0)}
                
                present(restrictedAlertController, animated: true)
            }
            else {
                presentMainView()
            }
            print("\nUsers location is restricted")
            
        case .denied:
            
            if disableDeniedAlertBool == false {
                disableDeniedAlertBool = true
                
                UserDefaults.standard.set(disableDeniedAlertBool, forKey: deniedBoolKey)
                
                let deniedAlertController = UIAlertController(title: "Location Services Denied", message: "Section 8 app needs your location in order to properly display notification. If you wish to allow loaction services it can be done in your phone's settings.", preferredStyle: .alert)
                
                let dismissAction = UIAlertAction(title: "OK", style: .cancel) { (alert) in
                    self.presentMainView()
                }
                
                [dismissAction].forEach { deniedAlertController.addAction($0)}
                
                present(deniedAlertController, animated: true)
            }
            else {
                presentMainView()
            }
            print("\nUser denied access to use their location\n")
            
        case .authorizedWhenInUse:
            print("\nuser granted authorizedWhenInUse\n")
            presentMainView()
            
        case .authorizedAlways:
            print("\nuser selected authorizedAlways\n")
            presentMainView()
        default: break
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("\n🚨\(locationManger.monitoredRegions)")
    }
    
    func loadUserDefaults() {
        disableDeniedAlertBool = UserDefaults.standard.bool(forKey: deniedBoolKey)
        disableRestrictedAlertBool = UserDefaults.standard.bool(forKey: restrictedBoolKey)
    }
    
    // Segue programatically to home view controller
    func presentMainView() {
        let homeTVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        present(homeTVC, animated: true, completion: nil)
    }
 
}
extension OnboardingScreenVC {
    
    // MARK: - Location Delegate Functions
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        print("🚨🌎User Entered location")
        
       
        
        let content = UNMutableNotificationContent()
        content.title = "You Got This"
        content.body = "Dont Froget to ask questions at today's visit"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

        let request = UNNotificationRequest(identifier: "Hey", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("There was an error in \(#function) ; (error) ; \(error.localizedDescription)")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("🌎The monitored regions are: \(manager.monitoredRegions)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("🌎locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

extension OnboardingScreenVC {
    
    // MARK: - Notification Delegate Functions for testing
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
}
