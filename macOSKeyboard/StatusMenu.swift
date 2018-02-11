//
//  StatusMenu.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-10.
//

import Cocoa

class StatusMenu: NSMenu {
    
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    init() {
        super.init(title: .init())
        statusItem.title = "Kd"
        statusItem.menu = self
        
        addItem(.separator())
        addItem(LegalNoticesMenuItem.init())
        addItem(VersionMenuItem.init())
        addItem(.separator())
        addItem(QuitMenuItem.init())
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
}
