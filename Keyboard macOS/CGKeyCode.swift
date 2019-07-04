//
//  CGKeyCode.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-02-24.
//

import Carbon

extension CGKeyCode {
    
    static func from(label: String, flags: CGEventFlags) -> CGKeyCode? {
        
        let inputSourceID = TISInputSource.currentKeyboardLayout.id
        
        if layouts[inputSourceID] == nil {
            layouts[inputSourceID] = .init()
        }
        
        if layouts[inputSourceID]![flags] == nil {
            layouts[inputSourceID]![flags] = .init()
            
            for keycode: CGKeyCode in 0..<256 {
                layouts[inputSourceID]![flags]![keycode.label(flags: flags)] = keycode
            }
        }
        
        return layouts[inputSourceID]![flags]![label]
    }
    
    private static var layouts: [String: [CGEventFlags: [String: CGKeyCode]]] = .init()
    
    func label(flags: CGEventFlags) -> String {
        let virtualKeyCode: UInt16 = self
        let keyAction: UInt16 = .init(kUCKeyActionDown)
        
        var modifierKeyState: UInt32 = 0
        
        if flags.contains(.maskCommand) {
            modifierKeyState = modifierKeyState | .init(cmdKey >> 8)
        }
        
        if flags.contains(.maskAlternate) {
            modifierKeyState = modifierKeyState | .init(optionKey >> 8)
        }
        
        if flags.contains(.maskControl) {
            modifierKeyState = modifierKeyState | .init(controlKey >> 8)
        }
        
        if flags.contains(.maskShift) {
            modifierKeyState = modifierKeyState | .init(shiftKey >> 8)
        }
        
        let keyboardType: UInt32 = .init(LMGetKbdType())
        let keyTranslateOptions: OptionBits = 1 << kUCKeyTranslateNoDeadKeysBit
        var deadKeyState: UInt32 = 0
        let maxStringLength: Int = 4
        
        var actualStringLength: Int = 0
        var unicodeString: [UniChar] = .init(repeating: 0, count: maxStringLength)
        
        let keyLayoutPointer = NSData.init(data: TISInputSource.currentKeyboardLayout.unicodeKeyLayoutData).bytes.assumingMemoryBound(to: UCKeyboardLayout.self)
        
        UCKeyTranslate(keyLayoutPointer, virtualKeyCode, keyAction, modifierKeyState, keyboardType, keyTranslateOptions, &deadKeyState, maxStringLength, &actualStringLength, &unicodeString)
        
        return .init(utf16CodeUnits: &unicodeString, count: actualStringLength)
    }
}