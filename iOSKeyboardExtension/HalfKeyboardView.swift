//
//  HalfKeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class HalfKeyboardView: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    init(layout: [[String]]) {
        super.init(frame: CGRect())
        
        axis = .vertical
        
        var keyRow: KeyRowView!
        var previousKeyRow: KeyRowView!
        
        for labelsRow in layout {
            keyRow = KeyRowView(labelsRow: labelsRow)
            
            addArrangedSubview(keyRow)
            
            keyRow.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            
            if previousKeyRow != nil {
                keyRow.heightAnchor.constraint(equalTo: previousKeyRow.heightAnchor).isActive = true
            }
            
            previousKeyRow = keyRow
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
