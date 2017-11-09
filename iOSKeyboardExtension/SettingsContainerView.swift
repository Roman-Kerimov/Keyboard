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
        
        settingsViewController.title = SETTINGS.string
        titleLabel.text = SETTINGS.string
        
        settingsViewController.updateLocalizedStrings()
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
    
    private let titleLabel: UILabel = .init()
    
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
        
        settingsViewController.navigationController?.view.layer.borderWidth = 1/UIScreen.main.scale
        settingsViewController.navigationController?.view.layer.borderColor = UIColor.lightGray.cgColor
        
        
        titleLabel.font = .boldSystemFont(ofSize: UIFont.systemFontSize * 1.8)
        titleLabel.sizeToFit()
        
        let titleItem: UIBarButtonItem = .init(customView: titleLabel)
        settingsViewController.navigationItem.leftBarButtonItem = titleItem
        settingsViewController.navigationItem.titleView = .init()
        
        
        let layoutModeSegmentedControlItems = [SpecialKey.horizontalMode.label, SpecialKey.verticalMode.label]
        let layoutModeSegmentedControl: UISegmentedControl = .init(items: layoutModeSegmentedControlItems)

        switch KeyboardSettings.shared.layoutMode {
        case .horizontal:
            layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.index(of: SpecialKey.horizontalMode.label)!

        case .vertical:
            layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.index(of: SpecialKey.verticalMode.label)!

        case .default:
            layoutModeSegmentedControl.selectedSegmentIndex = 0
        }

        layoutModeSegmentedControl.addTarget(self, action: #selector(action(layoutModeSegmentedControl:)), for: .allEvents)
        
        let layoutModeItem: UIBarButtonItem = .init(customView: layoutModeSegmentedControl)
        settingsViewController.navigationItem.rightBarButtonItem = layoutModeItem
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func action(layoutModeSegmentedControl: UISegmentedControl) {
        let selectedSegmentIndex = layoutModeSegmentedControl.selectedSegmentIndex
        let selectedSegmentTitle = layoutModeSegmentedControl.titleForSegment(at: selectedSegmentIndex)!
        
        KeyboardViewController.shared.keyAction(label: selectedSegmentTitle)
    }
}
