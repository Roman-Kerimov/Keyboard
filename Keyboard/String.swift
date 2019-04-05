//
//  String.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import UIKit

extension String {
    static let space: String = Character.space.description
    static let `return`: String = Character.return.description
    static let tab: String = Character.tab.description
    static let reverseSolidus: String = Character.reverseSolidus.description
    static let comma: String = Character.comma.description
    static let fullStop: String = Character.fullStop.description
    static let lowLine: String = Character.lowLine.description
    static let v: String = Character.v.description
    static let z: String = Character.z.description
    
    var defaultShiftGesture: String? {
        
        let decomposedUnicodeScalars = decomposedStringWithCanonicalMapping.unicodeScalars
        
        let shiftGestures = decomposedUnicodeScalars.compactMap {$0.description.characterComponents.defaultShiftGesture}
        
        if shiftGestures.count != decomposedUnicodeScalars.count {
            return nil
        }
        
        return shiftGestures.joined()
    }
    
    var characterComponents: [CharacterComponent] {
        return characterComponentsDictionary[self] ?? .init()
    }
    
    func removing(characterComponents: Set<CharacterComponent>) -> String {
        return self.characterComponents.removing(characterComponents: characterComponents).character
    }
    
    func appending(characterComponent: CharacterComponent) -> String {
        
        if self.characterComponents.isEmpty {
            return self
        }
        
        if characterComponent == .latin {
            return removing(characterComponents: CharacterComponent.scripts)
        }
        
        let characterComponents = self.characterComponents + [characterComponent]
        
        if characterComponents.character.isEmpty {
            return self
        }
        
        return characterComponents.character
    }
    
    func size(withFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [.font: font])
    }
    
    var hexToUInt32: UInt32? {
        var output: UInt32 = 0
        
        if Scanner.init(string: self).scanHexInt32(&output) {
            return output
        }
        else {
            return nil
        }
    }
    
    var hexToUnicodeScalar: Unicode.Scalar? {
        
        guard let codePoint = hexToUInt32 else {
            return nil
        }
        
        return Unicode.Scalar.init(codePoint)
    }
    
    func contains(_ regularExpression: NSRegularExpression) -> Bool {
        return regularExpression.numberOfMatches(in: self, options: [], range: .init(location: 0, length: count)) != 0
    }
}
