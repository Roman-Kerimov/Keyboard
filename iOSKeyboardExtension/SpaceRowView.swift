//
//  SpaceRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 31.07.16.
//
//

import UIKit

class SpaceRowView: RowView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let nextKeyboardKey = KeyView(key: .nextKeyboard)
    let dismissKeyboardKey = KeyView(key: .dismissKeyboard)
    let spaceKey = KeyView(key: .space)
    let returnKey = KeyView(key: .return)
    let settingsKey = KeyView(key: .settings)
    
    internal override init() {
        super.init()
        
        let compactKeyMultiplier: CGFloat = 1/8
        
        addArrangedSubview(nextKeyboardKey)
        nextKeyboardKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: compactKeyMultiplier).isActive = true
        
        addArrangedSubview(dismissKeyboardKey)
        dismissKeyboardKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: compactKeyMultiplier).isActive = true
        
        addArrangedSubview(spaceKey)
        
        addArrangedSubview(returnKey)
        returnKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
        
        addArrangedSubview(settingsKey)
        settingsKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: compactKeyMultiplier).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
