//
//  CharacterCollectionViewCell.swift
//  Keyboard
//
//  Created by Roman Kerimov on 12.04.17.
//
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    let title: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.alignBounds()
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
