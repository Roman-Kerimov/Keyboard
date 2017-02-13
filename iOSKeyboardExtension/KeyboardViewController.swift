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
        
        KeyboardViewController.shared = self
        
        keyboardView.settingsRowView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        keyboardView.settingsRowView.hideButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
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
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        keyboardView.configure()
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
    
    func keyAction(label: String) {
        
        switch label {
            
        case deleteLabel:
            textDocumentProxy.deleteBackward()
            
        case spaceLabel:
            if settings.allowMultipleSpaces {
                textDocumentProxy.insertText(" ")
            }
            else if isNextWhitespace {
                textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            }
            else if textDocumentProxy.documentContextBeforeInput != nil &&
                textDocumentProxy.documentContextBeforeInput != "" &&
                !isLastWhitespace {
                textDocumentProxy.insertText(" ")
            }
            
        case returnLabel:
            textDocumentProxy.insertText("\n")
            
        case tabLabel:
            textDocumentProxy.insertText("\t")
            
        case unionLabel:
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
        
        default:
            textDocumentProxy.insertText(label)
        }
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
