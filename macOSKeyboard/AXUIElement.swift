//
//  AXUIElement.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-13.
//

import Foundation

extension AXUIElement {
    static let systemWide = AXUIElementCreateSystemWide()
    
    static var focused: AXUIElement {
        
        var focusedUIElement: CFTypeRef?
        AXUIElementCopyAttributeValue(.systemWide, kAXFocusedUIElementAttribute as CFString, &focusedUIElement)

        return focusedUIElement as! AXUIElement
    }
    
    var text: String {
        get {
            var textValue: CFTypeRef?
            AXUIElementCopyAttributeValue(self, kAXValueAttribute as CFString, &textValue)
            return textValue as! String
        }
        
        set {
            AXUIElementSetAttributeValue(self, kAXValueAttribute as CFString, newValue as CFTypeRef)
        }
    }
    
    var selectedText: String {
        get {
            var selectedTextValue: CFTypeRef?
            AXUIElementCopyAttributeValue(self, kAXSelectedTextAttribute as CFString, &selectedTextValue)
            return selectedTextValue as! String
        }
        
        set {
            AXUIElementSetAttributeValue(self, kAXSelectedTextAttribute as CFString, newValue as CFTypeRef)
        }
    }
    
    var selectedTextRange: NSRange {
        get {
            var selectedTextRangeAttribute: CFTypeRef?
            AXUIElementCopyAttributeValue(self, kAXSelectedTextRangeAttribute as CFString, &selectedTextRangeAttribute)
            
            var selectedTextRange: NSRange = .init()
            AXValueGetValue(selectedTextRangeAttribute as! AXValue, .cfRange, &selectedTextRange)
            
            return selectedTextRange
        }
        
        set {
            var range = newValue
            AXUIElementSetAttributeValue(self, kAXSelectedTextRangeAttribute as CFString, AXValueCreate(.cfRange, &range) as CFTypeRef)
        }
    }
}
