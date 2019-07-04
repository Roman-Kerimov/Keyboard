//
//  CharacterSequenceWindow.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-10-21.
//

import SwiftUI
import Combine

class CharacterSequenceWindow: FloatingWindow {
    
    init() {
        super.init(contentView: NSHostingView.init(rootView: CharacterSequenceView().environmentObject(Keyboard.default.characterSequence)))
        
        setFrame(.init(origin: .zero, size: .init(width: 1, height: .characterSequenceDefaultHeight)), display: true)
    }
    
    func updateFrame(width: Length = 1) {
        let boundingFrame = (NSScreen.main?.visibleFrame ?? .zero).insetBy(dx:  AppDelegate.characterSearchWindow.frame.width + 20, dy: 0)
        
        setFrame(
            .init(
                x: boundingFrame.minX,
                y: boundingFrame.minY,
                width: min(width + 1, boundingFrame.width),
                height: frame.height
            ),
            display: true
        )
    }
}
