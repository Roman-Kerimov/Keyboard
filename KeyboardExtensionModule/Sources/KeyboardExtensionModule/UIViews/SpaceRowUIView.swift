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
    
    private lazy var keys: [(proportion: CGFloat, view: KeyUIView)] = [
        (5, .init(key: .settings)),
        (5, .init(key: .nextKeyboard)),
        (17, .init(key: .space)),
        (8, .init(key: .enter)),
        (5, .init(key: .dismissKeyboard)),
    ]
    
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
