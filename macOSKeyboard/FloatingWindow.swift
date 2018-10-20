//
//  FloatingWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-10-20.
//

import UIKit

class FloatingWindow: NSWindow {
    
    init(contentView: UIView) {
        super.init(
            contentRect: contentView.frame,
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
        
        self.contentView = contentView
        
        makeKeyAndOrderFront(self)
    }
    
    override var canBecomeKey: Bool {
        return false
    }
}
