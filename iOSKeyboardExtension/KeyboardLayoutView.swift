//
//  MainRowsView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 21.11.16.
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
            
            for (rowIndex, row) in layout.rows.enumerated() {
                for (columnIndex, baseCharacterComponent) in row.enumerated() {
                    
                    let keyView = keys[rowIndex][columnIndex]
                    keyView.mainLabel = [baseCharacterComponent].character
                    let shiftDownCharacterComponents = [KeyboardLayout.shiftDown.rows[rowIndex][columnIndex]]
                    keyView.shiftDownLabel = shiftDownCharacterComponents.character + shiftDownCharacterComponents.extraArray.filter {$0.contains(.extra0) || $0.contains(.extra1) || $0.contains(.extra2)} .map {$0.character} .joined()
                    
                    if let shiftUpCharacterComponent = KeyboardLayout.shiftUpDictionary[baseCharacterComponent] {
                        keyView.shiftUpLabel = [shiftUpCharacterComponent].character
                    }
                }
            }
            
        }
    }
    
    var keys: [[KeyView]] = Array.init(repeating: Array.init(repeating: .init(), count: 10), count: 3)
    
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
        
        for rowIndex in 0...2 {
            for columnIndex in 0...9 {
                
                let halfKeyboardIndex: Int
                
                if columnIndex < layout.columnCount/2 {
                    halfKeyboardIndex = 0
                }
                else {
                    halfKeyboardIndex = 1
                }
                
                let keyView = KeyView.init()
                
                halfKeyboards[halfKeyboardIndex].addSubview(keyView)
                
                keys[rowIndex][columnIndex] = keyView
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        for (rowIndex, row) in keys.enumerated() {
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
