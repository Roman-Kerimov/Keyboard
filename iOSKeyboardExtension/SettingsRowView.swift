//
//  SettingsRowView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 12.12.16.
//
//

import UIKit

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
            for button in buttons {
                button.setTitleColor(colorScheme.settingsLabelColor, for: [])
            }
        }
    }
    
    func configureFor(height: CGFloat) {
        for button in buttons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: height * 5/8)
            
            let horizontalInset = height / 2
            layoutMargins = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
        	isLayoutMarginsRelativeArrangement = true
        }
    }
    
    let nextKeyboardButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    
    var buttons: [UIButton]!

    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        distribution = .equalSpacing
        
        nextKeyboardButton.setTitle(NSLocalizedString("next keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        settingsButton.setTitle("settings", for: [])
        
        buttons = [nextKeyboardButton, settingsButton]
        
        for button in buttons {
            
            button.sizeToFit()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            addArrangedSubview(button)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
