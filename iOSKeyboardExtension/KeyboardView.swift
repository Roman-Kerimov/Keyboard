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
    
    var leftIndentConstraint: NSLayoutConstraint!
    var rightIndentConstraint: NSLayoutConstraint!
    
    var heightConstraint: NSLayoutConstraint?
    var topIndentConstraint: NSLayoutConstraint!
    let backgroundKeyboardView = UIView()
    
    let leftKeyboardLayout = ["',.py",
                              "aoeui",
                              ";qjkx"]
    
    let rightKeyboardLayout = ["fgcrl",
                               "dhtns",
                               "bmwvz"]
    
    override func prepareForInterfaceBuilder() {
        initialize()
        configure(forIB: true)
        
        backgroundKeyboardView.backgroundColor = UIColor.lightGray()
    }
    
    override func awakeFromNib() {
        initialize()
    }
    
    func configure(screenWidth: CGFloat = UIScreen.main().bounds.width, forIB: Bool = false) {
        if heightConstraint != nil {
            removeConstraint(heightConstraint!)
        }
        
        let screenSize: CGSize!
        
        if forIB {
            screenSize = bounds.size
        }
        else {
            let previousScreenSize = UIScreen.main().bounds.size
            
            if  previousScreenSize.width == screenWidth {
                screenSize = previousScreenSize
            }
            else {
                screenSize = CGSize(width: previousScreenSize.height, height: previousScreenSize.width)
            }
            
        }
        
        let horizontalKeyCount = leftKeyboardLayout.first!.characters.count + rightKeyboardLayout.first!.characters.count
        let keyWidth = min(max(screenSize.width, screenSize.height)/CGFloat(horizontalKeyCount), maxKeySide)
        KeyView.keySize = CGSize(width: keyWidth, height: keyWidth * 3/4)
        
        if bounds.width < 480 {
            
            leftIndentConstraint.constant = screenSize.width - keyWidth * CGFloat(leftKeyboardLayout.first!.characters.count)
            rightIndentConstraint.constant = -keyWidth/2
            
            heightConstraint = NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 0,
                constant: KeyView.keySize.height * 7
            )
            
            addConstraint(heightConstraint!)
            
        }
        else {
            
            heightConstraint = NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 0,
                constant: KeyView.keySize.height * 4
            )
            
            addConstraint(heightConstraint!)
            
            leftIndentConstraint.constant = 0
            rightIndentConstraint.constant = 0
        }
        
        if forIB {
            let topIndentForIB = screenSize.height - heightConstraint!.constant
            topIndentConstraint.constant = topIndentForIB
        }

    }
    
    func initialize() {
        addSubview(backgroundKeyboardView)
        backgroundKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        backgroundKeyboardView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topIndentConstraint = backgroundKeyboardView.topAnchor.constraint(equalTo: topAnchor)
        topIndentConstraint.isActive = true
        backgroundKeyboardView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundKeyboardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let leftKeyboardView = HalfKeyboardView(labelsLayout: leftKeyboardLayout)
        backgroundKeyboardView.addSubview(leftKeyboardView)
        leftKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let rightKeyboardView = HalfKeyboardView(labelsLayout: rightKeyboardLayout)
        backgroundKeyboardView.addSubview(rightKeyboardView)
        rightKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let spaceKeyboardView = UIView()
        backgroundKeyboardView.addSubview(spaceKeyboardView)
        spaceKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        leftIndentConstraint = leftKeyboardView.leftAnchor.constraint(equalTo: backgroundKeyboardView.leftAnchor)
        leftIndentConstraint.isActive = true
        
        leftKeyboardView.topAnchor.constraint(equalTo: backgroundKeyboardView.topAnchor).isActive = true
        
        rightIndentConstraint = rightKeyboardView.rightAnchor.constraint(equalTo: backgroundKeyboardView.rightAnchor)
        rightIndentConstraint.isActive = true
        
        spaceKeyboardView.leftAnchor.constraint(equalTo: backgroundKeyboardView.leftAnchor).isActive = true
        spaceKeyboardView.topAnchor.constraint(equalTo: rightKeyboardView.bottomAnchor).isActive = true
        spaceKeyboardView.rightAnchor.constraint(equalTo: backgroundKeyboardView.rightAnchor).isActive = true
        spaceKeyboardView.bottomAnchor.constraint(equalTo: backgroundKeyboardView.bottomAnchor).isActive = true
        
        spaceKeyboardView.heightAnchor.constraint(equalTo: rightKeyboardView.heightAnchor, multiplier: 1/3).isActive = true
    }

}
