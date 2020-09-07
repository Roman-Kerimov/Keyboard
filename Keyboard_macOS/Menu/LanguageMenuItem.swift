//
//  LanguageMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import AppKit
import KeyboardModule

class LanguageMenuItem: LocalizedMenuItem {
    
    override func updateLocalizedStrings() {
        state = language == Settings.current.language ? .on : .off
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
        Settings.current.language = language
    }
}
