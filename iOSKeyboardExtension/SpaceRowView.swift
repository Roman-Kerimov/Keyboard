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
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        
        let deleteKey = KeyView(label: deleteLabel)
        
        addArrangedSubview(deleteKey)
        
        deleteKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
        
        let spaceKey = KeyView(label: spaceLabel)
        
        addArrangedSubview(spaceKey)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
