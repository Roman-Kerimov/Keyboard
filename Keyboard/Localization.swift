//
//  Localization.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-01-14.
//
//

import SwiftUI
import Combine

extension Language: Identifiable {
    var id: String {
        return rawValue
    }
    
    static var preferredList: [Language] {
        var languageCodes: [String] = UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        
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
        return Locale(identifier: rawValue).localizedString(forIdentifier: rawValue)?.applyingTransformIfNeeded(language: self) ?? .init()
    }
    
    var localizedName: String {
        return Locale(identifier: Settings.current.language.rawValue).localizedString(forIdentifier: rawValue)?.applyingTransformIfNeeded(language: Settings.current.language) ?? .init()
    }
}

extension LocalizedString {
    static var uppercasedString: String {
        return string.uppercased(with: Locale(identifier: Settings.current.language.rawValue))
    }
}

fileprivate extension String {
    func applyingTransformIfNeeded(language: Language) -> String {
        switch language {
        case .ru_Latn:
            return self.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)
        default:
           return self
        }
    }
}

extension NSObject {
    
    @objc func updateLocalizedStrings() {
        
    }
}

@available(iOS 13.0, *)
extension View {
    func localized() -> some View {
        return self.environmentObject(Settings.current)
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
