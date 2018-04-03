//
//  Character.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-05-02.
//
//

import Foundation

let unicodeNameSeparator = ", "

extension Character {
    static let space: Character = " "
    static let `return`: Character = "\n"
    static let tab: Character = "\t"
    static let reverseSolidus: Character = "\\"
    static let comma: Character = ","
    static let fullStop: Character = "."
    static let lowLine: Character = "_"
    static let v: Character = "v"
    
    func belongsTo(_ characterSet: CharacterSet) -> Bool {
        return characterSet.contains(self.unicodeScalars.first!)
    }
    
    var isSpaceReturnOrTab: Bool {
        return self == .space
            || self == .return
            || self == .tab
    }
    
    var unicodeName: String {
        var outputString = self.description.applyingTransform(.toUnicodeName, reverse: false) ?? ""
        outputString = outputString.replacingOccurrences(of: "}\\N{", with: unicodeNameSeparator)
        outputString = outputString.replacingOccurrences(of: "\\N{", with: String.space)
        outputString = outputString.replacingOccurrences(of: "}", with: String.space)
        
        if outputString.hasPrefix(.space) {
            outputString = .init(outputString.suffix(outputString.count - 1))
        }
        
        if outputString.hasSuffix(.space) {
            outputString = .init(outputString.prefix(outputString.count - 1))
        }
        
        return outputString
    }
    
    var characterComponents: [CharacterComponent] {
        return description.characterComponents
    }
}
