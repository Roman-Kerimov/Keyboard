//
//  CharacterSequenceView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-04-12.
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
        
        longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongPressGesture(from:)))
        addGestureRecognizer(longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0
        
        if Bundle.main.isInterfaceBuilder {
            characters = .init("keyboard😀")
        }
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
    
    private var activeCharacter: Character? {
        guard let activeIndexPath = activeIndexPath else {
            return nil
        }
        
        return characters[activeIndexPath.item]
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
                
                performCharacterSequenceUpdates {
                    characters.remove(at: activeIndexPath.item)
                    characters.insert(contentsOf: activeCell.title.text!, at: activeIndexPath.item)
                }
            }
            
            self.activeIndexPath = nil
            actionStage = .interactiveMovement
            
        default:
            cancelInteractiveMovement()
        }
    }
    
    override func endInteractiveMovement() {
        guard let activeCell = self.activeCell else {
            return
        }
        
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
                if activeCharacter == .space && activeIndexPath?.item == characters.count - 1 {
                    Keyboard.default.delegate?.delete()
                }
                else {
                    performCharacterSequenceUpdates {
                        characters.remove(at: activeIndexPath!.item)
                        deleteItems(at: [activeIndexPath!])
                    }
                }
            }, completion: { _ in
                enableAtimations()
                KeyboardViewController.shared.updateDocumentContext()
            })
            
            deleteKey.isHighlighted = false
            return
        }
        
        if activeCharacter == .space {
            let destinationIndexPath: IndexPath = indexPathForItem(at: activeCell.center)
                ?? .init(row: characters.count - 1, section: 0)
            
            cancelInteractiveMovement()
            
            let shouldInsertSpace: Bool = destinationIndexPath.item < characters.count - 1
            let shouldDeleteSpace: Bool = shouldInsertSpace && activeIndexPath?.item == characters.count - 1
            
            performBatchUpdates({
                guard shouldInsertSpace else {
                    return
                }
                
                performCharacterSequenceUpdates {
                    if activeIndexPath?.item == 0 {
                        characters.insert(.space, at: destinationIndexPath.item + 1)
                    }
                    else {
                        characters.insert(.space, at: destinationIndexPath.item)
                    }
                    
                    insertItems(at: [destinationIndexPath])
                }
                
                if destinationIndexPath.item > 0
                    && characters[destinationIndexPath.item - 1] != .space
                    && characters[destinationIndexPath.item] != .space {
                 
                    performBatchUpdates({
                        reloadItems(at: indexPathsForVisibleItems)
                    })
                }
                
            }, completion: { (_) in
                enableAtimations()
                
                if shouldDeleteSpace {
                    Keyboard.default.delegate?.delete()
                }
                
                KeyboardViewController.shared.updateDocumentContext()
            })
            
            return
        }
        
        super.endInteractiveMovement()
        
        enableAtimations()
    }
    
    private var characterFont: UIFont {
        return UIFont(name: "Courier New", size: 1.4 * layout.itemSize.width)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionViewCell
        cell.configure()
            
        cell.title.font = characterFont
        cell.backgroundColor = colorScheme.labelColor.withAlphaComponent(0.05)
        cell.layer.cornerRadius = layout.itemSize.width * 0.3
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        
        if characters[proposedIndexPath.item] == .space
            && activeCharacter != .space
            && activeIndexPath != proposedIndexPath {
            
            if proposedIndexPath.item == 0 {
                return .init(row: proposedIndexPath.item + 1, section: 0)
            }
            
            if proposedIndexPath.item == characters.count - 1 {
                return .init(row: proposedIndexPath.item - 1, section: 0)
            }
        }
        
        return proposedIndexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var characters = self.characters
        
        if activeIndexPath != nil && activeIndexPath!.item < characters.count && layout.targetIndexPath != nil && layout.targetIndexPath!.item < characters.count {
            characters.insert(characters.remove(at: activeIndexPath!.item), at: layout.targetIndexPath!.item)
        }
        
        return .init(
            width: max(
                layout.itemSize.width,
                characters[indexPath.item].description.size(withFont: characterFont).width
            ),
            
            height: layout.itemSize.height
        )
    }
    
    var characterSpacing: CGFloat {
        return floor(layout.itemSize.width * 0.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return characterSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return characterSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        performCharacterSequenceUpdates {
            let sourceCharacter = characters.remove(at: sourceIndexPath.item)
            characters.insert(sourceCharacter, at: destinationIndexPath.item)
        }
    }
    
    func performCharacterSequenceUpdates(_ updates: () -> Void) {
        KeyboardViewController.shared.textDocumentProxy.deleteBackward(characters.count)
        
        let shouldRemoveFirstSpace = characters.first != .space
        
        updates()
        
        removeDoubleSpace()
        
        let text: String
        
        if characters.first == .space && shouldRemoveFirstSpace {
            text = .init(characters.suffix(characters.count - 1))
        }
        else {
            text = .init(characters)
        }
        
        KeyboardViewController.shared.textDocumentProxy.insertText(text)
    }
    
    private func removeDoubleSpace() {
        for (index, character) in characters.enumerated() {
            if character == .space && index > 0 && characters[index - 1] == .space {
                performBatchUpdates({
                    characters.remove(at: index)
                    deleteItems(at: [.init(row: index, section: 0)])
                })
                break
            }
        }
    }
    
    internal var deleteKey: KeyView {
        return KeyboardViewController.shared.keyboardView.deleteKey
    }
}
