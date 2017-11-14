//
//  String.swift
//  Keyboard
//
//  Created by Roman Kerimov on 01.06.17.
//
//

import UIKit

extension String {
    static let space: String = Character.space.description
    static let `return`: String = Character.return.description
    static let tab: String = Character.tab.description
    static let reverseSolidus: String = Character.reverseSolidus.description
    
    var characterComponents: [CharacterComponent] {
        return characterComponentsDictionary[self]?.normalized ?? .init()
    }
    
    func size(withFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [.font: font])
    }
}
