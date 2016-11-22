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
        
        axis = .horizontal
        
        for _ in 0...1 {
            let halfKeyboard = HalfKeyboardView(rowCount: layout.rowCount)
            halfKeyboards.append(halfKeyboard)
            addArrangedSubview(halfKeyboard)
        }
        
        var key00: KeyView!
        
        for (rowIndex, labelsRow) in layout.labels.enumerated() {
            for (columnIndex, label) in labelsRow.enumerated() {
                
                let halfKeyboardIndex: Int
                
                if columnIndex < layout.columnCount/2 {
                    halfKeyboardIndex = 0
                }
                else {
                    halfKeyboardIndex = 1
                }
                
                let key = KeyView(label: label)
                
                halfKeyboards[halfKeyboardIndex].rows[rowIndex].addArrangedSubview(key)
                
                if rowIndex == 0 && columnIndex == 0 {
                    key00 = key
                }
                else {
                    key.widthAnchor.constraint(equalTo: key00.widthAnchor).isActive = true
                }
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
