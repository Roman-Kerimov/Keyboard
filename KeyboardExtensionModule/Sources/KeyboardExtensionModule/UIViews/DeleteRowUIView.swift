//
//  DeleteRowUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-22.
//
//

import UIKit

class DeleteRowUIView: UIView {
    
    let deleteKey = KeyUIView(key: .delete)
    internal let characterSequence = CharacterSequenceUIView()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(deleteKey)
        addSubview(characterSequence)
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let keyboardViewController = KeyboardUIViewController.shared
        
        deleteKey.frame = .init(
            x: keyboardViewController.characterSequenceWidth,
            y: 0,
            width: keyboardViewController.deleteKeyWidth,
            height: frame.height
        )
        
        characterSequence.frame.size = .init(
            width: keyboardViewController.characterSequenceWidth,
            height: frame.height
        )
    }
}
