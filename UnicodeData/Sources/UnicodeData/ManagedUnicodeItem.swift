//
//  ManagedUnicodeItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//
//

import CoreData

public class ManagedUnicodeItem: NSManagedObject, ManagedObjectDescriptions {
    
    @NSManaged public var annotation: String?
    @NSManaged public var codePoints: String?
    @NSManaged public var frequency: Int16
    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var order: Int32
    @NSManaged public var totalStrokes: Int16
    @NSManaged public var ttsAnnotation: String?
    
    static let attributeDescriptions: [NSAttributeDescription] = [
        .init(name: "annotation", type: .stringAttributeType, isOptional: true),
        .init(name: "codePoints", type: .stringAttributeType, isOptional: false),
        .init(name: "frequency", type: .integer16AttributeType, isOptional: true, defaultValue: Int16(1000)),
        .init(name: "language", type: .stringAttributeType, isOptional: false, defaultValue: ""),
        .init(name: "name", type: .stringAttributeType, isOptional: true),
        .init(name: "order", type: .integer32AttributeType, isOptional: false, defaultValue: Int32(0)),
        .init(name: "totalStrokes", type: .integer16AttributeType, isOptional: true),
        .init(name: "ttsAnnotation", type: .stringAttributeType, isOptional: true),
    ]
}
