//
//  KeyboardSettings.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 18.12.16.
//
//

import UIKit

class KeyboardSettings: NSObject {

    enum KeyboardLayoutMode: String {
        case horizontal = "horizontal"
        case vertical = "vertical"
        
        case `default` = "default"
    }
    
    var layout: KeyboardLayout = .qwerty
    
    #if TARGET_INTERFACE_BUILDER
    
    var layoutMode: KeyboardLayoutMode = .default
    
    #else
    
    private let layoutModeKey = "layoutMode"
    var layoutMode: KeyboardLayoutMode {
        get {
            return KeyboardLayoutMode(rawValue: UserDefaults.standard.string(forKey: layoutModeKey) ?? "") ?? .default
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: layoutModeKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    #endif
}
