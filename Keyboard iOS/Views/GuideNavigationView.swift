//
//  GuideNavigationView.swift
//  Keyboard iOS
//
//  Created by Roman Kerimov on 2019-08-02.
//

import SwiftUI

@available(iOS 13.0, *)
struct GuideNavigationView: View {
    @EnvironmentObject var locale: Locale
    
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
        .padding(1)
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct GuideNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        GuideNavigationView().localized()
    }
}
#endif