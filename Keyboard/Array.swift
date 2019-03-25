//
//  Array.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-03-24.
//

import Foundation

extension Array where Element: Equatable {
    var permulations: [Array] {
        var currentPermulations: [Array] = [[]]

        for element in self {
            let lastPermulations = currentPermulations
            
            currentPermulations = (lastPermulations.first!.startIndex...lastPermulations.first!.endIndex).flatMap({ (insertIndex) -> [Array] in
                return lastPermulations.compactMap {
                    var permulation = $0
                    
                    guard permulation.prefix(upTo: insertIndex).contains(element) == false else {
                        return nil
                    }
                    
                    permulation.insert(element, at: insertIndex)
                
                    return permulation
                }
            })
        }
        
        return currentPermulations.reversed()
    }
}
