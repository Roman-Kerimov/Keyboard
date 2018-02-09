//
//  SettingsContainerView_LegalNoticesView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import UIKit

class SettingsContainerView_LegalNoticesView: SettingsContainerView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        navigationController.pushViewController(settingsViewController.rootView.legalNoticesViewController, animated: false)
    }
    
}
