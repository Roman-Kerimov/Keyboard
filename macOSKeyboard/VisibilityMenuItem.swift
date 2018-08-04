//
//  VisibilityMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-06-14.
//

import Cocoa

class VisibilityMenuItem: LocalizedMenuItem {
    override func updateLocalizedStrings() {
        title = AppDelegate.isUserDefaultsVisibleKeyboard ? HIDE_FOR_APPLICATION.string : SHOW_FOR_APPLICATION.string
    }
    
    override func menuItemAction() {
        AppDelegate.isUserDefaultsVisibleKeyboard = !AppDelegate.isUserDefaultsVisibleKeyboard
        updateLocalizedStrings()
    }
}