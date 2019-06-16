//
//  SettingsContainerView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-14.
//
//

import UIKit

class SettingsContainerView: UIStackView {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        titleLabel.text = SETTINGS.string
    }
    
    private let horizontalModeLabel = "▄▄"
    private let verticalModeLabel = "▝█▖"
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let backButton = UIButton()
    
    let navigationController = UINavigationController()
    let settingsViewController = ViewController <SettingsTableView> ()
    
    var widthConstraint: NSLayoutConstraint!
    
    private let titleLabel: UILabel = .init()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        axis = .horizontal
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(navigationController.view)
        updateLocalizedStrings()
        
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
        
        let layoutModeSegmentedControlItems = [horizontalModeLabel, verticalModeLabel]
        let layoutModeSegmentedControl: UISegmentedControl = .init(items: layoutModeSegmentedControlItems)

        switch Keyboard.default.layoutMode {
        case .horizontal:
            layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.firstIndex(of: horizontalModeLabel)!

        case .vertical:
            layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.firstIndex(of: verticalModeLabel)!

        case .default:
            layoutModeSegmentedControl.selectedSegmentIndex = 0
        }

        layoutModeSegmentedControl.addTarget(self, action: #selector(action(layoutModeSegmentedControl:)), for: .allEvents)
        
        let layoutModeItem: UIBarButtonItem = .init(customView: layoutModeSegmentedControl)
        settingsViewController.navigationItem.rightBarButtonItem = layoutModeItem
        
        NotificationCenter.default.addLocaleObserver(self)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func action(layoutModeSegmentedControl: UISegmentedControl) {
        let selectedSegmentIndex = layoutModeSegmentedControl.selectedSegmentIndex
        let selectedSegmentTitle = layoutModeSegmentedControl.titleForSegment(at: selectedSegmentIndex)!
        
        switch selectedSegmentTitle {
        case horizontalModeLabel:
            Keyboard.default.layoutMode = .horizontal
            
        case verticalModeLabel:
            Keyboard.default.layoutMode = .vertical
            
        default:
            break
        }
    }
}
