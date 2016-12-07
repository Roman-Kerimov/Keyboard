//
//  MainRowsView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 21.11.16.
//
//

import UIKit

class MainRowsView: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var halfKeyboards: [HalfKeyboardView] = []
    
    init(layout: KeyboardLayout) {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        distribution = .fillEqually
        
        for _ in 0...1 {
            let halfKeyboard = HalfKeyboardView(rowCount: layout.rowCount)
            halfKeyboards.append(halfKeyboard)
            addArrangedSubview(halfKeyboard)
        }
        
        for (rowIndex, labelsRow) in layout.labels.enumerated() {
            for (columnIndex, label) in labelsRow.enumerated() {
                
                let halfKeyboardIndex: Int
                
                if columnIndex < layout.columnCount/2 {
                    halfKeyboardIndex = 0
                }
                else {
                    halfKeyboardIndex = 1
                }
                
                let key = KeyView(label: label, shiftDownLabel: KeyboardLayout.shiftDown.labels[rowIndex][columnIndex])
                
                halfKeyboards[halfKeyboardIndex].rows[rowIndex].addArrangedSubview(key)
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
