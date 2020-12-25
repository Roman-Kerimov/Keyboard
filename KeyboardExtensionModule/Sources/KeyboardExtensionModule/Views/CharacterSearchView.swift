//
//  CharacterSearchView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-21.
//

import SwiftUI

struct CharacterSearchView: UIViewRepresentable {
    func makeUIView(context: Context) -> CharacterSearchUIView {
        CharacterSearchUIView()
    }
    
    func updateUIView(_ characterSearchUIView: CharacterSearchUIView, context: Context) {
        let controller = KeyboardViewController.shared
        characterSearchUIView.size = CGSize(width: controller.horizontalIndent, height: controller.layoutHeight)
    }
}
