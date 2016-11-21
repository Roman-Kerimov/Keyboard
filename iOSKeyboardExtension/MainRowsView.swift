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
    
    init(layout: KeyboardLayout) {
        super.init(frame: CGRect())
        
        axis = .horizontal
        
        let leftKeyboardView = HalfKeyboardView(layout: layout.left)
        addArrangedSubview(leftKeyboardView)
        leftKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let rightKeyboardView = HalfKeyboardView(layout: layout.right)
        addArrangedSubview(rightKeyboardView)
        rightKeyboardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
