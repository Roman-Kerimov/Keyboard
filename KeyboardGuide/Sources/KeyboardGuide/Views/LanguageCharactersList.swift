//
//  LanguageCharactersList.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-02-03.
//

import SwiftUI
import KeyboardModule
import UnicodeData

struct LanguageCharactersList: View {
    @EnvironmentObject var settings: Settings
    
    @AppStorage("languageFilter") fileprivate var languageFilter: LanguageFilter = .supported
    
    func filtered(_ characterCollections: [CharacterCollection]) -> [CharacterCollection] {
        switch languageFilter {
        case .all:
            return characterCollections
            
        case .supported:
            return characterCollections.filter { characterCollection in
                !characterCollection.characterSections.joined()
                    .contains {
                        $0.typingDescription(languageCode: characterCollection.locale.languageCode!) == nil
                    }
            }
            
        case .unsupported:
            return characterCollections.filter { characterCollection in
                characterCollection.characterSections.joined()
                    .contains {
                        $0.typingDescription(languageCode: characterCollection.locale.languageCode!) == nil
                    }
            }
        }
    }
    
    var body: some View {
        List {
            
            Section {
                ForEach(filtered(UnicodeData.default.preferredCharacterCollections())) { (characterCollection) in
                    LanguageCharactersRow(characterCollection: characterCollection)
                }
            }
            
            Section {
                ForEach(filtered(UnicodeData.default.characterCollections())) { (characterCollection) in
                    LanguageCharactersRow(characterCollection: characterCollection)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(LANGUAGES.string)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Picker(selection: $languageFilter, label: EmptyView()) {
                    Image(systemName: "circle.fill")
                        .tag(LanguageFilter.supported)
                    
                    Image(systemName: "circle.lefthalf.fill")
                        .tag(LanguageFilter.all)
                    
                    Image(systemName: "circle")
                        .tag(LanguageFilter.unsupported)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                
                Text(filtered(UnicodeData.default.characterCollections()).count.description)
            }
        }
    }
}

fileprivate enum LanguageFilter: String, Codable {
    case all, supported, unsupported
}
