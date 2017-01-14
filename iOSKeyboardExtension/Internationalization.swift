//
//  Internationalization.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.01.17.
//
//

import Foundation

protocol InternationalizedString {
    static var cs: String {get}
    static var de: String {get}
    static var en: String {get}
    static var es: String {get}
    static var fr: String {get}
    static var it: String {get}
    static var nl: String {get}
    static var pl: String {get}
    static var pt: String {get}
    static var ru: String {get}
    static var sv: String {get}
}

enum Language: String {
    case cs = "cs"
    case de = "de"
    case en = "en"
    case es = "es"
    case fr = "fr"
    case it = "it"
    case nl = "nl"
    case pl = "pl"
    case pt = "pt"
    case ru = "ru"
    case sv = "sv"
}

extension InternationalizedString {
    static var string: String {
        switch Internationalize.language {
            
        case .cs: return cs
        case .de: return de
        case .en: return en
        case .es: return es
        case .fr: return fr
        case .it: return it
        case .nl: return nl
        case .pl: return pl
        case .pt: return pt
        case .ru: return ru
        case .sv: return sv
            
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


