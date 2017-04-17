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
        
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
