//
//  Array<CharacterComponent>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-10-18.
//

import Foundation

extension Array where Element == CharacterComponent {
    
    private static let characterDictionary: [String: String] = .init(
        uniqueKeysWithValues: characterComponentsDictionary.filter {!$0.value.isEmpty} .map {($0.value.key, $0.key)}
    )
    
    var key: String {
        return self.map {$0.hashValue.description}.joined(separator: String.space)
    }
    
    var character: String {
        return type(of: self).characterDictionary[self.key] ?? .init()
    }

}
