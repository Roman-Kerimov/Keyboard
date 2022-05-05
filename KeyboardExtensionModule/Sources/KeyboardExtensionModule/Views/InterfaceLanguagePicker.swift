//
//  InterfaceLanguagePicker.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI
import KeyboardModule

public struct InterfaceLanguagePicker: View {
    @EnvironmentObject var settings: Settings
    
    public init() {}
    
    public var body: some View {
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
