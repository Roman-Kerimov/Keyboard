//
//  StatusMenu.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-10.
//

import AppKit
import KeyboardModule

class StatusMenu: NSMenu {
    
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    let visibilityMenuItem = VisibilityMenuItem()
    
    init() {
        super.init(title: "")
        
        delegate = self
        let controlText = "Kd"
        let controlTextFont: NSFont = .boldMenuFont
        
        let disabledControlTextColor: NSColor = .disabledControlTextColor
        let disabledControlTextColorWithoutAlphaComponent: NSColor  = NSColor.windowBackgroundColor.blended(withFraction: disabledControlTextColor.alphaComponent, of: disabledControlTextColor)!
        
        let title = NSMutableAttributedString(string: controlText)
        title.addAttribute(.font, value: controlTextFont)
        title.addAttribute(.foregroundColor, value: AXIsProcessTrusted() ? .controlTextColor : disabledControlTextColorWithoutAlphaComponent)
        statusItem.button?.attributedTitle = title
        
        let alternateTitle = NSMutableAttributedString(string: controlText)
        alternateTitle.addAttribute(.font, value: controlTextFont)
        alternateTitle.addAttribute(.foregroundColor, value: NSColor.selectedMenuItemTextColor)
        statusItem.button?.attributedAlternateTitle = alternateTitle
        
        statusItem.menu = self
        
        if !AXIsProcessTrusted() {
            addItem(AccessibilityMenuItem())
            addItem(.separator())
        }
        
        for layout in KeyboardLayout.allLayouts {
            addItem(LayoutMenuItem(layout: layout))
        }
        
        addItem(.separator())
        addItem(InterfaceLanguageMenuItem())
        addItem(.separator())
        addItem(visibilityMenuItem)
        addItem(.separator())
        addItem(LegalNoticesMenuItem())
        addItem(VersionMenuItem())
        addItem(.separator())
        addItem(QuitMenuItem())
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
}

// MARK: - NSMenuDelegate
extension StatusMenu: NSMenuDelegate {
    
    func menu(_ menu: NSMenu, willHighlight item: NSMenuItem?) {
        DispatchQueue.main.async {
            if let layoutItem = item as? LayoutMenuItem {
                AppDelegate.keyboardWindow.setIsVisible(true)
                Keyboard.default.previewLayout = layoutItem.layout
            } else {
                AppDelegate.keyboardWindow.setIsVisible(false)
                Keyboard.default.previewLayout = Keyboard.default.layout
            }
        }
    }
    
    func menuDidClose(_ menu: NSMenu) {
        AppDelegate.keyboardWindow.setIsVisible(false)
    }
}
