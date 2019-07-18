//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI
import Combine

class CharacterSequence: BindableObject {
    var willChange: PassthroughSubject<CharacterSequence, Never> = .init()
    
    var characters: [Character] = .init() {
        willSet {
            willChange.send(self)
        }
        
        didSet {
            NotificationCenter.default.post(self)
        }
    }
    
    var autocompleteText: String = .init() {
        willSet {
            guard autocompleteText != newValue else {
                return
            }
            
            willChange.send(self)
        }
        
        didSet {
            guard autocompleteText != oldValue else {
                return
            }
            
            NotificationCenter.default.post(self)
        }
    }
    
    var autocompleteLabel: String = .init() {
        willSet {
            guard autocompleteLabel != newValue else {
                return
            }
            
            willChange.send(self)
        }
        
        didSet {
            guard autocompleteLabel != oldValue else {
                return
            }
            
            NotificationCenter.default.post(self)
        }
    }
    
    var autocompleteDeleteCount: Int = 0 {
        willSet {
            guard autocompleteDeleteCount != newValue else {
                return
            }
            
            willChange.send(self)
        }
        
        didSet {
            guard autocompleteDeleteCount != oldValue else {
                return
            }
            
            NotificationCenter.default.post(self)
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
