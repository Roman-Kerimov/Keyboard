//
//  LocalizedMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-11.
//

import Cocoa

class LocalizedMenuItem: NSMenuItem {

    init() {
        super.init(title: .init(), action: nil, keyEquivalent: .init())
        
        NotificationCenter.default.addLocaleObserver(self)
        updateLocalizedStrings()
        
        target = self
        action = #selector(menuItemAction)
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    @objc func menuItemAction() {
    
    }
}
