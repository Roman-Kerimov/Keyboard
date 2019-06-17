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
    internal let characterSequence: CharacterSequenceUIView
    
    init() {
        
        characterSequence = .init(deleteButton: deleteKey)
        
        super.init(frame: .zero)
        
        addSubview(deleteKey)
        addSubview(characterSequence)
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let deleteKeyWidth = frame.width / 5
        deleteKey.frame = .init(origin: .init(x: frame.width - deleteKeyWidth, y: 0), size: .init(width: deleteKeyWidth, height: frame.height))
        
        characterSequence.frame.size = .init(width: frame.width - deleteKeyWidth, height: frame.height)
    }
}
