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
        return self.normalized.map {$0.hashValue.description} .joined(separator: .space)
    }
    
    var character: String {
        return type(of: self).characterDictionary[self.key] ?? .init()
    }
    
    var normalized: [CharacterComponent] {
        return self.filter {!$0.isCommutative} + (self.filter {$0.isCommutative} .sorted {$0.hashValue < $1.hashValue})
    }
    
    var extraArray: [[CharacterComponent]] {
        let baseCharacterComponents = self.filter { $0.isExtraComponent == false }
        
        var extraArray = CharacterComponent.extraComponents.map { baseCharacterComponents + [$0]}
        
        //For LATIN SMALL LETTER SIDEWAYS TURNED M
        extraArray += [baseCharacterComponents + [.turned, .sideways]]
        
        return extraArray.filter { $0.character.isEmpty == false} .map { $0.normalized }
    }
}
