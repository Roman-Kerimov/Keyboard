//
//  KeyboardColorScheme.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 05.12.16.
//
//

import UIKit

struct KeyboardColorScheme {
    
    let keyColor: UIColor
    let labelColor: UIColor
    let shiftLabelColor: UIColor
    
    var borderColor: UIColor {
        return labelColor
    }
    
    let activeLabelColor = UIColor.white

    static let light = KeyboardColorScheme(
        keyColor: UIColor.white,
        labelColor: UIColor.black,
        shiftLabelColor: UIColor.lightGray
    )
    
    static let dark = KeyboardColorScheme(
        keyColor: UIColor.black,
        labelColor: UIColor.white,
        shiftLabelColor: UIColor.lightGray
    )
    
    static let `default` = KeyboardColorScheme.light
}
