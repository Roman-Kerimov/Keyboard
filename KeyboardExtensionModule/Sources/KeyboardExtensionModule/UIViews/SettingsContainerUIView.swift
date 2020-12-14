//
//  SettingsContainerUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-14.
//
//

import SwiftUI
import KeyboardModule

class SettingsContainerUIView: UIStackView {
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let backButton = UIButton()
    
    let navigationController: UIViewController = {
        if #available(iOS 13.0, *) {
            return UIHostingController(rootView: SettingsNavigationView().localized().environmentObject(Keyboard.default))
        }
        else {
            return SettingsUINavigationController()
        }
    }()
    
    lazy var widthConstraint: NSLayoutConstraint = {
        let widthConstraint = navigationController.view.widthAnchor.constraint(
            equalToConstant: KeyboardUIViewController.shared.settingsWidth
        )
        widthConstraint.isActive = true
        
        return widthConstraint
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        axis = .horizontal
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(navigationController.view)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
