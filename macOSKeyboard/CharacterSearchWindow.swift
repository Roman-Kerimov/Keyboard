//
//  CharacterSearchWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-05-13.
//

import UIKit

class CharacterSearchWindow: NSWindow {
    init() {
        super.init(
            contentRect: .init(origin: .zero, size: .init(width: 30, height: 250)),
            styleMask: [.titled, .fullSizeContentView],
            backing: .buffered,
            defer: true
        )
        
        level = .floating
        collectionBehavior = .canJoinAllSpaces
        allowsToolTipsWhenApplicationIsInactive = true
        titlebarAppearsTransparent = true
        isMovable = false
        
        let characterSearchView = CharacterSearchView.init()
        characterSearchView.size = frame.size
        contentView = characterSearchView
        
        makeKeyAndOrderFront(self)
    }
    
    override var canBecomeKey: Bool {
        return false
    }
}
