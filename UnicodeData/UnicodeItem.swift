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
    
    var localizedName: String {ttsAnnotation ?? annotation ?? managed.name!}
    
    init(managed: ManagedUnicodeItem) {
        self.managed = managed
    }
}
