//
//  NumericRowView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 22.11.16.
//
//

import UIKit

class NumericRowView: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        distribution = .fillEqually
        
        for label in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"] {
            let key = KeyView(label: label)
            addArrangedSubview(key)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
