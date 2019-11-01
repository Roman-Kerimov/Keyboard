//
//  eventTapCallback.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-06-10.
//

import AppKit
import Carbon

func eventTapCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    let key: Key = .by(keycode: event.keycode)
    
    if [.leftMouseDown, .rightMouseDown].contains(event.type) {
        AppDelegate.nonAccessibilityDocumentContext.reset()
        return Unmanaged.passRetained(event)
    }
    
    if event.type == .keyDown {
        if event.flags.contains(.maskCommand) {
            AppDelegate.nonAccessibilityDocumentContext.reset()
        }
        else {
            switch key {
                
            case .delete:
                AppDelegate.nonAccessibilityDocumentContext.deleteBackward()
                
            case .forwardDelete:
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
    
    let autorepeatKeys: [Key] = [
        .delete,
        .leftArrow,
        .rightArrow,
        .downArrow,
        .upArrow,
    ]
    
    guard !isAutorepeatEvent || autorepeatKeys.contains(key)  else {
        return nil
    }
    
    guard AppDelegate.skipTapCount == 0 else {
        AppDelegate.skipTapCount -= 1
        return Unmanaged.passRetained(event)
    }
    
    if key == .enter && event.type == .keyDown {
        AppDelegate.preEnterDocumentContext = AppDelegate.documentContext
    }
    
    if key == .enter && event.type == .keyUp {
        let preEnterContext: String = AppDelegate.preEnterDocumentContext?.beforeInput ?? .init()
        let postEnterContext: String = AppDelegate.documentContext.beforeInput ?? .init()
        
        if postEnterContext.hasPrefix(preEnterContext) {
            let enteredString = postEnterContext.dropFirst(preEnterContext.count)
            
            if enteredString.last == .return {
                AppDelegate.tap(key: .delete)
            }
            else if enteredString.contains(.return) {
                AppDelegate.tap(key: .z, flags: .maskCommand)
            }
        }
    }
    
    if let archivedPasteboardItems = AppDelegate.archivedPasteboardItems {
        if event.type == .keyUp && Keyboard.default.currentKey != nil {
            NSPasteboard.general.restore(archivedItems: archivedPasteboardItems)
            AppDelegate.archivedPasteboardItems = nil
        }
    }
    
    let commandKeys: [Key] = [.leftCommand, .rightCommand]
    
    if Keyboard.default.currentKey != nil && event.type == .flagsChanged && commandKeys.contains(key) {
        Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
        return nil
    }
    
    if commandKeys.contains(key) && Keyboard.default.shiftFlag {
        Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
    }
    
    if Keyboard.default.shiftFlag == false && event.flags.contains(.maskCommand) || AppDelegate.commandPressedKeycodes.contains(event.keycode) {
        
        if event.type == .keyDown {
            AppDelegate.commandPressedKeycodes.append(event.keycode)
        }
        
        if event.type == .keyUp {
            AppDelegate.commandPressedKeycodes.removeAll {$0 == event.keycode}
        }
        
        return Unmanaged.passRetained(event)
    }
    
    Keyboard.default.shiftUpFlag = event.flags.contains(.maskShift)
    Keyboard.default.shiftDownFlag = event.flags.contains(.maskAlternate)
    
    if event.flags.contains(.maskAlphaShift) {
        
        var ioConnect: io_connect_t = .init(0)
        let ioService = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching(kIOHIDSystemClass))
        IOServiceOpen(ioService, mach_task_self_, UInt32(kIOHIDParamConnectType), &ioConnect)
        IOHIDSetModifierLockState(ioConnect, Int32(kIOHIDCapsLockState), false)
        IOServiceClose(ioConnect)
        
        if Keyboard.default.characterSequence.autocompleteText.isEmpty == false {
            Keyboard.default.characterSequence.autocomplete()
        }
        
        return nil
    }
    
    if Keyboard.default.layout != .system {
        
        let selectorKeys: [Key] = [.grave, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .hyphenMinus, .equal, .leftSquareBracket, .rightSquareBracket, .reverseSolidus, .apostrophe]
        
        if let item = selectorKeys.firstIndex(of: key) {
            
            if event.type == .keyDown {
                Keyboard.default.characterSearch.insert(item: item)
            }
            
            return nil
        }
    }
    
    guard Keyboard.default.layout.contain(key) else {
        if Keyboard.default.shiftFlag {
            return nil
        }
        return Unmanaged.passRetained(event)
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
