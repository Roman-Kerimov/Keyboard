//
//  GuideWindow.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-01-05.
//

import AppKit

class GuideWindow: NSWindow {

    init() {
        super.init(
            contentRect: .zero,
            styleMask: [.resizable, .closable, .titled],
            backing: .buffered,
            defer: true
        )
        
        isReleasedWhenClosed = false
        
        delegate = self
        
        NotificationCenter.default.addLocaleObserver(self)
    }
    
}

// MARK: - NSWindowDelegate
extension GuideWindow: NSWindowDelegate {
    
    func windowDidChangeOcclusionState(_ notification: Notification) {
        
        updateLocalizedStrings()
        
        var psn = ProcessSerialNumber(highLongOfPSN: 0, lowLongOfPSN: UInt32(kCurrentProcess))
        TransformProcessType(
            &psn,
            ProcessApplicationTransformState(
                NSApplication.shared.windows.contains(where: {$0 is GuideWindow && $0.isVisible})
                ? kProcessTransformToForegroundApplication
                : kProcessTransformToUIElementApplication
            )
        )
    }
    
}
