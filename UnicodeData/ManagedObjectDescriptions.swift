//
//  ManagedObjectDescriptions.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//

import CoreData

protocol ManagedObjectDescriptions {
    static var attributeDescriptions: [NSAttributeDescription] { get }
}

extension ManagedObjectDescriptions {
    static func entityDescription() -> NSEntityDescription {
        let entityDescription = NSEntityDescription()
        
        entityDescription.name = String(describing: self)
        entityDescription.managedObjectClassName = NSStringFromClass(self as! AnyClass)
        entityDescription.properties = self.attributeDescriptions
        
        return entityDescription
    }
}
