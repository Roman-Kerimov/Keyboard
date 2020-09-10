//
//  KeyboardUIViewController.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-06-23.
//
//

import UIKit
import KeyboardModule
import UnicodeData

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
            Key.enter.isEnabled = textDocumentProxy.hasText && textDocumentProxy.returnKeyType != .default
        }
        else {
            Key.enter.isEnabled = textDocumentProxy.returnKeyType != .default
        }
    }
    
    private let keyboardUIView: KeyboardUIView? = KeyboardUIView()
    
    override func loadView() {
        if let keyboardUIView = keyboardUIView {
            view = keyboardUIView
        }
        else {
            view = UIView()
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnicodeData.default.loadIfNeeded()
        
        KeyboardUIViewController.shared = self
        Keyboard.default.delegate = self
        
        keyboardUIView?.frame = UIScreen.main.bounds
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDocumentContext), name: .DocumentContextDidChange, object: nil)
        
        if Bundle.main.isExtension {
            // Hack for working of the keyboard height constraint
            let hiddenView: UILabel = .init()
            hiddenView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(hiddenView)
            hiddenView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            hiddenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            hiddenView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        keyboardUIView?.state = .appearing
        keyboardUIView?.setNeedsLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        keyboardUIView?.state = .appeared
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        keyboardUIView?.state = .disappearing
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        keyboardUIView?.state = .disappeared
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
        
        if let keyboardUIView = keyboardUIView, keyboardUIView.state != .appeared {
            UIKeyboardAppearance.current = self.textDocumentProxy.keyboardAppearance ?? .default
            NotificationCenter.default.post(name: .KeyboardAppearanceDidChange, object: nil)
        }
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            UIKeyboardAppearance.current = UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light
            NotificationCenter.default.post(name: .KeyboardAppearanceDidChange, object: nil)
        }
    }
    
    override var needsInputModeSwitchKey: Bool {
        
        guard Bundle.main.isExtension else {
            return false
        }
    
        if #available(iOS 11.0, *) {
            return super.needsInputModeSwitchKey
        }
        else if let installedKeyboards = UserDefaults.standard.stringArray(forKey: "AppleKeyboards") {
            return installedKeyboards.count > 1
        }
        else {
            return true
        }
    }
    
    func delete() {
        textDocumentProxy.deleteBackward()
    }
    
    func enter() {
        insert(text: .return)
    }
    
    func settings() {
        keyboardUIView?.showSettings()
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
}

extension NSNotification.Name {
    static let KeyboardAppearanceDidChange: NSNotification.Name = .init("2KqZjiSSeYYkZs8K9DyZo32kPMYWRng")
}
