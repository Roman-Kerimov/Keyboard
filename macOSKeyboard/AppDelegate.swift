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
    static var preEnterDocumentContext: DocumentContext?
    static var keycodeToKeyDictionary: [Keycode: Key] = .init()
    
    static let characterSearchWindow = CharacterSearchWindow.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        AppDelegate.synchronizeKeyboardLayout()
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
        
        AppDelegate.characterSearchWindow.setIsVisible(isProcessTrusted)
        
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
                
                AppDelegate.characterSearchWindow.setIsVisible(self.previousDocumentContext != .init())
            }
            
            self.statusMenu.visibilityMenuItem.isHidden = !AppDelegate.isUserDefaultsVisibility
            self.statusMenu.visibilityMenuItem.updateLocalizedStrings()
        }
        
        Keyboard.default.delegate = self
        
        let eventMask: CGEventMask = 1 << CGEventType.keyDown.rawValue | 1 << CGEventType.keyUp.rawValue | 1 << CGEventType.flagsChanged.rawValue | 1 << CGEventType.leftMouseDown.rawValue | 1 << CGEventType.rightMouseDown.rawValue

        if let eventTap = CGEvent.tapCreate(tap: .cghidEventTap, place: .headInsertEventTap, options: .defaultTap, eventsOfInterest: eventMask, callback: eventTapCallback, userInfo: nil) {
            
            CFRunLoopAddSource(CFRunLoopGetCurrent(), CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0), .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
        }
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDistributedCenter(), nil, AppDelegate.synchronizeKeyboardLayoutNotificationCallback, kTISNotifySelectedKeyboardInputSourceChanged, nil, .deliverImmediately)
        
        NotificationCenter.default.addObserver(self, selector: #selector(synchronizeSystemInputSource), name: .LayoutDidChange, object: nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    static func synchronizeKeyboardLayout() {
        
        guard TISInputSource.currentKeyboardLayout.isASCIICapable else {
            return
        }
        
        if let keyboardLayout = KeyboardLayout.list[TISInputSource.currentKeyboardLayout.id] {
            Keyboard.default.layout = keyboardLayout
        }
        else {
            AppDelegate.synchronizeSystemInputSource()
        }
    }
    
    static var synchronizeKeyboardLayoutNotificationCallback: CFNotificationCallback = { (center, observer, name, object, userInfo) in
        AppDelegate.synchronizeKeyboardLayout()
    }
    
    static func synchronizeSystemInputSource() {
        let inputSource = TISInputSource.inputSourceList[Keyboard.default.layout.inputSourceID]
        TISEnableInputSource(inputSource)
        TISSelectInputSource(inputSource)
    }
    
    @objc func synchronizeSystemInputSource() {
        AppDelegate.synchronizeSystemInputSource()
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
    
    static func tap(keycode: Keycode, flags: CGEventFlags = .init()) {
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
        
        if isUserDefaultsVisibility && isUserDefaultsVisibleKeyboard {
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
    
    static var isUserDefaultsVisibility: Bool {
        return [kAXScrollAreaRole, kAXWindowRole].contains(AXUIElement.focused?.role ?? .init())
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
            
            var bundleDictionary = UserDefaults.standard.dictionary(forKey: bundleID) ?? .init()
            bundleDictionary[isUserDefaultsVisibleKeyboardKey] = newValue as Any
            
            UserDefaults.standard.set(bundleDictionary, forKey: bundleID)
            UserDefaults.standard.synchronize()
        }
    }
}

