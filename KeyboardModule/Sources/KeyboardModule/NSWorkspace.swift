//
//  NSWorkspace.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-06-15.
//

#if canImport(AppKit)
import AppKit

extension NSWorkspace {
    var frontmostApplicationName: String {
        frontmostApplication?.localizedName ?? ""
    }
}
#endif
