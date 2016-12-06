//
//  KeyboardViewController.swift
//  iOSKeyboardExtension
//
//  Created by Roman Kerimov on 23.06.16.
//
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    var keyboardView: KeyboardView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        for key in KeyView.allKeys {
            key.action = keyAction(label:)
        }
        
        keyboardView = view as! KeyboardView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (view as! KeyboardView).configure()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        (view as! KeyboardView).configure()
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
        
        self.nextKeyboardButton.setTitleColor(keyboardView.colorScheme.labelColor, for: [])
        
        
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
        
        default:
            textDocumentProxy.insertText(label)
        }
    }

}
