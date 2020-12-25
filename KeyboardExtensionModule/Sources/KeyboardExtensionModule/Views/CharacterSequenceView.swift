//
//  CharacterSequenceView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-20.
//

import SwiftUI

struct CharacterSequenceView: UIViewRepresentable {
    func makeUIView(context: Context) -> CharacterSequenceUIView {
        CharacterSequenceUIView()
    }
    
    func updateUIView(_ characterSequenceUIView: CharacterSequenceUIView, context: Context) {
        characterSequenceUIView.layout.itemSize = KeyboardUIViewController.shared.characterSequenceItemSize
        characterSequenceUIView.reloadData()
    }
}
