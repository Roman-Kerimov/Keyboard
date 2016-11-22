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

    var heightConstraint: NSLayoutConstraint!
    
    init() {
        super.init(frame: CGRect())
        
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        
        var baseKeyForConstraint: KeyView!
        
        for (index, label) in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].enumerated() {
            let key = KeyView(label: label)
            addArrangedSubview(key)
            
            if index == 0 {
                baseKeyForConstraint = key
            }
            else {
                key.widthAnchor.constraint(equalTo: baseKeyForConstraint.widthAnchor).isActive = true
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
