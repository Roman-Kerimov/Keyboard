//
//  LanguageCharactersRow.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-04.
//

import SwiftUI

@available(iOS 13.0, *)
struct LanguageCharactersRow: View {
    @EnvironmentObject var locale: Locale
    
    let characterCollection: CharacterCollection
    
    var localeComponents: [String] {
        [characterCollection.locale.regionCode, characterCollection.locale.scriptCode].compactMap {$0}
    }
    
    var body: some View {
        NavigationLink(destination: CharacterGestureList(characters: characterCollection.characters, languageCode: characterCollection.locale.languageCode!).navigationBarTitle(characterCollection.localizedLanguage(locale: locale))) {
            
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
                    Text(characterCollection.localizedLanguage(locale: locale))
                        .foregroundColor(.primary)
                        .padding(.vertical, 12)
                        
                    CharactersView(characters: self.characterCollection.characters, languageCode: self.characterCollection.locale.languageCode!)
                        .padding(.bottom, 8)
                }
                
            }
        }
    }
}
