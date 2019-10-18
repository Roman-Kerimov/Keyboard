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
    
    var codePoints: String {managed.codePoints!}
    var isFullyQualified: Bool {managed.isFullyQualified}
    var name: String {managed.name!}
    private var order: Int {.init(managed.order)}
    
    init(managed: ManagedUnicodeItem) {
        self.managed = managed
    }
}
