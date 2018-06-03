//
//  AXUIElement.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-13.
//

import Foundation

extension AXUIElement {
    static let systemWide = AXUIElementCreateSystemWide()
    
    static var focused: AXUIElement? {
        
        var focusedUIElement: CFTypeRef?
        AXUIElementCopyAttributeValue(.systemWide, kAXFocusedUIElementAttribute as CFString, &focusedUIElement)

        return focusedUIElement as! AXUIElement?
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

        var rangeValue: NSRange = .init()
        AXValueGetValue(value as! AXValue, .cfRange, &rangeValue)

        return rangeValue
    }
    
    private func set(attribute: AXAttribute, value: NSRange) {
        var rangeValue = value
        AXUIElementSetAttributeValue(self, attribute.cfString, AXValueCreate(.cfRange, &rangeValue) as CFTypeRef)
    }
    
    
    func hasSettable(attribute: AXAttribute) -> Bool {
        
        var isSettable: DarwinBoolean = .init(false)
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
            return get(attribute: .value)
        }
        
        set {
            set(attribute: .value, value: newValue ?? .init())
        }
    }
    
    var selectedText: String? {
        get {
            return get(attribute: .selectedText)
        }
        
        set {
            set(attribute: .selectedText, value: newValue ?? .init())
        }
    }
    
    var selectedTextRange: NSRange? {
        get {
            return get(attribute: .selectedTextRange)
        }
        
        set {
            set(attribute: .selectedTextRange, value: newValue ?? .init())
        }
    }
}
