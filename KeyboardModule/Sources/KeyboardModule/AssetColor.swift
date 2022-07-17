//
//  AssetColor.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-07-08.
//

import SwiftUI

public protocol AssetColor {
    static func assetColor(_ assetName: String) -> Self
}

extension Color: AssetColor {
    public static func assetColor(_ assetName: String) -> Self {
        Color(assetName, bundle: Bundle.module)
    }
}

#if canImport(UIKit)
extension UIColor: AssetColor {
    public static func assetColor(_ assetName: String) -> Self {
        Self(named: assetName, in: Bundle.module, compatibleWith: nil)!
    }
}
#endif

public extension AssetColor {
    
    // MARK: - Text Colors
    
    static var unemphasizedSelectedTextBackground: Self {
        assetColor("unemphasizedSelectedTextBackground")
    }
    
    
    // MARK: - Control colors
    
    static var control: Self {
        assetColor("control")
    }
    
    static var disabledControlText: Self {
        assetColor("disabledControlText")
    }
    
    static var alternateSelectedControlText: Self {
        assetColor("alternateSelectedControlText")
    }
}
