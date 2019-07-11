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
    let settingsLabelColor: UIColor
    
    let fakeBackroundColorForInterfaceBuilder: UIColor
    
    var borderColor: UIColor {
        return .clear
    }
    
    let activeLabelColor: UIColor = .white

    static let light = KeyboardColorScheme(
        keyColor: .white,
        labelColor: .black,
        shiftLabelColor: UIColor.black.withAlphaComponent(0.4),
        settingsLabelColor: .lightGray,
        
        fakeBackroundColorForInterfaceBuilder: UIColor.black.withAlphaComponent(0.1)
    )
    
    static let dark = KeyboardColorScheme(
        keyColor: UIColor.white.withAlphaComponent(0.3),
        labelColor: .white,
        shiftLabelColor: UIColor.white.withAlphaComponent(0.5),
        settingsLabelColor: .lightGray,
        
        fakeBackroundColorForInterfaceBuilder: .darkGray
    )
    
    static let `default` = KeyboardColorScheme.light
}
