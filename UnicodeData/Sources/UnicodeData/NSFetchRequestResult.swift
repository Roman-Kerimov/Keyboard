//
//  NSFetchRequestResult.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-09-04.
//

import CoreData

extension NSFetchRequestResult {
    static func fetchRequest() -> NSFetchRequest<Self> {
        return NSFetchRequest<Self>(entityName: String(describing: Self.self))
    }
}
