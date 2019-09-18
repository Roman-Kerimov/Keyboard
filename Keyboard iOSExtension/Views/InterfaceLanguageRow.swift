//
//  InterfaceLanguageRow.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-21.
//

import SwiftUI

@available(iOS 13.0, *)
struct InterfaceLanguageRow: View {
    @EnvironmentObject var locale: Locale
    
    let language: Language
    
    var body: some View {
        Button(action: {self.locale.language = self.language}, label: {
            HStack {
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        Text(self.language.selfName)
                        
                        Text(self.language.localizedName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } 
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                }
                
                language == locale.language ? Image.checkmark.foregroundColor(.accentColor) : nil
            }
        })
        .buttonStyle(PlainButtonStyle())
        .previewDisplayName(language.id)
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct InterfaceLanguageListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            InterfaceLanguageRow(language: Locale.current.language).localized()
            
            ForEach(Language.allCases) { language in
                InterfaceLanguageRow(language: language).localized()
            }
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
#endif