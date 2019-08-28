//
//  SettingsContainerUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-14.
//
//

import UIKit

class SettingsContainerUIView: UIStackView {
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let backButton = UIButton()
    
    let navigationController = SettingsUINavigationController()
    
    var widthConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        axis = .horizontal
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(navigationController.view)
        
        widthConstraint = navigationController.view.widthAnchor.constraint(equalToConstant: 280)
        widthConstraint.isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
