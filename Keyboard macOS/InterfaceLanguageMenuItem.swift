//
//  InterfaceLanguageMenuItem.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import AppKit

class InterfaceLanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = LANGUAGE.string
        
        let languageMenu: NSMenu = .init()
        
        for preferredLanguage in Language.preferredList {
            languageMenu.addItem(LanguageMenuItem.init(language: preferredLanguage))
        }
        
        languageMenu.addItem(.separator())
        
        for language in Language.allCases {
            languageMenu.addItem(LanguageMenuItem.init(language: language))
        }
        
        submenu = languageMenu
    }
}