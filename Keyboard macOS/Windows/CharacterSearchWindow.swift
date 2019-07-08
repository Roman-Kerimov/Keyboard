//
//  CharacterSearchWindow.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-05-13.
//

import SwiftUI

final class CharacterSearchWindow: FloatingWindow {
    
    override init() {
        super.init()
        
        contentView = NSHostingView(rootView: CharacterSearchView().environmentObject(Keyboard.default.characterSearch))
        setFrame(.init(origin: .zero, size: .init(width: .characterSearchDefaultWidth, height: .characterSearchDefaultHeight)), display: true)
    }
}
