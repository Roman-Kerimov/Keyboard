//
//  CharacterCollectionViewCell.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-04-12.
//
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    let title: UILabel = .init()
    
    let unicodeName: LabelView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(unicodeName)
        
        unicodeName.translatesAutoresizingMaskIntoConstraints = false
        unicodeName.leftAnchor.constraint(equalTo: rightAnchor).isActive = true
        unicodeName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var maxUnicodeNameViewWidth: CGFloat {
        return UIScreen.main.bounds.width - frame.width
    }
}
