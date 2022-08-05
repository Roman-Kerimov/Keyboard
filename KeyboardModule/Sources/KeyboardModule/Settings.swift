//
//  Settings.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-04-22.
//

import SwiftUI

public final class Settings: ObservableObject {
    
    public static let current = Settings()
     
    @Published("rrvfFT9eUMTqwVCEW4cbDo3c4TJsa1O")
    public var language: Language = .en {
        didSet {
            NotificationCenter.default.post(name: .LocalizationDidChange, object: nil)
        }
    }
}
