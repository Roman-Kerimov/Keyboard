//
//  KeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 09.07.16.
//
//

import UIKit

@IBDesignable
internal class KeyboardView: UIView {
    
    @IBInspectable internal var darkColorScheme: Bool = false
    @IBInspectable internal var alternateLayoutMode: Bool = false
    
    internal var nextKeyboardButton: UIButton {
        return settingsRowView.nextKeyboardButton
    }
    
    internal var hideButton: UIButton {
        return settingsRowView.hideButton
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let settings = KeyboardSettings()
    
    internal var colorScheme: KeyboardColorScheme = .default {
        didSet {
            set(colorScheme: colorScheme)
        }
    }
    
    private func set(colorScheme: KeyboardColorScheme) {
        for key in keys {
            key.colorScheme = colorScheme
        }
        
        settingsRowView.colorScheme = colorScheme
        
        #if TARGET_INTERFACE_BUILDER
            keyboardView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
        #endif
    }
    
    private var keys: [KeyView] {
        var keyViews: [KeyView] = []
        
        for halfKeyboard in layoutView.halfKeyboards {
            for row in halfKeyboard.rows {
                keyViews += row.arrangedSubviews as! [KeyView]
            }
        }
        
        keyViews += spaceRowView.arrangedSubviews as! [KeyView]
        
        return keyViews
    }
    
    private var scaleFactor: CGFloat {
        #if TARGET_INTERFACE_BUILDER
            return 1
        #else
            return bounds.width / UIScreen.main.bounds.width
        #endif
    }
    
    private var minimalScreenSize: CGSize {
        return CGSize(width: 320 * scaleFactor, height: 480 * scaleFactor)
    }
    
    private var  screenSize: CGSize {
        #if TARGET_INTERFACE_BUILDER
            return bounds.size
        #else
        	let nativeSize = UIScreen.main.bounds.size
            return CGSize(width: nativeSize.width * scaleFactor, height: nativeSize.height * scaleFactor)
        #endif
    }
    
    private let spaceRowHeightInKeys: CGFloat = 1
    
    private let maxKeyboardHeightRatio: CGFloat = 0.56
    
    private var maxKeyWidth: CGFloat {
        return 102.4 * scaleFactor
    }
    private func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
        return width * 0.94
    }
    
    private var sizeInKeys = CGSize()
    
    private var sizeInKeysForVerticalMode: CGSize {
        return CGSize(
            width: CGFloat(settings.layout.columnCount / 2) + 0.5,
            height: CGFloat(settings.layout.rowCount * 2) + spaceRowHeightInKeys
        )
    }
    
    private var sizeInKeysForHorizontalMode: CGSize {
        return CGSize(
            width: CGFloat(settings.layout.columnCount),
            height: CGFloat(settings.layout.rowCount) + spaceRowHeightInKeys
        )
    }
    
    private var settingsRowHeight: CGFloat {
        return max(screenSize.width, screenSize.height) * 0.04
    }
    
    private var keySize: CGSize {
        let keyWidth = min(maxKeyWidth, screenSize.width / sizeInKeys.width)
        
        let maxKeyboardHeight = (screenSize.height * maxKeyboardHeightRatio - settingsRowHeight)
        
        return CGSize(
            width: keyWidth,
            height: min(
                max(
                    min(
                        maxKeyboardHeight / sizeInKeysForVerticalMode.height,
                        maxKeyHeight(fromWidth: maxKeyWidth)
                    ),
                    maxKeyHeight(fromWidth: keyWidth)
                ),
                
                maxKeyboardHeight / sizeInKeys.height
            )
        )
    }
    
    private var halfKeyboardSize: CGSize {
        return CGSize(
            width: keySize.width * CGFloat(settings.layout.columnCount / 2),
            height: keySize.height * CGFloat(settings.layout.rowCount)
        )
    }
    
    private var spaceRowHeight: CGFloat {
        return spaceRowHeightInKeys * keySize.height
    }

    private var size: CGSize {
        return CGSize(
            width: keySize.width * sizeInKeys.width,
            height: keySize.height * sizeInKeys.height + settingsRowHeight
        )
    }
    
    
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    
    private let keyboardView = UIView()
    private let keyboardStackView = UIStackView()
    
    override internal func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configure()
        
        colorScheme = .default
        
        if darkColorScheme {
            colorScheme = .dark
        }
    }
    
    internal func configure() {
        if settingsRowView.layoutModeSegmentedControl.numberOfSegments < 2 {
            settingsRowView.layoutModeSegmentedControl.insertSegment(withTitle: verticalModeLabel, at: 1, animated: false)
        }
        
        let verticalModeIndex = modeSegmentLabels.index(of: verticalModeLabel)!
        let horizontalModeIndex = modeSegmentLabels.index(of: horizontalModeLabel)!
        
        if settings.layoutMode == .default {
            if bounds.width < self.minimalScreenSize.height {
                settings.layoutMode = .vertical
            }
            else {
                settings.layoutMode = .horizontal
            }
        }
        
        if alternateLayoutMode {
            if settings.layoutMode == .vertical {
                settings.layoutMode = .horizontal
            }
            else {
                settings.layoutMode = .vertical
            }
        }
        
        switch settings.layoutMode {
            
        case .horizontal:
            settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex = horizontalModeIndex
            
        case .vertical:
            settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex = verticalModeIndex
            
        default:
            abort()
        }
        
        if screenSize.height < self.minimalScreenSize.height {
            settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex = horizontalModeIndex
            settingsRowView.layoutModeSegmentedControl.removeSegment(at: verticalModeIndex, animated: false)
        }
        
        switch settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex {
            
        case verticalModeIndex:
            keyboardStackView.alignment = .trailing
            sizeInKeys = self.sizeInKeysForVerticalMode
            
        case horizontalModeIndex:
            keyboardStackView.alignment = .center
            sizeInKeys = sizeInKeysForHorizontalMode
            
        default:
            abort()
        }
        
        if widthConstraint != nil {
            widthConstraint?.constant = size.width
        }
        else {
            widthConstraint = layoutContainerView.widthAnchor.constraint(equalToConstant: size.width)
            widthConstraint?.priority = 999
            widthConstraint?.isActive = true
        }
        
        if heightConstraint != nil {
            heightConstraint?.constant = size.height
        }
        else {
            heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
            heightConstraint!.priority = 999
            heightConstraint!.isActive = true
        }
        
        #if TARGET_INTERFACE_BUILDER
            keyboardView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        #endif
        
        layoutView.halfKeyboardSize = halfKeyboardSize
        spaceRowView.height = spaceRowHeight
        settingsRowView.height = settingsRowHeight
        
        let maxKeyWidth = self.maxKeyWidth
        let keySize = self.keySize
        let minimalScreenSize = self.minimalScreenSize
        let sizeInKeysForVerticalMode = self.sizeInKeysForVerticalMode
        
        for key in keys {
            key.configure(maxKeyWidth: maxKeyWidth, keySize: keySize, minimalScreenSize: minimalScreenSize, sizeInKeysForVerticalMode: sizeInKeysForVerticalMode)
        }
    }
    
    private var layoutContainerView = UIView()
    private let spaceRowView = SpaceRowView()
    private let settingsRowView = SettingsRowView()
    
    override private init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        #if !TARGET_INTERFACE_BUILDER
            keyboardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        #endif
        
        keyboardView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboardView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        keyboardView.addSubview(keyboardStackView)
        keyboardStackView.alignBounds()
        keyboardStackView.axis = .vertical
        keyboardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.addArrangedSubview(layoutContainerView)
        addKeyboardLayout()
        
        keyboardStackView.addArrangedSubview(spaceRowView)
        keyboardStackView.addArrangedSubview(settingsRowView)
        
        layoutContainerView.widthAnchor.constraint(equalTo: spaceRowView.widthAnchor).isActive = true
        
        settingsRowView.widthAnchor.constraint(equalTo: keyboardStackView.widthAnchor).isActive = true
        
        settingsRowView.layoutModeSegmentedControl.addTarget(self, action: #selector(keyboardModeDidChange), for: .allEvents)
        
        settingsRowView.settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        settingsContainerView.backButton.addTarget(self, action: #selector(hideSettings), for: .allTouchEvents)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func keyboardModeDidChange(segmentedControl: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
            
        case modeSegmentLabels.index(of: verticalModeLabel)!:
            settings.layoutMode = .vertical
            
        case modeSegmentLabels.index(of: horizontalModeLabel)!:
            settings.layoutMode = .horizontal
            
        default:
            abort()
        }
        
        configure()
    }
    
    private var layoutView = KeyboardLayoutView(layout: KeyboardSettings().layout)
    
    internal func updateKeyboardLayout() {
        layoutView.removeFromSuperview()
        
        layoutView = KeyboardLayoutView(layout: settings.layout)
        addKeyboardLayout()
        
        configure()
        set(colorScheme: colorScheme)
    }
    
    private func addKeyboardLayout() {
        layoutContainerView.addSubview(layoutView)
        layoutView.alignBounds()
    }
    
    private let settingsContainerView = SettingsContainerView()
    
    private var settingsRightConstraint: NSLayoutConstraint!
    
    private let settingsAnimateDuration = 0.3
    
    @objc private func showSettings() {
        addSubview(settingsContainerView)
        
        settingsRightConstraint = settingsContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: settingsContainerView.widthConstraint.constant)
        
        NSLayoutConstraint.activate([
            settingsContainerView.topAnchor.constraint(equalTo: topAnchor),
            settingsContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            settingsRightConstraint,
            settingsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        layoutIfNeeded()
        
        settingsRightConstraint.constant = 0
        
        UIView.animate(withDuration: settingsAnimateDuration) {
            self.settingsContainerView.backButton.backgroundColor = self.settingsContainerView.shadeColor
            self.layoutIfNeeded()
        }
    }
    
    @objc private func hideSettings() {
        
        layoutIfNeeded()
        
        settingsRightConstraint.constant = self.settingsContainerView.widthConstraint.constant
        
        UIView.animate(withDuration: settingsAnimateDuration) {
            self.settingsContainerView.backButton.backgroundColor = .clear
            self.layoutIfNeeded()
        }
        
        Timer.scheduledTimer(withTimeInterval: settingsAnimateDuration, repeats: false) { (timer) in
            self.settingsContainerView.removeFromSuperview()
        }
    }
}
