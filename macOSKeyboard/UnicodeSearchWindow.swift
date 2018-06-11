//
//  UnicodeSearchWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-05-13.
//

import UIKit

class UnicodeSearchWindow: NSWindow {
    init() {
        super.init(
            contentRect: .init(origin: .zero, size: .init(width: 30, height: 250)),
            styleMask: .titled,
            backing: .buffered,
            defer: true
        )
        
        level = .floating
        collectionBehavior = .canJoinAllSpaces
        allowsToolTipsWhenApplicationIsInactive = true
        
        let unicodeCollectionView = UnicodeCollectionView.init()
        unicodeCollectionView.size = frame.size
        contentView = unicodeCollectionView
        
        makeKeyAndOrderFront(self)
    }
}
