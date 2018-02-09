//
//  MainRowsView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-11-21.
//
//

import UIKit

class KeyboardLayoutView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public var layout: KeyboardLayout = .qwerty {
        didSet {
            setKeys()
        }
    }
    
    var keyViews: [[KeyView]] = []
    
    var halfKeyboards: [UIView] = .init()
    internal let unicodeCollectionView: UnicodeCollectionView = .init()
    
    init() {
        super.init(frame: .zero)
        
        clipsToBounds = true
        
        for _ in 0...1 {
            let halfKeyboard: UIView = .init()
            halfKeyboards.append(halfKeyboard)
            addSubview(halfKeyboard)
        }
        
        addSubview(unicodeCollectionView)
        
        setKeys()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setKeys() {
        for (rowIndex, row) in layout.rows.enumerated() {
            for (columnIndex, key) in row.enumerated() {
                
                if rowIndex == keyViews.count {
                    keyViews.append([])
                }
                
                if columnIndex == keyViews[rowIndex].count {
                    let keyView = KeyView.init(key: key)
                    keyViews[rowIndex].append(keyView)
                    
                    let halfKeyboardIndex: Int
                    
                    if columnIndex < layout.columnCount/2 {
                        halfKeyboardIndex = 0
                    }
                    else {
                        halfKeyboardIndex = 1
                    }
                    
                    halfKeyboards[halfKeyboardIndex].addSubview(keyView)
                }
                else {
                    keyViews[rowIndex][columnIndex].key = key
                }
            }
        }
    }
    
    func configure(size: CGSize, halfKeyboardSize: CGSize, keySize: CGSize, keySpacing: CGFloat, labelFontSize: CGFloat, horizontalIndent: CGFloat) {
        frame.size = size
        
        for (halfKeyboardIndex, halfKeyboard) in halfKeyboards.enumerated() {
            halfKeyboard.frame.size = halfKeyboardSize
            
            if halfKeyboardIndex == 0 {
                halfKeyboard.frame.origin.x = horizontalIndent
            }
            else {
                halfKeyboard.frame.origin.x = size.width - halfKeyboard.frame.width - horizontalIndent
                halfKeyboard.frame.origin.y = size.height - halfKeyboard.frame.height
            }
        }
        
        unicodeCollectionView.size = .init(width: horizontalIndent, height: size.height)
        
        for (rowIndex, row) in keyViews.enumerated() {
            for (keyIndex, key) in row.enumerated() {
                
                let halfKeyboardIndex: Int
                
                if keyIndex < layout.columnCount/2 {
                    halfKeyboardIndex = 0
                }
                else {
                    halfKeyboardIndex = 1
                }
                
                key.frame.origin.x = keySize.width * .init(keyIndex - row.count/2 * halfKeyboardIndex)
                key.frame.origin.y = keySize.height * .init(rowIndex)
                key.configure(size: keySize, spacing: keySpacing, labelFontSize: labelFontSize)
            }
        }
    }
}
