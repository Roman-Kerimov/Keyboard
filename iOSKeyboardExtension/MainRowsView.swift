//
//  MainRowsView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 21.11.16.
//
//

import UIKit

class MainRowsView: UIView {

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
        
        for _ in 0...1 {
            let halfKeyboard = HalfKeyboardView(rowCount: layout.rowCount)
            halfKeyboards.append(halfKeyboard)
            addSubview(halfKeyboard)
        }
        
        halfKeyboards.first!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        halfKeyboards.first!.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        halfKeyboards.last!.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        halfKeyboards.last!.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        halfKeyboards.first!.widthAnchor.constraint(equalTo: halfKeyboards.last!.widthAnchor).isActive = true
        halfKeyboards.first!.heightAnchor.constraint(equalTo: halfKeyboards.last!.heightAnchor).isActive = true
        
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
