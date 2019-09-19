//
//  UnicodeItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-01.
//

import Foundation

class UnicodeItem: Codable, Comparable {
    
    static func == (lhs: UnicodeItem, rhs: UnicodeItem) -> Bool {
        return lhs.order == rhs.order
    }
    
    static func < (lhs: UnicodeItem, rhs: UnicodeItem) -> Bool {
        return lhs.order < rhs.order
    }
    
    let codePoints: String
    let isFullyQualified: Bool
    let name: String
    private let order: Int
    
    private static var count: Int = 0
    
    init(codePoints: String, name: String, isFullyQualified: Bool = true) {
        
        self.codePoints = codePoints
        self.isFullyQualified = isFullyQualified
        self.name = name
        self.order = UnicodeItem.count
        
        UnicodeItem.count += 1
    }
}
