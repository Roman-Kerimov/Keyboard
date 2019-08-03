//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation
import Combine

@available(iOS 13.0, *)
extension CharacterSequence: ObservableObject {

    var objectWillChange: ObservableObjectPublisher {
        if _objectWillChange == nil {
            _objectWillChange = ObservableObjectPublisher.init()
        }

        return _objectWillChange as! ObservableObjectPublisher
    }
}

final class CharacterSequence {
    var _objectWillChange: Any? = nil
    
    var characters: [Character] = .init() {
        willSet {
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
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
            
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
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
            
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
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
            
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
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
