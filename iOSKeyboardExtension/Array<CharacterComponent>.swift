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
        return normalized.map {.fullStop + .init(describing: $0)} .joined(separator: .comma + .space)
    }
    
    var character: String {
        return type(of: self).characterDictionary[self.key] ?? .init()
    }
    
    var normalized: [CharacterComponent] {
        return (self as NSArray).sortedArray(options: .stable) {
            let left = $0 as! CharacterComponent
            let right = $1 as! CharacterComponent
            
            guard left.isCommutative && right.isCommutative else {
                return .orderedSame
            }
            
            if left.hashValue < right.hashValue {
                return .orderedAscending
            }
            else if left.hashValue > right.hashValue {
                return .orderedDescending
            }
            else {
                return .orderedSame
            }
            
        } as! [CharacterComponent]
    }
    
    static var extraArrayExtension: [[CharacterComponent]] = .init()
    var extraArray: [[CharacterComponent]] {
        let baseCharacterComponents = self.filter { $0.isExtraComponent == false }
        
        var extraArray = Array<CharacterComponent>.extraArrayExtension + CharacterComponent.extraComponents.map { baseCharacterComponents + [$0]}
        
        //For LATIN SMALL LETTER SIDEWAYS TURNED M
        extraArray += [baseCharacterComponents + [.turned, .sideways]]
        
        return extraArray.filter { $0.character.isEmpty == false} .map { $0.normalized }
    }
}
