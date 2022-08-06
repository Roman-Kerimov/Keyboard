//
//  CharacterSequenceWindow.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-10-21.
//

import SwiftUI
import Combine
import KeyboardModule

final class CharacterSequenceWindow: FloatingWindow {
    
    private var anyCancellables: [AnyCancellable] = []
    
    override init() {
        super.init()
        
        contentView = NSHostingView(
            rootView: CharacterSequenceView(characterSequence: Keyboard.default.characterSequence)
        )
        
        setContentSize(.init(width: 1, height: .characterSequenceDefaultHeight))
        
        Keyboard.default.characterSequence.$contentWidth
            .sink(receiveValue: updateFrame(width:))
            .store(in: &anyCancellables)
    }
    
    func updateFrame(width: Double = 1) {
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
