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
        
        addArrangedSubview(characterSequence)
        
        addArrangedSubview(deleteKey)
        deleteKey.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
