//
//  CharacterExtension.swift
//  Keyboard
//
//  Created by Roman Kerimov on 02.05.17.
//
//

import Foundation

extension Character {
    static let space: Character = .init(" ")
    static let `return`: Character = .init("\n")
    static let tab: Character = .init("\t")
    
    var unicodeScalar: UnicodeScalar {
        return String.init(self).unicodeScalars.first!
    }
    
    var string: String {
        return String.init(self)
    }
}
