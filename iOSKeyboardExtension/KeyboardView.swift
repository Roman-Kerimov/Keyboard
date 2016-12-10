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
    
    private let maxKeyWidth: CGFloat = 102.4
    private func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
        return width * 0.94
    }

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
    
    var updatableConstraints: [NSLayoutConstraint] = []
    
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
        
        for constraint in updatableConstraints {
            constraint.isActive = false
            removeConstraint(constraint)
        }
        updatableConstraints = []
        
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
        
        let keyWidth: CGFloat
        let keyHeight: CGFloat
        
        let widthInKeys: CGFloat
        let heightInKeys: CGFloat
        
        if bounds.width < 480 {
            mainRowsView.axis = .vertical
            
            widthInKeys = CGFloat(keyboardLayout.columnCount / 2)
            heightInKeys = CGFloat(keyboardLayout.rowCount * 2 + 1)
            
            keyWidth = min(maxKeyWidth, 320 / widthInKeys)
            keyHeight = min(maxKeyHeight(fromWidth: keyWidth), min(568, screenSize.height) / 2 / heightInKeys)
        }
        else {
            mainRowsView.axis = .horizontal
            
            widthInKeys = CGFloat(keyboardLayout.columnCount)
            heightInKeys = CGFloat(keyboardLayout.rowCount + 1)
            
            keyWidth = min(maxKeyWidth, screenSize.width / widthInKeys)
            keyHeight = min(maxKeyHeight(fromWidth: keyWidth), screenSize.height / 2 / heightInKeys)
        }
        
        KeyView.configureFor(width: keyWidth, height: keyHeight)
        
        let keyboardWidth = keyWidth * widthInKeys
        let keyboardHeight = keyHeight * heightInKeys
        
        
        updatableConstraints.append(spaceRowView.heightAnchor.constraint(equalToConstant: keyHeight))
        updatableConstraints.append(keyboardStackView.widthAnchor.constraint(equalToConstant: keyboardWidth))
        updatableConstraints.append(heightAnchor.constraint(equalToConstant: keyboardHeight))
        updatableConstraints.last!.priority = 999
        
        for constraint in updatableConstraints {
            constraint.isActive = true
        }
        
        if isInterfaceBuilder {
            keyboardView.heightAnchor.constraint(equalToConstant: keyboardHeight).isActive = true
        }
    }
    
    var mainRowsView: MainRowsView!
    let spaceRowView = SpaceRowView()
    
    func initialize() {
        
        addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        if !isInterfaceBuilder {
            keyboardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
        keyboardView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboardView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        keyboardView.addSubview(keyboardStackView)
        keyboardStackView.axis = .vertical
        keyboardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.topAnchor.constraint(equalTo: keyboardView.topAnchor).isActive = true
        keyboardStackView.centerXAnchor.constraint(equalTo: keyboardView.centerXAnchor).isActive = true
        keyboardStackView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor).isActive = true
        
        mainRowsView = MainRowsView(layout: keyboardLayout)
        
        keyboardStackView.addArrangedSubview(mainRowsView)
        keyboardStackView.addArrangedSubview(spaceRowView)
    }
}
