//
//  Settings.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-04-22.
//

import SwiftUI

public final class Settings: ObservableObject {
    
    public static let current: Settings = .init()
    
    private init() {
        language = Language(rawValue: UserDefaults.standard.string(forKey: currentLanguageKey) ?? "") ?? Language.preferredList.first ?? .en
    }
     
    private let currentLanguageKey = "rrvfFT9eUMTqwVCEW4cbDo3c4TJsa1O"
    public var language: Language {
        willSet {
            objectWillChange.send()
        }
        
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: currentLanguageKey)
            
            NotificationCenter.default.post(name: .LocalizationDidChange, object: nil)
        }
    }
}
