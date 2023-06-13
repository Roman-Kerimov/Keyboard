//
//  KeyboardWindow.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-07-09.
//

import SwiftUI
import KeyboardModule

final class KeyboardWindow: FloatingWindow {
    override init() {
        super.init()
        
        contentView = NSHostingView(rootView: KeyboardView(keyboard: .default))
        center()
        setFrameOrigin(CGPoint(x: frame.origin.x, y: NSScreen.main?.visibleFrame.origin.y ?? 0))
    }
}
