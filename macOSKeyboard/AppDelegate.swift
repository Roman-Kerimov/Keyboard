//
//  AppDelegate.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-01-30.
//

import Cocoa
import Carbon

class AppDelegate: NSObject, NSApplicationDelegate, KeyboardDelegate {
    
    private let isProcessTrusted: Bool = AXIsProcessTrusted()

    let statusMenu: StatusMenu = .init()
    
    private static var preEnterDocumentContext: DocumentContext?
    private static var keycodeToKeyDictionary: [Keycode: Key] = .init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (timer) in
            if self.isProcessTrusted != AXIsProcessTrusted() {
                let keyboard: Process = .init()
                keyboard.launchPath = Bundle.main.executablePath!
                keyboard.launch()
                LaunchAgent.unload()
                NSApp.terminate(self)
            }
        }
        
        Keyboard.default.delegate = self
        
        let eventMask: CGEventMask = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.keyUp.rawValue | 1 << CGEventType.flagsChanged.rawValue

        let keyEvent = CGEvent.tapCreate(
            tap: .cgSessionEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: eventMask,
            callback: { (eventTapProxy, _, event, nil) -> Unmanaged<CGEvent>? in
                
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
                    let postEnterContext: String = AppDelegate.documentContext.beforeInput

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
                
                let key: Key
                
                if TISInputSource.currentKeyboardLayout.isASCIICapable {
                    let disabledKeys: [Keycode] = [.grave, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .hyphenMinus, .equal, .leftSquareBracket, .rightSquareBracket, .reverseSolidus, .apostrophe]
                    
                    if disabledKeys.contains(event.keycode) {
                        return nil
                    }
                    
                    Keyboard.default.shiftUpFlag = event.flags.contains(.maskShift)
                    Keyboard.default.shiftDownFlag = event.flags.contains(.maskAlternate)
                    
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
                        key = !Keyboard.default.shiftFlag && event.keycode != .space ? .init(label: event.character) : Keyboard.default.layout.key(code: event.keycode) ?? .init()
                        
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
        guard let keycode: Keycode = .from(label: label, flags: .maskCommand) else {
            return
        }
        
        tap(keycode: keycode, flags: flags)
    }
    
    static var skipTapCount: Int = 0
    private func tap(keycode: Keycode, flags: CGEventFlags = .init()) {
        AppDelegate.tap(keycode: keycode, flags: flags)
    }
    
    private static func tap(keycode: Keycode, flags: CGEventFlags = .init()) {
        AppDelegate.skipTapCount += 2
        
        let source = CGEventSource.init(stateID: .hidSystemState)
        let keyDown = CGEvent.init(keyboardEventSource: source, virtualKey: keycode, keyDown: true)
        keyDown?.flags = flags
        keyDown?.post(tap: .cghidEventTap)
        
        let keyUp = CGEvent.init(keyboardEventSource: source, virtualKey: keycode, keyDown: false)
        keyUp?.post(tap: .cghidEventTap)
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
    
    func enter() {
        tap(keycode: .enter)
    }
    
    func settings() {}
    
    func insert(text: String) {
        
        for flags: CGEventFlags in [[], [.maskShift], [.maskAlternate], [.maskShift, .maskAlternate]] {
            if let keycode: Keycode = .from(label: text, flags: flags) {
                tap(keycode: keycode, flags: flags)
                return
            }
        }
        
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
        return AppDelegate.documentContext
    }
    
    static var documentContext: DocumentContext {
        let text = AXUIElement.focused.text
        let selectedTextRange = AXUIElement.focused.selectedTextRange
        
        return .init(
            beforeInput: .init(text.prefix(upTo: .init(encodedOffset: selectedTextRange.lowerBound))),
            afterInput: .init(text.suffix(from: .init(encodedOffset: selectedTextRange.upperBound)))
        )
    }
}

