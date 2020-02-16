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
    let languageCode: String
    
    var textKey: String {
        character.applyingTransform(.init("Any-Hex/Perl"), reverse: false)!
    }
    
    var textBinding: Binding<String> {
        .init(
            get: {UserDefaults.characterFields.string(forKey: self.textKey) ?? ""},
            set: {UserDefaults.characterFields.set($0, forKey: self.textKey)}
        )
    }
    
    var body: some View {
        HStack {
            Text(character)
                .frame(width: 30)
            
            characterTypingDescriptionText
                .frame(width: 70, alignment: .leading)
            
            TextField("", text: textBinding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    var characterTypingDescriptionText: Text {
        character.typingDescription(languageCode: languageCode)?.map {Text($0.description).foregroundColor($0.description.defaultShiftGesture == nil ? .red : .secondary)} .reduce(Text(""), +) ?? Text("")
    }
}
