//
//  LocalizationController.swift
//  Section 8
//
//  Created by Jared Warren on 12/11/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class LocalizationController {
    
    let langChangedNotif = Notification.Name("langChangedNotif")
    
    static let shared = LocalizationController()
    private init() {}
    
    var activeLanguage: [String] = {
        let language = NSLocale.preferredLanguages
        
        switch true {
            
        case language.first?.prefix(2) == "pt" :
            return ["pt-BR"]
            
        case language.first?.prefix(2) == "es" :
            return ["es-419"]
            
        default:
            return ["\(String(describing: NSLocale.preferredLanguages.first))"]
            
        }
    }()
    
    func setToEnglish() {
        LocalizationController.shared.activeLanguage = ["en"]
        print("🇺🇸")
    }
    
    func establecerEnEspañol() {
        LocalizationController.shared.activeLanguage = ["es-419"]
        print("🇲🇽")
    }
    
    func definirParaOPortuguês() {
        LocalizationController.shared.activeLanguage = ["pt-BR"]
        print("🇧🇷")
    }
    
    func saveLanguage() {
        do {
            let savedLanguage = try JSONEncoder().encode(self.activeLanguage)
            try savedLanguage.write(to: fileURL())
        } catch {
            print("\(error, error.localizedDescription)")
        }
    }
    
    func loadLanguage() {
        do {
            let decodedLanguage = try JSONDecoder().decode([String].self, from: Data(contentsOf: fileURL()))
            self.activeLanguage = decodedLanguage
        } catch {
            print("Language set to English.")
        }
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "ActiveLanguage.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
}

public extension String {
    
    var localize: String {
        LocalizationController.shared.loadLanguage()
        let path = Bundle.main.path(forResource: LocalizationController.shared.activeLanguage[0], ofType: "lproj")
        let localizedBundle = Bundle(path: path ?? Bundle.main.path(forResource: "en", ofType: "lproj")!)
        return NSLocalizedString(self, tableName: nil, bundle: localizedBundle!, value: "", comment: "")
    }
}
