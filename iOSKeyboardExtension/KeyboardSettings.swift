//
//  KeyboardSettings.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 18.12.16.
//
//

import UIKit

class KeyboardSettings: NSObject {

    enum KeyboardLayoutMode {
        case horizontal, vertical
        case `default`
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
    
    private var portraitLayoutMode: KeyboardLayoutMode = .default
    private var landscapeLayoutMode: KeyboardLayoutMode = .default
}
