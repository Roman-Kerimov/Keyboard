//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-06-23.
//
//

import UIKit

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

class KeyboardViewController: UIInputViewController, KeyboardDelegate {
    static var shared: KeyboardViewController = .init()
    
    @objc internal func updateDocumentContext() {
        keyboardView.documentContext = textDocumentProxy.documentContext
        
        if textDocumentProxy.enablesReturnKeyAutomatically == true {
            keyboardView.returnKey.isEnabled = textDocumentProxy.hasText
        }
    }
    
    let keyboardView = KeyboardView()
    
    override func loadView() {
        view = keyboardView
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        
        KeyboardViewController.shared = self
        Keyboard.default.delegate = self
        
        keyboardView.frame = UIScreen.main.bounds
        
        keyboardView.nextKeyboardKey.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        keyboardView.dismissKeyboardKey.addTarget(self, action: #selector(dismissKeyboard), for: .allTouchEvents)
        
        // Hack for working of the keyboard height constraint
        let hiddenView: UILabel = .init()
        hiddenView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hiddenView)
        hiddenView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        hiddenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        hiddenView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        keyboardView.configure()
    }
    
    var isAppeared: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if view.bounds.width < UIScreen.main.bounds.width {
            keyboardView.configure()
        }
        
        isAppeared = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDocumentContext), name: .DocumentContextDidChange, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        previousDocumentContext = .init()
        
        isAppeared = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if Bundle.main.isExtension {
            UIView.setAnimationsEnabled(false)
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.keyboardView.configure()
        }) { _ in
            UIView.setAnimationsEnabled(true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        if !isAppeared {
            if textDocumentProxy.keyboardAppearance == .dark {
                keyboardView.colorScheme = .dark
            } else {
                keyboardView.colorScheme = .default
            }
        }
        
        normalizeTextPosition()
        updateDocumentContext()
    }
    
    override var needsInputModeSwitchKey: Bool {
        guard Bundle.main.isExtension else {
            return false
        }
        
        #if TARGET_INTERFACE_BUILDER
            return true
        #else
            if #available(iOS 11.0, *) {
                return super.needsInputModeSwitchKey
            }
            else if let installedKeyboards = UserDefaults.standard.object(forKey: "AppleKeyboards") as? [String] {
                return installedKeyboards.count > 1
            }
            else {
                return true
            }
        #endif
    }
    
    private var previousDocumentContext: DocumentContext = .init()
    
    internal func normalizeTextPosition() {
        
        guard textDocumentProxy.documentContext != previousDocumentContext else {
            return
        }
        
        if previousDocumentContext.beforeInput == textDocumentProxy.stringBeforeInput
            || previousDocumentContext.afterInput == textDocumentProxy.stringAfterInput {
            
            previousDocumentContext = textDocumentProxy.documentContext
            return
        }
        
        previousDocumentContext = textDocumentProxy.documentContext
        
        if cancelNextNormalization {
            cancelNextNormalization = false
            return
        }
        
        if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab == false
            && textDocumentProxy.characterAfterInput?.belongsTo(.alphanumerics) == true {
            
            textDocumentProxy.moveTextPositionToSequenceEnd(of: .alphanumerics)
        }
        else if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput == .space {
            
            textDocumentProxy.moveTextPositionToSequenceEnd(of: .init(charactersIn: .space))
        }
        else if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false {
            
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
    }
    
    var cancelNextNormalization = false
    
    var shouldInsertSpace: Bool {
        if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab == false {
            return true
        }
        else {
            return false
        }
    }
    
    func delete() {
        if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false
            && textDocumentProxy.characterAfterInput?.belongsTo(.punctuationCharacters) == false {
            
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
        else {
            textDocumentProxy.deleteBackward()
        }
        
        if textDocumentProxy.characterBeforeInput != .space
            && textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab != false
            && textDocumentProxy.characterAfterInput == .space {
            
            textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            textDocumentProxy.deleteBackward()
        }
        
        if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput == .space {
            
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            textDocumentProxy.deleteBackward()
        }
        
        if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab == false
            && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false {
            
            textDocumentProxy.insertText(.space)
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
    }
    
    func space() {
        if textDocumentProxy.characterAfterInput == .space {
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
        }
        
        if shouldInsertSpace {
            textDocumentProxy.insertText(.space)
        }
    }
    
    func spaceInsist() {
        if !shouldInsertSpace {
            textDocumentProxy.insertText(.space)
        }
    }
    
    func `return`() {
        textDocumentProxy.insertText(.return)
        
        if textDocumentProxy.characterAfterInput == .space {
            textDocumentProxy.deleteForward(sequenceOf: .init(charactersIn: .space))
        }
    }
    
    func tab() {
        textDocumentProxy.insertText(.tab)
        
        if textDocumentProxy.characterAfterInput == .space {
            textDocumentProxy.deleteForward(sequenceOf: .init(charactersIn: .space))
        }
    }
    
    func settings() {
        keyboardView.showSettings()
    }
    
    func insert(text: String) {
        if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab != false
            && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false
            && textDocumentProxy.characterAfterInput?.belongsTo(.punctuationCharacters) == false {
            
            textDocumentProxy.insertText(.space)
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
        
        textDocumentProxy.insertText(text)
    }
    
    var documentContext: DocumentContext {
        return textDocumentProxy.documentContext
    }
}

extension UITextDocumentProxy {
    var documentContext: DocumentContext {
        return .init(beforeInput: documentContextBeforeInput ?? .init(), afterInput: documentContextAfterInput ?? .init())
    }
    
    var stringBeforeInput: String? {
        return documentContext.beforeInput
    }
    
    var stringAfterInput: String? {
        return documentContext.afterInput
    }
    
    var characterBeforeInput: Character? {
        return stringBeforeInput?.last
    }
    
    var characterAfterInput: Character? {
        return stringAfterInput?.first
    }
    
    private func characterSequenceStringBeforeInput(of characterSet: CharacterSet) -> String {
        return .init(stringBeforeInput?.components(separatedBy: characterSet.inverted).last! ?? .init())
    }
    
    private func characterSequenceStringAfterInput(of characterSet: CharacterSet) -> String {
        return .init(stringAfterInput?.components(separatedBy: characterSet.inverted).first! ?? .init())
    }
    
    public func deleteBackward(_ count: Int) {
        for _ in 0..<count {
            deleteBackward()
        }
    }
    
    public func deleteBackward(sequenceOf characterSet: CharacterSet) {
        let stringForDelete: String = characterSequenceStringBeforeInput(of: characterSet)
        
        deleteBackward(stringForDelete.count)
    }
    
    public func deleteForward(sequenceOf characterSet: CharacterSet) {
        let stringForDelete: String = characterSequenceStringAfterInput(of: characterSet)
        
        adjustTextPosition(byCharacterOffset: stringForDelete.utf16.count)
        deleteBackward(stringForDelete.count)
    }
    
    func moveTextPositionToSequenceStart(of characterSet: CharacterSet) {
        DispatchQueue.main.async {
            self.adjustTextPosition(byCharacterOffset: -self.characterSequenceStringBeforeInput(of: characterSet).utf16.count)
        }
    }
    
    func moveTextPositionToSequenceEnd(of characterSet: CharacterSet) {
        DispatchQueue.main.async {
            self.adjustTextPosition(byCharacterOffset: self.characterSequenceStringAfterInput(of: characterSet).utf16.count)
        }
    }
}
