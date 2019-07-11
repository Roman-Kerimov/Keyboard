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
    
    @IBInspectable internal var text: String = .init()
    @IBInspectable internal var darkAppearance: Bool = false
    @IBInspectable internal var alternateLayoutMode: Bool = false
    
    enum State {
        case disappeared, disappearing, appearing, appeared
    }
    
    var state: State = .disappeared
    
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
    
    private var characterSequenceView: CharacterSequenceView {
        return deleteRowView.characterSequence
    }
    
    public var characterSearchView: CharacterSearchView {
        return layoutView.characterSearchView
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
        
        state = .appeared
        
        enterKey.isEnabled = false
        
        LoadUnicodeDataFiles.init().start()
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
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsLayout), name: .LayoutModeDidChange, object: nil)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        #if TARGET_INTERFACE_BUILDER
            Keyboard.default.delegate = self
            
            UIKeyboardAppearance.current = darkAppearance ? .dark : .default
            
            backgroundView.backgroundColor = .windowBackgroundColor
            
            NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
            
            SearchUnicodeScalars.init(for: characterSearchView).start()
        #endif
        
        guard state != .disappeared else {
            return
        }
        
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
        
        KeyView.size = keySize
        KeyView.spacing = deleteRowHeight * 0.1
        KeyView.labelFontSize = min(spaceRowHeight * 0.5, 36)
        
        deleteRowView.frame = .init(origin: .zero, size: .init(width: keyboardSize.width, height: deleteRowHeight))
        
        let layoutHeight: CGFloat = backgroundView.bounds.height - deleteRowHeight - spaceRowHeight
        
        layoutView.frame = .init(x: 0, y: deleteRowHeight, width: keyboardSize.width, height: layoutHeight)
        layoutView.horizontalIndent = horizontalIndentInKeys * keySize.width
        
        spaceRowView.frame = .init(x: 0, y: deleteRowHeight + layoutHeight, width: keyboardSize.width, height: spaceRowHeight)
        
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
            self.settingsContainerView.navigationController.removeFromParent()
        }
    }
}

#if TARGET_INTERFACE_BUILDER
extension KeyboardView: KeyboardDelegate {
    
    func delete() {}
    func enter() {}
    func settings() {}
    func insert(text: String) {}
    
    var documentContext: DocumentContext {
        return .init(beforeInput: text, afterInput: nil)
    }
}
#endif
