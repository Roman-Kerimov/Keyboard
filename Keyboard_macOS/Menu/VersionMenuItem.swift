//
//  VersionMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-11.
//

import AppKit
import KeyboardModule

class VersionMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = VERSION.string
    }

    override init() {
        super.init()
        
        target = nil
        action = nil
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
}
