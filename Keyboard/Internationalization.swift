//
//  Internationalization.swift
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
        let languageCodes: [String]
        #if TARGET_INTERFACE_BUILDER
            languageCodes = .init()
        #else
            languageCodes = UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        #endif

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
    
    static var list: [Language] {
        struct Stored {
            static let list = values(of: Language.self)
        }
        return Stored.list
    }
}

internal func values<Enum: Hashable>(of: Enum.Type) -> [Enum] {
    var iterateEnum: AnyIterator<Enum> {
        var index = 0
        
        return AnyIterator {
            let next = withUnsafeBytes(of: &index) {
                $0.load(as: Enum.self)
            }
            
            if next.hashValue != index {
                return nil
            }
            
            index += 1
            
            return next
        }
    }
    
    var values: [Enum] = []
    
    for value in iterateEnum {
        guard value != values.first else {
            break
        }
        
        values.append(value)
    }
    
    return values
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
