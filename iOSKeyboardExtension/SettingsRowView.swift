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
            
            let font = UIFont.systemFont(ofSize: height * 5/8)
            
            for control in controls {
                if let button = control as? UIButton {
                    button.titleLabel?.font = font
                }
                
                if let segmentedControl = control as? UISegmentedControl {
                    
                    segmentedControl.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
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
        
        nextKeyboardButton.setTitle(NSLocalizedString("next keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        hideButton.setTitle("hide", for: [])
        settingsButton.setTitle("settings", for: [])
        
        controls = [nextKeyboardButton, modeSegmentedControl, hideButton, settingsButton]
        
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
