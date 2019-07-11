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
        
        addSubview(unicodeName)
        
        backgroundColor = .touchableClear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    #if os(macOS)
    override func layout() {crossLayout()}
    #else
    override func layoutSubviews() {crossLayout()}
    #endif
    func crossLayout() {
        title.frame.size = frame.size
        unicodeName.frame.origin = .init(x: frame.maxX, y: (frame.height - unicodeName.frame.height)/2)
    }
    
    private var maxUnicodeNameViewWidth: CGFloat {
        return UIScreen.main.bounds.width - frame.width
    }
}
