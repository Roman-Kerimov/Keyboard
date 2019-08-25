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
                    NavigationLink.init(destination: InterfaceLanguageList()) {
                        HStack {
                            Text(LANGUAGE.string)
                            Spacer()
                            Text(locale.language.selfName)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section(header: Text(ABOUT.uppercasedString), footer: Text(VERSION.string)) {
                    NavigationLink(LEGAL_NOTICES.string, destination: LegalNoticesView())
                }
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
