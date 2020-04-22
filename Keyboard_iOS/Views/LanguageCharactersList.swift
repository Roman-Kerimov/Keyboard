//
//  LanguageCharactersList.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-02-03.
//

import SwiftUI

@available(iOS 13.0, *)
struct LanguageCharactersList: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        List {
            
            Section {
                ForEach(UnicodeData.default.preferredCharacterCollections()) { (characterCollection) in
                    LanguageCharactersRow(characterCollection: characterCollection)
                }
            }
            
            Section {
                ForEach(UnicodeData.default.characterCollections()) { (characterCollection) in
                    LanguageCharactersRow(characterCollection: characterCollection)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(LANGUAGES.string)
    }
}
