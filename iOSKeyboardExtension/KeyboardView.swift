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
            
            settingsRowView.colorScheme = colorScheme
            
            if isInterfaceBuilder {
                keyboardView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
            }
        }
    }
    
    var heightConstraint: NSLayoutConstraint?
    
    let keyboardView = UIView()
    let keyboardStackView = UIStackView()
    var keyboardStackViewWidthConstraint: NSLayoutConstraint?
    var keyboardStackViewCenterXConstraint: NSLayoutConstraint?
    var keyboardStackViewRightConstraint: NSLayoutConstraint?
    
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
    
    func configure() {
        
        let screenSize: CGSize!
        
        if isInterfaceBuilder {
            screenSize = bounds.size
        }
        else {
            screenSize = UIScreen.main.bounds.size
        }
        
        let keyWidth: CGFloat
        let keyHeight: CGFloat
        
        let widthInKeys: CGFloat
        let heightInKeys: CGFloat
        
        let spaceRowHeightInKeys: CGFloat = 1
        let settingsRowHeightInKeys: CGFloat = 0.5
        
        let otherRowsHeightInKeys: CGFloat = spaceRowHeightInKeys + settingsRowHeightInKeys
        
        let maxKeyboardHeightRatio: CGFloat = 0.56
        
        let verticalModeIndex = modeSegmentLabels.index(of: verticalModeLabel)!
        let horizontalModeIndex = modeSegmentLabels.index(of: horizontalModeLabel)!
        
        if settingsRowView.modeSegmentedControl.isSelected == false {
            if bounds.width < 480 {
                settingsRowView.modeSegmentedControl.selectedSegmentIndex = verticalModeIndex
            }
            else {
                settingsRowView.modeSegmentedControl.selectedSegmentIndex = horizontalModeIndex
            }
            
            settingsRowView.modeSegmentedControl.isSelected = true
        }
        
        switch settingsRowView.modeSegmentedControl.selectedSegmentIndex {
        case verticalModeIndex:
            
            keyboardStackViewCenterXConstraint?.isActive = false
            keyboardStackViewRightConstraint?.isActive = true
            
            widthInKeys = CGFloat(keyboardLayout.columnCount / 2) + 0.5
            heightInKeys = CGFloat(keyboardLayout.rowCount * 2) + otherRowsHeightInKeys
            
            keyWidth = min(maxKeyWidth, 320 / widthInKeys)
            keyHeight = min(
                maxKeyHeight(fromWidth: keyWidth),
                min(568, screenSize.height) * maxKeyboardHeightRatio / heightInKeys
            )
            
        case horizontalModeIndex:
            
            keyboardStackViewRightConstraint?.isActive = false
            keyboardStackViewCenterXConstraint?.isActive = true
            
            widthInKeys = CGFloat(keyboardLayout.columnCount)
            heightInKeys = CGFloat(keyboardLayout.rowCount) + otherRowsHeightInKeys
            
            keyWidth = min(maxKeyWidth, screenSize.width / widthInKeys)
            keyHeight = min(
                maxKeyHeight(fromWidth: keyWidth),
                screenSize.height * maxKeyboardHeightRatio / heightInKeys
            )
            
        default:
            abort()
        }
        
        mainRowsView.halfKeyboardSize = CGSize(
            width: keyWidth * CGFloat(keyboardLayout.columnCount / 2),
            height: keyHeight * CGFloat(keyboardLayout.rowCount)
        )
        
        spaceRowView.height = spaceRowHeightInKeys * keyHeight
        settingsRowView.height = settingsRowHeightInKeys * keyHeight
        
        let keyboardWidth = keyWidth * widthInKeys
        let keyboardHeight = keyHeight * heightInKeys
        
        if keyboardStackViewWidthConstraint != nil {
            keyboardStackViewWidthConstraint?.constant = keyboardWidth
        }
        else {
            keyboardStackViewWidthConstraint = keyboardStackView.widthAnchor.constraint(equalToConstant: keyboardWidth)
            keyboardStackViewWidthConstraint?.isActive = true
        }
        
        if heightConstraint != nil {
            heightConstraint?.constant = keyboardHeight
        }
        else {
            heightConstraint = heightAnchor.constraint(equalToConstant: keyboardHeight)
            heightConstraint!.priority = 999
            heightConstraint!.isActive = true
        }
        
        if isInterfaceBuilder {
            keyboardView.heightAnchor.constraint(equalToConstant: keyboardHeight).isActive = true
        }
        
        KeyView.configureFor(width: keyWidth, height: keyHeight)
    }
    
    var mainRowsView: MainRowsView!
    let spaceRowView = SpaceRowView()
    let settingsRowView = SettingsRowView()
    
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
        keyboardStackView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor).isActive = true
        
        keyboardStackViewRightConstraint = keyboardStackView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor)
        keyboardStackViewCenterXConstraint = keyboardStackView.centerXAnchor.constraint(equalTo: keyboardView.centerXAnchor)
        
        mainRowsView = MainRowsView(layout: keyboardLayout)
        
        keyboardStackView.addArrangedSubview(mainRowsView)
        keyboardStackView.addArrangedSubview(spaceRowView)
        keyboardStackView.addArrangedSubview(settingsRowView)
        
        settingsRowView.modeSegmentedControl
            .addTarget(self, action: #selector(keyboardModeDidChange), for: .allEvents)
    }
    
    func keyboardModeDidChange() {
        configure()
    }
}
