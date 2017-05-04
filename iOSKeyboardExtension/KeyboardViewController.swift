//
//  KeyboardViewController.swift
//  iOSKeyboardExtension
//
//  Created by Roman Kerimov on 23.06.16.
//
//

import UIKit

class KeyboardViewController: UIInputViewController {
    static var shared: KeyboardViewController!
    
    internal func updateDocumentContext() {
        keyboardView.documentContext = textDocumentProxy.documentContext
    }
    
    let keyboardView = KeyboardView()
    let settings = KeyboardSettings()
    
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
        Localization.initialize()
        KeyboardViewController.shared = self
        
        keyboardView.nextKeyboardKey.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        keyboardView.configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if view.bounds.width < UIScreen.main.bounds.width {
            keyboardView.configure()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        previousDocumentContext = .init()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: nil) { (context) in
            self.keyboardView.configure()
        }
        
        super.viewWillTransition(to: size, with: coordinator)
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
        
        let proxy = self.textDocumentProxy
        
        if proxy.keyboardAppearance == .dark {
            keyboardView.colorScheme = .dark
        } else {
            keyboardView.colorScheme = .default
        }
        
        normalizeTextPosition()
        updateDocumentContext()
    }
    
    private var previousDocumentContext: DocumentContext = .init()
    
    private func normalizeTextPosition() {
        
        guard textDocumentProxy.documentContext != previousDocumentContext else {
            return
        }
        
        previousDocumentContext = textDocumentProxy.documentContext
        
        if cancelNextNormalization {
            cancelNextNormalization = false
            return
        }
        
        let documentContextBeforeInput = textDocumentProxy.documentContextBeforeInput ?? .init()
        var documentContextAfterInput = textDocumentProxy.documentContextAfterInput ?? .init()
        
        guard let characterBeforeInput = documentContextBeforeInput.characters.last else {
            return
        }
        
        guard let characterAfterInput = documentContextAfterInput.characters.first else {
            return
        }
        
        if characterBeforeInput != .space
            && characterBeforeInput != .return
            && characterBeforeInput != .tab
            && CharacterSet.alphanumerics.contains(characterAfterInput.unicodeScalar) {
            
            moveToSequenceEnd(of: .alphanumerics)
        }
        else if characterAfterInput == .space {
            moveToSequenceEnd(of: CharacterSet.init(charactersIn: Character.space.string))
        }
        else if characterBeforeInput == .space
            && characterAfterInput != .space
            && characterAfterInput != .return
            && characterAfterInput != .tab {
            
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
    }
    
    var cancelNextNormalization = false
    
    func moveToSequenceStart(of characterSet: CharacterSet) {
        let sequence = textDocumentProxy.documentContextBeforeInput?.components(separatedBy: characterSet.inverted).last!.characters ?? .init()
        textDocumentProxy.adjustTextPosition(byCharacterOffset: -sequence.count)
    }
    
    func moveToSequenceEnd(of characterSet: CharacterSet) {
        let sequence = textDocumentProxy.documentContextAfterInput?.components(separatedBy: characterSet.inverted).first!.characters ?? .init()
        textDocumentProxy.adjustTextPosition(byCharacterOffset: sequence.count)
    }
    
    var isLastWhitespace: Bool {
        if let character = textDocumentProxy.documentContextBeforeInput?.characters.last {
            return String(character).rangeOfCharacter(from: .whitespacesAndNewlines) != nil
        }
        else {
            return false
        }
    }
    
    var isNextWhitespace: Bool {
        if let character = textDocumentProxy.documentContextAfterInput?.characters.first {
            if String(character) == "\t" {
                return false
            }
            
            return String(character).rangeOfCharacter(from: .whitespaces) != nil
        }
        else {
            return false
        }
    }
    
    func keyAction(label: String, offcet: Int = 0) {
        
        textDocumentProxy.adjustTextPosition(byCharacterOffset: offcet)
        
        guard let specialKey = SpecialKey(rawValue: label) else {
            textDocumentProxy.insertText(label)
            return
        }
        
        switch specialKey {
            
        case .delete:
            textDocumentProxy.deleteBackward()
            
        case .space:
            if settings.allowMultipleSpaces {
                textDocumentProxy.insertText(" ")
            }
            else if isNextWhitespace {
                cancelNextNormalization = true
                textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            }
            else if textDocumentProxy.documentContextBeforeInput != nil &&
                textDocumentProxy.documentContextBeforeInput != "" &&
                !isLastWhitespace {
                textDocumentProxy.insertText(" ")
            }
            
        case .return:
            textDocumentProxy.insertText("\n")
            
        case .tab:
            textDocumentProxy.insertText("\t")
            
        case .union:
            var maxSuffixLength = KeyboardLayout.unionDictionary.keys.map { $0.characters.count }.max()!
            
            Suffix: while maxSuffixLength > 0 {
                guard textDocumentProxy.documentContextBeforeInput != nil else {
                    return
                }
                
                let combination = String(textDocumentProxy.documentContextBeforeInput!.characters.suffix(maxSuffixLength))
                
                if let union = KeyboardLayout.unionDictionary[combination] {
                    
                    for _ in 1...combination.characters.count {
                        textDocumentProxy.deleteBackward()
                    }
                    
                    textDocumentProxy.insertText(union)
                    
                    break Suffix
                }
                
                maxSuffixLength -= 1
            }
            
        case .nextKeyboard:
            break
            
        case .dismissKeyboard:
            dismissKeyboard()
            
        case .settings:
            keyboardView.showSettings()
            
        case .horizontalMode:
            settings.layoutMode = .horizontal
            keyboardView.configure()
            
        case .verticalMode:
            settings.layoutMode = .vertical
            keyboardView.configure()
        }
        
        textDocumentProxy.adjustTextPosition(byCharacterOffset: -offcet)
    }
}

extension UIView {
    func alignBounds() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            leftAnchor.constraint(equalTo: superview!.leftAnchor),
            rightAnchor.constraint(equalTo: superview!.rightAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
        ])
    }
}

struct DocumentContext: Equatable {
    let beforeInput: String?
    let afterInput: String?
    
    static func ==(left: DocumentContext, right: DocumentContext) -> Bool {
        return left.beforeInput == right.beforeInput && left.afterInput == right.afterInput
    }
    
    init() {
        beforeInput = nil
        afterInput = nil
    }
    
    init(beforeInput: String?, afterInput: String?) {
        self.beforeInput = beforeInput
        self.afterInput = afterInput
    }
}

extension UITextDocumentProxy {
    var documentContext: DocumentContext {
        return .init(beforeInput: documentContextBeforeInput, afterInput: documentContextAfterInput)
    }
}
