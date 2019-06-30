//
//  CharacterSearchWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-05-13.
//

import SwiftUI

class CharacterSearchWindow: FloatingWindow {
    
    init() {
        super.init(contentView: NSHostingView(rootView: CharacterSearchView().environmentObject(Keyboard.default.characterSearch)))
        
        setFrame(.init(origin: .zero, size: .init(width: 30, height: 250)), display: true)
    }
}
