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
    
    private var previousDocumentContext: DocumentContext = .init()
    private static var preEnterDocumentContext: DocumentContext?
    private static var keycodeToKeyDictionary: [Keycode: Key] = .init()
    
    let unicodeSearchWindow = UnicodeSearchWindow.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
          
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (timer) in
            if self.isProcessTrusted != AXIsProcessTrusted() {
                let keyboard: Process = .init()
                keyboard.launchPath = Bundle.main.executablePath!
                keyboard.launch()
                LaunchAgent.unload()
                NSApp.terminate(self)
            }
            
            if self.previousDocumentContext != self.documentContext {
                self.previousDocumentContext = self.documentContext
                
                NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
                
                self.unicodeSearchWindow.setIsVisible(self.previousDocumentContext != .init())
            }
        }
        
        Keyboard.default.delegate = self
        
        let eventMask: CGEventMask = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.keyUp.rawValue | 1 << CGEventType.flagsChanged.rawValue | 1 << CGEventType.leftMouseDown.rawValue | 1 << CGEventType.rightMouseDown.rawValue

        let eventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: eventMask,
            callback: { (eventTapProxy, _, event, nil) -> Unmanaged<CGEvent>? in
                
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

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: eventTap!, enable: true)
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
        
        if AXUIElement.focused?.hasSettable(attribute: .selectedText) == true && AXUIElement.focused?.hasSettable(attribute: .selectedTextRange) == true {
            let location: Int = AXUIElement.focused!.selectedTextRange!.location
            AXUIElement.focused?.selectedTextRange = .init(location: location - 1, length: 1)
            AXUIElement.focused?.selectedText = .init()
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
        AppDelegate.nonAccessibilityDocumentContext.beforeInput.append(text)
        
        for flags: CGEventFlags in [[], [.maskShift], [.maskAlternate], [.maskShift, .maskAlternate]] {
            if let keycode: Keycode = .from(label: text, flags: flags) {
                tap(keycode: keycode, flags: flags)
                return
            }
        }
        
        if AXUIElement.focused?.hasSettable(attribute: .selectedText) == true {
            AXUIElement.focused?.selectedText = text
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
    
    static var nonAccessibilityDocumentContext: NonAccessibilityDocumentContext = .init()
    
    var documentContext: DocumentContext {
        return AppDelegate.documentContext
    }
    
    static var documentContext: DocumentContext {
        
        if [kAXScrollAreaRole, kAXWindowRole].contains(AXUIElement.focused?.role ?? .init()) {
            return .init(beforeInput: nonAccessibilityDocumentContext.beforeInput, afterInput: nonAccessibilityDocumentContext.afterInput)
        }
        
        guard let text = AXUIElement.focused?.text else {
            return .init()
        }
        
        guard let selectedTextRange = AXUIElement.focused?.selectedTextRange else {
            return .init()
        }
        
        guard selectedTextRange.upperBound <= text.count else {
            return .init(beforeInput: text, afterInput: .init())
        }
        
        return .init(
            beforeInput: .init(text.prefix(upTo: .init(encodedOffset: selectedTextRange.lowerBound))),
            afterInput: .init(text.suffix(from: .init(encodedOffset: selectedTextRange.upperBound)))
        )
    }
}

