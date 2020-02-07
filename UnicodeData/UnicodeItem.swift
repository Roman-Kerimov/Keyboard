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
        guard let regionCode = UnicodeData.default.regionCode(flagCodePoints: codePoints) else {
            return nil
        }
        
        if regionCode == regionCode.lowercased() {
            var subdivisionCode = regionCode
            subdivisionCode.insert("‐", at: subdivisionCode.index(subdivisionCode.startIndex, offsetBy: 2))
            
            return subdivisionCode.uppercased()
        }
        else {
            return regionCode
        }
    }
}
