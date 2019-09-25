//
//  NSRegularExpression.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-10.
//

import Foundation

extension NSRegularExpression {
    static func contains(word: String) -> NSRegularExpression {
        return try! .init(pattern: "\\b\(NSRegularExpression.escapedPattern(for: word))\\b", options: .caseInsensitive)
    }
    
    static func containsWord(withPrefix prefix: String) -> NSRegularExpression {
        return try! .init(pattern: "\\b\(NSRegularExpression.escapedPattern(for: prefix))\\w+", options: .caseInsensitive)
    }
    
    static func contains(nonPrefix text: String) -> NSRegularExpression {
        return try! .init(pattern: "\\w+\(NSRegularExpression.escapedPattern(for: text))\\w+", options: .caseInsensitive)
    }
}
