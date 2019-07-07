//
//  CGEvent.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-02-20.
//

import Foundation

extension CGEvent {
    var keycode: Keycode {
        get {
            return .init(self.getIntegerValueField(.keyboardEventKeycode))
        }
        
        set {
            self.setIntegerValueField(.keyboardEventKeycode, value: Int64(newValue))
        }
    }
    
    var character: String {
        get {
            var actualStringLength: Int = 0
            var unicodeString: [UniChar] = []
            
            self.keyboardGetUnicodeString(maxStringLength: 10, actualStringLength: &actualStringLength, unicodeString: &unicodeString)
            
            return .init(utf16CodeUnits: unicodeString, count: actualStringLength)
        }
    }
}
