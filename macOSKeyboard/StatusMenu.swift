//
//  StatusMenu.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-10.
//

import UIKit

class StatusMenu: NSMenu {
    
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    init() {
        super.init(title: .init())
        statusItem.title = "Kd"
        let title: NSMutableAttributedString = .init(string: statusItem.title!)
        title.addAttribute(.font, value: UIFont.boldMenuFont)
        title.addAttribute(.foregroundColor, value: AXIsProcessTrusted() ? UIColor.black : UIColor.lightGray)
        statusItem.attributedTitle = title
        
        statusItem.menu = self
        
        if !AXIsProcessTrusted() {
            addItem(AccessibilityMenuItem.init())
            addItem(.separator())
        }
        
        for layout in KeyboardLayout.list {
            addItem(LayoutMenuItem.init(layout: layout))
        }
        addItem(.separator())
        addItem(InterfaceLanguageMenuItem.init())
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
