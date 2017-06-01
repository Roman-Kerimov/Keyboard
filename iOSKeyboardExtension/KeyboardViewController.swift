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
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        previousDocumentContext = .init()
        
        isAppeared = false
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
            
            moveToSequenceEnd(of: .alphanumerics)
        }
        else if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput == .space {
            
            moveToSequenceEnd(of: CharacterSet.init(charactersIn: .space))
        }
        else if textDocumentProxy.characterBeforeInput == .space
            && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false {
            
            cancelNextNormalization = true
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        }
    }
    
    var cancelNextNormalization = false
    
    func moveToSequenceStart(of characterSet: CharacterSet) {
        let sequence = textDocumentProxy.stringBeforeInput?.components(separatedBy: characterSet.inverted).last!.characters ?? .init()
        textDocumentProxy.adjustTextPosition(byCharacterOffset: -sequence.count)
    }
    
    func moveToSequenceEnd(of characterSet: CharacterSet) {
        let sequence = textDocumentProxy.stringAfterInput?.components(separatedBy: characterSet.inverted).first!.characters ?? .init()
        textDocumentProxy.adjustTextPosition(byCharacterOffset: sequence.count)
    }
    
    func keyAction(label: String, offset: Int = 0) {
        
        let offsetString: String
        let utf16Offset: Int
        
        if offset < 0 {
            offsetString = .init(textDocumentProxy.stringBeforeInput?.characters.suffix(-offset) ?? .init())
            utf16Offset = -offsetString.utf16.count
        }
        else {
            offsetString = .init(textDocumentProxy.stringAfterInput?.characters.prefix(offset) ?? .init())
            utf16Offset = offsetString.utf16.count
        }
            
        textDocumentProxy.adjustTextPosition(byCharacterOffset: utf16Offset)
        
        guard let specialKey = SpecialKey(rawValue: label) else {
            
            if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab != false
                && textDocumentProxy.characterAfterInput?.isSpaceReturnOrTab == false
                && textDocumentProxy.characterAfterInput?.belongsTo(.punctuationCharacters) == false
                && offset == 0 {
                
                textDocumentProxy.insertText(.space)
                textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
            }
            
            textDocumentProxy.insertText(label)
            return
        }
        
        switch specialKey {
            
        case .delete:
            if settings.allowMultipleSpaces == true {
                textDocumentProxy.deleteBackward()
            }
            else if textDocumentProxy.characterBeforeInput == .space
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
            
            if settings.allowMultipleSpaces == false
                && textDocumentProxy.characterBeforeInput == .space
                && textDocumentProxy.characterAfterInput == .space {
                
                cancelNextNormalization = true
                textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
                textDocumentProxy.deleteBackward()
            }
            
        case .removeCharacter:
            textDocumentProxy.deleteBackward()
            
        case .space:
            if settings.allowMultipleSpaces {
                textDocumentProxy.insertText(" ")
            }
            else if textDocumentProxy.characterAfterInput == .space {
                cancelNextNormalization = true
                textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            }
            else if textDocumentProxy.characterBeforeInput?.isSpaceReturnOrTab == false {
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
        
        textDocumentProxy.adjustTextPosition(byCharacterOffset: -utf16Offset)
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
    
    var stringBeforeInput: String? {
        return documentContext.beforeInput
    }
    
    var stringAfterInput: String? {
        return documentContext.afterInput
    }
    
    var characterBeforeInput: Character? {
        return stringBeforeInput?.characters.last
    }
    
    var characterAfterInput: Character? {
        return stringAfterInput?.characters.first
    }
}
