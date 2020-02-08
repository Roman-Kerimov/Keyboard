//
//  CharacterGestureRow.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-08.
//

import SwiftUI

@available(iOS 13.0, *)
struct CharacterGestureRow: View {
    let character: String
    
    @State var text: String = ""
    
    var body: some View {
        HStack {
            Text(character)
                .frame(width: 30)
            
            Text(character.defaultShiftGesture ?? "")
                .foregroundColor(.secondary)
                .frame(width: 70, alignment: .leading)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
