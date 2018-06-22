//
//  KeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-09.
//
//

import UIKit

@IBDesignable
internal class KeyboardView: UIView {
    
    @IBInspectable internal var darkColorScheme: Bool = false
    @IBInspectable internal var alternateLayoutMode: Bool = false
    
    internal var documentContext: DocumentContext = .init() {
        didSet {
            let documentContextBeforeInput: String = documentContext.beforeInput ?? .init()
            
            var characterSequence: [Character] = .init()
            var spaceCount = 0
            
            characterSequenceView.characters = characterSequence
            
            var isNonspaceSequence: Bool = false
            
            for character in documentContextBeforeInput.reversed() {
                
                switch character {
                case Character.space:
                    spaceCount += 1
                    
                case Character.return, Character.tab:
                    return
                    
                default:
                    isNonspaceSequence = true
                    spaceCount = 0
                }
                
                if spaceCount == 2 {
                    break
                }
                
                characterSequence = [character] + characterSequence
                
                if spaceCount == 1 && isNonspaceSequence {
                    break
                }
            }
            
            characterSequenceView.characters = characterSequence
        }
    }
    
    internal var nextKeyboardKey: KeyView {
        return spaceRowView.nextKeyboardKey
    }
    
    internal var dismissKeyboardKey: KeyView {
        return spaceRowView.dismissKeyboardKey
    }
    
    internal var deleteKey: KeyView {
        return deleteRowView.deleteKey
    }
    
    internal var enterKey: KeyView {
        return spaceRowView.enterKey
    }
    
    internal var spaceKey: KeyView {
        return spaceRowView.spaceKey
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    #if TARGET_INTERFACE_BUILDER
    private var layoutMode: Keyboard.KeyboardLayoutMode = .default
    #else
    private var layoutMode: Keyboard.KeyboardLayoutMode {
        get {
            return Keyboard.default.layoutMode
        }
        
        set {
            Keyboard.default.layoutMode = newValue
        }
    }
    #endif

    internal var colorScheme: KeyboardColorScheme = .default {
        didSet {
            set(colorScheme: colorScheme)
        }
    }
    
    private func set(colorScheme: KeyboardColorScheme) {
        for key in keys {
            key.colorScheme = colorScheme
        }
        
        characterSequenceView.colorScheme = colorScheme
        layoutView.unicodeCollectionView.colorScheme = colorScheme
        
        if Bundle.main.isInterfaceBuilder {
            backgroundView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
        }
    }
    
    private var characterSequenceView: CharacterSequenceView {
        return deleteRowView.characterSequence
    }
    
    public var unicodeCollectionView: UnicodeCollectionView {
        return layoutView.unicodeCollectionView
    }
    
    private var keys: [KeyView] {
        var keyViews: [KeyView] = []
        
        for row in layoutView.keyViews {
            keyViews += row
        }
        
        keyViews.append(deleteRowView.deleteKey)
        keyViews += spaceRowView.keys.map {$0.view}
        
        return keyViews
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    private let backgroundView: UIView = .init()
    
    override internal func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        colorScheme = darkColorScheme ? .dark : .default
        
        enterKey.isEnabled = false
    }
    
    private let deleteRowView: DeleteRowView = .init()
    private let layoutView: KeyboardLayoutView = .init()
    private let spaceRowView: SpaceRowView = .init()
    
    override private init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        
        backgroundView.addSubview(deleteRowView)
        backgroundView.addSubview(spaceRowView)
        backgroundView.addSubview(layoutView)
        
        layoutView.layout = Keyboard.default.layout
        
        settingsContainerView.backButton.addTarget(self, action: #selector(hideSettings), for: .allTouchEvents)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLayout), name: .LayoutDidChange, object: nil)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let scaleFactor: CGFloat = Bundle.main.isInterfaceBuilder ? 1 : bounds.width / UIScreen.main.bounds.width
        
        let minimalScreenSize: CGSize = CGSize.init(width: 320, height: 480).applying(.init(scale: scaleFactor))
        
        let isPrefferedVerticalMode: Bool = bounds.width < minimalScreenSize.height
        
        if layoutMode == .default {
            layoutMode = isPrefferedVerticalMode ? .vertical : .horizontal
        }
        
        if alternateLayoutMode {
            layoutMode = layoutMode == .vertical ? .horizontal : .vertical
        }
        
        let screenSize: CGSize = Bundle.main.isInterfaceBuilder ? bounds.size : UIScreen.main.bounds.size.applying(.init(scale: scaleFactor))
        
        let isHorizontalMode = layoutMode == .horizontal || screenSize.height < minimalScreenSize.height
        
        let horizontalIndentInKeys: CGFloat = layoutMode == .horizontal && isPrefferedVerticalMode ? 1 : 0.5
        
        let coefficientOfIncreaseForMainButtons: CGFloat = layoutMode == .horizontal && isPrefferedVerticalMode ? 1.2 : 1
        
        let deleteRowHeightInKeys: CGFloat = 1 / coefficientOfIncreaseForMainButtons
        let spaceRowHeightInKeys: CGFloat = deleteRowHeightInKeys
        
        let sizeInKeysForVerticalMode: CGSize = .init(
            width: CGFloat(Keyboard.default.layout.columnCount / 2) + 0.2 + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Keyboard.default.layout.rowCount * 2) + spaceRowHeightInKeys
        )
        
        let sizeInKeysForHorizontalMode: CGSize = .init(
            width: CGFloat(Keyboard.default.layout.columnCount) + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Keyboard.default.layout.rowCount) + spaceRowHeightInKeys
        )
        
        let keyboardSizeInKeys = isHorizontalMode ? sizeInKeysForHorizontalMode : sizeInKeysForVerticalMode
        
        let maxKeyWidth: CGFloat = 1024/sizeInKeysForHorizontalMode.width * scaleFactor
        
        func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
            return width * 0.94
        }
        
        let keyWidth = min(maxKeyWidth, screenSize.width / keyboardSizeInKeys.width)
        
        let maxKeyboardHeightRatio: CGFloat = 0.59
        let maxKeyboardHeight = (screenSize.height * maxKeyboardHeightRatio)
        
        let keySize: CGSize = .init(
            width: keyWidth,
            height: min(
                max(
                    min(
                        maxKeyboardHeight / sizeInKeysForVerticalMode.height * coefficientOfIncreaseForMainButtons,
                        maxKeyHeight(fromWidth: maxKeyWidth)
                    ),
                    maxKeyHeight(fromWidth: keyWidth)
                ),
                
                maxKeyboardHeight / keyboardSizeInKeys.height
            )
        )
        
        let keyboardSize: CGSize = .init(
            width: keySize.width * keyboardSizeInKeys.width,
            height: keySize.height * keyboardSizeInKeys.height
        )
        
        if heightConstraint != nil {
            heightConstraint?.constant = keyboardSize.height
        }
        else {
            heightConstraint = heightAnchor.constraint(equalToConstant: keyboardSize.height)
            heightConstraint?.priority = .defaultHigh
            heightConstraint?.isActive = true
        }
        
        if !Bundle.main.isInterfaceBuilder && !Bundle.main.isExtension {
            frame = UIScreen.main.bounds
            frame.size.height = keyboardSize.height
        }
        
        backgroundView.frame = .init(
            x: 0,
            y: Bundle.main.isInterfaceBuilder ? bounds.height - keyboardSize.height : 0,
            width: bounds.width,
            height:  keyboardSize.height
        )
        
        let deleteRowHeight: CGFloat = deleteRowHeightInKeys * keySize.height
        let spaceRowHeight: CGFloat = spaceRowHeightInKeys * keySize.height
        
        let keySpacing = deleteRowHeight * 0.1
        let labelFontSize: CGFloat = min(spaceRowHeight * 0.5, 36)
        
        deleteRowView.configure(
            size: .init(width: keyboardSize.width, height: deleteRowHeight),
            keySpacing: keySpacing, labelFontSize: labelFontSize
        )
        deleteRowView.frame.origin.y = 0
        
        let layoutHeight: CGFloat = backgroundView.bounds.height - deleteRowHeight - spaceRowHeight
        
        layoutView.frame = .init(x: 0, y: deleteRowHeight, width: keyboardSize.width, height: layoutHeight)
        layoutView.keySize = keySize
        layoutView.keySpacing = keySpacing
        layoutView.labelFontSize = labelFontSize
        layoutView.horizontalIndent = horizontalIndentInKeys * keySize.width
        
        spaceRowView.configure(
            size: .init(width: keyboardSize.width, height: spaceRowHeight),
            keySpacing: keySpacing, labelFontSize: labelFontSize
        )
        spaceRowView.frame.origin.y = deleteRowHeight + layoutHeight
        
        
        if isHorizontalMode {
            deleteRowView.center.x = backgroundView.bounds.midX
            layoutView.center.x = backgroundView.bounds.midX
            spaceRowView.center.x = backgroundView.bounds.midX
        }
        else {
            let originX = backgroundView.bounds.maxX - keyboardSize.width
            deleteRowView.frame.origin.x = originX
            layoutView.frame.origin.x = originX
            spaceRowView.frame.origin.x = originX
        }
        
        deleteRowView.characterSequence.layout.itemSize = .init(
            width: floor(max(keySize.width, minimalScreenSize.width/5.5)/4),
            height: deleteRowHeight
        )
        deleteRowView.characterSequence.reloadData()
    }
    
    @objc private func setLayout() {
        layoutView.layout = Keyboard.default.layout
    }
    
    internal var settingsContainerView: SettingsContainerView = .init()
    
    private var settingsRightConstraint: NSLayoutConstraint!
    
    private let settingsAnimateDuration = 0.3
    
    @objc internal func showSettings() {
        
        controller?.addChildViewController(settingsContainerView.navigationController)
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
            self.settingsContainerView.navigationController.removeFromParentViewController()
        }
    }
}
