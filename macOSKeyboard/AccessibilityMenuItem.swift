//
//  AccessibilityMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-04-22.
//

import UIKit

class AccessibilityMenuItem: LocalizedMenuItem {

    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        let title: NSMutableAttributedString = .init(string: ENABLE_KEYBOARD.string)
        title.addAttribute(.font, value: UIFont.boldMenuFont)
        attributedTitle = title
    }
    
    override func menuItemAction() {
        AXIsProcessTrustedWithOptions(NSDictionary.init(dictionary: [kAXTrustedCheckOptionPrompt.takeRetainedValue(): true]))
    }
}
