//
//  LanguageMenuItem.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import AppKit

class LanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        state = language == Locale.current.language ? .on : .off
    }
    
    let language: Language

    init(language: Language) {
        self.language = language
        super.init()
        
        title = language.selfName
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func menuItemAction() {
        Locale.current.language = language
    }
}
