//
//  LanguageMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-12.
//

import Cocoa

class LanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        state = language == Language.current ? .on : .off
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
        Language.current = language
    }
}
