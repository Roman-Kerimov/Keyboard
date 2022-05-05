//
//  LegalNoticesView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI

public struct LegalNoticesView : View {
    @EnvironmentObject var settings: Settings
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            Text(legalNotices)
                .font(.custom(.legalTextFontName, size: .legalTextFontSize))
        }
        .padding(.horizontal, 0.5 * .legalTextFontSize)
        .navigationBarTitle(Text(LEGAL_NOTICES.string), displayMode: .inline)
    }
}
