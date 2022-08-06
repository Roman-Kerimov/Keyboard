//
//  CellPreferenceKey.swift
//  
//
//  Created by Roman Kerimov on 2022-07-26.
//

import SwiftUI

struct CellPreferenceKey: PreferenceKey {
    typealias Value = [Cell]
    
    static var defaultValue: [Cell] = []
    
    static func reduce(value: inout [Cell], nextValue: () -> [Cell]) {
        value.append(contentsOf: nextValue())
    }
}

struct Cell: Equatable {
    let index: Int
    let frame: CGRect
}
