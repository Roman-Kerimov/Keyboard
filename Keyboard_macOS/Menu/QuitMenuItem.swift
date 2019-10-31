//
//  QuitMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-11.
//

import AppKit

class QuitMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = QUIT.string
    }
    
    override func menuItemAction() {
        LaunchAgent.unload()
        NSApplication.shared.terminate(self)
    }
}
