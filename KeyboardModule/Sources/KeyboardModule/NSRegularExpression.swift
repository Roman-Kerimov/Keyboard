//
//  NSRegularExpression.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-10.
//

import Foundation

extension NSRegularExpression {
    static func contains(word: String) -> NSRegularExpression {
        try! NSRegularExpression(
            pattern: "\\b\(NSRegularExpression.escapedPattern(for: word))\\b",
            options: .caseInsensitive
        )
    }
    
    static func containsWord(withPrefix prefix: String) -> NSRegularExpression {
        try! NSRegularExpression(
            pattern: "\\b\(NSRegularExpression.escapedPattern(for: prefix))",
            options: .caseInsensitive
        )
    }
}
