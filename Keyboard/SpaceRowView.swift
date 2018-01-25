//
//  SpaceRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-31.
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
    
    var keys: [(proportion: CGFloat, view: KeyView)] {
        return [
            (5, settingsKey),
            (5, nextKeyboardKey),
            (6, tabKey),
            (12, spaceKey),
            (8, returnKey),
            (5, dismissKeyboardKey),
        ]
    }
    
    internal let settingsKey: KeyView = .init(key: .settings)
    internal let nextKeyboardKey: KeyView = .init(key: .nextKeyboard)
    internal let tabKey: KeyView = .init(key: .tab)
    internal let spaceKey: KeyView = .init(key: .space)
    internal let returnKey: KeyView = .init(key: .return)
    internal let dismissKeyboardKey: KeyView = .init(key: .dismissKeyboard)
    
    internal override init() {
        super.init()
        
        for key in keys {
            addSubview(key.view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(size: CGSize, keySpacing: CGFloat, labelFontSize: CGFloat) {
        super.configure(size: size, keySpacing: keySpacing, labelFontSize: labelFontSize)
        
        let allParts = keys.map {$0.proportion} .reduce(0, +)
        
        var freeSpace: CGFloat = 0
        
        var originX: CGFloat = 0
        for (proportion, keyView) in keys {
            var keyWidth = size.width * proportion/allParts
            
            if keyView.key == .space {
                 keyWidth += freeSpace
                freeSpace = 0
            }
            
            if keyView.key == .nextKeyboard
                && KeyboardViewController.shared.needsInputModeSwitchKey == false {
                
                freeSpace = keyWidth
                keyWidth = 0
                keyView.isHidden = true
            }
            else {
                keyView.isHidden = false
            }
            
            keyView.configure(size: .init(width: keyWidth, height: size.height), spacing: keySpacing, labelFontSize: labelFontSize)
            keyView.frame.origin.x = originX
            
            originX += keyWidth
        }
        
    }
}
