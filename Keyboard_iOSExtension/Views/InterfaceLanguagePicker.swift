//
//  InterfaceLanguagePicker.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI
import KeyboardModule

@available(iOS 13.0, *)
struct InterfaceLanguagePicker: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        NavigationLink(destination: InterfaceLanguageList()) {
            HStack {
                Text(LANGUAGE.string)
                Spacer()
                Text(settings.language.selfName)
                    .foregroundColor(.secondary)
            }
        }
    }
}
