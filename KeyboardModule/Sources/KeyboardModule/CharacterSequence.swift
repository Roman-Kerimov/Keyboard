//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation

public final class CharacterSequence: ObservableObject {
    
    @Published public var characters: [Character] = []
    
    @Published public var autocompleteText = ""
    @Published public var autocompleteLabel = ""
    @Published var autocompleteDeleteCount = 0
    
    @objc public func autocomplete() {
        for _ in 0..<autocompleteDeleteCount {
            Keyboard.default.delegate?.delete()
        }
        
        autocompleteDeleteCount = 0
        
        Keyboard.default.delegate?.insert(text: autocompleteText)
        
        autocompleteText = .init()
        autocompleteLabel = .init()
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
}
