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
    
    private func get(attribute: AXAttribute) -> String {
        var value: CFTypeRef?
        AXUIElementCopyAttributeValue(self, kAXValueAttribute as CFString, &value)
        return value as! String
    }
    
    private func set(attribute: AXAttribute, value: String) {
        AXUIElementSetAttributeValue(self, attribute.cfString, value as CFTypeRef)
    }
    
    private func get(attribute: AXAttribute) -> NSRange {
        
        var value: CFTypeRef?
        AXUIElementCopyAttributeValue(self, kAXSelectedTextRangeAttribute as CFString, &value)

        var rangeValue: NSRange = .init()
        AXValueGetValue(value as! AXValue, .cfRange, &rangeValue)

        return rangeValue
    }
    
    private func set(attribute: AXAttribute, value: NSRange) {
        var rangeValue = value
        AXUIElementSetAttributeValue(self, attribute.cfString, AXValueCreate(.cfRange, &rangeValue) as CFTypeRef)
    }
    

    var text: String {
        get {
            return get(attribute: .value)
        }
        
        set {
            set(attribute: .value, value: newValue)
        }
    }
    
    var selectedText: String {
        get {
            return get(attribute: .selectedText)
        }
        
        set {
            set(attribute: .selectedText, value: newValue)
        }
    }
    
    var selectedTextRange: NSRange {
        get {
            return get(attribute: .selectedTextRange)
        }
        
        set {
            set(attribute: .selectedTextRange, value: newValue)
        }
    }
}
