//
//  LayoutMenuItem.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-12.
//

import Foundation
import Combine
import KeyboardModule

class LayoutMenuItem: LocalizedMenuItem {
    
    let layout: KeyboardLayout
    
    private var anyCancellables: [AnyCancellable] = []
    
    init(layout: KeyboardLayout) {
        self.layout = layout
        super.init()
        
        title = layout.name
        
        Keyboard.default.$layout
            .map { [weak self] layout in
                self?.layout == layout ? .on : .off
            }
            .assign(to: \.state, on: self)
            .store(in: &anyCancellables)
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func menuItemAction() {
        Keyboard.default.layout = layout
    }
}
