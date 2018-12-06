//
//  AppDelegate.swift
//  Section 8
//
//  Created by Jared Warren on 11/27/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import GoogleMaps
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Google Maps
        GMSServices.provideAPIKey("AIzaSyAchY5OHlVXXQyaux0dO-kM0gVQz0T0rzE")
        StepController.shared.loadCompletedSteps()
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
         
        return true
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
            print("/n🥶 dissmiss action tapped on the pop up notifcation/n")
            //An action that indicates the user opened the app from the notification interface.
        case UNNotificationDefaultActionIdentifier:
            print("\n😜 UNNotificationDefaultActionIdentifier: User Tapped the Title area of the notifcation and was segued to the app \n")
        case "EditNotifID":
            print("\nUser Tapped on the edit option on the date picker notification")
        default:
            print("\nUser Tapped The Dississ Button")
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        application.applicationIconBadgeNumber = 0;

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

