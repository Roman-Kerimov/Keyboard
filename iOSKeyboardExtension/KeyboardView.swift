//
//  KeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 09.07.16.
//
//

import UIKit

@IBDesignable
class KeyboardView: UIView {
    
    @IBInspectable var darkColorScheme: Bool = false
    @IBInspectable var alternateLayoutMode: Bool = false

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let settings = KeyboardSettings()
    
    var colorScheme: KeyboardColorScheme = .default {
        didSet {
            for key in keys {
                key.colorScheme = colorScheme
            }
            
            settingsRowView.colorScheme = colorScheme
            
            if isInterfaceBuilder {
                keyboardView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
            }
        }
    }
    
    var keys: [KeyView] {
        var keyViews: [KeyView] = []
        
        for halfKeyboard in layoutView!.halfKeyboards {
            for row in halfKeyboard.rows {
                keyViews += row.arrangedSubviews as! [KeyView]
            }
        }
        
        keyViews += spaceRowView.arrangedSubviews as! [KeyView]
        
        return keyViews
    }
    
    var scaleFactor: CGFloat {
        if isInterfaceBuilder {
            return 1
        }
        else {
            return bounds.width / UIScreen.main.bounds.width
        }
    }
    
    var minimalScreenSize: CGSize {
        return CGSize(width: 320 * scaleFactor, height: 480 * scaleFactor)
    }
    
    var  screenSize: CGSize {
        if isInterfaceBuilder {
            return bounds.size
        }
        else {
        	let nativeSize = UIScreen.main.bounds.size
            return CGSize(width: nativeSize.width * scaleFactor, height: nativeSize.height * scaleFactor)
        }
    }
    
    let spaceRowHeightInKeys: CGFloat = 1
    
    let maxKeyboardHeightRatio: CGFloat = 0.56
    
    private var maxKeyWidth: CGFloat {
        return 102.4 * scaleFactor
    }
    private func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
        return width * 0.94
    }
    
    var sizeInKeys = CGSize()
    
    var sizeInKeysForVerticalMode: CGSize {
        return CGSize(
            width: CGFloat(settings.layout.columnCount / 2) + 0.5,
            height: CGFloat(settings.layout.rowCount * 2) + spaceRowHeightInKeys
        )
    }
    
    var sizeInKeysForHorizontalMode: CGSize {
        return CGSize(
            width: CGFloat(settings.layout.columnCount),
            height: CGFloat(settings.layout.rowCount) + spaceRowHeightInKeys
        )
    }
    
    var settingsRowHeight: CGFloat {
        return max(screenSize.width, screenSize.height) * 0.04
    }
    
    var keySize: CGSize {
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
    
    var halfKeyboardSize: CGSize {
        return CGSize(
            width: keySize.width * CGFloat(settings.layout.columnCount / 2),
            height: keySize.height * CGFloat(settings.layout.rowCount)
        )
    }
    
    var spaceRowHeight: CGFloat {
        return spaceRowHeightInKeys * keySize.height
    }

    var size: CGSize {
        return CGSize(
            width: keySize.width * sizeInKeys.width,
            height: keySize.height * sizeInKeys.height + settingsRowHeight
        )
    }
    
    
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let keyboardView = UIView()
    let keyboardStackView = UIStackView()
    
    var isInterfaceBuilder: Bool = false
    
    override func prepareForInterfaceBuilder() {
        isInterfaceBuilder = true
        
        initialize()
        configure()
        
        colorScheme = .default
        
        if darkColorScheme {
            colorScheme = .dark
        }
    }
    
    override func awakeFromNib() {
        initialize()
    }
    
    func configure() {
        if settingsRowView.layoutModeSegmentedControl.numberOfSegments < 2 {
            settingsRowView.layoutModeSegmentedControl.insertSegment(withTitle: verticalModeLabel, at: 1, animated: false)
        }
        
        let verticalModeIndex = modeSegmentLabels.index(of: verticalModeLabel)!
        let horizontalModeIndex = modeSegmentLabels.index(of: horizontalModeLabel)!
        
        if settings.layoutMode == .default {
            if bounds.width < minimalScreenSize.height {
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
        
        if screenSize.height < minimalScreenSize.height {
            settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex = horizontalModeIndex
            settingsRowView.layoutModeSegmentedControl.removeSegment(at: verticalModeIndex, animated: false)
        }
        
        switch settingsRowView.layoutModeSegmentedControl.selectedSegmentIndex {
            
        case verticalModeIndex:
            keyboardStackView.alignment = .trailing
            sizeInKeys = sizeInKeysForVerticalMode
            
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
        
        if isInterfaceBuilder {
            keyboardView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        layoutView?.halfKeyboardSize = halfKeyboardSize
        spaceRowView.height = spaceRowHeight
        settingsRowView.height = settingsRowHeight
        
        for key in keys {
            key.configure(for: self)
        }
    }
    
    var layoutView: KeyboardLayoutView? {
        return layoutContainerView.subviews.filter { $0 is KeyboardLayoutView }.first as? KeyboardLayoutView
    }
    
    var layoutContainerView = UIView()
    let spaceRowView = SpaceRowView()
    let settingsRowView = SettingsRowView()
    
    func initialize() {
        
        addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        if !isInterfaceBuilder {
            keyboardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
        keyboardView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboardView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        keyboardView.addSubview(keyboardStackView)
        keyboardStackView.alignBounds()
        keyboardStackView.axis = .vertical
        keyboardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStackView.addArrangedSubview(layoutContainerView)
        #if TARGET_INTERFACE_BUILDER
            let layoutView = KeyboardLayoutView(layout: .qwerty)
            layoutContainerView.addSubview(layoutView)
            layoutView.alignBounds()
        #endif
        
        keyboardStackView.addArrangedSubview(spaceRowView)
        keyboardStackView.addArrangedSubview(settingsRowView)
        
        layoutContainerView.widthAnchor.constraint(equalTo: spaceRowView.widthAnchor).isActive = true
        
        settingsRowView.widthAnchor.constraint(equalTo: keyboardStackView.widthAnchor).isActive = true
        
        settingsRowView.layoutModeSegmentedControl.addTarget(self, action: #selector(keyboardModeDidChange), for: .allEvents)
    }
    
    func keyboardModeDidChange(segmentedControl: UISegmentedControl) {
        
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
}
