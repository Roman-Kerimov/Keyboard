//
//  SettingsNavigationView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI

@available(iOS 13.0, *)
struct SettingsNavigationView: View {
    @EnvironmentObject var locale: Locale
    
    var body: some View {
        NavigationView {
            List {
                LayoutPickerSection()

                Section {
                    InterfaceLanguagePicker()
                }
                
                AboutSection()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(
                leading: Text(SETTINGS.string).font(.custom(.settingsTitleFontName, size: .settingsTitleFontSize)),
                trailing: LayoutModePicker()
            )
        }
    }
}

@available(iOS 13.0, *)
struct SettingsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsNavigationView().localized()
    }
}
