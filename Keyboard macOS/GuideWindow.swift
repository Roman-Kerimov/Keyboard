//
//  GuideWindow.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-01-05.
//

import AppKit

class GuideWindow: NSWindow, NSWindowDelegate {

    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        
        delegate = self
    }
    
    func windowDidChangeOcclusionState(_ notification: Notification) {
        var psn: ProcessSerialNumber = .init(highLongOfPSN: 0, lowLongOfPSN: .init(kCurrentProcess))
        TransformProcessType(&psn, .init(NSApplication.shared.windows.contains(where: {$0 is GuideWindow && $0.isVisible}) ? kProcessTransformToForegroundApplication : kProcessTransformToUIElementApplication))
    }
}
