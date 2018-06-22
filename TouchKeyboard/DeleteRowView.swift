//
//  DeleteRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-22.
//
//

import UIKit

class DeleteRowView: UIView {
    
    let deleteKey = KeyView(key: .delete)
    internal let characterSequence: CharacterSequenceView = .init()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(characterSequence)
        addSubview(deleteKey)
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        deleteKey.frame = .init(origin: .init(x: frame.width - deleteKey.frame.width, y: 0), size: .init(width: frame.width / 5, height: frame.height))
        
        characterSequence.contentInset = .init(top: 0, left: 0, bottom: 0, right: deleteKey.frame.width)
        characterSequence.frame.size = .init(width: frame.width, height: frame.height)
    }
}
