//
//  KeyboardUIViewController.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-06-23.
//
//

import UIKit

extension UIView {
    open override var inputViewController: UIInputViewController? {
        return KeyboardUIViewController.shared
    }
}

extension UIViewController {
    open override var inputViewController: UIInputViewController? {
        return KeyboardUIViewController.shared
    }
}

extension UIApplication {
    open override var inputViewController: UIInputViewController? {
        return KeyboardUIViewController.shared
    }
}

class KeyboardUIViewController: UIInputViewController, KeyboardDelegate {
    fileprivate static var shared: KeyboardUIViewController = .init()
    
    @objc private func updateDocumentContext() {
        
        if textDocumentProxy.enablesReturnKeyAutomatically == true {
            keyboardView.enterKey.isEnabled = textDocumentProxy.hasText && textDocumentProxy.returnKeyType != .default
        }
        else {
            keyboardView.enterKey.isEnabled = textDocumentProxy.returnKeyType != .default
        }
    }
    
    let keyboardView = KeyboardUIView()
    
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
        
        KeyboardUIViewController.shared = self
        Keyboard.default.delegate = self
        
        keyboardView.frame = UIScreen.main.bounds
        
        keyboardView.nextKeyboardKey.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        keyboardView.dismissKeyboardKey.addTarget(self, action: #selector(dismissKeyboard), for: .allTouchEvents)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDocumentContext), name: .DocumentContextDidChange, object: nil)
        
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
        
        keyboardView.state = .appearing
        keyboardView.setNeedsLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        keyboardView.state = .appeared
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        keyboardView.state = .disappearing
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        previousDocumentContext = .init()
        
        keyboardView.state = .disappeared
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
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
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        if keyboardView.state != .appeared {
            UIKeyboardAppearance.current = self.textDocumentProxy.keyboardAppearance ?? .default
            NotificationCenter.default.post(name: .KeyboardAppearanceDidChange, object: nil)
        }
        
        normalizeTextPosition()
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    override var needsInputModeSwitchKey: Bool {
        
        guard Bundle.main.isExtension else {
            return false
        }
    
        if #available(iOS 11.0, *) {
            return super.needsInputModeSwitchKey
        }
        else if let installedKeyboards = UserDefaults.standard.object(forKey: "AppleKeyboards") as? [String] {
            return installedKeyboards.count > 1
        }
        else {
            return true
        }
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
    
    func delete() {
        textDocumentProxy.deleteBackward()
    }
    
    func enter() {
        insert(text: .return)
    }
    
    func settings() {
        keyboardView.showSettings()
    }
    
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

extension NSNotification.Name {
    static let KeyboardAppearanceDidChange: NSNotification.Name = .init("2KqZjiSSeYYkZs8K9DyZo32kPMYWRng")
}
