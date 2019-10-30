//
//  AboutSection.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-28.
//

import SwiftUI

@available(iOS 13.0, *)
struct AboutSection: View {
    @EnvironmentObject var locale: Locale
    
    var body: some View {
        Section(header: Text(ABOUT.uppercasedString), footer: Text(VERSION.string)) {
            NavigationLink(LEGAL_NOTICES.string, destination: LegalNoticesView())
        }
    }
}
