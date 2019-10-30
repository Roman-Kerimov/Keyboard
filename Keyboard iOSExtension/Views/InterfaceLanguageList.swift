//
//  InterfaceLanguageList.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-21.
//

import SwiftUI

@available(iOS 13.0, *)
struct InterfaceLanguageList: View {
    @EnvironmentObject var locale: Locale
    
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

@available(iOS 13.0, *)
struct InterfaceLanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        InterfaceLanguageList().localized()
    }
}
