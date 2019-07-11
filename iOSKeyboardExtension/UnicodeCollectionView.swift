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

    internal var size: CGSize = .zero {
        didSet {
            frame.size = size
            
            layout.itemSize = .init(width: size.width, height: size.width)
            reloadData()
        }
    }
    
    internal override init() {
        super.init()
        
        layout.minimumLineSpacing = 0
        
        #if TARGET_INTERFACE_BUILDER
            characters = "⌨🎹😀😇ǶÆ".characters.map {$0.description}
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        cell.configure()
        
        cell.title.font = UIFont.systemFont(ofSize: 0.7 * layout.itemSize.width)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for _ in textForSearch.characters {
            KeyboardViewController.shared.keyAction(label: SpecialKey.delete.label)
        }
        
        let character = characters[indexPath.item]
        
        
        var frequentlyUsedCharacters = KeyboardSettings.shared.frequentlyUsedCharacters
        
        if let index = frequentlyUsedCharacters.index(of: character) {
            frequentlyUsedCharacters.remove(at: index)
        }
        
        frequentlyUsedCharacters = [character] + frequentlyUsedCharacters
        
        KeyboardSettings.shared.frequentlyUsedCharacters = .init( frequentlyUsedCharacters.suffix(100) )
        
        
        KeyboardViewController.shared.keyAction(label: character)
        KeyboardViewController.shared.updateDocumentContext()
    }
    
    private var textForSearch: String = .init()
    
    public func search(byName text: String) {
        textForSearch = text
        
        UnicodeTable.default.searchScalars(byName: text.replacingOccurrences(of: .reverseSolidus, with: ""), for: self)
    }
}
