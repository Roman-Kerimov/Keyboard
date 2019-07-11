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
    
    var height: CGFloat = 0 {
        didSet {
            if heightConstraint != nil {
                heightConstraint!.constant = height
            }
            else {
                heightConstraint = heightAnchor.constraint(equalToConstant: height)
                heightConstraint!.isActive = true
            }
        }
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        
        let spaceKey = KeyView(label: spaceLabel)
        addArrangedSubview(spaceKey)
        
        let deleteKey = KeyView(label: deleteLabel)
        addArrangedSubview(deleteKey)
        deleteKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
