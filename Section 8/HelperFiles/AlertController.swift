//
//  AlertController.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/1/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class AlertControllerManager {
    
    static func presentAlertControllerWith(title: String, message: String?) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        [dismissAction].forEach { alertController.addAction($0) }
        
        return alertController
    }
}

// present(alertController, animated:  true, completion: nil)
