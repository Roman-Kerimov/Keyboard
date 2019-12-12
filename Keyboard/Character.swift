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
    static let z: Character = "z"
    
    func belongsTo(_ characterSet: CharacterSet) -> Bool {
        return characterSet.contains(self.unicodeScalars.first!)
    }
    
    var characterComponents: [CharacterComponent] {
        return description.characterComponents
    }
    
    func removing(characterComponents: Set<CharacterComponent>) -> String {
        return description.removing(characterComponents: characterComponents)
    }
    
    var previewDescription: String {
        return description.previewDescription
    }
}
