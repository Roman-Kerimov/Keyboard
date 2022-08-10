//
//  Keycode.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-03-19.
//

import Foundation

public typealias Keycode = Int

extension Keycode {
    static let keycodeMaxCount = 259
}

// MARK: - Carbon
#if canImport(Carbon)
import Carbon

extension Keycode {
    
    public static func from(label: String, flags: CGEventFlags) -> Self? {
        
        let inputSourceID = TISInputSource.currentKeyboardLayout.id
        
        if layouts[inputSourceID] == nil {
            layouts[inputSourceID] = [:]
        }
        
        if layouts[inputSourceID]![flags] == nil {
            layouts[inputSourceID]![flags] = [:]
            
            for keycode: Self in 0..<256 {
                layouts[inputSourceID]![flags]![keycode.label(flags: flags)] = keycode
            }
        }
        
        return layouts[inputSourceID]![flags]![label]
    }
    
    private static var layouts: [String: [CGEventFlags: [String: Self]]] = [:]
    
    func label(flags: CGEventFlags) -> String {
        let virtualKeyCode = UInt16(self)
        let keyAction = UInt16(kUCKeyActionDown)
        
        var modifierKeyState: UInt32 = 0
        
        if flags.contains(.maskCommand) {
            modifierKeyState = modifierKeyState | UInt32(cmdKey >> 8)
        }
        
        if flags.contains(.maskAlternate) {
            modifierKeyState = modifierKeyState | UInt32(optionKey >> 8)
        }
        
        if flags.contains(.maskControl) {
            modifierKeyState = modifierKeyState | UInt32(controlKey >> 8)
        }
        
        if flags.contains(.maskShift) {
            modifierKeyState = modifierKeyState | UInt32(shiftKey >> 8)
        }
        
        let keyboardType = UInt32(LMGetKbdType())
        let keyTranslateOptions: OptionBits = 1 << kUCKeyTranslateNoDeadKeysBit
        var deadKeyState: UInt32 = 0
        let maxStringLength: Int = 4
        
        var actualStringLength: Int = 0
        var unicodeString: [UniChar] = Array(repeating: 0, count: maxStringLength)
        
        let keyLayoutPointer = NSData(data: TISInputSource.currentKeyboardLayout.unicodeKeyLayoutData)
            .bytes
            .assumingMemoryBound(to: UCKeyboardLayout.self)
        
        UCKeyTranslate(
            keyLayoutPointer,
            virtualKeyCode,
            keyAction,
            modifierKeyState,
            keyboardType,
            keyTranslateOptions,
            &deadKeyState,
            maxStringLength,
            &actualStringLength,
            &unicodeString
        )
        
        return String(utf16CodeUnits: &unicodeString, count: actualStringLength)
    }
}
#endif
