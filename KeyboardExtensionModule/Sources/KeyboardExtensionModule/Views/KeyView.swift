//
//  KeyView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-20.
//

import SwiftUI
import KeyboardModule

@available(iOS 13.0, *)
struct KeyView: UIViewRepresentable {
    let key: Key
    
    func makeUIView(context: Context) -> KeyUIView {
        KeyUIView(key: key)
    }
    
    func updateUIView(_ uiView: KeyUIView, context: Context) {
        
    }
}
