//
//  LocalizedMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-11.
//

import AppKit

class LocalizedMenuItem: NSMenuItem {
    
    init() {
        super.init(title: "", action: nil, keyEquivalent: "")
        
        NotificationCenter.default.addLocaleObserver(self)
        updateLocalizedStrings()
        
        target = self
        action = #selector(menuItemAction)
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    @objc func menuItemAction() {}
}
