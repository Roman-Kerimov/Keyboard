//
//  NonAccessibilityDocumentContext.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-06-06.
//

struct NonAccessibilityDocumentContext: Equatable {
    var beforeInput: String = .init()
    var afterInput: String = .init()
    
    mutating func deleteBackward() {
       
        guard !beforeInput.isEmpty else {
            reset()
            return
        }
        
        beforeInput.removeLast()
    }
    
    mutating func deleteForward() {
        
        guard !afterInput.isEmpty else {
            reset()
            return
        }
        
        afterInput.removeFirst()
    }
    
    mutating func moveBackward() {
        
        guard !beforeInput.isEmpty else {
            reset()
            return
        }
        
        self.afterInput.insert(self.beforeInput.removeLast(), at: afterInput.startIndex)
    }
    
    mutating func moveForward() {
        
        guard !afterInput.isEmpty else {
            reset()
            return
        }
        
        self.beforeInput.insert(self.afterInput.removeFirst(), at: beforeInput.endIndex)
    }
    
    mutating func reset() {
        beforeInput = .init()
        afterInput = .init()
    }
}
