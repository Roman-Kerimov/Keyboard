//
//  CharactersView.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-13.
//

import SwiftUI

struct CharactersView: View {
    let characters: [String]
    let languageCode: String
    
    var body: some View {
        characters
            .map {Text($0.previewDescription).foregroundColor($0.typingDescription(languageCode: languageCode) == nil ? .red : .secondary)}
            .map {$0 + Text(" ")}
            .reduce(Text(""), +)
            .font(.caption)
            .lineLimit(20)
    }
}
