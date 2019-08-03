//
//  GuideWindow.swift
//  Keyboard macOS
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
        
        var psn: ProcessSerialNumber = .init(highLongOfPSN: 0, lowLongOfPSN: .init(kCurrentProcess))
        TransformProcessType(&psn, .init(NSApplication.shared.windows.contains(where: {$0 is GuideWindow && $0.isVisible}) ? kProcessTransformToForegroundApplication : kProcessTransformToUIElementApplication))
    }
    
}
