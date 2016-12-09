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
    let segmentSpace: CGFloat = 4

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var colorScheme: KeyboardColorScheme = .default {
        didSet {
            for key in KeyView.allKeys {
                key.colorScheme = colorScheme
            }
            
            if isInterfaceBuilder {
                keyboardView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
            }
        }
    }
    
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
    
    let keyboardView = UIView()
    let keyboardStackView = UIStackView()
    
    let keyboardLayout = KeyboardLayout.qwerty
    
    var isInterfaceBuilder: Bool = false
    
    override func prepareForInterfaceBuilder() {
        isInterfaceBuilder = true
        
        initialize()
        configure()
        
        colorScheme = .default
    }
    
    override func awakeFromNib() {
        initialize()
    }
    
    func configure(screenWidth: CGFloat = UIScreen.main.bounds.width) {
        
        let screenSize: CGSize!
        
        if isInterfaceBuilder {
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
        
        let keyWidth = min(max(screenSize.width, screenSize.height)/CGFloat(keyboardLayout.columnCount), maxKeySide)
        KeyView.keySize = CGSize(width: keyWidth, height: keyWidth * 3/4)
        
        var keyboardHeight: CGFloat = 0
        
        if bounds.width < 480 {
            
            mainRowsView.axis = .vertical
            
            keyboardHeight = KeyView.keySize.height * CGFloat(keyboardLayout.rowCount * 2) + segmentSpace * CGFloat(keyboardStackView.arrangedSubviews.count)
        }
        else {
            
            mainRowsView.axis = .horizontal
            
            keyboardHeight = KeyView.keySize.height * CGFloat(keyboardLayout.rowCount) + segmentSpace * CGFloat(keyboardStackView.arrangedSubviews.count - 1)
        }
        
        let spaceRowHeight = KeyView.keySize.height
        
        spaceRowView.heightAnchor.constraint(equalToConstant: spaceRowHeight).isActive = true
        
        keyboardHeight += spaceRowHeight
        
        let heightConstraint = heightAnchor.constraint(equalToConstant: keyboardHeight)
        heightConstraint.priority = 999
        heightConstraint.isActive = true
        
        let keyboardViewHeightConstraint = keyboardView.heightAnchor.constraint(equalToConstant: keyboardHeight)
        keyboardViewHeightConstraint.priority = 999
        keyboardViewHeightConstraint.isActive = true
    }
    
    let numericRowView = NumericRowView()
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
        keyboardStackView.spacing = segmentSpace
        keyboardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.topAnchor.constraint(equalTo: keyboardView.topAnchor).isActive = true
        keyboardStackView.leftAnchor.constraint(equalTo: keyboardView.leftAnchor).isActive = true
        keyboardStackView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor).isActive = true
        keyboardStackView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor).isActive = true
        
        mainRowsView = MainRowsView(layout: keyboardLayout)
        mainRowsView.spacing = segmentSpace
        
        keyboardStackView.addArrangedSubview(mainRowsView)
        keyboardStackView.addArrangedSubview(spaceRowView)
    }
}
