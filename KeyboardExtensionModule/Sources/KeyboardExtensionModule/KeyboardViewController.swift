//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-06-23.
//
//

import SwiftUI
import KeyboardModule
import UnicodeData

extension UIView {
    open override var inputViewController: UIInputViewController? {
        return KeyboardViewController.shared
    }
}

extension UIViewController {
    open override var inputViewController: UIInputViewController? {
        return KeyboardViewController.shared
    }
}

extension UIApplication {
    open override var inputViewController: UIInputViewController? {
        return KeyboardViewController.shared
    }
}

class KeyboardViewController: UIInputViewController, KeyboardDelegate, ObservableObject {
    static var shared: KeyboardViewController = .init()
    
    enum State {
        case disappeared, disappearing, appearing, appeared
    }
    
    var state: State = .disappeared
    
    private var layoutMode: Keyboard.KeyboardLayoutMode {
        get {
            return Keyboard.default.layoutMode
        }
        
        set {
            Keyboard.default.layoutMode = newValue
        }
    }
    
    var isHorizontalMode = false
    
    private lazy var heightConstraint: NSLayoutConstraint = {
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: keyboardSize.height)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
        
        return heightConstraint
    }()
    
    var keySize: CGSize = .zero
    var keyCornerRadius: CGFloat = .zero
    var keySpacing: CGFloat = .zero
    var keyLabelFontSize: CGFloat = 1
    var keyNameLabelFontSize: CGFloat = 1
    var horizontalMainLabelIndent: CGFloat = .zero
    var verticalShiftLabelIndent: CGFloat = .zero
    var horizontalShiftLabelIndent: CGFloat = .zero
    
    var keyboardSize: CGSize = .zero
    
    var deleteRowHeight: CGFloat = .zero
    var characterSequenceWidth: CGFloat = .zero
    var characterSequenceItemSize: CGSize = .zero
    var characterSequenceFontSize: CGFloat = 1
    var deleteKeyWidth: CGFloat = .zero
    
    var layoutHeight: CGFloat = .zero
    var horizontalIndent: CGFloat = .zero
    
    var spaceRowHeight: CGFloat = .zero
    var spaceRowKeyDescriptions: [SpaceRowKeyDescription] {SpaceRowKeyDescription.allCases}
    
    class SpaceRowKeyDescription: CaseIterable, Identifiable {
        var id: Keycode {
            key.id
        }
        
        let key: Key
        let proportion: CGFloat
        
        var width: CGFloat = .zero
        
        init(key: Key, proportion: CGFloat) {
            self.key = key
            self.proportion = proportion
        }
        
        static let settings = SpaceRowKeyDescription(key: .settings, proportion: 5)
        static let nextKeyboard = SpaceRowKeyDescription(key: .nextKeyboard, proportion: 5)
        static let space = SpaceRowKeyDescription(key: .space, proportion: 17)
        static let enter = SpaceRowKeyDescription(key: .enter, proportion: 8)
        static let dismissKeyboard = SpaceRowKeyDescription(key: .dismissKeyboard, proportion: 5)
        
        static let allCases: [SpaceRowKeyDescription] = [.settings, .nextKeyboard, .space, .enter, .dismissKeyboard]
    }
    
    let settingsWidth: CGFloat = 280
    let settingsAnimationDuration: Float64 = 0.3
    
    func updateSizes(keyboardViewMaxWidth: CGFloat) {
        let scaleFactor: CGFloat = keyboardViewMaxWidth / UIScreen.main.bounds.width
        
        let minimalScreenSize: CGSize = CGSize.init(width: 320, height: 480).applying(.init(scale: scaleFactor))
        
        let isPrefferedVerticalMode: Bool = keyboardViewMaxWidth < minimalScreenSize.height
        
        if layoutMode == .default {
            layoutMode = isPrefferedVerticalMode ? .vertical : .horizontal
        }
        
        let screenSize: CGSize = UIScreen.main.bounds.size.applying(.init(scale: scaleFactor))
        
        isHorizontalMode = layoutMode == .horizontal || screenSize.height < minimalScreenSize.height
        
        let horizontalIndentInKeys: CGFloat = layoutMode == .vertical && isPrefferedVerticalMode ? 0.75 : layoutMode == .horizontal && isPrefferedVerticalMode ? 1 : 0.5
        
        let coefficientOfIncreaseForMainButtons: CGFloat = layoutMode == .horizontal && isPrefferedVerticalMode ? 1.2 : 1
        
        let deleteRowHeightInKeys: CGFloat = 1 / coefficientOfIncreaseForMainButtons
        let spaceRowHeightInKeys: CGFloat = deleteRowHeightInKeys
        
        let sizeInKeysForVerticalMode: CGSize = .init(
            width: CGFloat(Key.layoutBoardColumnCount / 2) + 0.2 + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Key.layoutBoardRowCount * 2) + spaceRowHeightInKeys
        )
        
        let sizeInKeysForHorizontalMode: CGSize = .init(
            width: CGFloat(Key.layoutBoardColumnCount) + horizontalIndentInKeys*2,
            height: deleteRowHeightInKeys + CGFloat(Key.layoutBoardRowCount) + spaceRowHeightInKeys
        )
        
        let keyboardSizeInKeys = isHorizontalMode ? sizeInKeysForHorizontalMode : sizeInKeysForVerticalMode
        
        let maxKeyWidth: CGFloat = 1024/sizeInKeysForHorizontalMode.width * scaleFactor
        
        func maxKeyHeight(fromWidth width: CGFloat) -> CGFloat {
            return width * 0.94
        }
        
        let keyWidth = min(maxKeyWidth, screenSize.width / keyboardSizeInKeys.width)
        
        let maxKeyboardHeightRatio: CGFloat = 0.59
        let maxKeyboardHeight = (screenSize.height * maxKeyboardHeightRatio)
        
        keySize = .init(
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
        
        keyboardSize = .init(
            width: keySize.width * keyboardSizeInKeys.width,
            height: keySize.height * keyboardSizeInKeys.height
        )
        
        heightConstraint.constant = keyboardSize.height
        
        if !Bundle.main.isExtension {
            view.frame = UIScreen.main.bounds
            view.frame.size.height = keyboardSize.height
        }
        
        deleteRowHeight = deleteRowHeightInKeys * keySize.height
        
        deleteKeyWidth = keyboardSize.width / 5
        
        characterSequenceWidth = keyboardSize.width - deleteKeyWidth
        
        characterSequenceItemSize = .init(
            width: floor(max(keySize.width, minimalScreenSize.width/5.5)/4),
            height: deleteRowHeight
        )
        
        characterSequenceFontSize = 1.8 * characterSequenceItemSize.width
        
        spaceRowHeight = spaceRowHeightInKeys * keySize.height
        
        spaceRowKeyDescriptions.forEach { spaceRowKeyDescription in
            spaceRowKeyDescription.width = keyboardSize.width * spaceRowKeyDescription.proportion / spaceRowKeyDescriptions.map(\.proportion).reduce(0, +)
        }
        
        if needsInputModeSwitchKey == false {
            SpaceRowKeyDescription.space.width += SpaceRowKeyDescription.nextKeyboard.width
            SpaceRowKeyDescription.nextKeyboard.width = 0
        }
        
        keySpacing = deleteRowHeight * 0.1
        keyCornerRadius = keySpacing
        keyLabelFontSize = min(spaceRowHeight * 0.5, 36)
        keyNameLabelFontSize = keyLabelFontSize / 1.8
        horizontalMainLabelIndent = keySpacing
        verticalShiftLabelIndent = keySpacing * 2.2
        horizontalShiftLabelIndent = keySpacing * 1.0
        
        layoutHeight = keyboardSize.height - deleteRowHeight - spaceRowHeight
        horizontalIndent = horizontalIndentInKeys * keySize.width
    }
    
    @objc private func updateDocumentContext() {
        
        if textDocumentProxy.enablesReturnKeyAutomatically == true {
            Key.enter.isEnabled = textDocumentProxy.hasText && textDocumentProxy.returnKeyType != .default
        }
        else {
            Key.enter.isEnabled = textDocumentProxy.returnKeyType != .default
        }
    }
    
    override func loadView() {
        view = UIView()
        
        let hostingController = UIHostingController(
            rootView: KeyboardView()
                .environmentObject(self)
                .environmentObject(Keyboard.default)
                .environmentObject(Settings.current)
        )
         
        hostingController.view.backgroundColor = .clear
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnicodeData.default.loadIfNeeded()
        
        KeyboardViewController.shared = self
        Keyboard.default.delegate = self
        
        view.frame = UIScreen.main.bounds
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDocumentContext), name: .DocumentContextDidChange, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        state = .appearing
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        state = .appeared
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        state = .disappearing
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        state = .disappeared
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        objectWillChange.send()
        
        if Bundle.main.isExtension {
            UIView.setAnimationsEnabled(false)
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in
            UIView.setAnimationsEnabled(true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
        
        // For input mode switch key
        objectWillChange.send()
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    override var needsInputModeSwitchKey: Bool {
        
        guard Bundle.main.isExtension else {
            return false
        }
        
        return super.needsInputModeSwitchKey
    }
    
    func delete() {
        textDocumentProxy.deleteBackward()
    }
    
    func enter() {
        insert(text: .return)
    }
    
    func settings() {
        isSettingViewPresented = true
    }
    
    @Published var isSettingViewPresented = false
    
    func insert(text: String) {
        textDocumentProxy.insertText(text)
        
        if [.asciiCapableNumberPad, .decimalPad, .numberPad, .numbersAndPunctuation, .phonePad].contains(textDocumentProxy.keyboardType) {
            
            textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
        }
    }
    
    var documentContext: DocumentContext {
        return textDocumentProxy.documentContext
    }
    
    var returnKeyType: UIReturnKeyType? {
        return textDocumentProxy.returnKeyType
    }
}

extension UITextDocumentProxy {
    var documentContext: DocumentContext {
        return .init(beforeInput: documentContextBeforeInput ?? .init(), afterInput: documentContextAfterInput ?? .init())
    }
}
