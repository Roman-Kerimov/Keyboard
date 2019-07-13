//
//  Length.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-13.
//

import SwiftUI

extension Length {
    static func keyboardGrid(_ value: Self) -> Self {
        return value * 50
    }
}
