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
    
    let unicodeName: LabelUIView = .init()
    
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
    
    override func layoutSubviews() {
        title.frame.size = frame.size
        unicodeName.frame.origin = .init(x: frame.maxX, y: (frame.height - unicodeName.frame.height)/2)
        
        let unicodeNameMaxWidth = UIScreen.main.bounds.maxX - frame.maxX
        
        if unicodeName.intrinsicContentSize.width > unicodeNameMaxWidth {
            unicodeName.frame.size.width = unicodeNameMaxWidth
        }
    }
    
    private var maxUnicodeNameViewWidth: CGFloat {
        return UIScreen.main.bounds.width - frame.width
    }
}
