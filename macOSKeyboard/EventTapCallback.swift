//
//  eventTapCallback.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-06-10.
//

import Cocoa
import Carbon

func eventTapCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    if [.leftMouseDown, .rightMouseDown].contains(event.type) {
        AppDelegate.nonAccessibilityDocumentContext.reset()
        return Unmanaged.passRetained(event)
    }
    
    if event.type == .keyDown {
        if event.flags.contains(.maskCommand) {
            AppDelegate.nonAccessibilityDocumentContext.reset()
        }
        else {
            switch event.keycode {
                
            case .delete:
                AppDelegate.nonAccessibilityDocumentContext.deleteBackward()
                
            case .init(kVK_ForwardDelete):
                AppDelegate.nonAccessibilityDocumentContext.deleteForward()
                
            case .leftArrow:
                if event.flags.contains(.maskAlternate) {
                    fallthrough
                }
                
                AppDelegate.nonAccessibilityDocumentContext.moveBackward()
                
            case .rightArrow:
                if event.flags.contains(.maskAlternate) {
                    fallthrough
                }
                
                AppDelegate.nonAccessibilityDocumentContext.moveForward()
                
            case .upArrow, .downArrow:
                AppDelegate.nonAccessibilityDocumentContext.reset()
                
            default:
                break
            }
        }
    }
    
    let isAutorepeatEvent: Bool = event.getIntegerValueField(.keyboardEventAutorepeat) == 0 ? false : true
    
    let autorepeatKeycodes: [Keycode] = [
        .delete,
        .leftArrow,
        .rightArrow,
        .downArrow,
        .upArrow,
        ]
    
    guard !isAutorepeatEvent || autorepeatKeycodes.contains(event.keycode)  else {
        return nil
    }
    
    guard AppDelegate.skipTapCount == 0 else {
        AppDelegate.skipTapCount -= 1
        return Unmanaged.passRetained(event)
    }
    
    if event.keycode == .enter && event.type == .keyDown {
        AppDelegate.preEnterDocumentContext = AppDelegate.documentContext
    }
    
    if event.keycode == .enter && event.type == .keyUp {
        let preEnterContext: String = AppDelegate.preEnterDocumentContext?.beforeInput ?? .init()
        let postEnterContext: String = AppDelegate.documentContext.beforeInput ?? .init()
        
        if postEnterContext.hasPrefix(preEnterContext) {
            let enteredString = postEnterContext.dropFirst(preEnterContext.count)
            
            if enteredString.last == .return {
                AppDelegate.tap(keycode: .delete)
            }
            else if enteredString.contains(.return) {
                AppDelegate.tap(keycode: .z, flags: .maskCommand)
            }
        }
    }
    
    if let archivedPasteboardItems = AppDelegate.archivedPasteboardItems {
        if event.type == .keyUp && Keyboard.default.currentKey != nil {
            NSPasteboard.general.restore(archivedItems: archivedPasteboardItems)
            AppDelegate.archivedPasteboardItems = nil
        }
    }
    
    let commandKeycodes: [Keycode] = [.leftCommand, .rightCommand]
    
    if Keyboard.default.currentKey != nil && event.type == .flagsChanged && commandKeycodes.contains(event.keycode) {
        Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
        return nil
    }
    
    if commandKeycodes.contains(event.keycode) && Keyboard.default.shiftFlag {
        Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
    }
    
    if Keyboard.default.shiftFlag == false && event.flags.contains(.maskCommand) {
        return Unmanaged.passRetained(event)
    }
    
    Keyboard.default.shiftDownFlag = event.flags.contains(.maskAlternate)
    
    let key: Key
    
    if TISInputSource.currentKeyboardLayout.isASCIICapable {
        let disabledKeys: [Keycode] = [.grave, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .hyphenMinus, .equal, .leftSquareBracket, .rightSquareBracket, .reverseSolidus, .apostrophe]
        
        if disabledKeys.contains(event.keycode) {
            return nil
        }
        
        Keyboard.default.shiftUpFlag = event.flags.contains(.maskShift)
        
        guard let layoutKey = Keyboard.default.layout.key(code: event.keycode) else {
            if Keyboard.default.shiftFlag {
                return nil
            }
            return Unmanaged.passRetained(event)
        }
        
        key = layoutKey
    }
    else {
        switch event.type {
        case .keyDown:
            let layoutKey = Keyboard.default.layout.key(code: event.keycode) ?? .init()
            key = !Keyboard.default.shiftFlag && event.keycode != .space ? .init(label: event.character, shiftDownLabel: layoutKey.shiftDownLabel) : layoutKey
            
            AppDelegate.keycodeToKeyDictionary[event.keycode] = key
            
        case .keyUp:
            key = AppDelegate.keycodeToKeyDictionary[event.keycode] ?? .init()
            
        default:
            return Unmanaged.passRetained(event)
        }
    }
    
    switch event.type {
    case .keyDown:
        Keyboard.default.down(key: key)
        
    case .keyUp:
        Keyboard.default.up(key: key)
        
    default:
        break
    }
    
    return nil
}
