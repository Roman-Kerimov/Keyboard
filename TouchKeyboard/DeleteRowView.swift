//
//  DeleteRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-22.
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
    
    override func configure(size: CGSize, keySpacing: CGFloat, labelFontSize: CGFloat) {
        super.configure(size: size, keySpacing: keySpacing, labelFontSize: labelFontSize)
        
        deleteKey.configure(size: .init(width: size.width / 5, height: size.height), spacing: keySpacing, labelFontSize: labelFontSize)
        deleteKey.frame.origin.x = size.width - deleteKey.frame.width
        
        characterSequence.contentInset = .init(top: 0, left: 0, bottom: 0, right: deleteKey.frame.width)
        characterSequence.frame.size = .init(width: frame.width, height: size.height)
    }
}