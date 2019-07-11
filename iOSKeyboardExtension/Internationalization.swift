//
//  Internationalization.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.01.17.
//
//

import Foundation

struct Internationalize {
    internal static var updates: [() -> Void] = []
    
    static func setString(_ update: @escaping () -> Void ) {
        updates.append(update)
        update()
    }
    
    static var language: Language = .en {
        didSet {
            for update in Internationalize.updates {
                update()
            }
        }
    }
    
    static func setPrefferedLanguage() {
        let languages = UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        
        Language: for languageCode in languages {
            if let language = Language(rawValue: languageCode) {
                Internationalize.language = language
                break Language
            }
            else if let language = Language(rawValue: languageCode.components(separatedBy: "-").first ?? "") {
                Internationalize.language = language
                break Language
            }
        }
    }
}
