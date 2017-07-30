//
//  CharacterSequenceView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 12.04.17.
//
//

import UIKit

class CharacterSequenceView: CharacterCollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    override init() {
        super.init()

        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: layout.itemSize.width)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
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
            }
            
            self.activeIndexPath = nil
            actionStage = .interactiveMovement
            
        default:
            cancelInteractiveMovement()
        }
    }
    
    override func endInteractiveMovement() {
        let activeCell = self.activeCell!
        
        func disableAtimations() {
            UIView.setAnimationsEnabled(false)
            activeCell.isHidden = true
        }
        
        func enableAtimations() {
            UIView.setAnimationsEnabled(true)
            activeCell.isHidden = false
        }
        
        disableAtimations()
        
        if deleteKey.isHighlighted {
            cancelInteractiveMovement()
            
            performBatchUpdates({
                performCharacterSequenceUpdates {
                    characters.remove(at: activeIndexPath!.item)
                    deleteItems(at: [activeIndexPath!])
                }
            }, completion: { _ in
                enableAtimations()
            })
            
            deleteKey.isHighlighted = false
            return
        }
        
        super.endInteractiveMovement()
        
        enableAtimations()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        cell.configure()
            
        cell.title.font = UIFont(name: "Courier New", size: 1.4 * layout.itemSize.width)
        cell.backgroundColor = colorScheme.labelColor.withAlphaComponent(0.05)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        performCharacterSequenceUpdates {
            let sourceCharacter = characters[sourceIndexPath.item]
            characters.remove(at: sourceIndexPath.item)
            characters.insert(sourceCharacter, at: destinationIndexPath.item)
        }
    }
    
    func performCharacterSequenceUpdates(_ updates: () -> Void) {
        KeyboardViewController.shared.textDocumentProxy.deleteBackward(characters.count)
        updates()
        KeyboardViewController.shared.textDocumentProxy.insertText(.init(characters))
    }
    
    internal var deleteKey: KeyView {
        return KeyboardViewController.shared.keyboardView.deleteKey
    }
}
