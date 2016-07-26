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
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        for key in KeyView.allKeys {
            key.action = keyAction(key:)
        }
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
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        var isDarkColorScheme: Bool
        
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white()
            isDarkColorScheme = true
        } else {
            textColor = UIColor.black()
            isDarkColorScheme = false
        }
        
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
        
        for key in KeyView.allKeys {
            key.isDarkColorScheme = isDarkColorScheme
        }
    }
    
    func keyAction(key: KeyView) {
        
        switch key.state {
        case .lowerCase:
            textDocumentProxy.insertText(key.label.text!)
            
        case .upperCase:
            textDocumentProxy.deleteBackward()
            textDocumentProxy.insertText(key.label.text!.uppercased())
            
        case .deleteBackward:
            textDocumentProxy.deleteBackward()
            
        default:
            break
        }
    }

}
