//
//  KeyboardViewController.swift
//  iOSKeyboardExtension
//
//  Created by Roman Kerimov on 23.06.16.
//
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: KeyboardView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        keyboardView = view as! KeyboardView
        
        keyboardView.settingsRowView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        keyboardView.settingsRowView.hideButton.addTarget(self, action: #selector(dismissKeyboard), for: .allTouchEvents)
        
        for key in KeyView.allKeys {
            key.action = keyAction(label:)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        keyboardView.configure()
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
    
    func keyAction(label: String) {
        
        switch label {
            
        case deleteLabel:
            if textDocumentProxy.documentContextBeforeInput?.characters.last != nil {
                textDocumentProxy.deleteBackward()
            }
            
        case spaceLabel:
            var isLastWhitespace = true
            
            if let lastCharacter = textDocumentProxy.documentContextBeforeInput?.characters.last {
                isLastWhitespace = String(lastCharacter).rangeOfCharacter(from: CharacterSet.whitespaces) != nil
            }
            
            if !isLastWhitespace {
                textDocumentProxy.insertText(" ")
            }
            
        case returnLabel:
            textDocumentProxy.insertText("\n")
            
        case tabLabel:
            textDocumentProxy.insertText("\t")
            
        case unionLabel:
            var maxSuffixLength = KeyboardLayout.unionDictionary.keys.map { $0.characters.count }.max()!
            
            Suffix: while maxSuffixLength > 0 {
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
