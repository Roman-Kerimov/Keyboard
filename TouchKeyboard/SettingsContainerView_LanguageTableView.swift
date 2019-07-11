//
//  SettingsContainerView_LanguageTableView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import UIKit

class SettingsContainerView_LanguageTableView: SettingsContainerView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        navigationController.pushViewController(settingsViewController.rootView.languageTableViewController, animated: false)
    }

}
