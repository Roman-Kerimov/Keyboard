//
//  String.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import SwiftUI

public extension String {
    
    #if canImport(UIKit)
    private typealias Font = UIFont
    #elseif canImport(AppKit)
    private typealias Font = NSFont
    #endif
    static var legalTextFontName = "System Font Bold"
    static let settingsTitleFontName = "System Font Bold"
    static let characterFontName = "STIXGeneral"
    static let specialKeyLabelFont = "System Font"
    
    static let horizontalModeLabel = "▄▄"
    static let verticalModeLabel = "▝█▖"
    
    static let space = Character.space.description
    static let `return` = Character.return.description
    static let tab = Character.tab.description
    static let reverseSolidus = Character.reverseSolidus.description
    static let comma = Character.comma.description
    static let fullStop = Character.fullStop.description
    static let lowLine = Character.lowLine.description
    static let v = Character.v.description
    static let z = Character.z.description
    
    func typingDescription(languageCode: String) -> String? {
        applyingReverseTransform(transformationCode: languageCode)?
            .map {$0.description.defaultShiftGesture ?? $0.description}
            .joined() ?? defaultShiftGesture
    }
    
    var defaultShiftGesture: String? {
        
        var decomposedUnicodeScalars = decomposedStringWithCanonicalMapping.unicodeScalars
        
        var shiftGesture = ""
        
        while !decomposedUnicodeScalars.isEmpty {
            var element = decomposedUnicodeScalars.prefix(characterComponentsDictionaryMaxUnicodeScalarCount)
            
            while true {
                guard !element.isEmpty else {
                    return nil
                }
                
                if let elementDefaultShiftGesture = String(element).characterComponents.defaultShiftGesture {
                    shiftGesture += elementDefaultShiftGesture
                    decomposedUnicodeScalars.removeFirst(element.count)
                    break
                } else {
                    element.removeLast()
                }
            }
        }
        
        return shiftGesture
    }
    
    var characterComponents: [CharacterComponent] {
        characterComponentsDictionary[self]?.flatMap {CharacterComponent.replaces[$0] ?? [$0]} ?? []
    }
    
    func removing(characterComponents: Set<CharacterComponent>) -> String {
        self.characterComponents.removing(characterComponents: characterComponents).character
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
    
    func size(fontName: String, fontSize: CGFloat) -> CGSize {
        (self as NSString).size(withAttributes: [.font: Font(name: fontName, size: fontSize)!])
    }
    
    func contains(_ regularExpression: NSRegularExpression) -> Bool {
        regularExpression.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: count)) != 0
    }
    
    var previewDescription: String {
        if unicodeScalars.first?.properties.isGraphemeExtend == true {
            return "◌" + self
        }
        
        return self
    }
}
