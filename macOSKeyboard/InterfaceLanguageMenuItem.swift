//
//  InterfaceLanguageMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-12.
//

import Cocoa

class InterfaceLanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = LANGUAGE.string
        
        let languageMenu: NSMenu = .init()
        
        for preferredLanguage in Language.preferredList {
            languageMenu.addItem(LanguageMenuItem.init(language: preferredLanguage))
        }
        
        languageMenu.addItem(.separator())
        
        for language in Language.cases {
            languageMenu.addItem(LanguageMenuItem.init(language: language))
        }
        
        submenu = languageMenu
    }
}
