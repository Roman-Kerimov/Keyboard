//
//  QuitMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-11.
//

import Cocoa

class QuitMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = QUIT.string
    }
    
    override func menuItemAction() {
        NSApplication.shared.terminate(self)
    }
}
