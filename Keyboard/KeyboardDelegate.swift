//
//  KeyboardDelegate.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-29.
//

import SwiftUI

protocol KeyboardDelegate {
    
    func delete()
    func enter()
    func settings()
    
    func insert(text: String)
    
    var documentContext: DocumentContext {get}
    
    #if !os(macOS)
    var returnKeyType: UIReturnKeyType? {get}
    #endif

    var needsInputModeSwitchKey: Bool {get}
    
    func prepareForPreview()
}

extension KeyboardDelegate {
    
    #if !os(macOS)
    var returnKeyType: UIReturnKeyType? {
        return nil
    }
    #endif
    
    var needsInputModeSwitchKey: Bool {
        return false
    }
    
    func prepareForPreview() {}
}
