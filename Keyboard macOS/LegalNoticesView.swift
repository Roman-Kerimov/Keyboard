//
//  LegalNoticesView.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI

struct LegalNoticesView : View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Text(legalNotices)
                    .lineLimit(nil)
                    .font(.custom(.legalTextFontName, size: .legalTextFontSize))
                    .frame(width: geometry.size.width, height: legalNotices.textHeightFrom(width: geometry.size.width, fontName: .legalTextFontName, fontSize: .legalTextFontSize))
            }
        }
        .padding(.horizontal, 0.5 * .legalTextFontSize)
    }
}

#if DEBUG
struct LegalNoticesView_Previews : PreviewProvider {
    static var previews: some View {
        Keyboard.default.delegate?.prepareForPreview()
        
        return LegalNoticesView()
    }
}
#endif
