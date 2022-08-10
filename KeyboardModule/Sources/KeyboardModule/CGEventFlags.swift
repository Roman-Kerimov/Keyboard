//
//  CGEventFlags.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-03-08.
//

import Foundation

#if os(macOS)
extension CGEventFlags: Hashable {
    public var hashValue: Int {
        Int(rawValue)
    }
}
#endif
