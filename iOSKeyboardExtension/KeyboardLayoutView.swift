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
            
            for (rowIndex, labelsRow) in layout.labels.enumerated() {
                for (columnIndex, label) in labelsRow.enumerated() {
                    
                    let keyView = keys[rowIndex][columnIndex]
                    keyView.mainLabel = label
                    keyView.shiftDownLabel.text = KeyboardLayout.shiftDown.labels[rowIndex][columnIndex]
                    keyView.shiftUpLabel.text = KeyboardLayout.shiftUpDictionary[label]
                }
            }
            
        }
    }
    
    var keys: [[KeyView]] = Array.init(repeating: Array.init(repeating: .init(), count: 10), count: 3)
    
    var halfKeyboards: [HalfKeyboardView] = []
    internal let unicodeCollectionView: UnicodeCollectionView = .init()
    
    init() {
        super.init(frame: .zero)
        
        for _ in 0...1 {
            let halfKeyboard = HalfKeyboardView(rowCount: layout.rowCount)
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
                
                halfKeyboards[halfKeyboardIndex].rows[rowIndex].addArrangedSubview(keyView)
                
                keys[rowIndex][columnIndex] = keyView
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGSize, halfKeyboardSize: CGSize, unicodeCollectionWidth: CGFloat) {
        frame.size = size
        
        for (halfKeyboardIndex, halfKeyboard) in halfKeyboards.enumerated() {
            halfKeyboard.frame.size = halfKeyboardSize
            
            if halfKeyboardIndex == 0 {
                halfKeyboard.frame.origin.x = unicodeCollectionWidth
            }
            else {
                halfKeyboard.frame.origin.x = size.width - halfKeyboard.frame.width
                halfKeyboard.frame.origin.y = size.height - halfKeyboard.frame.height
            }
        }
        
        unicodeCollectionView.size = .init(width: unicodeCollectionWidth, height: size.height)
    }
}
