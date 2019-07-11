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
    
    let keys: [(proportion: CGFloat, view: KeyView)] = [
        (5, .init(key: .settings)),
        (5, .init(key: .nextKeyboard)),
        (17,.init(key: .space)),
        (8, .init(key: .return)),
        (5, .init(key: .dismissKeyboard)),
    ]
    
    var nextKeyboardKey: KeyView {
        return keys.filter {$0.view.specialKey == SpecialKey.nextKeyboard} .first!.view
    }
    
    internal override init() {
        super.init()
        
        for key in keys {
            addSubview(key.view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(size: CGSize, labelFontSize: CGFloat) {
        super.configure(size: size, labelFontSize: labelFontSize)
        
        let allParts = keys.map {$0.proportion} .reduce(0, +)
        
        var originX: CGFloat = 0
        for (proportion, keyView) in keys {
            let keyWidth = size.width * proportion/allParts
            
            keyView.configure(size: .init(width: keyWidth, height: size.height), labelFontSize: labelFontSize)
            keyView.frame.origin.x = originX
            
            originX += keyWidth
        }
        
    }
}
