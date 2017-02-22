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
    
    internal override var size: CGSize {
        didSet {
            super.size = size
            
            let compactKeyWidth = size.width / 8
            
            nextKeyboardKey.width = compactKeyWidth
            dismissKeyboardKey.width = compactKeyWidth
            settingsKey.width = compactKeyWidth
            
            returnKey.width = size.width / 5
        }
    }
    
    let nextKeyboardKey = KeyView(key: .nextKeyboard)
    let dismissKeyboardKey = KeyView(key: .dismissKeyboard)
    let spaceKey = KeyView(key: .space)
    let returnKey = KeyView(key: .return)
    let settingsKey = KeyView(key: .settings)
    
    internal override init() {
        super.init()
        
        addArrangedSubview(nextKeyboardKey)
        addArrangedSubview(dismissKeyboardKey)
        addArrangedSubview(spaceKey)
        addArrangedSubview(returnKey)
        addArrangedSubview(settingsKey)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
