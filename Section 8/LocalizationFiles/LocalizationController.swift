//
//  LocalizationController.swift
//  Section 8
//
//  Created by Jared Warren on 12/11/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class LocalizationHelper {
    
    static let shared = LocalizationHelper()
    private init() {}
    
    var activeLanguage: String = {
        if let preferred = NSLocale.preferredLanguages.first {
            print(preferred)
            return preferred
        } else {
            return "en"
        }
    }()
}

/*
 In general, you should not change the iOS system language (via use of the AppleLanguages pref key) from within your application.
 This goes against the basic iOS user model for switching languages in the Settings app.
 It also uses a preference key that is not documented, meaning that at some point in the future, the key name could change, which would break your application.
 */
