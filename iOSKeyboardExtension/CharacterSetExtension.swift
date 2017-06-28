//
//  CharacterSetExtension.swift
//  Keyboard
//
//  Created by Roman Kerimov on 02/06/2017.
//
//

import Foundation

extension CharacterSet {
    
    static let printableASCII: CharacterSet = .init(
        charactersIn: ClosedRange.init(uncheckedBounds: (lower: " ", upper: "~"))
    )
    
}
