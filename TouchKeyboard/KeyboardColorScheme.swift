//
//  KeyboardColorScheme.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-12-05.
//
//

import UIKit

struct KeyboardColorScheme {
    
    let keyColor: UIColor
    let serviceKeyColor: UIColor
    let labelColor: UIColor
    let shiftLabelColor: UIColor
    let settingsLabelColor: UIColor
    
    let unicodeNameTextColor: UIColor
    let unicodeNameBackgroundColor: UIColor
    
    let fakeBackroundColorForInterfaceBuilder: UIColor
    
    let disabledKeyLabelColor: UIColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    let specialReturnLabelColor: UIColor = .white

    static let light = KeyboardColorScheme(
        keyColor: .white,
        serviceKeyColor: #colorLiteral(red: 0.418971857, green: 0.4386817824, blue: 0.4612155331, alpha: 0.2007917366),
        labelColor: .black,
        shiftLabelColor: .darkGray,
        settingsLabelColor: .lightGray,
        
        unicodeNameTextColor: .white,
        unicodeNameBackgroundColor: .init(white: 0.4, alpha: 0.8),
        
        fakeBackroundColorForInterfaceBuilder: UIColor.black.withAlphaComponent(0.1)
    )
    
    static let dark = KeyboardColorScheme(
        keyColor: UIColor.white.withAlphaComponent(0.3),
        serviceKeyColor: UIColor.white.withAlphaComponent(0.15),
        labelColor: .white,
        shiftLabelColor: #colorLiteral(red: 0.8789479733, green: 0.8789479733, blue: 0.8789479733, alpha: 1),
        settingsLabelColor: .lightGray,
        
        unicodeNameTextColor: .black,
        unicodeNameBackgroundColor: .init(white: 1, alpha: 0.8),
        
        fakeBackroundColorForInterfaceBuilder: .darkGray
    )
    
    static let `default` = KeyboardColorScheme.light
}
