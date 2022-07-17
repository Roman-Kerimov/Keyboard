//
//  ViewOffsetKey.swift
//  
//
//  Created by Roman Kerimov on 2022-07-17.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
