//
//  AppDelegate.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-01-30.
//

import AppKit
import Carbon
import Combine
import KeyboardModule
import UnicodeData

class AppDelegate: NSObject {
    
    private var anyCancellables: [AnyCancellable] = []
    
    private let isProcessTrusted: Bool = AXIsProcessTrusted()
    
    let statusMenu = StatusMenu()
    
    static var commandPressedKeycodes: [Keycode] = []
    
    private var previousDocumentContext = DocumentContext()
    static var preEnterDocumentContext: DocumentContext?
    
    static let keyboardWindow = KeyboardWindow()
    static let characterSearchWindow = CharacterSearchWindow()
    static let characterSequenceWindow = CharacterSequenceWindow()
    
    var eventTap: CFMachPort? = nil
    
    func layoutWindows() {
        let visibleFrame = NSScreen.main?.visibleFrame ?? .zero
        
        AppDelegate.characterSearchWindow.setFrameOrigin(visibleFrame.origin)
        AppDelegate.characterSequenceWindow.updateFrame()
    }
    
    static func synchronizeKeyboardLayout() {
        Keyboard.default.layout = KeyboardLayout.allLayouts.element(inputSourceID: TISInputSource.currentKeyboardLayout.id)
    }
    
    static var synchronizeKeyboardLayoutNotificationCallback: CFNotificationCallback = { (center, observer, name, object, userInfo) in
        AppDelegate.synchronizeKeyboardLayout()
    }
    
    private func tap(label: String, flags: CGEventFlags = []) {
        guard let keycode: Keycode = .from(label: label, flags: .maskCommand) else {
            return
        }
        
        tap(key: .by(keycode: keycode), flags: flags)
    }
    
    static var skipTapCount: Int = 0
    private func tap(key: Key, flags: CGEventFlags = []) {
        AppDelegate.tap(key: key, flags: flags)
    }
    
    static func tap(key: Key, flags: CGEventFlags = []) {
        AppDelegate.skipTapCount += 2
        
        let source = CGEventSource(stateID: .hidSystemState)
        let keyDown = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(key.keycode), keyDown: true)
        keyDown?.flags = flags
        keyDown?.post(tap: .cghidEventTap)
        
        let keyUp = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(key.keycode), keyDown: false)
        keyUp?.post(tap: .cghidEventTap)
    }
    
    static var archivedPasteboardItems: [NSPasteboardItem]? = nil
    
    static var nonAccessibilityDocumentContext = NonAccessibilityDocumentContext()
    
    static var documentContext: DocumentContext {
        
        if isUserDefaultsVisibility && isUserDefaultsVisibleKeyboard {
            return DocumentContext(
                beforeInput: nonAccessibilityDocumentContext.beforeInput,
                afterInput: nonAccessibilityDocumentContext.afterInput
            )
        }
        
        guard let text = AXUIElement.focused?.text else {
            return .empty
        }
        
        guard let selectedTextRange = AXUIElement.focused?.selectedTextRange else {
            return .empty
        }
        
        guard selectedTextRange.upperBound <= text.count else {
            return DocumentContext(beforeInput: text, afterInput: "")
        }
        
        return DocumentContext(
            beforeInput: String(text.prefix(upTo: String.Index(utf16Offset: selectedTextRange.lowerBound, in: text))),
            afterInput: String(text.suffix(from: String.Index(utf16Offset: selectedTextRange.upperBound, in: text)))
        )
    }
    
    static var isUserDefaultsVisibility: Bool {
        return [kAXScrollAreaRole, kAXWindowRole].contains(AXUIElement.focused?.role ?? "")
    }
    
    static let isUserDefaultsVisibleKeyboardKey = "BbqMJTrDcbJy3FJTI2fXo6TEHLoAU37"
    
    static var isUserDefaultsVisibleKeyboard: Bool {
        get {
            guard let bundleID = NSWorkspace.shared.frontmostApplication?.bundleIdentifier else {
                return true
            }
            
            return UserDefaults.standard.dictionary(forKey: bundleID)?[isUserDefaultsVisibleKeyboardKey] as? Bool ?? true
        }
        
        set {
            guard let bundleID = NSWorkspace.shared.frontmostApplication?.bundleIdentifier else {
                return
            }
            
            var bundleDictionary = UserDefaults.standard.dictionary(forKey: bundleID) ?? [:]
            bundleDictionary[isUserDefaultsVisibleKeyboardKey] = newValue as Any
            
            UserDefaults.standard.set(bundleDictionary, forKey: bundleID)
            UserDefaults.standard.synchronize()
        }
    }
}

// MARK: - NSApplicationDelegate
extension AppDelegate: NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        UnicodeData.default.loadIfNeeded()
        
        AppDelegate.synchronizeKeyboardLayout()
        
        NotificationCenter.default.post(name: .documentContextDidChange, object: nil)
        
        layoutWindows()
        
        AppDelegate.characterSearchWindow.setIsVisible(isProcessTrusted)
        AppDelegate.characterSequenceWindow.setIsVisible(isProcessTrusted)
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (timer) in
            if self.isProcessTrusted != AXIsProcessTrusted() {
                let keyboardProcess = Process()
                keyboardProcess.launchPath = Bundle.main.executablePath!
                keyboardProcess.launch()
                LaunchAgent.unload()
                NSApp.terminate(self)
            }
            
            if self.previousDocumentContext != self.documentContext {
                self.previousDocumentContext = self.documentContext
                
                NotificationCenter.default.post(name: .documentContextDidChange, object: nil)
                
                AppDelegate.characterSearchWindow.setIsVisible(self.previousDocumentContext != .empty)
                AppDelegate.characterSequenceWindow.setIsVisible(self.previousDocumentContext != .empty)
            }
            
            self.statusMenu.visibilityMenuItem.isHidden = !AppDelegate.isUserDefaultsVisibility
            self.statusMenu.visibilityMenuItem.updateLocalizedStrings()
        }
        
        Keyboard.default.delegate = self
        
        let keyboardEventMask: CGEventMask = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.keyUp.rawValue | 1 << CGEventType.flagsChanged.rawValue
        
        let mouseEventMask: CGEventMask = 1 << CGEventType.leftMouseDown.rawValue | 1 << CGEventType.rightMouseDown.rawValue
        
        let eventMask: CGEventMask = keyboardEventMask | mouseEventMask
        
        eventTap = CGEvent.tapCreate(tap: .cghidEventTap, place: .headInsertEventTap, options: .defaultTap, eventsOfInterest: eventMask, callback: eventTapCallback, userInfo: nil)
        
        if let eventTap = self.eventTap {
            
            CFRunLoopAddSource(CFRunLoopGetCurrent(), CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0), .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
        }
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDistributedCenter(), nil, AppDelegate.synchronizeKeyboardLayoutNotificationCallback, kTISNotifySelectedKeyboardInputSourceChanged, nil, .deliverImmediately)
        
        Keyboard.default.$layout
            .sink { layout in
                let inputSource = TISInputSource.inputSourceList[layout.inputSourceID]
                TISEnableInputSource(inputSource)
                TISSelectInputSource(inputSource)
            }
            .store(in: &anyCancellables)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationDidChangeScreenParameters(_ notification: Notification) {
        layoutWindows()
    }
}

// MARK: - KeyboardDelegate
extension AppDelegate: KeyboardDelegate {
    
    func delete() {
        
        if AXUIElement.focused?.hasSettable(attribute: .selectedText) == true && AXUIElement.focused?.hasSettable(attribute: .selectedTextRange) == true {
            let location: Int = AXUIElement.focused!.selectedTextRange!.location
            AXUIElement.focused?.selectedTextRange = NSRange(location: location - 1, length: 1)
            AXUIElement.focused?.selectedText = ""
        } else {
            tap(key: .delete)
        }
    }
    
    func enter() {
        tap(key: .enter)
    }
    
    func settings() {}
    
    func insert(text: String) {
        AppDelegate.nonAccessibilityDocumentContext.beforeInput.append(text)
        
        for flags: CGEventFlags in [[], [.maskShift], [.maskAlternate], [.maskShift, .maskAlternate]] {
            if let keycode: Keycode = .from(label: text, flags: flags) {
                tap(key: .by(keycode: keycode), flags: flags)
                return
            }
        }
        
        if AXUIElement.focused?.hasSettable(attribute: .selectedText) == true {
            AXUIElement.focused?.selectedText = text
        } else {
            
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
    
    func prepareForPreview() {
        if let eventTap = self.eventTap {
            CGEvent.tapEnable(tap: eventTap, enable: false)
        }
        
        NSStatusBar.system.removeStatusItem(self.statusMenu.statusItem)
    }
}
