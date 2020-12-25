//
//  KeyboardDelegate.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-29.
//

import SwiftUI

public protocol KeyboardDelegate {
    
    func delete()
    func enter()
    func settings()
    
    func insert(text: String)
    
    var documentContext: DocumentContext {get}
    
    #if canImport(UIKit)
    var returnKeyType: UIReturnKeyType? {get}
    #endif
    
    func prepareForPreview()
}

public extension KeyboardDelegate {
    
    var needsReturn: Bool {
        #if canImport(UIKit)
        return Keyboard.default.delegate?.returnKeyType == .default
        #else
        return true
        #endif
    }
    
    func prepareForPreview() {}
}
