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
        clipsToBounds = false
        
        #if TARGET_INTERFACE_BUILDER
            characters = .init("⌨🎹😀😇ǶÆ")
            
            isHiddenUnicodeNames = false
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        
        let characterFontSize = 0.7 * layout.itemSize.width
        cell.title.font = .systemFont(ofSize: characterFontSize)
        
        cell.unicodeName.text = characters[indexPath.item].unicodeName
        
        let REGIONAL_INDICATOR_LETTER_ = "REGIONAL INDICATOR SYMBOL LETTER "
        
        if cell.unicodeName.text!.contains(REGIONAL_INDICATOR_LETTER_)
            && cell.unicodeName.text!.contains(unicodeNameSeparator) {
            
            let regionCode = cell.unicodeName.text!
                .replacingOccurrences(of: unicodeNameSeparator + REGIONAL_INDICATOR_LETTER_, with: "")
                .replacingOccurrences(of: REGIONAL_INDICATOR_LETTER_, with: "")
            
            let unicodeLabelSeparator = " | "
            
            cell.unicodeName.text! = regionCode
            
            if let regionName = Locale.init(identifier: "en").localizedString(forRegionCode: regionCode)?.uppercased() {
                cell.unicodeName.text! += unicodeLabelSeparator + regionName
            }
        }
        
        cell.unicodeName.textColor = colorScheme.unicodeNameTextColor
        cell.unicodeName.backgroundColor = colorScheme.unicodeNameBackgroundColor
        cell.unicodeName.font = .boldSystemFont(ofSize: characterFontSize/2)
        
        cell.unicodeName.frame.size.width += cell.unicodeName.font.pointSize/2
        
        cell.unicodeName.isHidden = isHiddenUnicodeNames
        
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for _ in textForSearch {
            KeyboardViewController.shared.keyAction(label: Key.delete.label)
        }
        
        let character = characters[indexPath.item]
        
        
        var frequentlyUsedCharacters = KeyboardSettings.shared.frequentlyUsedCharacters
        
        if let index = frequentlyUsedCharacters.index(of: character) {
            frequentlyUsedCharacters.remove(at: index)
        }
        
        frequentlyUsedCharacters = [character] + frequentlyUsedCharacters
        
        KeyboardSettings.shared.frequentlyUsedCharacters = .init( frequentlyUsedCharacters.suffix(100) )
        
        
        KeyboardViewController.shared.keyAction(label: character.description)
        KeyboardViewController.shared.updateDocumentContext()
    }
    
    private var textForSearch: String = .init()
    
    public func search(byName text: String) {
        textForSearch = text
        
        UnicodeTable.default.searchScalars(byName: text.replacingOccurrences(of: String.reverseSolidus, with: ""), for: self)
    }
    
    override func reloadData() {
        super.reloadData()
        
        if numberOfItems(inSection: 0) > 0 {
            self.scrollToItem(at: .init(row: 0, section: 0), at: .top, animated: false)
        }
    }
    
    public var isHiddenUnicodeNames: Bool = true {
        didSet {
            for cell in visibleCells as! [CharacterCollectionViewCell] {
                cell.unicodeName.isHidden = isHiddenUnicodeNames
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isHiddenUnicodeNames = false
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isHiddenUnicodeNames = false
    }
}
