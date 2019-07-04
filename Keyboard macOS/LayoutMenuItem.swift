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
        
        updateItemState()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateItemState), name: .LayoutDidChange, object: nil)
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func menuItemAction() {
        Keyboard.default.layout = layout
    }
    
    @objc func updateItemState() {
        state = layout.name == Keyboard.default.layout.name ? .on : .off
    }
}
