//
//  GuideNavigationView.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2019-08-02.
//

import SwiftUI

@available(iOS 13.0, *)
struct GuideNavigationView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(LANGUAGES.uppercasedString)) {
                    ForEach(UnicodeData.default.preferredCharacterCollections(maxCount: 3)) { (characterCollection) in
                        LanguageCharactersRow(characterCollection: characterCollection)
                    }
                    
                    NavigationLink(destination: LanguageCharactersList()) {
                        Text(OTHER_LANGUAGES.string)
                            .foregroundColor(.accentColor)
                    }
                }
                
                Section(header: Text(SETTINGS.uppercasedString)) {
                    InterfaceLanguagePicker()
                }
                
                AboutSection()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Bundle.main.productName)
        }
        .padding(.horizontal, (horizontalSizeClass, verticalSizeClass) == (.regular, .regular) ? 1 : 0)
    }
}
