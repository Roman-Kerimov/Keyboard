//
//  CharacterSequenceWindow.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-10-21.
//

class CharacterSequenceWindow: FloatingWindow {
    
    init() {
        let characterSequenceView = CharacterSequenceUIView.init(deleteButton: nil)
        characterSequenceView.frame.origin = .zero
        characterSequenceView.frame.size = .init(width: 1, height: 40)
        
        characterSequenceView.layout.itemSize = .init(
            width: 12,
            height: characterSequenceView.frame.height
        )
        
        super.init(contentView: characterSequenceView)
    }
}
