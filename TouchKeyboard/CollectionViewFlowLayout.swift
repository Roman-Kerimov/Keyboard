//
//  CollectionViewFlowLayout.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-11-14.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var targetIndexPath: IndexPath?

    #if !os(macOS)
    override func invalidationContext(forInteractivelyMovingItems targetIndexPaths: [IndexPath], withTargetPosition targetPosition: CGPoint, previousIndexPaths: [IndexPath], previousPosition: CGPoint) -> UICollectionViewLayoutInvalidationContext {
        
        let context = super.invalidationContext(forInteractivelyMovingItems: targetIndexPaths, withTargetPosition: targetPosition, previousIndexPaths: previousIndexPaths, previousPosition: previousPosition)
        
        targetIndexPath = targetIndexPaths.first
        
        return context
    }
    #endif
}
