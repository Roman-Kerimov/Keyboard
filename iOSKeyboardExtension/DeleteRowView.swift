//
//  DeleteRowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 22.02.17.
//
//

import UIKit

class DeleteRowView: RowView {

    internal override var size: CGSize {
        didSet {
            super.size = size
            
            deleteKey.width = size.width / 5
        }
    }
    
    let deleteKey = KeyView(key: .delete)
    
    internal override init() {
        super.init()
        
        addArrangedSubview(UIView())
        addArrangedSubview(deleteKey)
    }
    
    internal required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
