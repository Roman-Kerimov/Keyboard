//
//  ManagedCharacterCollection.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//
//

import CoreData

public class ManagedCharacterCollection: NSManagedObject, ManagedObjectDescriptions {
    
    @NSManaged public var auxiliary: [String]?
    @NSManaged public var index: [String]?
    @NSManaged public var keyboardIntersection: [String]?
    @NSManaged public var language: String?
    @NSManaged public var main: [String]?
    @NSManaged public var numbers: [String]?
    @NSManaged public var punctuation: [String]?
    
    static let attributeDescriptions: [NSAttributeDescription] = [
        .init(name: "auxiliary", type: .transformableAttributeType, isOptional: true),
        .init(name: "index", type: .transformableAttributeType, isOptional: true),
        .init(name: "keyboardIntersection", type: .transformableAttributeType, isOptional: true),
        .init(name: "language", type: .stringAttributeType, isOptional: true),
        .init(name: "main", type: .transformableAttributeType, isOptional: true),
        .init(name: "numbers", type: .transformableAttributeType, isOptional: true),
        .init(name: "punctuation", type: .transformableAttributeType, isOptional: true),
    ]
}
