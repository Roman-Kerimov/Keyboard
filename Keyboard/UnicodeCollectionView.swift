//
//  UnicodeCollectionView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-05-15.
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
        
        let progressView: UIProgressView = .init()
        backgroundView = progressView
        progressView.isHidden = true
        
        NotificationCenter.default.addObserver(forName: .UnicodeDataFilesLoadingProgressDidChange, object: nil, queue: nil) { (notification) in
            DispatchQueue.main.async {
                let progress = notification.object as! Float
                progressView.isHidden = progress == 1
                progressView.setProgress(progress, animated: true)
            }
        }
        
        layout.minimumLineSpacing = 0
        clipsToBounds = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(search), name: .UnicodeDataFilesDidLoad, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(search), name: .DocumentContextDidChange, object: nil)
        
        if Bundle.main.isInterfaceBuilder {
            characters = .init("⌨🎹😀😇ǶÆ")
            
            isHiddenUnicodeNames = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        
        let characterFontSize = 0.7 * layout.itemSize.width
        cell.title.font = .systemFont(ofSize: characterFontSize)
        
        cell.unicodeName.text = characters[indexPath.item].unicodeName
        
        if cell.title.text?.first?.belongsTo(.regionalIndicatorSymbols) == true
            && cell.title.text?.unicodeScalars.count == 2 {
            
            let regionCode = cell.title.text!.unicodeScalars.map {Unicode.Scalar.init($0.value - 0x1F1A5)!.description} .joined()
            
            let unicodeLabelSeparator = " | "
            
            cell.unicodeName.text = regionCode + unicodeLabelSeparator + cell.unicodeName.text!
        }
        
        cell.unicodeName.textColor = colorScheme.unicodeNameTextColor
        cell.unicodeName.backgroundColor = colorScheme.unicodeNameBackgroundColor
        cell.unicodeName.font = .boldSystemFont(ofSize: characterFontSize/2)
        
        cell.unicodeName.frame.size.width += cell.unicodeName.font.pointSize/2
        
        cell.unicodeName.isHidden = isHiddenUnicodeNames
        
        #if os(macOS)
        cell.toolTip = cell.unicodeName.text
        #endif
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deselectItem(at: indexPath, animated: false)
        
        for _ in textForSearch {
            Keyboard.default.delegate?.delete()
        }
        
        let character = characters[indexPath.item]
        
        
        var frequentlyUsedCharacters = Keyboard.default.frequentlyUsedCharacters
        
        if let index = frequentlyUsedCharacters.index(of: character) {
            frequentlyUsedCharacters.remove(at: index)
        }
        
        frequentlyUsedCharacters = [character] + frequentlyUsedCharacters
        
        Keyboard.default.frequentlyUsedCharacters = .init( frequentlyUsedCharacters.suffix(100) )
        
        Keyboard.default.delegate?.insert(text: character.description)
        NotificationCenter.default.post(.init(name: .DocumentContextDidChange))
    }
    
    private var textForSearch: String = .init()
    
    @objc private func search() {
        
        guard let documentContextBeforeInput = Keyboard.default.delegate?.documentContext.beforeInput else {
            return
        }
        
        var textForSearch =
            documentContextBeforeInput
                .components(separatedBy: .whitespacesAndNewlines).last?
                .components(separatedBy: CharacterSet.printableASCII.inverted).last ?? .init()
        
        if textForSearch.contains(.reverseSolidus) {
            textForSearch = .reverseSolidus + ( textForSearch.components(separatedBy: String.reverseSolidus).last ?? .init() )
        }
        
        self.textForSearch = textForSearch
        
        UnicodeTable.default.searchScalars(byName: textForSearch.replacingOccurrences(of: String.reverseSolidus, with: ""), for: self)
    }
    
    @objc override func reloadData() {
        super.reloadData()
        
        if numberOfItems(inSection: 0) > 0 {
            self.scrollToItem(at: .init(item: 0, section: 0), at: .top, animated: false)
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
