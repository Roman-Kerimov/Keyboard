//
//  CharactersView.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-13.
//

import SwiftUI

@available(iOS 13.0, *)
struct CharactersView: View {
    let characters: [String]
    
    var body: some View {
        characters
            .map {Text($0).foregroundColor($0.defaultShiftGesture == nil ? .red : .secondary)}
            .reduce(Text(""), +)
            .font(.caption)
    }
}
