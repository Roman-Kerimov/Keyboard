//
//  NSAttributeDescription.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//

import CoreData

extension NSAttributeDescription {
    public convenience init(name: String, type: NSAttributeType, isOptional: Bool, defaultValue: Any? = nil) {
        self.init()
        
        self.name = name
        self.attributeType = type
         
        if type == .transformableAttributeType {
            self.valueTransformerName = NSValueTransformerName.secureUnarchiveFromDataTransformerName.rawValue
        }
        
        self.isOptional = isOptional
        self.defaultValue = defaultValue
    }
}
