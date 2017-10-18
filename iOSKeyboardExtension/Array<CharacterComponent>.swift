//
//  Array<CharacterComponent>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-10-18.
//

import Foundation

extension Array where Element == CharacterComponent {
    var key: String {
        return self.map {$0.hashValue.description}.joined(separator: String.space)
    }
}
