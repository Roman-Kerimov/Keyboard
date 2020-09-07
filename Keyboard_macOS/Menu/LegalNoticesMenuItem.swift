//
//  LegalNoticesMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-11.
//

import SwiftUI
import KeyboardModule

class LegalNoticesMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = LEGAL_NOTICES.string
    }
    
    var legalNoticesWindow: LegalNoticesWindow = .init()
    
    override func menuItemAction() {
        legalNoticesWindow.orderFrontRegardless()
    }
}
