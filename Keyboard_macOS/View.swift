//
//  View.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-08-02.
//

import SwiftUI

extension View {
        
    func navigationBarTitle(_ title: Text, displayMode: NavigationBarItem.TitleDisplayMode) -> some View {
        return self
    }
    
    func navigationBarTitle<S>(_ title: S) -> some View where S : StringProtocol {
        return self
    }
}
