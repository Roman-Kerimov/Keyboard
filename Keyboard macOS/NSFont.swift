//
//  NSFont.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-04.
//

import AppKit

extension NSFont {
    static var boldMenuFont: NSFont {
        return boldSystemFont(ofSize: systemFontSize * 1.3)
    }
}
