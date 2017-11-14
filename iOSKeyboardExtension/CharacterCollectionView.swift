//
//  CharacterCollectionView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 15.05.17.
//
//

import UIKit

class CharacterCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var characters: [Character] = .init() {
        didSet {
            reloadData()
        }
    }
    
    var colorScheme: KeyboardColorScheme = .default {
        didSet {
            reloadData()
        }
    }
    
    internal let layout: CollectionViewFlowLayout = .init()
    let characterCellReuseIdentifier = "fWz2pPGnOBKbeARRwDdJswgBqDYSA6P"
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: characterCellReuseIdentifier)
        backgroundColor = .clear
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        alwaysBounceVertical = true
        backgroundColor = .touchableClear
        
        #if TARGET_INTERFACE_BUILDER
            characters = .init("CharacterCollectionView")
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        var character = characters[indexPath.row]
        
        if character.unicodeScalars.count == 1
            && character.description.applyingTransform(.toUnicodeName, reverse: false)?.contains("COMBINING") == true {
            
            character = .init("◌" + character.description)
        }
        
        cell.title.text = character.description
        cell.title.textColor = colorScheme.labelColor
        
        return cell
    }
}
