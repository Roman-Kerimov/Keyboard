//
//  NSWorkspace.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-06-15.
//

import AppKit

extension NSWorkspace {
    var frontmostApplicationName: String {
        return frontmostApplication?.localizedName ?? .init()
    }
}
