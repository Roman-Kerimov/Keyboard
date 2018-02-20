//
//  AppDelegate.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-01-30.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, KeyboardDelegate {

    let statusMenu: StatusMenu = .init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        Keyboard.default.delegate = self
        
        let eventMask: CGEventMask = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.keyUp.rawValue | 1 << CGEventType.flagsChanged.rawValue

        let keyEvent = CGEvent.tapCreate(
            tap: .cgSessionEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: eventMask,
            callback: { (eventTapProxy, eventType, event, nil) -> Unmanaged<CGEvent>? in
                
                let isAutorepeatEvent: Bool = event.getIntegerValueField(.keyboardEventAutorepeat) == 0 ? false : true
                
                let returnKeycode: CGKeyCode = 36
                let deleteKeycode: CGKeyCode = 51
                let leftArrowKeycode: CGKeyCode = 123
                let rightArrowKeycode: CGKeyCode = 124
                let downArrowKeycode: CGKeyCode = 125
                let upArrowKeycode: CGKeyCode = 126
                
                let autorepeatKeycodes: [CGKeyCode] = [
                    returnKeycode,
                    deleteKeycode,
                    leftArrowKeycode,
                    rightArrowKeycode,
                    downArrowKeycode,
                    upArrowKeycode
                ]
                
                guard !isAutorepeatEvent || autorepeatKeycodes.contains(event.keycode)  else {
                    return nil
                }
                
                Keyboard.default.shiftUpFlag = event.flags.contains(.maskShift)
                Keyboard.default.shiftDownFlag = event.flags.contains(.maskAlternate)
                
                let commandKeycodes: [CGKeyCode] = [54, 55]
                
                if Keyboard.default.currentKeys.isEmpty == false && eventType == .flagsChanged && commandKeycodes.contains(event.keycode) {
                    Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
                    return nil
                }
                
                if commandKeycodes.contains(event.keycode) && Keyboard.default.shiftFlag {
                    Keyboard.default.shiftFlag = event.flags.contains(.maskCommand)
                }
                
                if Keyboard.default.shiftFlag == false && event.flags.contains(.maskCommand) {
                    return Unmanaged.passRetained(event)
                }
                
                guard let key = Keyboard.default.layout.key(code: event.keycode) else {
                    if Keyboard.default.shiftFlag {
                        return nil
                    }
                    return Unmanaged.passRetained(event)
                }
                
                switch eventType {
                case .keyDown:
                    Keyboard.default.down(key: key)
                    
                case .keyUp:
                    Keyboard.default.up(key: key)
                    
                default:
                    break
                }
                
                return nil
            },
            userInfo: nil
        )

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, keyEvent, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: keyEvent!, enable: true)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    // MARK: - KeyboardDelegate

    func delete() {
        let location: Int = AXUIElement.focused.selectedTextRange.location
        AXUIElement.focused.selectedTextRange = .init(location: location - 1, length: 1)
        AXUIElement.focused.selectedText = .init()
    }
    
    func settings() {}
    
    func insert(text: String) {
        AXUIElement.focused.selectedText = text
    }
    
    var documentContext: DocumentContext {
        let text = AXUIElement.focused.text
        let selectedTextRange = AXUIElement.focused.selectedTextRange
        
        return .init(
            beforeInput: .init(text.prefix(upTo: .init(encodedOffset: selectedTextRange.lowerBound))),
            afterInput: .init(text.suffix(from: .init(encodedOffset: selectedTextRange.upperBound)))
        )
    }
}

