//
//  VersionMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-11.
//

import Cocoa

class VersionMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = Bundle.main.version
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
