//
//  CharacterSearchWindow.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-05-13.
//

import SwiftUI
import KeyboardModule

final class CharacterSearchWindow: FloatingWindow {
    
    override init() {
        super.init()
        
        contentView = NSHostingView(rootView: CharacterSearchView().environmentObject(Keyboard.default.characterSearch))
        setContentSize(.init(width: .characterSearchDefaultWidth, height: .characterSearchDefaultHeight))
    }
}
