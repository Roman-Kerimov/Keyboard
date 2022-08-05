//
//  CharacterCollectionUIViewCell.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-04-12.
//
//

import UIKit

class CharacterCollectionUIViewCell: UICollectionViewCell {
    
    let title: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        title.frame.size = frame.size
    }
}
