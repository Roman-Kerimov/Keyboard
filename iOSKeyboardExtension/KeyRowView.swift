//
//  KeyRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class KeyRowView: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init(labelsRow: String) {
        super.init(frame: CGRect())
        
        axis = .horizontal
        
        var key: KeyView!
        var previousKey: KeyView!
        
        for character in labelsRow.characters {
            key = KeyView(labelString: String(character))
            
            addArrangedSubview(key)
            
            key.heightAnchor.constraint(equalTo: heightAnchor).isActive = true            
            if previousKey != nil {
                key.widthAnchor.constraint(equalTo: previousKey.widthAnchor).isActive = true
            }
            
            previousKey = key
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
