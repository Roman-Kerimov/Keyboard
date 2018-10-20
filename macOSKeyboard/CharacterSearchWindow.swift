//
//  CharacterSearchWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-05-13.
//

import UIKit

class CharacterSearchWindow: FloatingWindow {
    
    init() {
        let characterSearchView = CharacterSearchView.init()
        characterSearchView.size = .init(width: 30, height: 250)
        
        super.init(contentView: characterSearchView)
    }
}
