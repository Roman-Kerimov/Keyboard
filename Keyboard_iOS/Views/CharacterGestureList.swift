//
//  CharacterGestureList.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-08.
//

import SwiftUI
 
@available(iOS 13.0, *)
struct CharacterGestureList: View {
    let characters: [String]
    let languageCode: String
    
    var body: some View {
        List(characters, id: \.self) { (character) in
            CharacterGestureRow(character: character, languageCode: self.languageCode).id(character)
        }
        .modifier(SoftwareKeyboardSupportViewModifier())
    }
}
