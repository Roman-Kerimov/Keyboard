//
//  LegalNoticesView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI

@available(iOS 13.0, *)
struct LegalNoticesView : View {
    @EnvironmentObject var locale: Locale
    
    var body: some View {
        ScrollView {
            Text(legalNotices)
                .font(.custom(.legalTextFontName, size: .legalTextFontSize))
        }
        .padding(.horizontal, 0.5 * .legalTextFontSize)
        .navigationBarTitle(Text(LEGAL_NOTICES.string), displayMode: .inline)
    }
}
