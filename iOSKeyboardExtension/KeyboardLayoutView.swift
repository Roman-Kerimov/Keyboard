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
    
    var halfKeyboardSize = CGSize() {
        didSet {
            if halfKeyboardWidthConstraint != nil && halfKeyboardHeightConstraint != nil  {
            	halfKeyboardWidthConstraint!.constant = halfKeyboardSize.width
                halfKeyboardHeightConstraint!.constant = halfKeyboardSize.height
            }
            else {
                halfKeyboardWidthConstraint = halfKeyboards.first!.widthAnchor.constraint(equalToConstant: halfKeyboardSize.width)
                halfKeyboardWidthConstraint!.isActive = true
                
                halfKeyboardHeightConstraint = halfKeyboards.first!.heightAnchor.constraint(equalToConstant: halfKeyboardSize.height)
                halfKeyboardHeightConstraint!.isActive = true
            }
        }
    }
    
    private var halfKeyboardHeightConstraint: NSLayoutConstraint?
    private var halfKeyboardWidthConstraint: NSLayoutConstraint?
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0...1 {
            let halfKeyboard = HalfKeyboardView(rowCount: layout.rowCount)
            halfKeyboards.append(halfKeyboard)
            addSubview(halfKeyboard)
        }
        
        addSubview(unicodeCollectionView)
        
        unicodeCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        unicodeCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        unicodeCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        halfKeyboards.first!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        halfKeyboards.first!.leftAnchor.constraint(equalTo: unicodeCollectionView.rightAnchor).isActive = true
        halfKeyboards.last!.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        halfKeyboards.last!.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        halfKeyboards.first!.widthAnchor.constraint(equalTo: halfKeyboards.last!.widthAnchor).isActive = true
        halfKeyboards.first!.heightAnchor.constraint(equalTo: halfKeyboards.last!.heightAnchor).isActive = true
        
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
}
