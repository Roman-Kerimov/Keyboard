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
        charactersIn: Range.init(
            uncheckedBounds: (
                lower: UnicodeScalar.init(0x20)!,
                upper: UnicodeScalar.init(0x7F)!
            )
        )
    )
    
}
