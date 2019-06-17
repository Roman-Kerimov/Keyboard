//
//  CharacterCollectionUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-05-15.
//
//

import UIKit

class CharacterCollectionUIView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

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
    
    internal let layout: CollectionViewFlowLayout = .init()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionUIViewCell.self, forCellWithReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier)
        backgroundColor = .clear
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        alwaysBounceVertical = true
        backgroundColor = .touchableClear
        
        clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionUIViewCell
        
        var character = characters[indexPath.item]
        
        if character.unicodeScalars.count == 1
            && character.unicodeName.contains("COMBINING") == true {
            
            character = .init("◌" + character.description)
        }
        
        cell.title.text = character.description
        cell.title.textColor = .labelColor
        
        return cell
    }
}
