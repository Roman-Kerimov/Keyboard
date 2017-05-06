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
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    let characterCellReuseIdentifier = "fWz2pPGnOBKbeARRwDdJswgBqDYSA6P"
    
    init() {

        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: layout.itemSize.width)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: characterCellReuseIdentifier)
        backgroundColor = .clear
        
        longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongPressGesture(from:)))
        addGestureRecognizer(longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0
        
        #if TARGET_INTERFACE_BUILDER
            characters = .init("keyboard".characters)
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func reloadData() {
        super.reloadData()
        
        OperationQueue.main.addOperation {
            if self.contentSize.width > self.frame.size.width {
                self.scrollToItem(at: IndexPath.init(row: self.characters.count - 1, section: 0), at: .right, animated: true)
            }
        }
    }
    
    private var activeIndexPath: IndexPath? {
        willSet {
            if let newValue = newValue {
                activeCell = cellForItem(at: newValue) as! CharacterCollectionViewCell
            }
        }
    }
    
    private var activeCell: CharacterCollectionViewCell!
    
    private enum CharacterSequenceActionStage {
        case interactiveMovement, uppercase, lowercase
    }
    
    private var actionStage: CharacterSequenceActionStage = .interactiveMovement {
        didSet {
            guard let activeIndexPath = activeIndexPath else {
                return
            }
            
            let isChangeStage = actionStage != oldValue
            let isInteractiveMovement = actionStage == .interactiveMovement
            let isUppercase = actionStage == .uppercase
            let isLowercase = actionStage == .lowercase
            
            if isInteractiveMovement && isChangeStage {
                beginInteractiveMovementForItem(at: activeIndexPath)
                activeCell.title.text = String.init(characters[activeIndexPath.item])
            }
            else if isInteractiveMovement {
                let touchPosition = longPressGestureRecognizer.location(in: longPressGestureRecognizer.view!)
                let targetPosition: CGPoint = .init(x: touchPosition.x, y: center.y)
                
                updateInteractiveMovementTargetPosition(targetPosition)
                deleteKey.isHighlighted = longPressGestureRecognizer.location(in: KeyboardViewController.shared.keyboardView.deleteKey).x > 0
            }
            else if isUppercase && isChangeStage {
                cancelInteractiveMovement()
                activeCell.title.text = activeCell.title.text?.uppercased()
            }
            else if isLowercase && isChangeStage {
                cancelInteractiveMovement()
                activeCell.title.text = activeCell.title.text?.lowercased()
            }
        }
    }
    
    @objc private func handleLongPressGesture(from gesture: UILongPressGestureRecognizer) {
        let gestureLocation: CGPoint = gesture.location(in: self)
        
        switch gesture.state {
        case .began:
            activeIndexPath = indexPathForItem(at: gesture.location(in: self))
            guard let activeIndexPath = activeIndexPath else {
                break
            }
            
            beginInteractiveMovementForItem(at: activeIndexPath)
            
        case .changed:
            
            if gestureLocation.y < 0 {
                actionStage = .uppercase
            }
            else if gestureLocation.y > bounds.height * 3 {
                actionStage = .lowercase
            }
            else {
                actionStage = .interactiveMovement
            }
            
        case .ended:
            
            switch actionStage {
                
            case .interactiveMovement:
                endInteractiveMovement()
                
            case .uppercase, .lowercase:
                guard let activeIndexPath = activeIndexPath else {
                    break
                }
                
                KeyboardViewController.shared.keyAction(label: SpecialKey.delete.label, offset: activeIndexPath.item - characters.count + 1)
                KeyboardViewController.shared.keyAction(label: activeCell.title.text!, offset: activeIndexPath.item - characters.count + 1)
                
                KeyboardViewController.shared.updateDocumentContext()
            }
            
            self.activeIndexPath = nil
            actionStage = .interactiveMovement
            
        default:
            cancelInteractiveMovement()
        }
    }
    
    override func endInteractiveMovement() {
        super.endInteractiveMovement()
        
        if deleteKey.isHighlighted {
            KeyboardViewController.shared.keyAction(label: SpecialKey.delete.label)
            deleteKey.isHighlighted = false
            
            KeyboardViewController.shared.updateDocumentContext()
        }
    }
    
    override func cancelInteractiveMovement() {
        super.cancelInteractiveMovement()
        
        deleteKey.isHighlighted = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.title.text = String.init(characters[indexPath.row])
        cell.title.textColor = colorScheme.labelColor
        cell.title.font = UIFont(name: "Courier New", size: 1.4 * layout.itemSize.width)
        cell.backgroundColor = colorScheme.labelColor.withAlphaComponent(0.05)

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        KeyboardViewController.shared.keyAction(label: SpecialKey.delete.label, offset: sourceIndexPath.item - characters.count + 1)
        
        if !deleteKey.isHighlighted {
            KeyboardViewController.shared.keyAction(label: String(characters[sourceIndexPath.item]), offset: destinationIndexPath.item - characters.count + 1)
        }
        else {
            deleteKey.isHighlighted = false
        }
    }
    
    internal var deleteKey: KeyView {
        return KeyboardViewController.shared.keyboardView.deleteKey
    }

}
