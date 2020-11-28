//
//  SpaceRowUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-31.
//
//

import UIKit
import KeyboardModule

class SpaceRowUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var keys: [(proportion: CGFloat, view: KeyUIView)] {
        return [
            (5, settingsKey),
            (5, nextKeyboardKey),
            (17, spaceKey),
            (8, enterKey),
            (5, dismissKeyboardKey),
        ]
    }
    
    internal let settingsKey: KeyUIView = .init(key: .settings)
    internal let nextKeyboardKey: KeyUIView = .init(key: .nextKeyboard)
    internal let spaceKey: KeyUIView = .init(key: .space)
    internal let enterKey: KeyUIView = .init(key: .enter)
    internal let dismissKeyboardKey: KeyUIView = .init(key: .dismissKeyboard)
    
    init() {
        super.init(frame: .zero)
        
        for key in keys {
            addSubview(key.view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let allParts = keys.map {$0.proportion} .reduce(0, +)
        
        var freeSpace: CGFloat = 0
        
        var originX: CGFloat = 0
        for (proportion, keyView) in keys {
            var keyWidth = frame.width * proportion/allParts
            
            if keyView.key == .space {
                 keyWidth += freeSpace
                freeSpace = 0
            }
            
            if keyView.key == .nextKeyboard
                && Keyboard.default.delegate?.needsInputModeSwitchKey == false {
                
                freeSpace = keyWidth
                keyWidth = 0
                keyView.isHidden = true
            }
            else {
                keyView.isHidden = false
            }
            
            keyView.frame = .init(x: originX, y: 0, width: keyWidth, height: frame.height)
            
            originX += keyWidth
        }
        
    }
}
