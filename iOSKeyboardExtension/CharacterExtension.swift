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
    
    private var unicodeScalar: UnicodeScalar {
        return String.init(self).unicodeScalars.first!
    }
    
    func belongsTo(_ characterSet: CharacterSet) -> Bool {
        return characterSet.contains(self.unicodeScalar)
    }
    
    var string: String {
        return String.init(self)
    }
    
    var isSpaceReturnOrTab: Bool {
        return self == .space
            || self == .return
            || self == .tab
    }
}
