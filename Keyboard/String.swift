//
//  String.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import SwiftUI

extension String {
    
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
    
    static let space: String = Character.space.description
    static let `return`: String = Character.return.description
    static let tab: String = Character.tab.description
    static let reverseSolidus: String = Character.reverseSolidus.description
    static let comma: String = Character.comma.description
    static let fullStop: String = Character.fullStop.description
    static let lowLine: String = Character.lowLine.description
    static let v: String = Character.v.description
    static let z: String = Character.z.description
    
    func typingDescription(languageCode: String) -> String? {
        return applyingReverseTransform(transformationCode: languageCode)?.map {$0.description.defaultShiftGesture ?? $0.description} .joined() ?? defaultShiftGesture
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
                }
                else {
                    element.removeLast()
                }
            }
        }
        
        return shiftGesture
    }
    
    var characterComponents: [CharacterComponent] {
        return characterComponentsDictionary[self]?.map {CharacterComponent.replaces[$0] ?? $0} ?? .init()
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
    
    func size(fontName: String, fontSize: CGFloat) -> CGSize {
        return (self as NSString).size(withAttributes: [.font: Font.init(name: fontName, size: fontSize)!])
    }
    
    func contains(_ regularExpression: NSRegularExpression) -> Bool {
        return regularExpression.numberOfMatches(in: self, options: [], range: .init(location: 0, length: count)) != 0
    }
    
    func textHeightFrom(width: CGFloat, fontName: String = "System Font", fontSize: CGFloat = .systemFontSize) -> CGFloat {
        
        #if canImport(UIKit)
        
        let text: UILabel = .init()
        text.text = self
        text.numberOfLines = 0
        
        #elseif canImport(AppKit)
        
        let text: NSTextField = .init(string: self)
        text.font = NSFont.init(name: fontName, size: fontSize)
        
        #endif
        
        text.font = Font.init(name: fontName, size: fontSize)
        text.lineBreakMode = .byWordWrapping
        return text.sizeThatFits(CGSize.init(width: width, height: .infinity)).height
    }
    
    var previewDescription: String {
        if unicodeScalars.first?.properties.isGraphemeExtend == true {
            
            return "◌" + self
        }
        
        return self
    }
}
