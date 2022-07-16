//
//  CharacterSearchUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-05-15.
//
//

import UIKit
import Combine
import KeyboardModule
import UnicodeData

class CharacterSearchUIView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var unicodeItems: [UnicodeItem] = .init() {
        didSet {
            reloadData()
            
            let maxPrefixLength = 10
            
            guard oldValue.prefix(maxPrefixLength) != unicodeItems.prefix(maxPrefixLength) else {
                return
            }
            
            if numberOfItems(inSection: 0) > 0 {
                self.scrollToItem(at: .init(item: 0, section: 0), at: .top, animated: false)
            }
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
    
    let activityIndicatorView = UIActivityIndicatorView()
    
    private var anyCancellables: [AnyCancellable] = []
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionUIViewCell.self, forCellWithReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier)
        register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: UICollectionReusableView.description())
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        alwaysBounceVertical = true
        backgroundColor = .touchableClear
        
        clipsToBounds = false
        
        layout.minimumLineSpacing = 0
        
        Keyboard.default.characterSearch.$foundUnicodeItems
            .assign(to: \.unicodeItems, on: self)
            .store(in: &anyCancellables)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideUnicodeNames), name: .KeyboardStateDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unicodeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionUIViewCell
        
        cell.title.text = unicodeItems[indexPath.item].codePoints.previewDescription
        cell.title.textColor = .label
        
        let characterFontSize = layout.itemSize.width * .characterSearchViewFontSizeFactor
        cell.title.font = .systemFont(ofSize: characterFontSize)
        
        cell.unicodeName.text = unicodeItems[indexPath.item].localizedName
        
        cell.unicodeName.textColor = .label
        cell.unicodeName.backgroundColor = .unemphasizedSelectedTextBackground
        cell.unicodeName.font = .boldSystemFont(ofSize: characterFontSize/2)
        
        cell.unicodeName.frame.size.width += cell.unicodeName.font.pointSize/2
        
        cell.unicodeName.isHidden = isHiddenUnicodeNames
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UICollectionReusableView.description(), for: indexPath)
        
        if activityIndicatorView.superview == nil {
            view.addSubview(activityIndicatorView)
            activityIndicatorView.frame.size = layout.itemSize
            activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            activityIndicatorView.startAnimating()
        }
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return Keyboard.default.characterSearch.isSearching ? layout.itemSize : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deselectItem(at: indexPath, animated: false)
        
        Keyboard.default.characterSearch.insert(item: indexPath.item)
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
