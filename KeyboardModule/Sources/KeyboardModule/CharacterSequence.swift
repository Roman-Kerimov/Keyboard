//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation

public final class CharacterSequence: ObservableObject {
    
    public var characters: [Character] = .init() {
        willSet {
            objectWillChange.send()
        }
        
        didSet {
            NotificationCenter.default.post(self)
        }
    }
    
    public var autocompleteText: String = .init() {
        willSet {
            guard autocompleteText != newValue else {
                return
            }
            
            objectWillChange.send()
        }
        
        didSet {
            guard autocompleteText != oldValue else {
                return
            }
            
            NotificationCenter.default.post(self)
        }
    }
    
    public var autocompleteLabel: String = .init() {
        willSet {
            guard autocompleteLabel != newValue else {
                return
            }
            
            objectWillChange.send()
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
            
            objectWillChange.send()
        }
        
        didSet {
            guard autocompleteDeleteCount != oldValue else {
                return
            }
            
            NotificationCenter.default.post(self)
        }
    }
    
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
