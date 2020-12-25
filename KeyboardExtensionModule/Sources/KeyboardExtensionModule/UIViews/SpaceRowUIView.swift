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
    private var keyViews: [KeyUIView] = []
    
    override func layoutSubviews() {
        
        let keyboardViewController = KeyboardViewController.shared
        
        if keyViews.isEmpty {
            keyViews = keyboardViewController.spaceRowKeyDescriptions.map {KeyUIView(key: $0.key)}
            
            for keyView in keyViews {
                addSubview(keyView)
            }
        }
        
        var originX: CGFloat = 0
        
        zip(keyViews, keyboardViewController.spaceRowKeyDescriptions.map(\.width)).forEach { (keyView, keyWidth) in
            keyView.frame = .init(x: originX, y: 0, width: keyWidth, height: frame.height)
            originX += keyWidth
        }
    }
}
