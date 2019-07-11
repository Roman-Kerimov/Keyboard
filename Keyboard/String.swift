//
//  String.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import UIKit

extension String {
    static let space: String = Character.space.description
    static let `return`: String = Character.return.description
    static let tab: String = Character.tab.description
    static let reverseSolidus: String = Character.reverseSolidus.description
    static let comma: String = Character.comma.description
    static let fullStop: String = Character.fullStop.description
    
    var characterComponents: [CharacterComponent] {
        return characterComponentsDictionary[self]?.normalized ?? .init()
    }
    
    func size(withFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [.font: font])
    }
}
