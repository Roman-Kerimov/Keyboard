//
//  ManagedWord.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//
//

import CoreData

public class ManagedWord: NSManagedObject, ManagedObjectDescriptions {

    @NSManaged public var language: String?
    @NSManaged public var string: String?

    static let attributeDescriptions: [NSAttributeDescription] = [
        .init(name: "language", type: .stringAttributeType, isOptional: true),
        .init(name: "string", type: .stringAttributeType, isOptional: true),
    ]
}
