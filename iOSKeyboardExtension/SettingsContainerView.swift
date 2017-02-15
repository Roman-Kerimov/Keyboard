//
//  SettingsContainerView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.02.17.
//
//

import UIKit

@IBDesignable
class SettingsContainerView: UIStackView {
    
    @IBInspectable var language: String = Language.en.rawValue
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let backButton = UIButton()
    
    let settingsView = SettingsView()
    
    var widthConstraint: NSLayoutConstraint!

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        backButton.backgroundColor = shadeColor
        Language.current = Language(rawValue: language) ?? .en
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        axis = .horizontal
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(settingsView)
        
        widthConstraint = settingsView.widthAnchor.constraint(equalToConstant: 280)
        widthConstraint.isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
