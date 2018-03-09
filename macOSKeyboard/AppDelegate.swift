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
                
                if let archivedPasteboardItems = AppDelegate.archivedPasteboardItems {
                    if event.type == .keyUp && Keyboard.default.currentKeys.count == 1 {
                        NSPasteboard.general.restore(archivedItems: archivedPasteboardItems)
                        AppDelegate.archivedPasteboardItems = nil
                    }
                }
                
                let isAutorepeatEvent: Bool = event.getIntegerValueField(.keyboardEventAutorepeat) == 0 ? false : true
                
                let autorepeatKeycodes: [CGKeyCode] = [
                    .return,
                    .delete,
                    .leftArrow,
                    .rightArrow,
                    .downArrow,
                    .upArrow,
                ]
                
                guard !isAutorepeatEvent || autorepeatKeycodes.contains(event.keycode)  else {
                    return nil
                }
                
                guard event.character.applyingTransform(.toLatin, reverse: false) == event.character else {
                    return Unmanaged.passRetained(event)
                }
                
                Keyboard.default.shiftUpFlag = event.flags.contains(.maskShift)
                Keyboard.default.shiftDownFlag = event.flags.contains(.maskAlternate)
                
                let commandKeycodes: [CGKeyCode] = [.leftCommand, .rightCommand]
                
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
    
    private func tap(label: String, flags: CGEventFlags = .init()) {
        guard let keycode: CGKeyCode = .from(label: label, flags: .maskCommand) else {
            return
        }
        
        tap(keycode: keycode, flags: flags)
    }
    
    private func tap(keycode: CGKeyCode, flags: CGEventFlags = .init()) {
        let source = CGEventSource.init(stateID: .combinedSessionState)
        let keyDown = CGEvent.init(keyboardEventSource: source, virtualKey: keycode, keyDown: true)
        keyDown?.flags = flags
        keyDown?.post(tap: .cgAnnotatedSessionEventTap)
        
        let keyUp = CGEvent.init(keyboardEventSource: source, virtualKey: keycode, keyDown: false)
        keyUp?.post(tap: .cgAnnotatedSessionEventTap)
    }
    
    static var archivedPasteboardItems: [NSPasteboardItem]? = nil
    
    
    // MARK: - KeyboardDelegate

    func delete() {
        
        if AXUIElement.focused.hasSettable(attribute: .selectedText) && AXUIElement.focused.hasSettable(attribute: .selectedTextRange) {
            let location: Int = AXUIElement.focused.selectedTextRange.location
            AXUIElement.focused.selectedTextRange = .init(location: location - 1, length: 1)
            AXUIElement.focused.selectedText = .init()
        }
        else {
            tap(keycode: .delete)
        }
    }
    
    func settings() {}
    
    func insert(text: String) {
        
        if AXUIElement.focused.hasSettable(attribute: .selectedText) {
            AXUIElement.focused.selectedText = text
        }
        else {
            
            if AppDelegate.archivedPasteboardItems == nil {
                AppDelegate.archivedPasteboardItems = NSPasteboard.general.archivedItems
            }
            
            NSPasteboard.general.declareTypes([.string], owner: nil)
            NSPasteboard.general.setString(text, forType: .string)

            tap(label: .v, flags: .maskCommand)
        }
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

