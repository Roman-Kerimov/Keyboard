//
//  CharacterSequenceView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 12.04.17.
//
//

import UIKit

class CharacterSequenceView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

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

        layout.sectionInset = .zero
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: characterCellReuseIdentifier)
        backgroundColor = .clear
        
        print()
        
        let longPressGestureRecognizer: UILongPressGestureRecognizer = .init(target: self, action: #selector(handleLongPressGesture(from:)))
        addGestureRecognizer(longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0
        
        #if TARGET_INTERFACE_BUILDER
            characters = .init("keyboard".characters)
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleLongPressGesture(from gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = indexPathForItem(at: gesture.location(in: self)) else {
                break
            }
            beginInteractiveMovementForItem(at: selectedIndexPath)
            
        case .changed:
            let touchPosition = gesture.location(in: gesture.view!)
            let targetPosition: CGPoint = .init(x: touchPosition.x, y: center.y)
            
            updateInteractiveMovementTargetPosition(targetPosition)
            
        case .ended:
            endInteractiveMovement()
            
        default:
            cancelInteractiveMovement()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.title.text = String.init(characters[indexPath.row])
        cell.title.textColor = colorScheme.labelColor
        cell.title.font = UIFont(name: "Courier New", size: 1.4 * layout.itemSize.width)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        KeyboardViewController.shared.keyAction(label: SpecialKey.delete.label, offcet: sourceIndexPath.item - characters.count + 1)
        KeyboardViewController.shared.keyAction(label: String(characters[sourceIndexPath.item]), offcet: destinationIndexPath.item - characters.count + 1)
        
        KeyboardViewController.shared.updateDocumentContext()
    }
    
    

}
