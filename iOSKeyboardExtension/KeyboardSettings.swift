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
    
    func set(layoutMode: KeyboardLayoutMode, forScreenSize screenSize: CGSize) {
        
        if screenSize.width < screenSize.height {
            portraitLayoutMode = layoutMode
        }
        else {
            landscapeLayoutMode = layoutMode
        }
    }
    
    func getLayoutMode(forScreenSize screenSize: CGSize) -> KeyboardLayoutMode {
        
        if screenSize.width < screenSize.height {
           	return portraitLayoutMode
        }
        else {
           	return landscapeLayoutMode
        }
    }
    
    func layoutMode(orientation: UIDeviceOrientation) -> KeyboardLayoutMode {
        return portraitLayoutMode
    }
    
    private let portraitLayoutModeKey = "portraitLayoutMode"
    private var portraitLayoutMode: KeyboardLayoutMode {
        get {
            return KeyboardLayoutMode(rawValue: UserDefaults.standard.string(forKey: portraitLayoutModeKey) ?? "") ?? .default
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: portraitLayoutModeKey)
            UserDefaults.standard.synchronize()
            
        }
    }
    
    private let landscapeLayoutModeKey = "landscapeLayoutMode"
    private var landscapeLayoutMode: KeyboardLayoutMode {
        get {
            return KeyboardLayoutMode(rawValue: UserDefaults.standard.string(forKey: landscapeLayoutModeKey) ?? "") ?? .default
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: landscapeLayoutModeKey)
            UserDefaults.standard.synchronize()
        }
    }
}
