//
//  CharacterSet.swift
//  Keyboard
//
//  Created by Roman Kerimov on 02/06/2017.
//
//

import UIKit

extension CharacterSet {
    
    static let printableASCII: CharacterSet = .init(
        charactersIn: ClosedRange.init(uncheckedBounds: (lower: " ", upper: "~"))
    )
    
    static let emoji: CharacterSet = UIFont.init(name: "Apple Color Emoji", size: 1)?.fontDescriptor.object(forKey: .characterSet) as! CharacterSet
    
    static let emoticons = CharacterSet.init(charactersIn: ClosedRange.init(uncheckedBounds: (lower: "😀", upper: "😷")))
        .union(.init(charactersIn: ClosedRange.init(uncheckedBounds: (lower: "🙁", upper: "🙄"))))
        .union(.init(charactersIn: ClosedRange.init(uncheckedBounds: (lower: "🤐", upper: "🤕"))))
        .union(.init(charactersIn: ClosedRange.init(uncheckedBounds: (lower: "🤠", upper: "🤥"))))
        .union(.init(charactersIn: "🤗🤧"))
    
}
