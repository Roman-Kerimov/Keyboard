//
//  InterfaceLanguageRow.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-21.
//

import SwiftUI
import KeyboardModule

@available(iOS 13.0, *)
struct InterfaceLanguageRow: View {
    @EnvironmentObject var settings: Settings
    
    let language: Language
    
    var body: some View {
        Button(action: {self.settings.language = self.language}, label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.language.selfName)
                        .foregroundColor(.primary)
                    
                    Text(self.language.localizedName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                language == settings.language ? Image.checkmark.foregroundColor(.accentColor) : nil
            }
        })
        .previewDisplayName(language.id)
    }
}
