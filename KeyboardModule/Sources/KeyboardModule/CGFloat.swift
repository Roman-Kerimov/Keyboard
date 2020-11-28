//
//  CGFloat.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-06-25.
//

import SwiftUI

public extension CGFloat {
    
    static var systemFontSize: Self {
        #if canImport(UIKit)
        return UIFont.systemFontSize
        #elseif canImport(AppKit)
        return NSFont.systemFontSize
        #endif
    }
    
    static var legalTextFontSize: Self {0.75 * systemFontSize}
    static var settingsTitleFontSize: Self {1.8 * systemFontSize}
    
    static let characterSearchViewFontSizeFactor: Self = 0.7
    
    static let characterSearchDefaultWidth: Self = 30
    static let characterSearchDefaultHeight: Self = 250
    
    static let characterSequenceDefaultHeight: Self = 40
    static let characterSequenceItemWidthExtensionFontSizeFactor: Self = 0.2
    static let characterSequenceCornerRadiusFontSizeFactor: Self = 0.15
    static let characterSequenceSpacingFontSizeFactor: Self = 0.05
    
    static func keyboardGrid(_ value: Self) -> Self {
        return value * 50
    }
}
