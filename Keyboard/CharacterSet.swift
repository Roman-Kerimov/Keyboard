//
//  CharacterSet.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-02.
//
//

import UIKit

extension CharacterSet {
    
    static let printableASCII: CharacterSet = .init(
        charactersIn: ClosedRange.init(uncheckedBounds: (lower: " ", upper: "~"))
    )
    
    static var emoji: CharacterSet = .init()
    
    static let regionalIndicatorSymbols: CharacterSet = .init(charactersIn: "🇦"..."🇿")
}
