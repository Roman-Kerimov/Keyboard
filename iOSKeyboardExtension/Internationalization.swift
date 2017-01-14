//
//  Internationalization.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.01.17.
//
//

import Foundation

protocol InternationalizedString {
    static var en: String {get}
    static var ru: String {get}
}

enum Language: String {
    case en = "en"
    case ru = "ru"
}

extension InternationalizedString {
    static var string: String {
        switch Internationalize.language {
        case .en:
            return en
        case .ru:
            return ru
        }
    }
}

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


