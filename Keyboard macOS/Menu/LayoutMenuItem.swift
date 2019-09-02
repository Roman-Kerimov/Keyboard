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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), publisher: Keyboard.self)
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func menuItemAction() {
        Keyboard.default.layout = layout
    }
    
    @objc func updateState() {
        self.state = self.layout.name == Keyboard.default.layout.name ? .on : .off
    }
}
