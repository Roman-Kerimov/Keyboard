//
//  SpaceRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 31.07.16.
//
//

import UIKit

class SpaceRowView: UIStackView {

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
        
        axis = .horizontal
        
        let deleteKey = KeyView(labelString: "delete", type: .delete)
        
        addArrangedSubview(deleteKey)
        
        deleteKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
        
        let spaceKey = KeyView(labelString: "", type: .space)
        
        addArrangedSubview(spaceKey)
        
        spaceKey.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        heightConstraint = heightAnchor.constraint(equalToConstant: keySize.height * 1.5)
        heightConstraint.isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
