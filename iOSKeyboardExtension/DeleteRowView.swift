//
//  DeleteRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 22.02.17.
//
//

import UIKit

class DeleteRowView: RowView {
    
    let deleteKey = KeyView(key: .delete)
    internal let characterSequence: CharacterSequenceView = .init()
    
    internal override init() {
        super.init()
        
        addSubview(characterSequence)
        addSubview(deleteKey)
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(size: CGSize) {
        super.configure(size: size)
        
        deleteKey.frame.size = .init(width: size.width / 5, height: size.height)
        deleteKey.frame.origin.x = size.width - deleteKey.frame.width
        
        characterSequence.frame.size = .init(width: deleteKey.frame.origin.x, height: size.height)
    }
}
