//
//  Localization.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-01-14.
//
//

import Foundation

extension Language {
    #if TARGET_INTERFACE_BUILDER
    static var current: Language = .en
    #else
    private static let currentKey = "rrvfFT9eUMTqwVCEW4cbDo3c4TJsa1O"
    static var current: Language {
        get {
            return Language(rawValue: UserDefaults.standard.string(forKey: currentKey) ?? "") ?? preferredList.first ?? .en
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: currentKey)
            
            NotificationCenter.default.post(name: .LocalizationDidChange, object: nil)
        }
    }
    #endif
    
    static var preferredList: [Language] {
        var languageCodes: [String] = Bundle.main.isInterfaceBuilder ? .init() : UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        
        if let ruIndex = languageCodes.firstIndex(where: {$0.hasPrefix("ru")}) {
            languageCodes.remove(at: ruIndex)
            languageCodes.insert(contentsOf: [Language.ru_Cyrl.rawValue, Language.ru_Latn.rawValue], at: ruIndex)
        }

        var languages: [Language] = []
        
        for languageCode in languageCodes {
            if let language = Language(rawValue: languageCode) {
                languages.append(language)
            }
            else if let language = Language(rawValue: languageCode.components(separatedBy: "-").dropLast().joined(separator: "-")) {
                languages.append(language)
            }
        }
        
        return languages
    }
    
    var selfName: String {
        return Locale(identifier: rawValue).localizedString(forIdentifier: rawValue)?.translatingScriptIfNeeded(language: self) ?? .init()
    }
    
    var localizedName: String {
        return Locale(identifier: Language.current.rawValue).localizedString(forIdentifier: rawValue)?.translatingScriptIfNeeded(language: .current) ?? .init()
    }
}

fileprivate extension String {
    func translatingScriptIfNeeded(language: Language) -> String {
        switch language {
        case .ru_Latn:
            return self.translating(from: .Cyrl, to: .Latn, withTable: .ru)
        default:
           return self
        }
    }
}

extension NSObject {
    
    @objc func updateLocalizedStrings() {
        
    }
}

extension NotificationCenter {
    func addLocaleObserver(_ observer: NSObject) {
        addObserver(observer, selector: #selector(observer.updateLocalizedStrings), name: .LocalizationDidChange, object: nil)
        
        updateLocalizedStrings()
    }
}

extension NSNotification.Name {
    static let LocalizationDidChange: NSNotification.Name = .init("eGuHC6YhIb9XAe2gDBjQPM8PHuojH5A")
}
