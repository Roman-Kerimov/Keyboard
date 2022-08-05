//
//  UIButtonView.swift
//  
//
//  Created by Roman Kerimov on 2022-07-16.
//

import SwiftUI

struct UIButtonView: UIViewRepresentable {
    let target: Any
    let action: Selector
    let controlEvents: UIControl.Event
    
    func makeUIView(context: Context) -> some UIView {
        let button = UIButton()
        button.addTarget(target, action: action, for: controlEvents)
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
