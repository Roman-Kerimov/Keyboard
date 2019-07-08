//
//  FloatingWindow.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-10-20.
//

import AppKit

class FloatingWindow: NSWindow {
    
    init() {
        super.init(
            contentRect: .zero,
            styleMask: [.titled, .fullSizeContentView],
            backing: .buffered,
            defer: true
        )
        
        level = .floating
        collectionBehavior = .canJoinAllSpaces
        allowsToolTipsWhenApplicationIsInactive = true
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        isMovable = false
        
        makeKeyAndOrderFront(self)
    }
    
    override var canBecomeKey: Bool {
        return false
    }
}
