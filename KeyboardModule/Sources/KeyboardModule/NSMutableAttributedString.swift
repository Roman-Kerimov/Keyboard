//
//  NSMutableAttributedString.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-04-22.
//

import Foundation

public extension NSMutableAttributedString {
    func addAttribute(_ name: NSAttributedString.Key, value: Any) {
        addAttribute(name, value: value, range: NSRange(location: 0, length: string.count))
    }
}
