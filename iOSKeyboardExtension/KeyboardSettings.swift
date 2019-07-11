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
    
    private let layoutKey = "layout"
    var layout: KeyboardLayout {
        get {
            return KeyboardLayout.list.filter { $0.name == (UserDefaults.standard.string(forKey: layoutKey) ?? "")}.first ?? .qwerty
        }
        
        set {
            UserDefaults.standard.set(newValue.name, forKey: layoutKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private let allowMultipleSpacesKey = "allowMultipleSpaces"
    var allowMultipleSpaces: Bool {
        get {
            return UserDefaults.standard.bool(forKey: allowMultipleSpacesKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: allowMultipleSpacesKey)
            UserDefaults.standard.synchronize()
        }
    }
    
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
