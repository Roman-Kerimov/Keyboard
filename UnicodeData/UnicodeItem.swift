//
//  UnicodeItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-01.
//

import Foundation

struct UnicodeItem: Equatable {
    
    static func == (lhs: UnicodeItem, rhs: UnicodeItem) -> Bool {
        return lhs.order == rhs.order
    }
    
    private let managed: ManagedUnicodeItem
    
    var language: String? {managed.language}
    
    var codePoints: String {managed.codePoints!}
    var name: String? {managed.name}
    var annotation: String? {managed.annotation}
    var ttsAnnotation: String? {managed.ttsAnnotation}
    private var order: Int {.init(managed.order)}
    
    static let nameSeparator = " | "
    
    var localizedName: String {[regionCode, ttsAnnotation ?? annotation ?? managed.name].compactMap({$0}).joined(separator: UnicodeItem.nameSeparator)}
    
    init(managed: ManagedUnicodeItem) {
        self.managed = managed
    }
    
    func set(language: String) {
        managed.language = language
    }
    
    func set(annotation: String) {
        managed.annotation = annotation
    }
    
    var regionCode: String? {
        let unicodeScalars = codePoints.unicodeScalars
        
        if unicodeScalars.count == 2, unicodeScalars.reduce(true, {$0 && CharacterSet(charactersIn: "🇦"..."🇿").contains($1)}) {
            return unicodeScalars.map {Unicode.Scalar($0.value - 0x1F1A5)!.description} .joined()
        }
        else if unicodeScalars.count > 4, unicodeScalars.first == "\u{1F3F4}", unicodeScalars.last == "\u{E007F}" {
            var subdivisionCode: String = unicodeScalars.dropFirst().dropLast().map {Unicode.Scalar($0.value - 0xE0000)?.description ?? "_"} .joined()
            
            guard subdivisionCode.unicodeScalars.reduce(true, {$0 && $1.isASCII && ($1.properties.isLowercase || $1.properties.generalCategory == .decimalNumber)}) else {
                return nil
            }
            
            subdivisionCode.insert("‐", at: subdivisionCode.index(subdivisionCode.startIndex, offsetBy: 2))
            
            return subdivisionCode.uppercased()
        }
        else {
            return nil
        }
    }
}
