//
//  LanguageCharactersRow.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-04.
//

import SwiftUI
import KeyboardModule
import UnicodeData

struct LanguageCharactersRow: View {
    @EnvironmentObject var settings: Settings
    
    let characterCollection: CharacterCollection
    
    var localeComponents: [String] {
        [characterCollection.locale.regionCode, characterCollection.locale.scriptCode].compactMap {$0}
    }
    
    var body: some View {
        NavigationLink(destination: CharacterGestureList(characterSections: characterCollection.characterSections, languageCode: characterCollection.locale.languageCode!).navigationBarTitle(characterCollection.localizedLanguage(locale: Locale(identifier: settings.language.rawValue)))) {
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(characterCollection.locale.languageCode!.appending(" ").prefix(3))
                        .font(.system(.largeTitle, design: .monospaced))
                    
                    if !localeComponents.isEmpty {
                        Text(localeComponents.joined(separator: .return))
                            .font(.system(.body, design: .monospaced))
                            .padding(.leading, 2)
                    }
                        
                    Spacer()
                }
                    
                
                VStack(alignment: .leading) {
                    Text(characterCollection.localizedLanguage(locale: Locale(identifier: settings.language.rawValue)))
                        .foregroundColor(.primary)
                        .padding(.vertical, 12)
                    
                    ForEach(self.characterCollection.characterSections, id: \.self) { (characters) in
                        CharactersView(characters: characters, languageCode: self.characterCollection.locale.languageCode!)
                    }
                    .padding(.bottom, 8)
                }
                
            }
        }
    }
}
