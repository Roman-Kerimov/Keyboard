//
//  KeyboardLayoutUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-11-21.
//
//

import UIKit
import KeyboardModule

class KeyboardLayoutUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var layout: KeyboardLayout = Keyboard.default.layout
    
    var keyViews: [[KeyUIView]] = []
    
    var halfKeyboards: [UIView] = .init()
    internal let characterSearchView: CharacterSearchUIView = .init()
    
    init() {
        super.init(frame: .zero)
        
        clipsToBounds = true
        
        for _ in 0...1 {
            let halfKeyboard: UIView = .init()
            halfKeyboards.append(halfKeyboard)
            addSubview(halfKeyboard)
        }
        
        addSubview(characterSearchView)
        
        for (rowIndex, row) in Key.layoutBoard.enumerated() {
            for (columnIndex, key) in row.enumerated() {
                
                if rowIndex == keyViews.count {
                    keyViews.append([])
                }
                
                let keyView = KeyUIView.init(key: key)
                keyViews[rowIndex].append(keyView)
                
                let halfKeyboardIndex = columnIndex < Key.layoutBoardColumnCount/2 ? 0 : 1
                
                halfKeyboards[halfKeyboardIndex].addSubview(keyView)
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var horizontalIndent: CGFloat = 0
    
    override func layoutSubviews() {
        
        for (halfKeyboardIndex, halfKeyboard) in halfKeyboards.enumerated() {
            
            halfKeyboard.frame.size = .init(
                width: KeyUIView.size.width * .init(Key.layoutBoardColumnCount / 2),
                height: KeyUIView.size.height * .init(Key.layoutBoardRowCount)
            )
            
            if halfKeyboardIndex == 0 {
                halfKeyboard.frame.origin.x = horizontalIndent
            }
            else {
                halfKeyboard.frame.origin.x = frame.width - halfKeyboard.frame.width - horizontalIndent
                halfKeyboard.frame.origin.y = frame.height - halfKeyboard.frame.height
            }
        }
        
        characterSearchView.size = .init(width: horizontalIndent, height: frame.height)
        
        for (rowIndex, row) in keyViews.enumerated() {
            for (keyIndex, key) in row.enumerated() {
                
                let halfKeyboardIndex: Int
                
                if keyIndex < Key.layoutBoardColumnCount/2 {
                    halfKeyboardIndex = 0
                }
                else {
                    halfKeyboardIndex = 1
                }
                
                key.frame = .init(
                    origin: .init(
                        x: KeyUIView.size.width * .init(keyIndex - row.count/2 * halfKeyboardIndex),
                        y: KeyUIView.size.height * .init(rowIndex)
                    ),
                    size: KeyUIView.size
                )
            }
        }
    }
}
