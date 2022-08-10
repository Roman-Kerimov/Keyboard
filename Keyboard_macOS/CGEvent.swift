//
//  CGEvent.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-20.
//

import Foundation
import KeyboardModule

extension CGEvent {
    var keycode: Keycode {
        get {
            Keycode(getIntegerValueField(.keyboardEventKeycode))
        }
        
        set {
            self.setIntegerValueField(.keyboardEventKeycode, value: Int64(newValue))
        }
    }
    
    var character: String {
        get {
            var actualStringLength: Int = 0
            var unicodeString: [UniChar] = []
            
            keyboardGetUnicodeString(maxStringLength: 10, actualStringLength: &actualStringLength, unicodeString: &unicodeString)
            
            return String(utf16CodeUnits: unicodeString, count: actualStringLength)
        }
    }
}
