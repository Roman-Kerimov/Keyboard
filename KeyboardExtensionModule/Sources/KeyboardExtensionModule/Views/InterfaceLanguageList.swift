//
//  InterfaceLanguageList.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-21.
//

import SwiftUI
import KeyboardModule

struct InterfaceLanguageList: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        List {
            Section {
                ForEach(Language.preferredList) { language in
                    InterfaceLanguageRow(language: language)
                }
            }
            
            Section {
                ForEach(Language.allCases) { language in
                    InterfaceLanguageRow(language: language)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text(LANGUAGE.string), displayMode: .inline)
    }
}
