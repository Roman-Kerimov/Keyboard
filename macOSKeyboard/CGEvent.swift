//
//  CGEvent.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-20.
//

import Foundation

extension CGEvent {
    var keycode: CGKeyCode {
        get {
            return .init(self.getIntegerValueField(.keyboardEventKeycode))
        }
        
        set {
            self.setIntegerValueField(.keyboardEventKeycode, value: .init(newValue))
        }
    }
}
