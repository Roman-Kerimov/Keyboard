//
//  ToolTipView.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2020-04-06.
//

import SwiftUI

public extension View {
    func toolTip(_ content: String) -> some View {
        self.overlay(ToolTipView(content: content))
    }
}

private struct ToolTipView: NSViewRepresentable {
    let content: String
    
    func makeNSView(context: NSViewRepresentableContext<ToolTipView>) -> NSView {
        NSView()
    }

    func updateNSView(_ nsView: NSView, context: NSViewRepresentableContext<ToolTipView>) {
        nsView.toolTip = content
    }
}
