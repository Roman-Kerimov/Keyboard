//
//  CharacterExtension.swift
//  Keyboard
//
//  Created by Roman Kerimov on 02.05.17.
//
//

import Foundation

extension Character {
    static let space: Character = " "
    static let `return`: Character = "\n"
    static let tab: Character = "\t"
    static let reverseSolidus: Character = "\\"
    
    private var unicodeScalar: UnicodeScalar {
        return String.init(self).unicodeScalars.first!
    }
    
    func belongsTo(_ characterSet: CharacterSet) -> Bool {
        return characterSet.contains(self.unicodeScalar)
    }
    
    var isSpaceReturnOrTab: Bool {
        return self == .space
            || self == .return
            || self == .tab
    }
    
    var unicodeName: String {
        var outputString = self.description.applyingTransform(.toUnicodeName, reverse: false) ?? ""
        outputString = outputString.replacingOccurrences(of: "}\\N{", with: ", ")
        outputString = outputString.replacingOccurrences(of: "\\N{", with: .space)
        outputString = outputString.replacingOccurrences(of: "}", with: .space)
        
        return outputString
    }
}
