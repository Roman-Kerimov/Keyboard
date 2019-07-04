//
//  CGEventFlags.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-03-08.
//

import Foundation

extension CGEventFlags: Hashable {
    public var hashValue: Int {
        return .init(rawValue)
    }
}
