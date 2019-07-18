//
//  KeyboardWindow.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-09.
//

import SwiftUI

final class KeyboardWindow: FloatingWindow {
    override init() {
        super.init()
        
        contentView = NSHostingView.init(rootView: KeyboardView().environmentObject(Keyboard.default))
        center()
        setFrameOrigin(.init(x: frame.origin.x, y: NSScreen.main?.visibleFrame.origin.y ?? 0))
    }
}