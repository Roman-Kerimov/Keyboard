//
//  StatusMenu.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-10.
//

import UIKit

class StatusMenu: NSMenu {
    
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    let visibilityMenuItem: VisibilityMenuItem = .init()
    
    init() {
        super.init(title: .init())
        
        let controlText = "Kd"
        let controlTextFont: UIFont = .boldMenuFont
        
        let disabledControlTextColor: UIColor = .disabledControlTextColor
        let disabledControlTextColorWithoutAlphaComponent: UIColor  = UIColor.windowBackgroundColor.blended(withFraction: disabledControlTextColor.alphaComponent, of: disabledControlTextColor)!
        
        let title: NSMutableAttributedString = .init(string: controlText)
        title.addAttribute(.font, value: controlTextFont)
        title.addAttribute(.foregroundColor, value: AXIsProcessTrusted() ? .controlTextColor : disabledControlTextColorWithoutAlphaComponent)
        statusItem.button?.attributedTitle = title
        
        let alternateTitle: NSMutableAttributedString = .init(string: controlText)
        alternateTitle.addAttribute(.font, value: controlTextFont)
        alternateTitle.addAttribute(.foregroundColor, value: UIColor.selectedMenuItemTextColor)
        statusItem.button?.attributedAlternateTitle = alternateTitle
        
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
        addItem(visibilityMenuItem)
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
