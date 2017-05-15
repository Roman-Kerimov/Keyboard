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
    
    internal let layout: UICollectionViewFlowLayout = .init()
    let characterCellReuseIdentifier = "fWz2pPGnOBKbeARRwDdJswgBqDYSA6P"
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: characterCellReuseIdentifier)
        backgroundColor = .clear
        
        translatesAutoresizingMaskIntoConstraints = false
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        #if TARGET_INTERFACE_BUILDER
            characters = .init("CharacterCollectionView".characters)
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
        
        cell.title.text = String.init(characters[indexPath.row])
        cell.title.textColor = colorScheme.labelColor
        
        return cell
    }
}
