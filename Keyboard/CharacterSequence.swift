//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI
import Combine

class CharacterSequence: BindableObject {
    var didChange: PassthroughSubject<CharacterSequence, Never> = .init()
    
    var characters: [Character] = .init() {
        didSet {
            didChange.send(self)
        }
    }
    
    var autocompleteText: String = .init() {
        didSet {
            guard autocompleteText != oldValue else {
                return
            }
            
            didChange.send(self)
        }
    }
    
    var autocompleteLabel: String = .init() {
        didSet {
            guard autocompleteLabel != oldValue else {
                return
            }
            
            didChange.send(self)
        }
    }
    
    var autocompleteDeleteCount: Int = 0 {
        didSet {
            guard autocompleteDeleteCount != oldValue else {
                return
            }
            
            didChange.send(self)
        }
    }
    
    @objc func autocomplete() {
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
