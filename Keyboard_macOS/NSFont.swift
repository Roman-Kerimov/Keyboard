//
//  NSFont.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-07-04.
//

import AppKit

extension NSFont {
    static var boldMenuFont: NSFont {
        boldSystemFont(ofSize: systemFontSize * 1.3)
    }
}
