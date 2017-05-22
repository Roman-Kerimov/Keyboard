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
    
    internal var documentContext: DocumentContext = .init() {
        didSet {
            let documentContextBeforeInput: String = documentContext.beforeInput ?? .init()
            
            var characterSequence: [Character] = .init()
            var spaceCount = 0
            
            characterSequenceView.characters = characterSequence
            
            var isNonspaceSequence: Bool = false
            
            for character in documentContextBeforeInput.characters.reversed() {
                
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
    
    internal var deleteKey: KeyView {
        return deleteRowView.deleteKey
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
        
        characterSequenceView.colorScheme = colorScheme
        layoutView.unicodeCollectionView.colorScheme = colorScheme
        
        #if TARGET_INTERFACE_BUILDER
            backgroundView.backgroundColor = colorScheme.fakeBackroundColorForInterfaceBuilder
        #endif
    }
    
    private var characterSequenceView: CharacterSequenceView {
        return deleteRowView.characterSequence
    }
    
    private var keys: [KeyView] {
        var keyViews: [KeyView] = []
        
        for row in layoutView.keys {
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
    
    private let deleteRowHeightInKeys: CGFloat = 1
    private let spaceRowHeightInKeys: CGFloat = 1
    
    private var unicodeCollectionWidthInKeys: CGFloat {
        if settings.layoutMode == .horizontal && isPrefferedVerticalMode {
            return 1
        }
        else {
            return 0.5
        }
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
            width: CGFloat(settings.layout.columnCount / 2) + 0.5 + unicodeCollectionWidthInKeys,
            height: deleteRowHeightInKeys + CGFloat(settings.layout.rowCount * 2) + spaceRowHeightInKeys
        )
    }
    
    private var sizeInKeysForHorizontalMode: CGSize {
        return CGSize(
            width: CGFloat(settings.layout.columnCount) + unicodeCollectionWidthInKeys,
            height: deleteRowHeightInKeys + CGFloat(settings.layout.rowCount) + spaceRowHeightInKeys
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
    
    private var deleteRowHeight: CGFloat {
        return deleteRowHeightInKeys * keySize.height
    }
    
    private var layoutHeight: CGFloat {
        return backgroundView.bounds.height - deleteRowHeight - spaceRowHeight
    }
    
    private var spaceRowHeight: CGFloat {
        return spaceRowHeightInKeys * keySize.height
    }

    private var unicodeCollectionWidth: CGFloat {
        return unicodeCollectionWidthInKeys * keySize.width
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
        
        colorScheme = .default
        
        if darkColorScheme {
            colorScheme = .dark
        }
    }
    
    private var isPrefferedVerticalMode: Bool {
        return bounds.width < self.minimalScreenSize.height
    }
    
    internal func configure() {
        
        if settings.layoutMode == .default {
            if isPrefferedVerticalMode {
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
        
        let isHorizontalMode = settings.layoutMode == .horizontal || screenSize.height < self.minimalScreenSize.height
        
        if isHorizontalMode {
            sizeInKeys = sizeInKeysForHorizontalMode
        }
        else {
            sizeInKeys = self.sizeInKeysForVerticalMode
        }
        
        if heightConstraint != nil {
            heightConstraint?.constant = size.height
        }
        else {
            heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
            heightConstraint!.priority = 999
            heightConstraint!.isActive = true
        }
        
        backgroundView.frame.size = .init(width: bounds.width, height: size.height)
        
        #if TARGET_INTERFACE_BUILDER
            backgroundView.frame.origin = .init(x: 0, y: bounds.height - size.height)
        #endif
        
        
        let maxKeyWidth = self.maxKeyWidth
        let keySize = self.keySize
        let minimalScreenSize = self.minimalScreenSize
        let sizeInKeysForVerticalMode = self.sizeInKeysForVerticalMode
        
        deleteRowView.configure(
            size: .init(width: size.width, height: deleteRowHeight)
        )
        deleteRowView.frame.origin.y = 0
        
        layoutView.configure(
            size: .init(width: size.width, height: layoutHeight),
            halfKeyboardSize: halfKeyboardSize,
            keySize: keySize,
            unicodeCollectionWidth: unicodeCollectionWidth
        )
        layoutView.frame.origin.y = deleteRowHeight
        
        spaceRowView.configure(
            size: .init(width: size.width, height: spaceRowHeight)
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
        
        for key in keys {
            key.configure(maxKeyWidth: maxKeyWidth, keySize: keySize, minimalScreenSize: minimalScreenSize, sizeInKeysForVerticalMode: sizeInKeysForVerticalMode)
        }
        
        deleteRowView.characterSequence.layout.itemSize = .init(
            width: .init(Int.init(max(keySize.width, minimalScreenSize.width/5.5)/4)),
            height: keySize.height
        )
        deleteRowView.characterSequence.reloadData()
    }
    
    private var deleteRowView = DeleteRowView()
    internal var layoutView = KeyboardLayoutView()
    private let spaceRowView = SpaceRowView()
    
    override private init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        
        backgroundView.addSubview(deleteRowView)
        backgroundView.addSubview(spaceRowView)
        backgroundView.addSubview(layoutView)
        
        layoutView.layout = settings.layout
        
        settingsContainerView.backButton.addTarget(self, action: #selector(hideSettings), for: .allTouchEvents)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal let settingsContainerView = SettingsContainerView()
    
    private var settingsRightConstraint: NSLayoutConstraint!
    
    private let settingsAnimateDuration = 0.3
    
    @objc internal func showSettings() {
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
