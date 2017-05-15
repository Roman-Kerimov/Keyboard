//
//  UnicodeCollectionView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 15.05.17.
//
//

import UIKit

class UnicodeCollectionView: CharacterCollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    internal var width: CGFloat = 0 {
        didSet {
            widthConstraint.constant = width
            widthConstraint.isActive = true
            
            layout.itemSize = .init(width: width, height: width)
            reloadData()
        }
    }
    
    private var widthConstraint: NSLayoutConstraint!
    
    internal override init() {
        super.init()
        
        widthConstraint = widthAnchor.constraint(equalToConstant: 0)
        
        layout.minimumLineSpacing = 0
        
//        #if TARGET_INTERFACE_BUILDER
            characters = .init("⌨🎹😀😇ǶÆ".characters)
//        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        
        cell.title.font = UIFont.systemFont(ofSize: 0.7 * layout.itemSize.width)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        KeyboardViewController.shared.keyAction(label: characters[indexPath.item].string)
        KeyboardViewController.shared.updateDocumentContext()
    }
}
