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
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        settingsViewController.title = SettingsTitle.string
    }
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let backButton = UIButton()
    
    let navigationController = UINavigationController()
    let settingsViewController = ViewController <SettingsTableView> ()
    
    var widthConstraint: NSLayoutConstraint!

    override func prepareForInterfaceBuilder() {
        Language.current = Language(rawValue: language) ?? .en
        
        super.prepareForInterfaceBuilder()
        
        backButton.backgroundColor = shadeColor
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        axis = .horizontal
        distribution = .fill
        
        #if !TARGET_INTERFACE_BUILDER
            translatesAutoresizingMaskIntoConstraints = false
        #endif
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(navigationController.view)
        
        widthConstraint = navigationController.view.widthAnchor.constraint(equalToConstant: 280)
        widthConstraint.isActive = true
        
        navigationController.viewControllers = [settingsViewController]
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
