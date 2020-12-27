//
//  Array<Key>.swift
//  
//
//  Created by Roman Kerimov on 2020-12-21.
//

import Foundation

extension Array: Identifiable where Element == Key {
    public var id: String {
        map {$0.id.description} .reduce("", +)
    }
}
