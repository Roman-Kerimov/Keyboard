//
//  KeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 09.07.16.
//
//

import UIKit

@IBDesignable
class KeyboardView: UIView {
    let maxKeySide: CGFloat = 94

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var verticalConstraints: [NSLayoutConstraint] = []
    
    func verticalConstrains(isActive: Bool) {
        for constraint in verticalConstraints {
            constraint.isActive = isActive
        }

    }
    
    var horizontalConstraints: [NSLayoutConstraint] = []
    
    func horizontalConstraints(isActive: Bool) {
        for constraint in horizontalConstraints {
            constraint.isActive = isActive
        }

    }
    
    
    var heightConstraint: NSLayoutConstraint?
    let keyboardView = UIView()
    let keyboardStackView = UIStackView()
    var keyboardViewHeightConstraint: NSLayoutConstraint!
    
    let keyboardLayout = KeyboardLayout.qwerty
    
    override func prepareForInterfaceBuilder() {
        initialize()
        configure(forIB: true)
        
        keyboardView.backgroundColor = UIColor.lightGray
    }
    
    override func awakeFromNib() {
        initialize()
    }
    
    func configure(screenWidth: CGFloat = UIScreen.main.bounds.width, forIB: Bool = false) {
        if heightConstraint != nil {
            removeConstraint(heightConstraint!)
        }
        
        let screenSize: CGSize!
        
        if forIB {
            screenSize = bounds.size
        }
        else {
            let previousScreenSize = UIScreen.main.bounds.size
            
            if  previousScreenSize.width == screenWidth {
                screenSize = previousScreenSize
            }
            else {
                screenSize = CGSize(width: previousScreenSize.height, height: previousScreenSize.width)
            }
            
        }
        
        let keyWidth = min(max(screenSize.width, screenSize.height)/CGFloat(keyboardLayout.horizontalKeyCount), maxKeySide)
        KeyView.keySize = CGSize(width: keyWidth, height: keyWidth * 3/4)
        spaceRowView.heightConstraint.constant = KeyView.keySize.height * 1.5
        
        let spaceRowHeight = spaceRowView.heightConstraint.constant
        
        let keyboardHeight: CGFloat
        
        if bounds.width < 480 {
            
            mainRowsView.axis = .vertical
            
            keyboardHeight = KeyView.keySize.height * CGFloat(keyboardLayout.left.count * 2) + spaceRowHeight
        }
        else {
            
            mainRowsView.axis = .horizontal
            
            keyboardHeight = KeyView.keySize.height * CGFloat(keyboardLayout.left.count) + spaceRowHeight
        }
        
        heightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 0,
            constant: keyboardHeight
        )
        
        addConstraint(heightConstraint!)
        
        keyboardViewHeightConstraint.constant = keyboardHeight
    }
        
    var mainRowsView: MainRowsView!
    let spaceRowView = SpaceRowView()
    
    func initialize() {
        
        addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboardView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        keyboardView.addSubview(keyboardStackView)
        keyboardStackView.axis = .vertical
        keyboardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.topAnchor.constraint(equalTo: keyboardView.topAnchor).isActive = true
        keyboardStackView.leftAnchor.constraint(equalTo: keyboardView.leftAnchor).isActive = true
        keyboardStackView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor).isActive = true
        keyboardStackView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor).isActive = true
        
        keyboardViewHeightConstraint = keyboardView.heightAnchor.constraint(equalToConstant: 0)
        keyboardViewHeightConstraint.isActive = true
        
        mainRowsView = MainRowsView(layout: keyboardLayout)
        keyboardStackView.addArrangedSubview(mainRowsView)
        mainRowsView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.addArrangedSubview(spaceRowView)
        spaceRowView.translatesAutoresizingMaskIntoConstraints = false
    }
}
