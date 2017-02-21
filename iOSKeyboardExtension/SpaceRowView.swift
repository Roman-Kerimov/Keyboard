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
    
    let nextKeyboardKey = KeyView(key: .nextKeyboard)
    let dismissKeyboardKey = KeyView(key: .dismissKeyboard)
    let spaceKey = KeyView(key: .space)
    let deleteKey = KeyView(key: .delete)
    let settingsKey = KeyView(key: .settings)
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        
        addArrangedSubview(nextKeyboardKey)
        addArrangedSubview(dismissKeyboardKey)
        addArrangedSubview(spaceKey)
        addArrangedSubview(deleteKey)
        addArrangedSubview(settingsKey)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(keyboardWidth: CGFloat) {
        
        let compactKeyWidth = keyboardWidth / 8
        
        nextKeyboardKey.width = compactKeyWidth
        dismissKeyboardKey.width = compactKeyWidth
        settingsKey.width = compactKeyWidth
        
        deleteKey.width = keyboardWidth / 5
    }
}
