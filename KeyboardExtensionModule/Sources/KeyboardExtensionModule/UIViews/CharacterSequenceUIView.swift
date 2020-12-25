//
//  CharacterSequenceUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-04-12.
//
//

import UIKit
import KeyboardModule

class CharacterSequenceUIView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var characters: [Character] = .init() {
        didSet {
            reloadData()
        }
    }
    
    let layout: CollectionViewFlowLayout = .init()
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    private var fontSize: CGFloat {KeyboardViewController.shared.characterSequenceFontSize}
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        backgroundColor = .touchableClear
        
        layout.scrollDirection = .horizontal
        
        alwaysBounceVertical = false
        
        contentInsetAdjustmentBehavior = .never
        
        longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongPressGesture(from:)))
        longPressGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacters), publisher: CharacterSequence.self)
        
        register(CharacterCollectionUIViewCell.self, forCellWithReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier)
        register(AutocompleteUIView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AutocompleteUIView.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCharacters() {
        characters = Keyboard.default.characterSequence.characters
    }
    
    override func reloadData() {
        super.reloadData()
        
        OperationQueue.main.addOperation {
            
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
                
                Key.delete.isHighlighted = longPressGestureRecognizer.location(in: self).x > frame.width
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
        
        if Key.delete.isHighlighted == true {
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
            
            Key.delete.isHighlighted = false
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
        return UIFont(name: .characterFontName, size: fontSize)!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionUIViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionUIViewCell
        
        cell.title.text = characters[indexPath.item].previewDescription
        cell.title.textColor = .labelColor
            
        cell.title.font = characterFont
        cell.backgroundColor = UIColor.labelColor.withAlphaComponent(CGFloat(Double.characterSequenceBackgroundOpacity))
        cell.cornerRadius = .characterSequenceCornerRadiusFontSizeFactor * fontSize
        
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
            width: characters[indexPath.item].description.size(fontName: .characterFontName, fontSize: fontSize).width + .characterSequenceItemWidthExtensionFontSizeFactor * fontSize,
            height: layout.itemSize.height
        )
    }
    
    var characterSpacing: CGFloat {
        return floor(.characterSequenceSpacingFontSizeFactor * fontSize)
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
        view.text = Keyboard.default.characterSequence.autocompleteLabel
        view.font = characterFont
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: Keyboard.default.characterSequence.autocompleteLabel.size(fontName: .characterFontName, fontSize: fontSize).width, height: layout.itemSize.height)
    }
}
