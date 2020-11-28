//
//  Settings.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-04-22.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
extension Settings: ObservableObject {

    var objectWillChange: ObservableObjectPublisher {
        if _objectWillChange == nil {
            _objectWillChange = ObservableObjectPublisher.init()
        }

        return _objectWillChange as! ObservableObjectPublisher
    }
}

final class Settings {
    var _objectWillChange: Any? = nil
    
    static let current: Settings = .init()
    
    private init() {
        language = Language(rawValue: UserDefaults.standard.string(forKey: currentLanguageKey) ?? "") ?? Language.preferredList.first ?? .en
    }
     
    private let currentLanguageKey = "rrvfFT9eUMTqwVCEW4cbDo3c4TJsa1O"
    var language: Language {
        willSet {
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
        }
        
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: currentLanguageKey)
            
            NotificationCenter.default.post(name: .LocalizationDidChange, object: nil)
        }
    }
}
