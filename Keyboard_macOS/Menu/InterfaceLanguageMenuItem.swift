//
//  InterfaceLanguageMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import AppKit
import KeyboardModule

class InterfaceLanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = LANGUAGE.string
        
        let languageMenu = NSMenu()
        
        for preferredLanguage in Language.preferredList {
            languageMenu.addItem(LanguageMenuItem(language: preferredLanguage))
        }
        
        languageMenu.addItem(.separator())
        
        for language in Language.allCases {
            languageMenu.addItem(LanguageMenuItem(language: language))
        }
        
        submenu = languageMenu
    }
}
