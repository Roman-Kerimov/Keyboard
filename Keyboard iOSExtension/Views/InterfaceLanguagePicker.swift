//
//  InterfaceLanguagePicker.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI

@available(iOS 13.0, *)
struct InterfaceLanguagePicker: View {
    @EnvironmentObject var locale: Locale
    
    var body: some View {
        NavigationLink(destination: InterfaceLanguageList()) {
            HStack {
                Text(LANGUAGE.string)
                Spacer()
                Text(locale.language.selfName)
                    .foregroundColor(.secondary)
            }
        }
    }
}

@available(iOS 13.0, *)
struct SettingsSection_Previews: PreviewProvider {
    static var previews: some View {
        InterfaceLanguagePicker().localized()
    }
}
