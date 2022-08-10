//
//  AXUIElement.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-13.
//

import Foundation
import ApplicationServices

extension AXUIElement {
    static let systemWide = AXUIElementCreateSystemWide()
    
    static var focused: AXUIElement? {
        
        var focusedUIElement: CFTypeRef?
        AXUIElementCopyAttributeValue(.systemWide, kAXFocusedUIElementAttribute as CFString, &focusedUIElement)
        
        if let focusedUIElement = focusedUIElement {
            return (focusedUIElement as! AXUIElement)
        }
        
        return nil
    }
    
    private func get(attribute: AXAttribute) -> String? {
        var value: CFTypeRef?
        AXUIElementCopyAttributeValue(self, attribute.cfString, &value)
        
        return value as? String
    }
    
    private func set(attribute: AXAttribute, value: String) {
        AXUIElementSetAttributeValue(self, attribute.cfString, value as CFTypeRef)
    }
    
    private func get(attribute: AXAttribute) -> NSRange? {
        var value: CFTypeRef?
        AXUIElementCopyAttributeValue(self, attribute.cfString, &value)
        
        if value == nil {
            return nil
        }
        
        var rangeValue = NSRange()
        AXValueGetValue(value as! AXValue, .cfRange, &rangeValue)
        
        return rangeValue
    }
    
    private func set(attribute: AXAttribute, value: NSRange) {
        var rangeValue = value
        AXUIElementSetAttributeValue(self, attribute.cfString, AXValueCreate(.cfRange, &rangeValue) as CFTypeRef)
    }
    
    
    func hasSettable(attribute: AXAttribute) -> Bool {
        var isSettable = DarwinBoolean(false)
        AXUIElementIsAttributeSettable(self, attribute.cfString, &isSettable)
        
        return isSettable.boolValue && attributeNames.filter {$0.hasSuffix("Ancestor")} .isEmpty
    }
    
    private var attributeNames: [String] {
        var attributeNamesCFArray: CFArray?
        
        AXUIElementCopyAttributeNames(self, &attributeNamesCFArray)
        
        return attributeNamesCFArray as! [String]
    }
    
    
    var text: String? {
        get {
            get(attribute: .value)
        }
        
        set {
            set(attribute: .value, value: newValue ?? "")
        }
    }
    
    var selectedText: String? {
        get {
            get(attribute: .selectedText)
        }
        
        set {
            set(attribute: .selectedText, value: newValue ?? "")
        }
    }
    
    var selectedTextRange: NSRange? {
        get {
            get(attribute: .selectedTextRange)
        }
        
        set {
            set(attribute: .selectedTextRange, value: newValue ?? NSRange())
        }
    }
    
    var role: String? {
        get {
            get(attribute: .role)
        }
    }
}
