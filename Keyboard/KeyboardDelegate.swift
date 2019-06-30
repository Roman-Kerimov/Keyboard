//
//  KeyboardDelegate.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-29.
//

import UIKit

protocol KeyboardDelegate {
    
    func delete()
    func enter()
    func settings()
    
    func insert(text: String)
    
    var documentContext: DocumentContext {get}
    
    var returnKeyType: UIReturnKeyType? {get}
    var needsInputModeSwitchKey: Bool {get}
    
    func prepareForPreview()
}

extension KeyboardDelegate {
    var returnKeyType: UIReturnKeyType? {
        return nil
    }
    
    var needsInputModeSwitchKey: Bool {
        return false
    }
    
    func prepareForPreview() {}
}
