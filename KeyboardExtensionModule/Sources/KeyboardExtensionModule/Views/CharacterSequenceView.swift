//
//  CharacterSequenceView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-20.
//

import SwiftUI

@available(iOS 13.0, *)
struct CharacterSequenceView: UIViewRepresentable {
    func makeUIView(context: Context) -> CharacterSequenceUIView {
        CharacterSequenceUIView()
    }
    
    func updateUIView(_ characterSequenceUIView: CharacterSequenceUIView, context: Context) {
        characterSequenceUIView.layout.itemSize = KeyboardViewController.shared.characterSequenceItemSize
        characterSequenceUIView.reloadData()
    }
}
