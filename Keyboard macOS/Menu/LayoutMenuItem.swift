//
//  LayoutMenuItem.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import Foundation

class LayoutMenuItem: LocalizedMenuItem {
    
    let layout: KeyboardLayout

    init(layout: KeyboardLayout) {
        self.layout = layout
        super.init()
        
        title = layout.name
        
        _ = Keyboard.default.objectWillChange.sink { (keyboard) in
            self.state = self.layout.name == keyboard.layout.name ? .on : .off
        }
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func menuItemAction() {
        Keyboard.default.layout = layout
    }
}
