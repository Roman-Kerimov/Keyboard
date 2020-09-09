//
//  CharacterSearchView.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-06-24.
//

import SwiftUI
import KeyboardModule

struct CharacterSearchView : View {
    @EnvironmentObject var characterSearch: CharacterSearch
    
    var body: some View {
        let enumeratedFoundUnicodeItems = self.characterSearch.foundUnicodeItems.enumerated().map {($0, $1)}
        
        return GeometryReader {geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(enumeratedFoundUnicodeItems, id: \.0) {(item, unicodeItem) in
                        Text(unicodeItem.codePoints.previewDescription)
                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                            .font(.system(size: geometry.size.width * .characterSearchViewFontSizeFactor))
                            .onTapGesture {self.characterSearch.insert(item: item)}
                            .help(unicodeItem.localizedName)
                    }
                    
                    if self.characterSearch.isSearching {
                        ActivityView().frame(width: geometry.size.width, height: geometry.size.width)
                    }
                }
            }
        }
    }
}
