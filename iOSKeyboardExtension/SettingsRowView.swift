//
//  SettingsRowView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 12.12.16.
//
//

import UIKit

let horizontalModeLabel = "▄▄"
let verticalModeLabel = "▝█▖"
let modeSegmentLabels = [horizontalModeLabel, verticalModeLabel]

class SettingsRowView: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var colorScheme: KeyboardColorScheme = .default {
        didSet {
            for control in controls {
                if let button = control as? UIButton {
                    button.setTitleColor(colorScheme.settingsLabelColor, for: [])
                }
                if let segmentedControl = control as? UISegmentedControl {
                    segmentedControl.tintColor = colorScheme.settingsLabelColor
                }
            }
        }
    }
    
    var height: CGFloat = 0 {
        didSet {
            heightConstraint.constant = height
            
            let fontSize = height * 5/8
            
            for control in controls {
                if let button = control as? UIButton {
                    button.titleLabel?.font = button.titleLabel?.font.withSize(fontSize)
                }
                
                if let segmentedControl = control as? UISegmentedControl {
                    
                    segmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], for: .normal)
                }
            }
            
            let horizontalInset = height / 2
            let verticalInset = height / 20
            layoutMargins = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
            isLayoutMarginsRelativeArrangement = true
        }
    }
    
    let nextKeyboardButton = UIButton(type: .system)
    let hideButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    
    let modeSegmentedControl = UISegmentedControl(items: modeSegmentLabels)
    
    var controls: [UIControl]!

    private var heightConstraint: NSLayoutConstraint!

    init() {
        super.init(frame: CGRect())
        
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        distribution = .equalSpacing
        
        let iconFont = UIFont(name: "FiraSans", size: 1)
        
        nextKeyboardButton.setTitle(NSLocalizedString("🌐", comment: "Title for 'Next Keyboard' button"), for: [])
        nextKeyboardButton.titleLabel?.font = iconFont
        
        hideButton.setTitle("⌨↓", for: [])
        hideButton.titleLabel?.font = iconFont
        
        settingsButton.setTitle("⚬⚬⚬", for: [])
        
        controls = [nextKeyboardButton, hideButton, modeSegmentedControl, settingsButton]
        
        for control in controls {
            
            control.sizeToFit()
            control.translatesAutoresizingMaskIntoConstraints = false
            
            addArrangedSubview(control)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
