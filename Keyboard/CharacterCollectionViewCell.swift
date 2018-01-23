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
    
    let unicodeName: LabelView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        
        addSubview(unicodeName)
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var maxUnicodeNameViewWidth: CGFloat {
        return UIScreen.main.bounds.width - frame.width
    }
    
    func configure() {
        title.frame.size = frame.size
        unicodeName.frame.origin.x = frame.width
        unicodeName.frame.origin.y = (frame.height - unicodeName.frame.height) / 2
        
        if unicodeName.frame.size.width > maxUnicodeNameViewWidth {
            unicodeName.frame.size.width = maxUnicodeNameViewWidth
        }
    }
}
