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
            let documentContextBeforeInput: String = documentContext.beforeInput
            
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
            
            var textForSearch: String =
                documentContextBeforeInput
                    .components(separatedBy: .whitespacesAndNewlines).last?
                    .components(separatedBy: CharacterSet.printableASCII.inverted).last ?? .init()
            
            if textForSearch.contains(.reverseSolidus) {
                textForSearch = .reverseSolidus + ( textForSearch.components(separatedBy: String.reverseSolidus).last ?? .init() )
            }
            
            unicodeCollectionView.search(byName: textForSearch)
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
        
        #if TARGET_INTERFACE_BUILDER
            backgroundView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
        #endif
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
    
    private var coefficientOfIncreaseForMainButtons: CGFloat {
        return layoutMode == .horizontal && isPrefferedVerticalMode ? 1.2 : 1
    }
    
    private var deleteRowHeightInKeys: CGFloat {
        return 1 / coefficientOfIncreaseForMainButtons
    }
    private var spaceRowHeightInKeys: CGFloat {
        return deleteRowHeightInKeys
    }
    
    private var horizontalIndentInKeys: CGFloat {
        return layoutMode == .horizontal && isPrefferedVerticalMode ? 1 : 0.5
    }
    
    private let maxKeyboardHeightRatio: CGFloat = 0.59
    
    private var maxKeyWidth: CGFloat {
        return 1024/sizeInKeysForHorizontalMode.width * scaleFactor
    }
    private func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
        return width * 0.94
    }
    
    private var sizeInKeys = CGSize()
    
    private var sizeInKeysForVerticalMode: CGSize {
        return CGSize(
            width: CGFloat(Keyboard.default.layout.columnCount / 2) + 0.2 + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Keyboard.default.layout.rowCount * 2) + spaceRowHeightInKeys
        )
    }
    
    private var sizeInKeysForHorizontalMode: CGSize {
        return CGSize(
            width: CGFloat(Keyboard.default.layout.columnCount) + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Keyboard.default.layout.rowCount) + spaceRowHeightInKeys
        )
    }
    
    private var keySize: CGSize {
        let keyWidth = min(maxKeyWidth, screenSize.width / sizeInKeys.width)
        
        let maxKeyboardHeight = (screenSize.height * maxKeyboardHeightRatio)
        
        return CGSize(
            width: keyWidth,
            height: min(
                max(
                    min(
                        maxKeyboardHeight / sizeInKeysForVerticalMode.height * coefficientOfIncreaseForMainButtons,
                        maxKeyHeight(fromWidth: maxKeyWidth)
                    ),
                    maxKeyHeight(fromWidth: keyWidth)
                ),
                
                maxKeyboardHeight / sizeInKeys.height
            )
        )
    }
    
    private var labelFontSize: CGFloat {
        return max(keySize.width, minimalScreenSize.width / sizeInKeysForVerticalMode.width) * 6/15
    }
    
    private var halfKeyboardSize: CGSize {
        return CGSize(
            width: keySize.width * CGFloat(Keyboard.default.layout.columnCount / 2),
            height: keySize.height * CGFloat(Keyboard.default.layout.rowCount)
        )
    }
    
    private var deleteRowHeight: CGFloat {
        return deleteRowHeightInKeys * keySize.height
    }
    
    private var layoutHeight: CGFloat {
        return backgroundView.bounds.height - deleteRowHeight - spaceRowHeight
    }
    
    private var spaceRowHeight: CGFloat {
        return spaceRowHeightInKeys * keySize.height
    }

    private var horizontalIndent: CGFloat {
        return horizontalIndentInKeys * keySize.width
    }

    private var size: CGSize {
        return CGSize(
            width: keySize.width * sizeInKeys.width,
            height: keySize.height * sizeInKeys.height
        )
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    private let backgroundView: UIView = .init()
    
    override internal func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configure()
        
        colorScheme = darkColorScheme ? .dark : .default
        
        enterKey.isEnabled = false
    }
    
    private var isPrefferedVerticalMode: Bool {
        return bounds.width < self.minimalScreenSize.height
    }
    
    internal func configure() {
        
        if layoutMode == .default {
            layoutMode = isPrefferedVerticalMode ? .vertical : .horizontal
        }
        
        if alternateLayoutMode {
            layoutMode = layoutMode == .vertical ? .horizontal : .vertical
        }
        
        let isHorizontalMode = layoutMode == .horizontal || screenSize.height < self.minimalScreenSize.height
        sizeInKeys = isHorizontalMode ? sizeInKeysForHorizontalMode : sizeInKeysForVerticalMode
        
        if heightConstraint != nil {
            heightConstraint?.constant = size.height
        }
        else {
            heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
            heightConstraint?.priority = .defaultHigh
            heightConstraint?.isActive = true
        }
        
        #if !TARGET_INTERFACE_BUILDER
            if !Bundle.main.isExtension {
                frame = UIScreen.main.bounds
                frame.size.height = size.height
            }
        #endif
        
        backgroundView.frame.size = .init(width: bounds.width, height: size.height)
        
        #if TARGET_INTERFACE_BUILDER
            backgroundView.frame.origin = .init(x: 0, y: bounds.height - size.height)
        #endif
        
        
        let keySize = self.keySize
        let keySpacing = deleteRowHeight * 0.1
        let labelFontSize: CGFloat = self.labelFontSize
        
        deleteRowView.configure(
            size: .init(width: size.width, height: deleteRowHeight),
            keySpacing: keySpacing, labelFontSize: labelFontSize
        )
        deleteRowView.frame.origin.y = 0
        
        layoutView.configure(
            size: .init(width: size.width, height: layoutHeight),
            halfKeyboardSize: halfKeyboardSize,
            keySize: keySize, keySpacing: keySpacing, labelFontSize: labelFontSize,
            horizontalIndent: horizontalIndent
        )
        layoutView.frame.origin.y = deleteRowHeight
        
        spaceRowView.configure(
            size: .init(width: size.width, height: spaceRowHeight),
            keySpacing: keySpacing, labelFontSize: labelFontSize
        )
        spaceRowView.frame.origin.y = deleteRowHeight + layoutHeight
        
        
        if isHorizontalMode {
            deleteRowView.center.x = backgroundView.bounds.midX
            layoutView.center.x = backgroundView.bounds.midX
            spaceRowView.center.x = backgroundView.bounds.midX
        }
        else {
            let originX = backgroundView.bounds.maxX - size.width
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
