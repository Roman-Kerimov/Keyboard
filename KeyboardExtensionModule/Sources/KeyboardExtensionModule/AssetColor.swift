//
//  AssetColor.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-07-08.
//

import SwiftUI

protocol AssetColor {
    static func assetColor(_ assetName: String) -> Self
}

extension Color: AssetColor {
    static func assetColor(_ assetName: String) -> Self {
        Self(uiColor: UIColor(named: assetName, in: Bundle.module, compatibleWith: nil)!)
    }
}

extension UIColor: AssetColor {
    static func assetColor(_ assetName: String) -> Self {
        Self(named: assetName, in: Bundle.module, compatibleWith: nil)!
    }
}

extension AssetColor {
    
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
