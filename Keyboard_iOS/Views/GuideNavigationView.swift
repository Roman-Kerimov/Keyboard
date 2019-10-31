//
//  GuideNavigationView.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2019-08-02.
//

import SwiftUI

@available(iOS 13.0, *)
struct GuideNavigationView: View {
    @EnvironmentObject var locale: Locale
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(SETTINGS.uppercasedString)) {
                    InterfaceLanguagePicker()
                }
                
                AboutSection()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Bundle.main.productName)
            
            InterfaceLanguageList()
        }
        .padding(.horizontal, (horizontalSizeClass, verticalSizeClass) == (.regular, .regular) ? 1 : 0)
    }
}
