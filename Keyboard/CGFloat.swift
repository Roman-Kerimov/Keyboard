//
//  CGFloat.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-06-25.
//

import SwiftUI

extension CGFloat {
    
    static var systemFontSize: Self {
        #if os(macOS)
        return NSFont.systemFontSize
        #else
        return UIFont.systemFontSize
        #endif
    }
    
    static var legalTextFontSize: Self {0.75 * systemFontSize}
    
    static let characterSearchViewFontSizeFactor: Self = 0.7
    
    static let characterSearchDefaultWidth: Self = 30
    static let characterSearchDefaultHeight: Self = 250
}
