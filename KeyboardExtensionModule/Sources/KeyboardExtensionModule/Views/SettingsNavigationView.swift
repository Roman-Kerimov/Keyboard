//
//  SettingsNavigationView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI
import KeyboardModule

struct SettingsNavigationView: View {
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var keyboard: Keyboard
    
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
                trailing: LayoutModePicker().environmentObject(keyboard)
            )
        }
        .environment(\.horizontalSizeClass, .compact)
    }
}
