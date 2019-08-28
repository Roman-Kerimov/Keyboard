//
//  SettingsUINavigationController.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import UIKit

class SettingsUINavigationController: UINavigationController {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        titleLabel.text = SETTINGS.string
    }
    
    let settingsViewController = ViewController <SettingsUIView> ()
    
    private let titleLabel: UILabel = .init()
    
    private let horizontalModeLabel = "▄▄"
    private let verticalModeLabel = "▝█▖"
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        viewControllers = [settingsViewController]
        
        updateLocalizedStrings()
        NotificationCenter.default.addLocaleObserver(self)
        
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
    }
    
    required init?(coder aDecoder: NSCoder) {
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
