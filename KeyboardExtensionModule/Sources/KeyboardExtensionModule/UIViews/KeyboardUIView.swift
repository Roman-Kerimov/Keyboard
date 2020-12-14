//
//  KeyboardUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-09.
//
//

import UIKit
import KeyboardModule

internal class KeyboardUIView: UIView {
    
    private let backgroundView: UIView = .init()
    
    private let deleteRowView: DeleteRowUIView = .init()
    private let layoutView: KeyboardLayoutUIView = .init()
    private let spaceRowView: SpaceRowUIView = .init()
    
    override private init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        
        backgroundView.addSubview(deleteRowView)
        backgroundView.addSubview(spaceRowView)
        backgroundView.addSubview(layoutView)
        
        layoutView.layout = Keyboard.default.layout
        
        settingsContainerView.backButton.addTarget(self, action: #selector(hideSettings), for: .allTouchEvents)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLayout), publisher: Keyboard.self)
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsLayout), publisher: Keyboard.self)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var keyboardViewControler: KeyboardUIViewController {.shared}
    
    override func layoutSubviews() {
        
        guard keyboardViewControler.state != .disappeared else {
            return
        }
        
        keyboardViewControler.updateSizes()
        
        backgroundView.frame = .init(
            origin: .zero,
            size: .init(
                width: bounds.width,
                height:  keyboardViewControler.keyboardSize.height
            )
        )
        
        deleteRowView.frame = .init(
            origin: .zero,
            size: .init(
                width: keyboardViewControler.keyboardSize.width,
                height: keyboardViewControler.deleteRowHeight
            )
        )
        
        layoutView.frame = .init(
            x: 0,
            y: keyboardViewControler.deleteRowHeight,
            width: keyboardViewControler.keyboardSize.width,
            height: keyboardViewControler.layoutHeight
        )
        
        spaceRowView.frame = .init(
            x: 0,
            y: keyboardViewControler.deleteRowHeight + keyboardViewControler.layoutHeight,
            width: keyboardViewControler.keyboardSize.width,
            height: keyboardViewControler.spaceRowHeight
        )
        
        if keyboardViewControler.isHorizontalMode {
            deleteRowView.center.x = backgroundView.bounds.midX
            layoutView.center.x = backgroundView.bounds.midX
            spaceRowView.center.x = backgroundView.bounds.midX
        }
        else {
            let originX = backgroundView.bounds.maxX - keyboardViewControler.keyboardSize.width
            deleteRowView.frame.origin.x = originX
            layoutView.frame.origin.x = originX
            spaceRowView.frame.origin.x = originX
        }
        
        deleteRowView.characterSequence.layout.itemSize = keyboardViewControler.characterSequenceItemSize
        deleteRowView.characterSequence.reloadData()
    }
    
    @objc private func setLayout() {
        layoutView.layout = Keyboard.default.layout
    }
    
    private var settingsContainerView: SettingsContainerUIView = .init()
    
    private var settingsRightConstraint: NSLayoutConstraint!
    
    private var settingsAnimationDuration: Float64 {keyboardViewControler.settingsAnimationDuration}
    
    @objc internal func showSettings() {
        
        controller?.addChild(settingsContainerView.navigationController)
        addSubview(settingsContainerView)
        
        settingsRightConstraint = settingsContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: settingsContainerView.widthConstraint.constant)
        
        NSLayoutConstraint.activate(
            [
                settingsContainerView.topAnchor.constraint(equalTo: topAnchor),
                settingsContainerView.leftAnchor.constraint(equalTo: leftAnchor),
                settingsRightConstraint,
                settingsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ]
        )
        
        layoutIfNeeded()
        
        settingsRightConstraint.constant = 0
        
        UIView.animate(withDuration: settingsAnimationDuration) {
            self.settingsContainerView.backButton.backgroundColor = self.settingsContainerView.shadeColor
            self.layoutIfNeeded()
        }
    }
    
    @objc private func hideSettings() {
        
        layoutIfNeeded()
        
        settingsRightConstraint.constant = self.settingsContainerView.widthConstraint.constant
        
        UIView.animate(withDuration: settingsAnimationDuration) {
            self.settingsContainerView.backButton.backgroundColor = .clear
            self.layoutIfNeeded()
        }
        
        Timer.scheduledTimer(withTimeInterval: settingsAnimationDuration, repeats: false) { (timer) in
            self.settingsContainerView.removeFromSuperview()
            self.settingsContainerView.navigationController.removeFromParent()
        }
    }
}
