//
//  CharacterSearchUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-05-15.
//
//

import UIKit

class CharacterSearchUIView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var characters: [Character] = .init() {
        didSet {
            reloadData()
        }
    }
    
    let layout: CollectionViewFlowLayout = .init()

    internal var size: CGSize = .zero {
        didSet {
            frame.size = size
            
            layout.itemSize = .init(width: size.width, height: size.width)
            reloadData()
        }
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionUIViewCell.self, forCellWithReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        alwaysBounceVertical = true
        backgroundColor = .touchableClear
        
        clipsToBounds = false
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacters), publisher: CharacterSearch.self)
        NotificationCenter.default.addObserver(self, selector: #selector(hideUnicodeNames), name: .KeyboardStateDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCharacters() {
        characters = Keyboard.default.characterSearch.foundCharacters
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionUIViewCell
        
        cell.title.text = characters[indexPath.item].previewDescription
        cell.title.textColor = .labelColor
        
        let characterFontSize = layout.itemSize.width * .characterSearchViewFontSizeFactor
        cell.title.font = .systemFont(ofSize: characterFontSize)
        
        cell.unicodeName.text = characters[indexPath.item].unicodeName
        
        if cell.title.text?.first?.belongsTo(.regionalIndicatorSymbols) == true
            && cell.title.text?.unicodeScalars.count == 2 {
            
            let regionCode = cell.title.text!.unicodeScalars.map {Unicode.Scalar.init($0.value - 0x1F1A5)!.description} .joined()
            
            let unicodeLabelSeparator = " | "
            
            cell.unicodeName.text = regionCode + unicodeLabelSeparator + cell.unicodeName.text!
        }
        
        cell.unicodeName.textColor = .unemphasizedSelectedTextColor
        cell.unicodeName.backgroundColor = .unemphasizedSelectedTextBackgroundColor
        cell.unicodeName.font = .boldSystemFont(ofSize: characterFontSize/2)
        
        cell.unicodeName.frame.size.width += cell.unicodeName.font.pointSize/2
        
        cell.unicodeName.isHidden = isHiddenUnicodeNames
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deselectItem(at: indexPath, animated: false)
        
        Keyboard.default.characterSearch.insert(item: indexPath.item)
    }
    
    @objc override func reloadData() {
        super.reloadData()
        
        if numberOfItems(inSection: 0) > 0 {
            self.scrollToItem(at: .init(item: 0, section: 0), at: .top, animated: false)
        }
    }
    
    private var isHiddenUnicodeNames: Bool = true {
        didSet {
            for cell in visibleCells as! [CharacterCollectionUIViewCell] {
                cell.unicodeName.isHidden = isHiddenUnicodeNames
            }
        }
    }
    
    @objc private func hideUnicodeNames() {
        isHiddenUnicodeNames = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isHiddenUnicodeNames = false
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isHiddenUnicodeNames = false
    }
}
