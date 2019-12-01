//
//  ActivityView.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-12-02.
//

import SwiftUI

struct ActivityView: NSViewRepresentable {
    func makeNSView(context: NSViewRepresentableContext<ActivityView>) -> NSProgressIndicator {
        
        let progressIndicator = NSProgressIndicator()
        
        progressIndicator.style = .spinning
        progressIndicator.controlSize = .small
        progressIndicator.startAnimation(self)
        
        return progressIndicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<ActivityView>) {}
}
