//
//  CharacterSequenceUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-04-12.
//
//

import UIKit

class CharacterSequenceUIView: CharacterCollectionUIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    private let deleteButton: UIButton?
    
    init(deleteButton: UIButton?) {
        
        self.deleteButton = deleteButton
        
        super.init()
        
        layout.scrollDirection = .horizontal
        
        alwaysBounceVertical = false
        
        longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongPressGesture(from:)))
        longPressGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacters), name: .CharacterSequenceDidChange, object: nil)
        
        register(AutocompleteUIView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AutocompleteUIView.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCharacters() {
        characters = Keyboard.default.characterSequence
    }
    
    override func reloadData() {
        super.reloadData()
        
        OperationQueue.main.addOperation {
            
            #if os(macOS)
            if self.layout.collectionViewContentSize.width == 0 {
                self.window?.setIsVisible(false)
            }
            else {
                self.window?.setContentSize(.init(width: min(self.layout.collectionViewContentSize.width, UIScreen.main.bounds.width - (self.window?.frame.origin.x ?? 0)), height: self.frame.height))
                self.window?.setIsVisible(true)
            }
            #endif
            
            if self.contentSize.width > self.frame.size.width {
                self.scrollRectToVisible(.init(origin: .init(x: self.contentSize.width - self.visibleSize.width, y: 0), size: self.visibleSize), animated: true)
            }
        }
    }
    
    private var activeIndexPath: IndexPath? {
        willSet {
            if let newValue = newValue {
                activeCell = cellForItem(at: newValue) as? CharacterCollectionUIViewCell
            }
        }
    }
    
    private var activeCharacter: Character? {
        guard let activeIndexPath = activeIndexPath else {
            return nil
        }
        
        return characters[activeIndexPath.item]
    }
    
    private var activeCell: CharacterCollectionUIViewCell!
    
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
                
                if let deleteButton = deleteButton {
                    deleteButton.isHighlighted = longPressGestureRecognizer.location(in: deleteButton).x > 0
                }
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
        
        if deleteButton?.isHighlighted == true {
            cancelInteractiveMovement()
            
            performBatchUpdates({
                if self.activeCharacter == .space && self.activeIndexPath?.item == self.characters.count - 1 {
                    Keyboard.default.delegate?.delete()
                }
                else {
                    self.performCharacterSequenceUpdates {
                        self.characters.remove(at: self.activeIndexPath!.item)
                        self.deleteItems(at: [self.activeIndexPath!])
                    }
                }
            }, completion: { _ in
                enableAtimations()
                NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
            })
            
            deleteButton?.isHighlighted = false
            return
        }
        
        if activeCharacter == .space {
            let destinationIndexPath: IndexPath = indexPathForItem(at: activeCell.center)
                ?? .init(item: characters.count - 1, section: 0)
            
            cancelInteractiveMovement()
            
            let shouldInsertSpace: Bool = destinationIndexPath.item < characters.count - 1
            let shouldDeleteSpace: Bool = shouldInsertSpace && activeIndexPath?.item == characters.count - 1
            
            performBatchUpdates({
                guard shouldInsertSpace else {
                    return
                }
                
                self.performCharacterSequenceUpdates {
                    if self.activeIndexPath?.item == 0 {
                        self.characters.insert(.space, at: destinationIndexPath.item + 1)
                    }
                    else {
                        self.characters.insert(.space, at: destinationIndexPath.item)
                    }
                    
                    self.insertItems(at: [destinationIndexPath])
                }
                
                if destinationIndexPath.item > 0
                    && self.characters[destinationIndexPath.item - 1] != .space
                    && self.characters[destinationIndexPath.item] != .space {
                 
                    self.performBatchUpdates({
                        self.reloadItems(at: self.indexPathsForVisibleItems)
                    })
                }
                
            }, completion: { (_) in
                enableAtimations()
                
                if shouldDeleteSpace {
                    Keyboard.default.delegate?.delete()
                }
                
                NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
            })
            
            return
        }
        
        super.endInteractiveMovement()
        
        enableAtimations()
    }
    
    private var characterFont: UIFont {
        return .characterFont(ofSize: 1.8 * layout.itemSize.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! CharacterCollectionUIViewCell
            
        cell.title.font = characterFont
        cell.backgroundColor = UIColor.labelColor.withAlphaComponent(0.05)
        cell.cornerRadius = layout.itemSize.width * 0.3
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        
        if characters[proposedIndexPath.item] == .space
            && activeCharacter != .space
            && activeIndexPath != proposedIndexPath {
            
            if proposedIndexPath.item == 0 {
                return .init(item: proposedIndexPath.item + 1, section: 0)
            }
            
            if proposedIndexPath.item == characters.count - 1 {
                return .init(item: proposedIndexPath.item - 1, section: 0)
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
            width: characters[indexPath.item].description.size(withFont: characterFont).width + characterFont.pointSize * 0.2,
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
        
        characters.forEach { (_) in
            Keyboard.default.delegate?.delete()
        }
        
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
        
        Keyboard.default.delegate?.insert(text: text)
    }
    
    private func removeDoubleSpace() {
        for (index, character) in characters.enumerated() {
            if character == .space && index > 0 && characters[index - 1] == .space {
                performBatchUpdates({
                    self.characters.remove(at: index)
                    self.deleteItems(at: [.init(item: index, section: 0)])
                })
                break
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AutocompleteUIView.reuseIdentifier, for: indexPath) as! AutocompleteUIView
        view.text = Keyboard.default.autocompleteLabel
        view.font = characterFont
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: Keyboard.default.autocompleteLabel.size(withFont: characterFont).width, height: layout.itemSize.height)
    }
}
